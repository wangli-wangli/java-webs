package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.patientDaoImpl;
import dao.resultDaoImpl;
import model.result;

/**
 * Servlet implementation class resultController
 */
@WebServlet("/resultController")
public class resultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public resultController() {
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
		if (actionUrl.equals("/Data-management-delete.do")) {// 删除患者文档
			String[] ids = request.getParameterValues("selected");
			if (ids != null) {
				int result_ids[] = new int[ids.length];
				for (int i = 0; i < ids.length; i++) {
					result_ids[i] = Integer.parseInt(ids[i]);
				}
				resultDaoImpl resultDao = new resultDaoImpl();

				resultDao.delete_results(result_ids);
			}
			response.setHeader("refresh", "0;url=Data_management.jsp");

		} else if (actionUrl.equals("/Data-management-daochu.do")) {// 导出诊断记录文档
			resultDaoImpl resultDao = new resultDaoImpl();
			String table = "result";// 表名
			//得到long类型当前时间
			long l = System.currentTimeMillis();
			//new日期对象
			Date date = new Date(l);
			//转换提日期输出格式
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String now = dateFormat.format(date);
            
			String path = "C:\\Users\\lenovo\\Desktop\\" + "管理数据" + now + ".xls";// 文件路径：桌面
			String[] ids = request.getParameterValues("selected");
			if (ids != null) {
				int result_ids[] = new int[ids.length];
				for (int i = 0; i < ids.length; i++) {
					result_ids[i] = Integer.parseInt(ids[i]);
				}
				List<result> results = new ArrayList<result>();
				results = resultDao.load_results2(result_ids);// 取出勾选框的result值
				try {

					boolean is = resultDao.write(path, results);// 然后再写进文件
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		response.setHeader("refresh", "0;url=Data_management.jsp");

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
