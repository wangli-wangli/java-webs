
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
import model.patient;

public class patientDaoImpl implements IpatientDao {

	@Override
	public void add(patient patient) {

		Connection connection = DBUtil.getConnection();

		String sql;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			sql = "insert into PATIENT(PATIENT_SEX,PATIENT_HOME," + "PATIENT_BELIEVE,PATIENT_PHONE,PATIENT_BORN,"
					+ "PATIENT_AGE,PATIENT_NAME,PATIENT_EDUCATION," + "PATIENT_BORNADDRESS,PATIENT_ADDRESS) values"
					+ "('" + patient.getPatient_sex() + "','" + patient.getPatient_home() + "','"
					+ patient.getPatient_believe() + "','" + patient.getPatient_phone() + "','"
					+ patient.getPatient_born() + "','" + patient.getPatient_age() + "','" + patient.getPatient_name()
					+ "','" + patient.getPatient_education() + "','" + patient.getPatient_bornAddress() + "','"
					+ patient.getPatient_address() + "')";
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
	public void delete_patients(int[] ids) {
		Connection connection = DBUtil.getConnection();
		String sql = "delete from PATIENT where PATIENT_ID =" + ids[0];
		for (int i = 1; i < ids.length; i++) {
			sql = sql + "  or PATIENT_ID=" + ids[i];
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
	public void update(patient patient) {

		Connection connection = DBUtil.getConnection();
		String sql = "update PATIENT set PATIENT_NAME='" + patient.getPatient_name() + "',PATIENT_SEX='"
				+ patient.getPatient_sex() + "',PATIENT_HOME='" + patient.getPatient_home() + "',PATIENT_AGE='"
				+ patient.getPatient_age() + "',PATIENT_EDUCATION='" + patient.getPatient_education()
				+ "',PATIENT_BELIEVE='" + patient.getPatient_believe() + "',PATIENT_PHONE='"
				+ patient.getPatient_phone() + "'  where PATIENT_ID=" + patient.getPatient_id();
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
	public patient load(int patient_id) {
		Connection connection = DBUtil.getConnection();
		String sql = "select * from PATIENT where PATIENT_ID =" + patient_id;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		patient patient = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				patient = new patient();
				patient.setPatient_id(resultSet.getInt("PATIENT_ID"));
				patient.setPatient_name(resultSet.getString("PATIENT_NAME"));
				patient.setPatient_sex(resultSet.getString("PATIENT_SEX"));
				patient.setPatient_age(resultSet.getString("PATIENT_AGE"));
				patient.setPatient_education(resultSet.getString("PATIENT_EDUCATION"));
				patient.setPatient_believe(resultSet.getString("PATIENT_BELIEVE"));
				patient.setPatient_phone(resultSet.getString("PATIENT_PHONE"));
				patient.setPatient_home(resultSet.getString("PATIENT_HOME"));
				patient.setPatient_address(resultSet.getString("PATIENT_ADDRESS"));
				patient.setPatient_born(resultSet.getString("PATIENT_BORN"));
				patient.setPatient_bornAddress(resultSet.getString("PATIENT_BORNADDRESS"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return patient;
	}

	
	@Override
	public List<patient> load_patients(int limit,int pages) {
		Connection connection = DBUtil.getConnection();
		//使用集合减运算符minus，该操作返回在第一个select中出现而不在第二个select中出现的记录
		String sql = "select * from PATIENT where rownum <=  " +  limit + " minus select * from PATIENT where rownum < " + (pages - 1) *limit;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<patient> patients = new ArrayList<patient>();
		patient patient = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				patient = new patient();
				patient.setPatient_id(resultSet.getInt("PATIENT_ID"));
				patient.setPatient_name(resultSet.getString("PATIENT_NAME"));
				patient.setPatient_sex(resultSet.getString("PATIENT_SEX"));
				patient.setPatient_age(resultSet.getString("PATIENT_AGE"));
				patient.setPatient_education(resultSet.getString("PATIENT_EDUCATION"));
				patient.setPatient_believe(resultSet.getString("PATIENT_BELIEVE"));
				patient.setPatient_phone(resultSet.getString("PATIENT_PHONE"));
				patient.setPatient_home(resultSet.getString("PATIENT_HOME"));
				patients.add(patient);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return patients;
	}

	@Override
	public List<patient> seek_patients(String[] seek,int limit,int pages) {// 按条件搜索
		Connection connection = DBUtil.getConnection();
		String sql = "select * from PATIENT where";
		if (seek[0] != null && !(seek[0].equals(""))) {
			sql = sql + "  PATIENT_NAME like '%" + seek[0] + "%' ";
		}
		if (seek[1] != null && !(seek[1].equals(""))) {
			if(seek[0] != null && !(seek[0].equals(""))) sql=sql+" and ";
			sql = sql + " PATIENT_AGE='" + seek[1] + "' ";
		}
		if (seek[2] != null && !(seek[2].equals(""))) {
			if((seek[0] != null && !(seek[0].equals("")))||seek[1] != null && !(seek[1].equals(""))) sql=sql+" and ";
			sql = sql + " PATIENT_HOME like '%" + seek[2] + "%' ";
		}
		sql=sql+" and rownum <=  " +  limit + " minus select * from PATIENT where rownum < " + (pages - 1) *limit;
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<patient> patients = new ArrayList<patient>();
		patient patient = null;
		try {
			System.out.println("sql:"+sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				patient = new patient();
				patient.setPatient_id(resultSet.getInt("PATIENT_ID"));
				patient.setPatient_name(resultSet.getString("PATIENT_NAME"));
				patient.setPatient_sex(resultSet.getString("PATIENT_SEX"));
				patient.setPatient_age(resultSet.getString("PATIENT_AGE"));
				patient.setPatient_education(resultSet.getString("PATIENT_EDUCATION"));
				patient.setPatient_believe(resultSet.getString("PATIENT_BELIEVE"));
				patient.setPatient_phone(resultSet.getString("PATIENT_PHONE"));
				patient.setPatient_home(resultSet.getString("PATIENT_HOME"));
				patients.add(patient);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return patients;
	}
	
	@Override
	public int load_couts() {//获得页面总条数
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from PATIENT";
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
