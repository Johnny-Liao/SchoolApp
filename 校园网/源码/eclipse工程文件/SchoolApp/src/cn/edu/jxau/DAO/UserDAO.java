package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class UserDAO {

	private static DB db = DBFactory.getInstance();

	public static boolean isUser(String username,String password) {
		String sql = "select * from myuser where myusername='" + username
				+ "' and password='" + password + "'";
		boolean bool = false;
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			if (rs.next()) {
				bool = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return bool;
	}
	
	public static boolean addUser(User user) {
		boolean bool = false;
		String sql = "insert into myuser value(null,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = db.getConn();
		PreparedStatement pstmt = db.getpStmt(conn, sql);
		try {
			pstmt.setString(1, user.getMyusername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getNickname());
			pstmt.setString(4, user.getPlace());
			pstmt.setString(5, user.getSex());
			pstmt.setString(6, user.getInsititute());
			pstmt.setInt(7, user.getMyclass());
			pstmt.setString(8, user.getMobile());
			pstmt.setString(9, user.getQq());
			pstmt.setString(10, user.getMajor());
			pstmt.setInt(11, user.getBedroom());
			pstmt.executeUpdate();
			bool = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closepStmt(pstmt);
		return bool;
	}
	
	public static User getUser(String username,String password) {
		User user = new User();
		String sql = "select * from myuser where myusername='" + username
				+ "' and password='" + password + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setMyusername(rs.getString("myusername"));
				user.setPassword(rs.getString("password"));
				user.setNickname(rs.getString("nickname"));
				user.setPlace(rs.getString("place"));
				user.setSex(rs.getString("sex"));
				user.setInsititute(rs.getString("insititute"));
				user.setMyclass(rs.getInt("class"));
				user.setMobile(rs.getString("moblie"));
				user.setQq(rs.getString("qq"));
				user.setMajor(rs.getString("major"));
				user.setBedroom(rs.getInt("bedroom"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return user;
	}
	
	public static User getUser(String id) {
		User user = new User();
		String sql = "select * from myuser where id='" + id + "'"; 
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setMyusername(rs.getString("myusername"));
				user.setPassword(rs.getString("password"));
				user.setNickname(rs.getString("nickname"));
				user.setPlace(rs.getString("place"));
				user.setSex(rs.getString("sex"));
				user.setInsititute(rs.getString("insititute"));
				user.setMyclass(rs.getInt("class"));
				user.setMobile(rs.getString("moblie"));
				user.setQq(rs.getString("qq"));
				user.setMajor(rs.getString("major"));
				user.setBedroom(rs.getInt("bedroom"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return user;
	}
	
	public static User getUsername(String username) {
		User user = new User();
		String sql = "select * from myuser where myusername='" + username + "'"; 
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setMyusername(rs.getString("myusername"));
				user.setPassword(rs.getString("password"));
				user.setNickname(rs.getString("nickname"));
				user.setPlace(rs.getString("place"));
				user.setSex(rs.getString("sex"));
				user.setInsititute(rs.getString("insititute"));
				user.setMyclass(rs.getInt("class"));
				user.setMobile(rs.getString("moblie"));
				user.setQq(rs.getString("qq"));
				user.setMajor(rs.getString("major"));
				user.setBedroom(rs.getInt("bedroom"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return user;
	}
	
	public static void delUser(String username) {
		String sql = "delete from myuser where myusername='" + username + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
	}
}
