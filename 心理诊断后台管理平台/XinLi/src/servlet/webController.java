package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import model.*;

/**
 * Servlet implementation class webController
 */
@WebServlet("/webController")
public class webController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public webController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionUrl = request.getServletPath(); // 获取用户请求的路径
		System.out.println("路径web：" + actionUrl);
		if (actionUrl.equals("/home-add.do")) {//添加患者文档
			String web_type = request.getParameter("web_type");
			String web_title = request.getParameter("web_title");
			String write_time = request.getParameter("write_time");
			String web_picture = request.getParameter("web_picture");
			String web_character = request.getParameter("web_character");
			web web = new web(web_type,web_title,write_time,web_picture,web_character);
			webDaoImpl webDao = new webDaoImpl();
			webDao.add(web);// 存入数据库
			

			// 改写页面
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String title = "";
			String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
			out.println(docType + "<html>\n" + "<head><meta charset=\"utf-8\"><title>" + title + "</title></head>\n"
					+ "<body bgcolor=\"#f0f0f0\">\n" + "</body>\n" + "<h1 style='color:red'>添加成功！</h1>" + "</html>\n");
		}
		else if (actionUrl.equals("/home-delete.do")) {//删除患者文档
			String[] ids=request.getParameterValues("selected");
			if(ids!=null) {
			int patient_ids[]=new int[ids.length];
			for(int i=0;i<ids.length;i++) {
				patient_ids[i]=Integer.parseInt(ids[i]);
			}
			webDaoImpl webDao = new webDaoImpl();
			
			webDao.delete_webs(patient_ids);
			}
			response.setHeader("refresh","0;url=Home.jsp");
			
		}
		else if (actionUrl.equals("/home-delete2.do")) {//删除患者文档
			String ids[]=new String[1];
			ids[0]=request.getParameter("web_id");
			if(ids!=null) {
			int web_ids[]=new int[ids.length];
			for(int i=0;i<ids.length;i++) {
				web_ids[i]=Integer.parseInt(ids[i]);
			}
			webDaoImpl webDao = new webDaoImpl();
			
			webDao.delete_webs(web_ids);
			}
			response.setHeader("refresh","0;url=Home.jsp");
			
		}
		else if (actionUrl.equals("/home-edit.do")) {//编辑web信息
			int web_id=Integer.parseInt(request.getParameter("web_id"));
			String web_title = request.getParameter("web_title");
			String write_time = request.getParameter("write_time");
			String web_picture = request.getParameter("web_picture");
			String web_character = request.getParameter("web_character");
			web web = new web(web_id,web_title,write_time,web_picture,web_character);
			webDaoImpl webDao = new webDaoImpl();
			webDao.update(web);// 存入数据库
			

			// 改写页面
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String title = "";
			String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
			out.println(docType + "<html>\n" + "<head><meta charset=\"utf-8\"><title>" + title + "</title></head>\n"
					+ "<body bgcolor=\"#f0f0f0\">\n" + "</body>\n" + "<h1 style='color:red'>编辑成功！</h1>" + "</html>\n");
	     }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
