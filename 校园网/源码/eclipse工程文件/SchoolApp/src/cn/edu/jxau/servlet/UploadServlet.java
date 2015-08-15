package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import cn.edu.jxau.DAO.NewstuDAO;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class UploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JspFactory jsp1 = JspFactory.getDefaultFactory();
        PageContext pageContext = jsp1.getPageContext(this, request, response, null, true,8192, true);
        SmartUpload smart = new SmartUpload();
        smart.initialize(pageContext);
        try {
			smart.upload();
			String ext = smart.getFiles().getFile(0).getFilePathName();
			NewstuDAO.setnewstu(ext);
		    smart.save("newstuupload");
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
        response.sendRedirect("index.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
