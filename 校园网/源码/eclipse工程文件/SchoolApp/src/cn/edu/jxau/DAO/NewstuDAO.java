package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class NewstuDAO {
	
	private static DB db = DBFactory.getInstance();
	
	public static List getFile() {
		List<String> list = new ArrayList<String>();
		String sql = "select * from newstu";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				list.add(rs.getString("filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static void setnewstu(String filename) {
		String sql = "insert into newstu value(null,?)";
		Connection conn = db.getConn();
		PreparedStatement pstmt = db.getpStmt(conn,sql);
		try {
			pstmt.setString(1, filename);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closepStmt(pstmt);
	}
}
