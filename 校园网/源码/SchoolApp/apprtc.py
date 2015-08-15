#!/usr/bin/python2.4
#
# Copyright 2011 Google Inc. All Rights Reserved.

# pylint: disable-msg=C6310

"""WebRTC Demo

This module demonstrates the WebRTC API by implementing a simple video chat app.
"""

import datetime
import logging
import os
import random
import re
import json
import jinja2
import webapp2
from google.appengine.api import channel
from google.appengine.ext import db

jinja_environment = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))

def generate_random(len):
  word = ''
  for i in range(len):
    word += random.choice('0123456789')
  return word

def sanitize(key):
  return re.sub('[^a-zA-Z0-9\-]', '-', key);

def make_token(room, user):
  return room.key().id_or_name() + '/' + user

def make_pc_config(stun_server, turn_server):
  servers = []
  if stun_server:
    stun_config = 'stun:{}'.format(stun_server)
  else:
    stun_config = 'stun:' + 'stun.l.google.com:19302'
  servers.append({'url':stun_config})
  if turn_server:
    turn_config = 'turn:{}'.format(turn_server)
    servers.append({'url':turn_config, 'credential':''})
  return {'iceServers':servers}

class Room(db.Model):
  """All the data we store for a room"""
  user1 = db.StringProperty()
  user2 = db.StringProperty()

  def __str__(self):
    str = '['
    if self.user1:
      str += self.user1
    if self.user2:
      str += ', ' + self.user2
    str += ']'
    return str

  def get_occupancy(self):
    occupancy = 0
    if self.user1:
      occupancy += 1
    if self.user2:
      occupancy += 1
    return occupancy

  def get_other_user(self, user):
    if user == self.user1:
      return self.user2
    elif user == self.user2:
      return self.user1
    else:
      return None

  def has_user(self, user):
    return (user and (user == self.user1 or user == self.user2))

  def add_user(self, user):
    if not self.user1:
      self.user1 = user
    elif not self.user2:
      self.user2 = user
    else:
      raise RuntimeError('room is full')
    self.put()

  def remove_user(self, user):
    if user == self.user2:
      self.user2 = None
    if user == self.user1:
      if self.user2:
        self.user1 = self.user2
        self.user2 = None
      else:
        self.user1 = None
    if self.get_occupancy() > 0:
      self.put()
    else:
      self.delete()


class ConnectPage(webapp2.RequestHandler):
  def post(self):
    key = self.request.get('from')
    room_key, user = key.split('/');
    logging.info('User ' + user + ' connected to room ' + room_key)


class DisconnectPage(webapp2.RequestHandler):
  def post(self):
    key = self.request.get('from')
    room_key, user = key.split('/');
    room = Room.get_by_key_name(room_key)
    if room and room.has_user(user):
      other_user = room.get_other_user(user)
      room.remove_user(user)
      logging.info('User ' + user + ' removed from room ' + room_key)
      logging.info('Room ' + room_key + ' has state ' + str(room))
      if other_user:
        channel.send_message(make_token(room, other_user), '{"type":"bye"}')
        logging.info('Sent BYE to ' + other_user)
    logging.warning('User ' + user + ' disconnected from room ' + room_key)


class MessagePage(webapp2.RequestHandler):
  def post(self):
    message = self.request.body
    message_obj = json.loads(message)
    room_key = self.request.get('r')
    room = Room.get_by_key_name(room_key)
    if room:
      user = self.request.get('u')
      other_user = room.get_other_user(user)
      if message_obj['type'] == 'bye':
        room.remove_user(user)
        logging.info('User ' + user + ' quit from room ' + room_key)
        logging.info('Room ' + room_key + ' has state ' + str(room))
      if other_user:
        # special case the loopback scenario
        if other_user == user:
          message = message.replace("\"offer\"", "\"answer\"")
          message = message.replace("a=crypto:0 AES_CM_128_HMAC_SHA1_32",
                                    "a=xrypto:0 AES_CM_128_HMAC_SHA1_32")
          message = message.replace("a=ice-options:google-ice\\r\\n", "")
        channel.send_message(make_token(room, other_user), message)
        logging.info('Delivered message to user ' + other_user);
    else:
      logging.warning('Unknown room ' + room_key)


class MainPage(webapp2.RequestHandler):
  """The main UI page, renders the 'index.html' template."""

  def get(self):
    """Renders the main page. When this page is shown, we create a new
    channel to push asynchronous updates to the client."""
    room_key = sanitize(self.request.get('r'));
    debug = self.request.get('debug')
    stun_server = self.request.get('ss');
    turn_server = self.request.get('ts');
    if not room_key:
      room_key = generate_random(8)
      redirect = '/?r=' + room_key
      if debug:
        redirect += ('&debug=' + debug)
      if turn_server:
        redirect += ('&ts=' + turn_server)
      if stun_server:
        redirect += ('&ss=' + stun_server)
      self.redirect(redirect)
      logging.info('Redirecting visitor to base URL to ' + redirect)
      return

    user = None
    initiator = 0
    room = Room.get_by_key_name(room_key)
    if not room and debug != "full":
      # New room.
      user = generate_random(8)
      room = Room(key_name = room_key)
      room.add_user(user)
      if debug != 'loopback':
        initiator = 0
      else:
        room.add_user(user)
        initiator = 1
    elif room and room.get_occupancy() == 1 and debug != 'full':
      # 1 occupant.
      user = generate_random(8)
      room.add_user(user)
      initiator = 1
    else:
      # 2 occupants (full).
      template = jinja_environment.get_template('full.html')
      self.response.out.write(template.render({ 'room_key': room_key }))
      logging.info('Room ' + room_key + ' is full')
      return

    room_link = 'https://apprtc.appspot.com/?r=' + room_key
    if debug:
      room_link += ('&debug=' + debug)
    if turn_server:
      room_link += ('&ts=' + turn_server)
    if stun_server:
      room_link += ('&ss=' + stun_server)

    token = channel.create_channel(room_key + '/' + user)
    pc_config = make_pc_config(stun_server, turn_server)
    template_values = {'token': token,
                       'me': user,
                       'room_key': room_key,
                       'room_link': room_link,
                       'initiator': initiator,
                       'pc_config': json.dumps(pc_config)
                      }
    template = jinja_environment.get_template('index.html')
    self.response.out.write(template.render(template_values))
    logging.info('User ' + user + ' added to room ' + room_key)
    logging.info('Room ' + room_key + ' has state ' + str(room))


app = webapp2.WSGIApplication([
    ('/', MainPage),
    ('/message', MessagePage),
    ('/_ah/channel/connected/', ConnectPage),
    ('/_ah/channel/disconnected/', DisconnectPage)
  ], debug=True)
