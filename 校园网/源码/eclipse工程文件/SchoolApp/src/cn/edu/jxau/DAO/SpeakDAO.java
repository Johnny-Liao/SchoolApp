package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Speak;
import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class SpeakDAO {
	private static DB db = DBFactory.getInstance();
	
	public static List getAllInfo() {
		String sql = "select * from speak order by id desc";
		List<Speak> list = new ArrayList<Speak>();
		Speak speak = null;
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				speak = new Speak();
				speak.setId(rs.getInt("id"));
				speak.setSpeakname(rs.getString("speakname"));
				speak.setSpeaktime(rs.getString("speaktime"));
				speak.setMytext(rs.getString("mytext"));
				list.add(speak);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static boolean setInfo(User user, String text) {
		boolean bool = false;
		String sql = "insert into speak value(null,?,now(),?)";
		Connection conn = db.getConn();
		PreparedStatement pstmt = db.getpStmt(conn, sql);
		try {
			pstmt.setString(1, user.getNickname());
			pstmt.setString(2, text);
			pstmt.executeUpdate();
			bool = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closepStmt(pstmt);
		return bool;
	}
	
	public static List getAboutme(String nickname) {
		String sql = "select * from speak where speakname='" + nickname + "' order by id desc";
		List<Speak> list = new ArrayList<Speak>();
		Speak speak = null;
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				speak = new Speak();
				speak.setId(rs.getInt("id"));
				speak.setSpeakname(rs.getString("speakname"));
				speak.setSpeaktime(rs.getString("speaktime"));
				speak.setMytext(rs.getString("mytext"));
				list.add(speak);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
 }
