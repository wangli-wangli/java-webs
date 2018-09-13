
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

import model.User;

public class UserDaoImpl implements IUserDao{

	@Override
	public void add(User user) {
		
				Connection connection = DBUtil.getConnection();
				
				String sql;
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
					sql="insert into T_USER(USER_NAME,USER_TYPE,SEX,STATUS,PASSWORD) values('"+user.getUsername()+"','"+user.getUser_type()
					+"','"+user.getSex()+"','1','"+user.getPassword()+"')";
					System.out.println("sql"+sql);
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				
			}

	@Override
	public void delete_users(int[] ids) {
		Connection connection = DBUtil.getConnection();
		String sql = "delete from T_USER where USER_ID =" + ids[0];
		for (int i = 1; i < ids.length; i++) {
			sql = sql + "  or USER_ID=" + ids[i];
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
	public void update_password(int id,String new_password) {
		
		Connection connection = DBUtil.getConnection();
		String sql = "update T_USER set PASSWORD='"+new_password+"' where USER_ID ="+id;
		PreparedStatement preparedStatement = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public User load(int id) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from T_USER where USER_ID = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
				user.setUser_id(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USER_NAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				user.setUser_type(resultSet.getString("USER_TYPE"));
				user.setStatus(resultSet.getString("STATUS"));
				user.setWrite_time(resultSet.getString("WRITE_TIME"));
				user.setSex(resultSet.getString("SEX"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	
	@Override
	public User load_username(String username) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from t_user where USER_NAME ='"+username+"'";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
				user.setUser_id(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USER_NAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				user.setUser_type(resultSet.getString("USER_TYPE"));
				user.setStatus(resultSet.getString("STATUS"));
				user.setWrite_time(resultSet.getString("WRITE_TIME"));
				user.setSex(resultSet.getString("SEX"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}

	@Override
	public 	List<User> load_users(int limit,int pages) {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from T_USER where rownum <=  " +  limit + " minus select * from T_USER where rownum < " + (pages - 1) *limit;
	System.out.println("sql:"+sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
				user.setUser_id(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USER_NAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				user.setUser_type(resultSet.getString("USER_TYPE"));
				user.setStatus(resultSet.getString("STATUS"));
				user.setWrite_time(resultSet.getString("WRITE_TIME"));
				user.setSex(resultSet.getString("SEX"));
				users.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	
	@Override
	public 	List<User> load_users(String[] seek,int limit,int pages) {
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from T_USER where";
	         	sql = sql + " USER_TYPE='" + seek[0] + "'";
				sql=sql+"  and  rownum <=  " +  limit + " minus select * from T_USER where rownum < " + (pages - 1) *limit;
	          
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<User> users = new ArrayList<User>();
		User user = null;
		System.out.println("sql:"+sql);
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
				user.setUser_id(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USER_NAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				user.setUser_type(resultSet.getString("USER_TYPE"));
				user.setStatus(resultSet.getString("STATUS"));
				user.setWrite_time(resultSet.getString("WRITE_TIME"));
				user.setSex(resultSet.getString("SEX"));
				users.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	
	@Override
	public int load_couts() {//获得页面总条数
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from T_USER";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int count=0;
		System.out.println("sql:"+sql);
		try {
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

		
	


