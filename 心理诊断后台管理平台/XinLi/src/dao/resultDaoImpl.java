
package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletSecurityElement;

import Util.DBUtil;
import Util.UserException;

import model.User;
import model.patient;
import model.result;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class resultDaoImpl implements IresultDao {

	@Override
	public void add(result result) {

		Connection connection = DBUtil.getConnection();

		String sql;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			sql = "insert into RESULT(PATIENT_NAME,QUESTION,ANSWER," + "STATUS,QUESTION_TYPE) values" + "('"
					+ result.getPatient_name() + "','" + result.getQuestion() + "','" + result.getAnswer() + "','1','"
					+ result.getQuestion_type() + "')";
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}

	}

	@Override
	public void delete_results(int[] ids) {
		Connection connection = DBUtil.getConnection();
		String sql = "delete from RESULT where RESULT_ID =" + ids[0];
		for (int i = 1; i < ids.length; i++) {
			sql = sql + "  or RESULT_ID=" + ids[i];
		}
		PreparedStatement preparedStatement = null;
		System.out.println("sql:"+sql);
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}

	}


	@Override
	public result load(int result_id) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from RESULT where RESULT_ID =" + result_id;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		result result = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				result = new result();
				result.setResult_id(resultSet.getInt("RESULT_ID"));
				result.setPatient_id(resultSet.getInt("PATIENT_ID"));
				result.setPatient_name(resultSet.getString("PATIENT_NAME"));
				result.setQuestion(resultSet.getString("QUESTION"));
				result.setWrite_time(resultSet.getString("WRITE_TIME"));
				result.setAnswer(resultSet.getString("ANSWER"));
				result.setStatus(resultSet.getString("STATUS"));
				result.setQuestion_type(resultSet.getString("QUESTION_TYPE"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return result;
	}

	@Override
	public List<result> load_results(int limit, int pages) {
		Connection connection = DBUtil.getConnection();
		// 使用集合减运算符minus，该操作返回在第一个select中出现而不在第二个select中出现的记录
		String sql = "select * from RESULT where rownum <=  " + limit + " minus select * from  RESULT where rownum < "
				+ (pages - 1) * limit;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<result> results = new ArrayList<result>();
		result result = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				result = new result();
				result.setResult_id(resultSet.getInt("RESULT_ID"));
				result.setPatient_id(resultSet.getInt("PATIENT_ID"));
				result.setPatient_name(resultSet.getString("PATIENT_NAME"));
				result.setQuestion(resultSet.getString("QUESTION"));
				result.setWrite_time(resultSet.getString("WRITE_TIME"));
				result.setAnswer(resultSet.getString("ANSWER"));
				result.setStatus(resultSet.getString("STATUS"));
				result.setQuestion_type(resultSet.getString("QUESTION_TYPE"));
				results.add(result);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return results;
	}

	@Override
	public List<result> load_results2(int[] ids) {// 返回相应id号的数据
		Connection connection = DBUtil.getConnection();
		// 使用集合减运算符minus，该操作返回在第一个select中出现而不在第二个select中出现的记录
		String sql = "select * from RESULT where RESULT_ID =" + ids[0];
		for (int i = 1; i < ids.length; i++) {
			sql = sql + "  or RESULT_ID=" + ids[i];
		}
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<result> results = new ArrayList<result>();
		result result = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				result = new result();
				result.setResult_id(resultSet.getInt("RESULT_ID"));
				result.setPatient_id(resultSet.getInt("PATIENT_ID"));
				result.setPatient_name(resultSet.getString("PATIENT_NAME"));
				result.setQuestion(resultSet.getString("QUESTION"));
				result.setWrite_time(resultSet.getString("WRITE_TIME"));
				result.setAnswer(resultSet.getString("ANSWER"));
				result.setStatus(resultSet.getString("STATUS"));
				result.setQuestion_type(resultSet.getString("QUESTION_TYPE"));
				results.add(result);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return results;
	}

	@Override
	public int load_couts() {// 获得页面总条数
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from RESULT";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int count = 0;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				count = resultSet.getInt(1);// 结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return count;

	}

	public static void read(String filePath) throws IOException {// 从文件中读取
		String fileType = filePath.substring(filePath.lastIndexOf(".") + 1, filePath.length());
		InputStream stream = new FileInputStream(filePath);
		Workbook wb = null;
		if (fileType.equals("xls")) {
			wb = new HSSFWorkbook(stream);
		} else if (fileType.equals("xlsx")) {
			wb = new XSSFWorkbook(stream);
		} else {
			System.out.println("您输入的excel格式不正确");
		}
		Sheet sheet1 = wb.getSheetAt(0);
		for (Row row : sheet1) {
			for (Cell cell : row) {
				System.out.print(cell.getStringCellValue() + "  ");
			}
			System.out.println();
		}
	}

	@Override
	public boolean write(String outPath, List<result> results) throws IOException {// 写入文件
		String fileType = outPath.substring(outPath.lastIndexOf(".") + 1, outPath.length());
		System.out.println(fileType);
		// 创建工作文档对象
		Workbook wb = null;
		if (fileType.equals("xls")) {
			wb = new HSSFWorkbook();
		} else {
			System.out.println("您的文档格式不正确！");
			return false;
		}
		// 创建sheet对象
		Sheet sheet1 = (Sheet) wb.createSheet("sheet1");
		// 循环写入行数据
		int i = 0;
		for (result result : results) {
			Row row = (Row) sheet1.createRow(i);
			// 循环写入列数据
			Cell cell = row.createCell(0);
			cell.setCellValue(result.getResult_id());
			cell = row.createCell(1);
			cell.setCellValue(result.getPatient_name());
			cell = row.createCell(3);
			cell.setCellValue(result.getQuestion_type());
			cell = row.createCell(4);
			cell.setCellValue(result.getQuestion());
			cell = row.createCell(5);
			cell.setCellValue(result.getAnswer());
			cell = row.createCell(6);
			cell.setCellValue(result.getWrite_time());
			cell = row.createCell(7);
			cell.setCellValue(result.getStatus());
			i++;
		}

		// 创建文件流
		OutputStream stream = new FileOutputStream(outPath);
		// 写入数据
		wb.write(stream);
		// 关闭文件流
		stream.close();

		return true;
	}

	@Override
	public List<String> load_QuestionTypes() {// 获得问题的类型
		Connection connection = DBUtil.getConnection();
		String sql = "select distinct QUESTION_TYPE from RESULT";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<String> types = new ArrayList<String>();

		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			int i = 1;
			while (resultSet.next()) {
				String type = resultSet.getString(i);// 结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值
				types.add(type);
				i++;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return types;

	}

	@Override
	public List<String> load_Answers(String QUESTION_TYPE) {// 获得问题的类型
		Connection connection = DBUtil.getConnection();
		String sql = "select DISTINCT ANSWER  from RESULT where QUESTION_TYPE='" + QUESTION_TYPE + "'";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<String> answers = new ArrayList<String>();

		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			int i = 1;
			while (resultSet.next()) {
				String answer = resultSet.getString("ANSWER");// 结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值
				answers.add(answer);
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return answers;

	}

	@Override
	public String load_Question(String QUESTION_TYPE) {// 获得该类型的问题
		Connection connection = DBUtil.getConnection();
		String sql = "select QUESTION  from RESULT where QUESTION_TYPE='" + QUESTION_TYPE + "'";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String question = null;

		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				question = resultSet.getString(1);// 结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return question;

	}

	@Override
	public int load_AnswerCounts(String QUESTION_TYPE, String answer) {// 获得问题的类型
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*)  from RESULT where QUESTION_TYPE='" + QUESTION_TYPE + "' and ANSWER='" + answer
				+ "'";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int count = 0;

		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				count = resultSet.getInt(1);// 结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return count;

	}

}
