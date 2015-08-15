package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javassist.bytecode.Descriptor.Iterator;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class ToolsDAO {
	
	private static DB db = DBFactory.getInstance();
	
	public static List getInfo(String org,String id,String name) {
		List<String> list = new ArrayList<String>();
		String sql = "select * from " + org + " where insititute='" + ToolsDAO.getStr(id) + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				list.add(rs.getString(name));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		
		return list;
	}
	
	
	public  static String getStr(String id) {
		int mid = Integer.parseInt(id);
		String str = "";
		switch(mid) {
			case 1 : str="农学院"; break;
			case 2 : str="园林与艺术学院"; break; 
			case 3 : str="动物科学技术学院"; break; 
			case 4 : str="工学院"; break; 
			case 5 : str="经济管理学院"; break; 
			case 6 : str="计算机与信息工程学院"; break; 
			case 7 : str="软件学院"; break; 
			case 8 : str="国土资源与环境学院"; break;
			case 9 : str="人文与公共管理学院"; break; 
			case 10 : str="职业师范技术学院"; break; 
			case 11 : str="理学院"; break; 
			case 12 : str="食品科学与工程学院"; break; 
			case 13 : str="生物科学与工程学院"; break; 
			case 14 : str="外国语学院"; break; 
			case 15 : str="马克思主义学院"; break; 
			case 16 : str="继续教育学院"; break; 
			case 17 : str="南昌商学院"; break; 
		}
		return str;
	}
	
}
