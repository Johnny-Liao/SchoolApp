package cn.edu.jxau.DB;

public class DBFactory {
	public static DB getInstance() {
		return MySQLDB.getInstance();
	}
}
