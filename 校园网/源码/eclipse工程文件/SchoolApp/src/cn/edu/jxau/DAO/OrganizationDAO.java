package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Myorgan;
import cn.edu.jxau.Bean.Organization;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class OrganizationDAO {
	private static DB db = DBFactory.getInstance();

	public static List getOrganInfo(String id) {
		List<Organization> list = new ArrayList<Organization>();
		Organization organ = null;
		String sql = "select * from organization where id='" + id + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				organ = new Organization();
				organ.setId(rs.getInt("id"));
				organ.setName(rs.getString("name"));
				organ.setInsititute(rs.getString("insititute"));
				organ.setImage(rs.getString("image"));
				organ.setOrgantime(rs.getString("organtime"));
				organ.setServey(rs.getString("servey"));
				list.add(organ);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		System.out.println(list);
		return list;
	}
	
	public static List getInfo(String id) {
		List<Organization> list = new ArrayList<Organization>();
		Organization organ = null;
		String sql = "select * from organization where insititute='" + ToolsDAO.getStr(id) + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				organ = new Organization();
				organ.setId(rs.getInt("id"));
				organ.setImage(rs.getString("image"));
				organ.setInsititute(rs.getString("insititute"));
				organ.setName(rs.getString("name"));
				organ.setOrgantime(rs.getString("organtime"));
				organ.setServey(rs.getString("servey"));
				list.add(organ);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static Organization getOrgan(String id) {
		Organization organ = null;
		String sql = "select * from organization where id='" + id + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				organ = new Organization();
				organ.setId(rs.getInt("id"));
				organ.setName(rs.getString("name"));
				organ.setInsititute(rs.getString("insititute"));
				organ.setImage(rs.getString("image"));
				organ.setOrgantime(rs.getString("organtime"));
				organ.setServey(rs.getString("servey"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return organ;
	}
	
	public static void setMyorgan(Myorgan organ) {
		String sql = "insert into myorgan value(null,?,'ª·‘±',?,?,?,?,?,?,?,?,?,0)";
		Connection conn = db.getConn();
		PreparedStatement pstmt = db.getpStmt(conn, sql);
		try {
			pstmt.setInt(1, organ.getOrgan());
			pstmt.setString(2, organ.getMyname());
			pstmt.setString(3, organ.getMysex());
			pstmt.setString(4, organ.getMyinsititute());
			pstmt.setInt(5, organ.getMyclass());
			pstmt.setString(6, organ.getMytel());
			pstmt.setString(7, organ.getMyqq());
			pstmt.setInt(8, organ.getMybedroom());
			pstmt.setString(9, organ.getMyaccount());
			pstmt.setString(10, organ.getMyappraise());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closepStmt(pstmt);
	}
}
