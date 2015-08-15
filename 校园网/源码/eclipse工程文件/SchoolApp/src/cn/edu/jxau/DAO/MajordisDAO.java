package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Majordis;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class MajordisDAO {
	
	private static DB db = DBFactory.getInstance();
	
	public static List getDis(int sid) {
		List<Majordis> list = new ArrayList<Majordis>();
		Majordis majordis = null;
		String sql = "select * from majordis where id='" + sid + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				majordis = new Majordis();
				majordis.setId(rs.getInt("id"));
				majordis.setAuthor(rs.getString("author"));
				majordis.setDistime(rs.getString("distime"));
				majordis.setTitle(rs.getString("title"));
				majordis.setText(rs.getString("distext"));
				list.add(majordis);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static Majordis getarticle(String title) {
		Majordis majordis = null;
		String sql = "select * from majordis where title='" + title + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				majordis = new Majordis();
				majordis.setId(rs.getInt("id"));
				majordis.setAuthor(rs.getString("author"));
				majordis.setDistime(rs.getString("distime"));
				majordis.setTitle(rs.getString("title"));
				majordis.setText(rs.getString("distext"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return majordis;
	}
	public static void setMajordis(Majordis majordis) {
		String sql = "insert into majordis value(?,?,?,now(),?)";
		Connection conn = db.getConn();
		PreparedStatement pstmt = db.getpStmt(conn, sql);
		try {
			pstmt.setInt(1, majordis.getId());
			pstmt.setString(2, majordis.getTitle());
			pstmt.setString(3, majordis.getAuthor());
			pstmt.setString(4, majordis.getText());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closepStmt(pstmt);
	}
}
