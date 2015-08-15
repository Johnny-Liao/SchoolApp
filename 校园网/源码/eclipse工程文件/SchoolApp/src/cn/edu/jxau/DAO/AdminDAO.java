package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import cn.edu.jxau.Bean.Admin;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class AdminDAO {

	private static DB db = DBFactory.getInstance();

	public static boolean isAdmin(String username,String password) {
		String sql = "select * from myadmin where myusername='" + username
				+ "' and mypassword='" + password + "'";
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
}
