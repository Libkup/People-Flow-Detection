package dao;

import java.sql.*;
import java.util.ArrayList;

import entity.Camera;
import util.DBConn;

public class CameraDAO {
	
	/**
	 * This function is used to get name of camera.
	 * 
	 * @param id
	 * @return name
	 */
	public String getName(int id) {
		String name = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	 * This function is used to get location of camera.
	 * 
	 * @param id
	 * @return location
	 */
	public String getLocation(int id) {
		String location = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				location = rs.getString("location");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return location;
	}
	
	/**
	 * This function is used to get description of camera.
	 * 
	 * @param id
	 * @return description
	 */
	public String getDescription(int id) {
		String description = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				description = rs.getString("description");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return description;
	}
	
	/**
	 * This function is used to get rtmpAddress of camera.
	 * 
	 * @param id
	 * @return rtmpAddress
	 */
	public String getRtmpAddress(int id) {
		String rtmpAddress = "";
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rtmpAddress = rs.getString("rtmp_address");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rtmpAddress;
	}
	
	/**
	 * This function is used to get highest_history number of people an hour.
	 * 
	 * @param id
	 * @return highest_history
	 */
	public int getHighest(int id) {
		int highest_history = 0;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				highest_history = rs.getInt("highest_history");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return highest_history;
	}

	/**
	 * This function is used to get highest number of people an hour.
	 * 
	 * @param id
	 * @return highest_hour
	 */
	public int getHighest_hour(int id) {
		int Highest_hour = 0;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Highest_hour = rs.getInt("highest_hour");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Highest_hour;
	}
	
	/**
	 * This function is used to get threshold by id
	 * 
	 * @param id
	 * @return threshold
	 */
	public int getthreshold(int id) {
		int threshold = 0;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				threshold = rs.getInt("threshold");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return threshold;
	}
	
	/**
	 * This function is used to update the threshold of target camera
	 * 
	 * @param id
	 * @param threshold
	 */
	public void updateThreshold(int id, int threshold) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "update camera set threshold=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, threshold);
			ps.setInt(2, id);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * This function is used to update the highest value of target camera
	 * 
	 * @param id
	 * @param highestHistory
	 */
	public void updateHighestHistory(int id, int highestHistory) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "update camera set highest_history=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, highestHistory);
			ps.setInt(2, id);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * This function is used to update the highest_hour value of target camera
	 * 
	 * @param id
	 * @param highestHour
	 */
	public void updateHighestHour(int id, int highestHour) {
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "update camera set highest_hour=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, highestHour);
			ps.setInt(2, id);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * This function is used to add the camera 
	 * 
	 * @param camera
	 *
	 */
	public int addCamera(Camera camera) {
		String name = camera.getName();
		String location = camera.getLocation();
		String description = camera.getDescription();
		String rtmp_address = camera.getRtmpAddress();
		int highest_history = camera.getHighestHistory();
		int highest_hour = camera.getHighestHour();
		int threshold = camera.getThreshold();
		int id = 0;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "insert into camera(name,location,description,rtmp_address,highest_history,highest_hour,threshold) values(?,?,?,?,?,?,?);";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, location);
			ps.setString(3, description);
			ps.setString(4, rtmp_address);
			ps.setInt(5, highest_history);
			ps.setInt(6,highest_hour);
			ps.setInt(7,threshold);
			ResultSet rs = ps.executeQuery();
			id = rs.getInt(1);
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
		
	}
	
	/**
	 * This function is used to get a list of camera name
	 * 
	 * @return list <String>
	 */
	public ArrayList<String>  getNameList() {
		String name = "";
		ArrayList <String> list = new ArrayList<String> ();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				name = rs.getString("name");
				list.add(name);
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * This function is used to get id by name
	 * 
	 * @param name
	 * @return id
	 */
	public int getId(String name) {
		int id = 0;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();

			String sql = "select * from camera where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt("id");
			}
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
//	/**
//	 * 
//	 * @param args
//	 */
//	public static void main(String[] args) {
//		CameraDAO cameradao = new CameraDAO();
//		ArrayList<String> list = cameradao.getNameList();
//		System.out.println(list.toString());
//		
//		for (int i = 0; i < list.size(); i++) {
//			System.out.print(cameradao.getId(list.get(i))+" ");
//		}
//		cameradao.updateHighestHistory(1, 666);
//		cameradao.updateHighestHour(1, 777);
//	}
	
}
