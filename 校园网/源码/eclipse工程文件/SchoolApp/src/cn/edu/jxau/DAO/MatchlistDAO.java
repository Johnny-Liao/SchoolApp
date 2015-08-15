package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Matchlist;
import cn.edu.jxau.Bean.Mymatch;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class MatchlistDAO {
	private static DB db = DBFactory.getInstance();
	
	public static List getall(String id) {
		String insititute = ToolsDAO.getStr(id);
		Mymatch mymatch = null;
		String sql = "select * from mymatch where insititute='" + insititute + "'";
		List<Mymatch> list = new ArrayList<Mymatch>();
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				mymatch = new Mymatch();
				mymatch.setId(rs.getInt("id"));
				mymatch.setInsititute(rs.getString("insititute"));
				mymatch.setMatchtype(rs.getString("matchtype"));
				mymatch.setServey("servey");
				list.add(mymatch);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static List getall() {
		Mymatch mymatch = null;
		String sql = "select * from mymatch order by id desc limit 0,3";
		List<Mymatch> list = new ArrayList<Mymatch>();
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				mymatch = new Mymatch();
				mymatch.setId(rs.getInt("id"));
				mymatch.setInsititute(rs.getString("insititute"));
				mymatch.setMatchtype(rs.getString("matchtype"));
				mymatch.setServey("servey");
				list.add(mymatch);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static Mymatch getMatch(String id) {
		Mymatch mymatch = null;
		String sql = "select * from mymatch where id='" + id + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				mymatch = new Mymatch();
				mymatch.setId(rs.getInt("id"));
				mymatch.setInsititute(rs.getString("insititute"));
				mymatch.setMatchtype(rs.getString("matchtype"));
				mymatch.setServey(rs.getString("servey"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return mymatch;
	}
	
	public static void setMatchlist(Matchlist matchlist) {
		String sql = "insert into matchlist value(null,?,?,?,?,?,?,?,?,?,?,?,?,null)";
		Connection conn = db.getConn();
		PreparedStatement pstmt = db.getpStmt(conn, sql);
		try {
			pstmt.setInt(1, matchlist.getMatchtype());
			pstmt.setString(2, matchlist.getPerson1());
			pstmt.setString(3, matchlist.getPerson2());
			pstmt.setString(4, matchlist.getPerson3());
			pstmt.setString(5, matchlist.getPerson4());
			pstmt.setString(6, matchlist.getPerson5());
			pstmt.setString(7, matchlist.getTel());
			pstmt.setString(8, matchlist.getInsititute());
			pstmt.setString(9, matchlist.getTitle());
			pstmt.setString(10, matchlist.getOurwork());
			pstmt.setString(11, matchlist.getTeacher());
			pstmt.setString(12, matchlist.getRemarks());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closepStmt(pstmt);
	}
}
