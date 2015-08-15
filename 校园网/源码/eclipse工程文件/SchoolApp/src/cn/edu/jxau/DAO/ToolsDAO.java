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
			case 1 : str="ũѧԺ"; break;
			case 2 : str="԰��������ѧԺ"; break; 
			case 3 : str="�����ѧ����ѧԺ"; break; 
			case 4 : str="��ѧԺ"; break; 
			case 5 : str="���ù���ѧԺ"; break; 
			case 6 : str="���������Ϣ����ѧԺ"; break; 
			case 7 : str="���ѧԺ"; break; 
			case 8 : str="������Դ�뻷��ѧԺ"; break;
			case 9 : str="�����빫������ѧԺ"; break; 
			case 10 : str="ְҵʦ������ѧԺ"; break; 
			case 11 : str="��ѧԺ"; break; 
			case 12 : str="ʳƷ��ѧ�빤��ѧԺ"; break; 
			case 13 : str="�����ѧ�빤��ѧԺ"; break; 
			case 14 : str="�����ѧԺ"; break; 
			case 15 : str="���˼����ѧԺ"; break; 
			case 16 : str="��������ѧԺ"; break; 
			case 17 : str="�ϲ���ѧԺ"; break; 
		}
		return str;
	}
	
}
