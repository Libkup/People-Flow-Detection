package dao;

import java.sql.*;

import util.DBConn;
import entity.User;

public class UserDAO {
	/**
	 * This function is use to verify if the user exits in the database.
	 * 
	 * @param String name
	 * @return boolean true(user exited, and password correct)/false(user not exited
	 *         or password wrong)
	 */
	public boolean verifyExit(String email) {
		boolean bool = false;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bool = true;
				break;
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}
	
	/**
	 * This function is used to verify the password at the situation of the user
	 * exits.
	 * 
	 * @param user
	 * @return boolean true(password correct)/false( password wrong)
	 */
	public boolean verifyPswd(String email, String pswd) {
		String pswd2 = "";
		boolean bool = false;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				pswd2 = rs.getString("password");
			}
			DBConn.closeConnection(conn, ps, rs);
			if (pswd.equals(pswd2)) {
				bool = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}

	/**
	 * This function is used to insert a new user's information.
	 * 
	 * @param user
	 */
	public void register(User user) {
		String name = user.getName();
		String email = user.getEmail();
		String password = user.getPassword();
		String gender = user.getGender();
		String phoneNumber = user.getPhoneNumber();
		String position = user.getPosition();
		String selfIntroduction = user.getSelfIntroduction();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "insert into user values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, gender);
			ps.setString(5, phoneNumber);
			ps.setString(6, position);
			ps.setString(7,selfIntroduction);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * This function is used to get email by name
	 * 
	 * @param name
	 * @return email
	 */
	public String getemail(String name) {
		String email = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				email = rs.getString("email");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return email;
	}
	
	/**
	 * This function is used to change password of the user .
	 * 
	 * @param email
	 * @param password
	 */
	public void changePassword(String email, String password) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			
			String sql = "update user set password = ? where email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,password);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
