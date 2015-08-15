package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Myorgan;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class MyorganDAO {
	private static DB db = DBFactory.getInstance();
	
	public static List getall(String id) {
		String sql = "select * from myorgan where organ='" + id + "'";
		Myorgan myorgan = null;
		List<Myorgan> list = new ArrayList<Myorgan>();
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				if(rs.getInt("istrue") == 1) {
					myorgan = new Myorgan();
					myorgan.setMyname(rs.getString("myname"));
					myorgan.setJob(rs.getString("job"));
					list.add(myorgan);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
