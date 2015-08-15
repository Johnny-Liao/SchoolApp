package servlet.file;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExportExcelSerlvet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		// 得到文件名字和路径
		String filename = "导出例子.xls";
		// 我觉得调用这个方法没有用处，就注释了 liyg
		// response.reset();
		// application/octet-stream
		response.setContentType("aplication/vnd.ms-excel");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "No-cache");
		response.setDateHeader("Expires", 0);
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ new String(filename.getBytes("gb18030"), "iso8859-1") + "\"");

		// 打开指定文件的流信息
		// 判断是在数据库中还是在物理文件系统中
		try {

			response.getWriter()
					.write("<table border='1'><tr><td>标题1</td><td>标题2</td><td>标题3</td><td>标题4</td></tr>"
							+ "<tr><td>内容1</td><td>内容2</td><td>内容3</td><td>内容4</td></tr>"
							+ "<tr><td>内容1</td><td>内容2</td><td>内容3</td><td>内容4</td></tr>"
							+ "<tr><td>内容1</td><td>内容2</td><td>内容3</td><td>内容4</td></tr>"
							+ "<tr><td>内容1</td><td>内容2</td><td>内容3</td><td>内容4</td></tr>"
							+ "<tr><td>内容1</td><td>内容2</td><td>内容3</td><td>内容4</td></tr></table>");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			response.getWriter().close();
		}
	}

}
