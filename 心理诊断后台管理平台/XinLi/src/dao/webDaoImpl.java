
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletSecurityElement;

import Util.DBUtil;
import Util.UserException;

import model.*;

public class webDaoImpl implements IwebDao {

	@Override
	public void add(web web) {
		Connection connection = DBUtil.getConnection();

		String sql;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			sql = "insert into WEB(WEB_TYPE,WEB_TITLE,WRITE_TIME,WEB_PICTURE,WEB_CHARACTER) values"
					+ "('" + web.getWeb_type() + "','" + web.getWeb_title()+ "','"
					+ web.getWrite_time() + "','" + web.getWeb_picture() + "','"
					+ web.getWeb_character() + "')";
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
	public void delete_webs(int[] ids) {
		Connection connection = DBUtil.getConnection();
		String sql = "delete from WEB where WEB_ID =" + ids[0];
		for (int i = 1; i < ids.length; i++) {
			sql = sql + "  or WEB_ID=" + ids[i];
		}
		PreparedStatement preparedStatement = null;
		try {
			System.out.println("sql:"+sql);
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
	public void update(web web) {

		Connection connection = DBUtil.getConnection();
		String sql = "update WEB set WEB_TITLE='" + web.getWeb_title() + "',WRITE_TIME='"
				+ web.getWrite_time() + "',WEB_PICTURE='" + web.getWeb_picture() + "',WEB_CHARACTER='"
				+ web.getWeb_character() + "'  where WEB_ID=" + web.getWeb_id();
		PreparedStatement preparedStatement = null;
		try {
			System.out.println("sql:"+sql);
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
	public web load(int web_id) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from WEB where WEB_ID =" + web_id;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		web web = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				web = new web();
				web.setWeb_id(resultSet.getInt("WEB_ID"));
				web.setWeb_title(resultSet.getString("WEB_TITLE"));
				web.setWrite_time(resultSet.getString("WRITE_TIME"));
				web.setWeb_picture(resultSet.getString("WEB_PICTURE"));
				web.setWeb_character(resultSet.getString("WEB_CHARACTER"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return web;
	}
	
	@Override
	public List<web> load2(String web_type) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from WEB where WEB_TYPE ='" + web_type+"'";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<web> webs = new ArrayList<web>();
		web web = null;
		
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				web = new web();
				web.setWeb_id(resultSet.getInt("WEB_ID"));
				web.setWeb_type(resultSet.getString("WEB_TYPE"));
				web.setWeb_title(resultSet.getString("WEB_TITLE"));
				web.setWrite_time(resultSet.getString("WRITE_TIME"));
				web.setWeb_picture(resultSet.getString("WEB_PICTURE"));
				web.setWeb_character(resultSet.getString("WEB_CHARACTER"));
				webs.add(web);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return webs;
	}
	
	@Override
	public List<question> load_question() {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from QUESTION ";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<question> questions = new ArrayList<question>();
		question question = null;
		
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				question = new question();
				question.setQuestion_id(resultSet.getInt("QUESTION_ID"));
				question.setQuestion_type(resultSet.getString("QUESTION_TYPE"));
				question.setQueston_name(resultSet.getString("QUESTION_NAME"));
				question.setAnswer1(resultSet.getString("ANSWER1"));
				question.setAnswer2(resultSet.getString("ANSWER2"));
				question.setAnswer3(resultSet.getString("ANSWER3"));
				question.setAnswer4(resultSet.getString("ANSWER4"));
				questions.add(question);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return questions;
	}


	
	@Override
	public List<web> load_webs(int limit,int pages) {
		Connection connection = DBUtil.getConnection();
		//使用集合减运算符minus，该操作返回在第一个select中出现而不在第二个select中出现的记录
		String sql = "select * from WEB where rownum <=  " +  limit + " minus select * from WEB where rownum < " + (pages - 1) *limit;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<web> webs = new ArrayList<web>();
		web web = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				web = new web();
				web.setWeb_id(resultSet.getInt("WEB_ID"));
				web.setWeb_type(resultSet.getString("WEB_TYPE"));
				web.setWeb_title(resultSet.getString("WEB_TITLE"));
				web.setWrite_time(resultSet.getString("WRITE_TIME"));
				web.setWeb_picture(resultSet.getString("WEB_PICTURE"));
				web.setWeb_character(resultSet.getString("WEB_CHARACTER"));
				webs.add(web);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return webs;
	}

	@Override
	public List<web> seek_webs(String[] seek,int limit,int pages) {// 按条件搜索
		Connection connection = DBUtil.getConnection();
		String sql = "select * from WEB where";
		sql = sql + "  WEB_CHARACTER like '%" + seek[0] + "%' or WEB_TYPE='"+seek[0]+"'";
        sql=sql+" and rownum <=  " +  limit + " minus select * from WEB where rownum < " + (pages - 1) *limit;
		
        PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<web> webs = new ArrayList<web>();
		web web = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				web = new web();
				web.setWeb_id(resultSet.getInt("WEB_ID"));
				web.setWeb_type(resultSet.getString("WEB_TYPE"));
				web.setWeb_title(resultSet.getString("WEB_TITLE"));
				web.setWrite_time(resultSet.getString("WRITE_TIME"));
				web.setWeb_picture(resultSet.getString("WEB_PICTURE"));
				web.setWeb_character(resultSet.getString("WEB_CHARACTER"));
				webs.add(web);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return webs;
	}
	
	@Override
	public int load_couts() {//获得页面总条数
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from WEB";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int count=0;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				  count = resultSet.getInt(1);//结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值

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
