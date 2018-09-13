package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDaoImpl;
import dao.patientDaoImpl;
import dao.webDaoImpl;
import model.User;
import model.patient;

/**
 * Servlet implementation class userController
 */
@WebServlet("/userController")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUrl = request.getServletPath(); // 获取用户请求的路径
		System.out.println("路径：" + actionUrl);
		if (actionUrl.equals("/user-management-add.do")) {//添加患者文档
			String user_name = request.getParameter("user_name");
			String user_sex = request.getParameter("user_sex");
			String password = request.getParameter("password");
			String user_type = request.getParameter("user_type");
			User user = new User(user_name,password,user_type,user_sex);
			UserDaoImpl userDao = new UserDaoImpl();
			userDao.add(user);// 存入数据库
			

			// 改写页面
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String title = "";
			String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
			out.println(docType + "<html>\n" + "<head><meta charset=\"utf-8\"><title>" + title + "</title></head>\n"
					+ "<body bgcolor=\"#f0f0f0\">\n" + "</body>\n" + "<h1 style='color:red'>添加成功！</h1>" + "</html>\n");
		}
		else if (actionUrl.equals("/Dangan-edit.do")) {//添加患者文档
			String id=request.getParameter("patient_id");
			int patient_id =Integer.parseInt(id);
			String patient_name = request.getParameter("patient_name");
			String patient_sex = request.getParameter("patient_sex");
			String patient_home = request.getParameter("patient_home");
			String patient_age = request.getParameter("patient_age");
			String patient_education = request.getParameter("patient_education");
			String patient_believe = request.getParameter("patient_believe");
			String patient_phone = request.getParameter("patient_phone");
			patient patient = new patient(patient_id,patient_sex, patient_name, patient_home, patient_believe, patient_phone,
					patient_age, patient_education);
			patientDaoImpl patientDao = new patientDaoImpl();
			patientDao.update(patient);// 存入数据库
			

			// 改写页面
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String title = "";
			String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
			out.println(docType + "<html>\n" + "<head><meta charset=\"utf-8\"><title>" + title + "</title></head>\n"
					+ "<body bgcolor=\"#f0f0f0\">\n" + "</body>\n" + "<h1 style='color:red'>编辑成功！</h1>" + "</html>\n");
	     }
		else if (actionUrl.equals("/user-management-delete2.do")) {//删除患者文档
			String ids[]=new String[1];
			ids[0]=request.getParameter("user_id");
			if(ids!=null) {
			int user_ids[]=new int[ids.length];
			for(int i=0;i<ids.length;i++) {
				user_ids[i]=Integer.parseInt(ids[i]);
			}
			UserDaoImpl userDao = new UserDaoImpl();
			
			userDao.delete_users(user_ids);
			}
			response.setHeader("refresh","0;url=User_management.jsp");
			
		}
		else if (actionUrl.equals("/user-management-delete.do")) {//删除患者文档
			String[] ids=request.getParameterValues("selected");
			if(ids!=null) {
			int user_ids[]=new int[ids.length];
			for(int i=0;i<ids.length;i++) {
				user_ids[i]=Integer.parseInt(ids[i]);
			}
			UserDaoImpl userDao = new UserDaoImpl();
			
			userDao.delete_users(user_ids);
			}
			response.setHeader("refresh","0;url=User_management.jsp");
			
		}
		else if (actionUrl.equals("/user-password.do")) {//修改密码
		     int id=Integer.parseInt(request.getParameter("user_id"));
			String old_password=request.getParameter("old_password");
			String new_password=request.getParameter("new_password");
			UserDaoImpl userDao=new UserDaoImpl();
			User user=userDao.load(id);
			if(user.getPassword().equals(old_password)) {	
				userDao.update_password(id,new_password);		
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				String title = "";
				String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
				out.println(docType + "<html>\n" + "<head><meta charset=\"utf-8\"><title>" + title + "</title></head>\n"
						+ "<body bgcolor=\"#f0f0f0\">\n" + "</body>\n" + "<h1 style='color:red'>修改成功！</h1>" + "</html>\n");
				
			}
			else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				String title = "";
				String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
				out.println(docType + "<html>\n" + "<head><meta charset=\"utf-8\"><title>" + title + "</title></head>\n"
						+ "<body bgcolor=\"#f0f0f0\">\n" + "</body>\n" + "<h1 style='color:red'>旧密码输入错误！</h1>" + "</html>\n");
			}
			
			
			/*
			userDao.delete_users(user_ids);*/
			
			
		
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
