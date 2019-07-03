package dao;

import java.sql.*;

import entity.Admin;
import util.DBConn;


public class AdminDAO {

	/**
	 * This function is use to verify if the admin exits in the database.
	 * 
	 * @param String email
	 * @return boolean true(admin exited, and password correct)/false(admin not exited
	 *         or password wrong)
	 */
	public boolean verifyExit(String email) {
		boolean bool = false;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "select * from admin where email=?";
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
	 * This function is used to verify the password at the situation of the admin
	 * exits.
	 * 
	 * @param name,pswd
	 * @return boolean true(password correct)/false( password wrong)
	 */
	public boolean verifyPswd(String email, String pswd) {
		String pswd2 = "";
		boolean bool = false;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "select * from admin where email=?";
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
	 * This function is used to insert a new admin's information.
	 * 
	 * @param admin
	 */
	public void register(Admin admin) {
		String name = admin.getName();
		String email = admin.getEmail();
		String password = admin.getPassword();
		String gender = admin.getGender();
		String phoneNumber = admin.getPhoneNumber();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "insert into admin values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, gender);
			ps.setString(5, phoneNumber);
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

			String sql = "select * from admin where name=?";
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
	
}