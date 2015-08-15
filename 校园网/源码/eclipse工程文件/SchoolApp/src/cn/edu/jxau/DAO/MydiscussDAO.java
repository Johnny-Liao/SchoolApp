package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Mydiscuss;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class MydiscussDAO {
	private static DB db = DBFactory.getInstance();
	
	public static List getMd(String id) {
		List<Mydiscuss> list = new ArrayList<Mydiscuss>();
		String sql = "select * from mydiscuss where id='" + id + "'";
		Mydiscuss mydiscuss = null;
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				mydiscuss = new Mydiscuss();
				mydiscuss.setId(rs.getInt("id"));
				mydiscuss.setNickname(rs.getString("nickname"));
				mydiscuss.setDiscuss(rs.getString("discuss"));
				list.add(mydiscuss);
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
