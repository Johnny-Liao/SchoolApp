package cn.edu.jxau.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public interface DB {
	
		public Connection getConn();

		public void closeConn(Connection conn);

		public Statement getStmt(Connection conn);

		public void closeStmt(Statement stmt);
		
		public PreparedStatement getpStmt(Connection conn,String sql);
		
		public void closepStmt(PreparedStatement pstmt);

		public ResultSet getRs(Statement stmt, String sql);

		public void closeRs(ResultSet rs);

}
