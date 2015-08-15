package cn.edu.jxau.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.jxau.Bean.Blog;
import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DB.DB;
import cn.edu.jxau.DB.DBFactory;

public class BlogDAO {
	
	private static DB db = DBFactory.getInstance();
	
	public static List getallBlog() {
		String sql = "select * from myblog";
		List<Blog> list = new ArrayList<Blog>();
		Blog blog = null;
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				blog = new Blog();
				blog.setId(rs.getInt("id"));
				blog.setTitle(rs.getString("title"));
				blog.setMyusername(rs.getString("myusername"));
				blog.setMydata(rs.getString("mydata"));
				blog.setInsititute(rs.getString("insititute"));
				blog.setArticle(rs.getString("article"));
				blog.setApproval(rs.getInt("approval"));
				blog.setOppse(rs.getInt("oppse"));
				list.add(blog);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static Blog getBlog(String id) {
		Blog blog = new Blog();
		String sql = "select * from myblog where id='" + id + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			if(rs.next()) {
				blog.setId(rs.getInt("id"));
				blog.setTitle(rs.getString("title"));
				blog.setMyusername(rs.getString("myusername"));
				blog.setMydata(rs.getString("mydata"));
				blog.setInsititute(rs.getString("insititute"));
				blog.setArticle(rs.getString("article"));
				blog.setApproval(rs.getInt("approval"));
				blog.setOppse(rs.getInt("oppse"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return blog;
	}
	
	public static List getBloglist(String username) {		
		List<Blog> list = new ArrayList<Blog>();
		Blog blog = null;
		String sql = "select * from myblog where myusername='" + username + "'";
		Connection conn = db.getConn();
		Statement stmt = db.getStmt(conn);
		ResultSet rs = db.getRs(stmt, sql);
		try {
			while(rs.next()) {
				blog = new Blog();
				blog.setId(rs.getInt("id"));
				blog.setTitle(rs.getString("title"));
				blog.setMyusername(rs.getString("myusername"));
				blog.setMydata(rs.getString("mydata"));
				blog.setInsititute(rs.getString("insititute"));
				blog.setArticle(rs.getString("article"));
				blog.setApproval(rs.getInt("approval"));
				blog.setOppse(rs.getInt("oppse"));
				list.add(blog);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		db.closeConn(conn);
		db.closeStmt(stmt);
		db.closeRs(rs);
		return list;
	}
	
	public static boolean setBlog(User user, String content, String title) {
		boolean bool = false;
		String sql = "insert into myblog value(null,?,?,now(),?,?,0,0)";
		Connection conn = db.getConn();
		PreparedStatement pstmt = db.getpStmt(conn, sql);
		try {
			pstmt.setString(1, title);
			pstmt.setString(2, user.getMyusername());
			pstmt.setString(3, user.getInsititute());
			pstmt.setString(4, content);
			pstmt.executeUpdate();
			bool = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bool;
	}
}
