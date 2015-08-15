package cn.edu.jxau.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class NewstuuploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JspFactory jf = JspFactory.getDefaultFactory();
		PageContext pageContext = jf.getPageContext(this, request, response, null, true,8192, true);
		String filename = request.getParameter("filename");
		filename = new String(filename.getBytes("ISO8859-1"),"gbk");
		SmartUpload su = new SmartUpload();
		su.initialize(pageContext);
		su.setContentDisposition(null);
		try {
			su.downloadFile("newstuupload/" + filename);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
