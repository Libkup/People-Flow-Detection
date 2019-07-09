package dao;

import java.sql.*;
import java.util.ArrayList;

import util.DBConn;
import entity.Camera;
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
		String added_camera = user.getAdded_camera();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "insert into user values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, gender);
			ps.setString(5, phoneNumber);
			ps.setString(6, position);
			ps.setString(7,selfIntroduction);
			ps.setString(8,added_camera);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * This function is used to get name by email
	 * 
	 * @param eamil
	 * @return name
	 */
	public ArrayList<Integer> getadded_camera(String email) {
		String added_camera = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
	
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				added_camera = rs.getString("added_camera");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String a[]  = added_camera.split("-");
		ArrayList<Integer>  b = new ArrayList<Integer>();
		for(int i=0;i<a.length;i++){
		   b.add(Integer.valueOf(a[i]));
		}
		return b;
	}

	
	public ArrayList<Camera> getAddedCamera(String email) {
		String added_camera = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
	
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				added_camera = rs.getString("added_camera");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String a[]  = added_camera.split("-");
		ArrayList<Integer>  b = new ArrayList<Integer>();
		for(int i=0;i<a.length;i++){
		   b.add(Integer.valueOf(a[i]));
		}
		CameraDAO cameraDAO = new CameraDAO();
		ArrayList<Camera> addedCamera = new ArrayList<>();
		for(Integer id : b){
			Camera camera = new Camera();
			camera.setName(cameraDAO.getName(id));
			camera.setLocation(cameraDAO.getLocation(id));
			camera.setDescription(cameraDAO.getDescription(id));
			camera.setHighestHistory(cameraDAO.getHighest(id));
			camera.setHighestHour(cameraDAO.getHighest_hour(id));
			camera.setThreshold(cameraDAO.getthreshold(id));
			addedCamera.add(camera);
		}
		return addedCamera;
	}
	
	/**
	 * This function is used to get name by email
	 * 
	 * @param eamil
	 * @return name
	 */
	public String getname(String email) {
		String name = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
	
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				name = rs.getString("name");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	/**
	 * This function is used to get user by email
	 * 
	 * @param eamil
	 * @return user
	 */
	public User getuser(String email) {
		User user = new User();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * This function is used to update user 
	 * 
	 * @param user
	 * 
	 */
	public void UpdateUser(User user,String email) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "update user set name=?, email=?, password=?, gender=?, phone_number=?, position=?, self_introduction=?, added_camera=? where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getPhoneNumber());
			ps.setString(6, user.getPosition());
			ps.setString(7, user.getSelfIntroduction());
			ps.setString(8, user.getAdded_camera());
			ps.setString(9, email);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	public void upadateAddedCamera(String email, String addedCamera) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			
			String sql = "update user set added_camera = ? where email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,addedCamera);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * This function is used to delete user .
	 * 
	 * @param email
	 */
	public void DeleteUser(String email) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			
			String sql = "delete from user where email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<User> getUserByName(String name){
		
		ArrayList<User> users = new ArrayList<>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user where name like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
				users.add(user);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	
	public ArrayList<User> getUserByEmai(String email){
		ArrayList<User> users = new ArrayList<>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user where email like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + email + "%");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
				users.add(user);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public ArrayList<User> getUserByGender (String gender){
		ArrayList<User> users = new ArrayList<>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user where gender = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, gender);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
				users.add(user);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	
	public ArrayList<User> getUserByPhonenumber (String phonenumber){
		ArrayList<User> users = new ArrayList<>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user where phone_number like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + phonenumber + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
				users.add(user);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	
	public ArrayList<User> getUserByPosition (String position){
		ArrayList<User> users = new ArrayList<>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user where position = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, position);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
				users.add(user);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public ArrayList<User> getAllUser (){
		ArrayList<User> users = new ArrayList<>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from user ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
				users.add(user);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	/**
	 * This function is used to insert a online user's .
	 * 
	 * @param user
	 */
	public void AddOnlineUser(User user) {
		String name = user.getName();
		String email = user.getEmail();
		String password = user.getPassword();
		String gender = user.getGender();
		String phoneNumber = user.getPhoneNumber();
		String position = user.getPosition();
		String selfIntroduction = user.getSelfIntroduction();
		String added_camera = user.getAdded_camera();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "insert into useronline values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, gender);
			ps.setString(5, phoneNumber);
			ps.setString(6, position);
			ps.setString(7,selfIntroduction);
			ps.setString(8,added_camera);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * This function is used to delete online user .
	 * 
	 * @param email
	 */
	public void DeleteOnlineUser(String email) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			
			String sql = "delete from useronline where email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<User> getAllOnlineUser (){
		ArrayList<User> users = new ArrayList<>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from useronline ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setPosition(rs.getString("position"));
				user.setSelfIntroduction(rs.getString("self_introduction"));
				user.setAdded_camera(rs.getString("added_camera"));
				users.add(user);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
}
