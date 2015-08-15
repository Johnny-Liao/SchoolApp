package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Houseinfo;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class HouseDAO {
	private static DB db = DBFactory.getInstance();
	
	public static List getHouseInfo(String house) {
		List<Houseinfo> list = new ArrayList<Houseinfo>();
		Houseinfo houseinfo = null;
		String sql = "select * from houseinfo where houseplace like '%" + house + "%'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				houseinfo = new Houseinfo();
				houseinfo.setId(rs.getInt("id"));
				houseinfo.setHousename(rs.getString("housename"));
				houseinfo.setHouseplace(rs.getString("houseplace"));
				houseinfo.setHousephone(rs.getString("housephone"));
				houseinfo.setHousemoney(rs.getString("housemoney"));
				houseinfo.setHousetime(rs.getString("housetime"));
				list.add(houseinfo);
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
