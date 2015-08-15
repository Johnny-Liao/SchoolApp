package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Major;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class MajorDAO {
	
	private static DB db = DBFactory.getInstance();
	
	public static Major getMajor(String majorname) {
		Major major = new Major();
		String sql = "select * from major where majorname='" + majorname + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			if(rs.next()) {
				major.setId(rs.getInt("id"));
				major.setMajorname(rs.getString("majorname"));
				major.setInsititute(rs.getString("insititute"));
				major.setSynopsis(rs.getString("synopsis"));
				major.setImage(rs.getString("image"));
				major.setMajortime(rs.getString("majortime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		
		return major;
	}
	public static List getList() {
		List<Major> list = new ArrayList<Major>();
		Major major = null;
		String sql = "select * from major";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				major = new Major();
				major.setId(rs.getInt("id"));
				major.setMajorname(rs.getString("majorname"));
				major.setInsititute(rs.getString("insititute"));
				major.setSynopsis(rs.getString("synopsis"));
				major.setImage(rs.getString("image"));
				major.setMajortime(rs.getString("majortime"));
				list.add(major);
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
