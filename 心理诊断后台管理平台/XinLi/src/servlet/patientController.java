package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.patientDaoImpl;
import model.patient;

/**
 * Servlet implementation class patientController
 */
@WebServlet("/patientController")
public class patientController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public patientController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actionUrl = request.getServletPath(); // 获取用户请求的路径
		System.out.println("路径：" + actionUrl);
		if (actionUrl.equals("/Dangan-add.do")) {//添加患者文档
			String patient_name = request.getParameter("patient_name");
			String patient_sex = request.getParameter("patient_sex");
			String patient_home = request.getParameter("patient_home");
			String patient_believe = request.getParameter("patient_believe");
			String patient_phone = request.getParameter("patient_phone");
			String patient_born = request.getParameter("patient_born");
			String patient_age = request.getParameter("patient_age");
			String patient_bornAddress = request.getParameter("patient_bornAddress");
			String patient_address = request.getParameter("patient_address");
			String patient_education = request.getParameter("patient_education");
			patient patient = new patient(patient_sex, patient_name, patient_home, patient_believe, patient_phone,
					patient_born, patient_age, patient_education, patient_bornAddress, patient_address);
			patientDaoImpl patientDao = new patientDaoImpl();
			patientDao.add(patient);// 存入数据库
			

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
		else if (actionUrl.equals("/Dangan-delete.do")) {//删除患者文档
			String[] ids=request.getParameterValues("selected");
			if(ids!=null) {
			int patient_ids[]=new int[ids.length];
			for(int i=0;i<ids.length;i++) {
				patient_ids[i]=Integer.parseInt(ids[i]);
			}
			patientDaoImpl patientDao = new patientDaoImpl();
			
			patientDao.delete_patients(patient_ids);
			}
			response.setHeader("refresh","0;url=Dangan.jsp");
			
		}
		else if (actionUrl.equals("/visitor/Dangan-add.do")) {//添加患者文档
			String patient_name = request.getParameter("patient_name");
			String patient_sex = request.getParameter("patient_sex");
			String patient_home = request.getParameter("patient_home");
			String patient_believe = request.getParameter("patient_believe");
			String patient_phone = request.getParameter("patient_phone");
			String patient_born = request.getParameter("patient_born");
			String patient_age = request.getParameter("patient_age");
			String patient_bornAddress = request.getParameter("patient_bornAddress");
			String patient_address = request.getParameter("patient_address");
			String patient_education = request.getParameter("patient_education");
			patient patient = new patient(patient_sex, patient_name, patient_home, patient_believe, patient_phone,
					patient_born, patient_age, patient_education, patient_bornAddress, patient_address);
			patientDaoImpl patientDao = new patientDaoImpl();
			patientDao.add(patient);// 存入数据库
			HttpSession session = request.getSession();
            session.setAttribute("patient",patient);
			response.sendRedirect("../test-one.jsp");//重定向
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
