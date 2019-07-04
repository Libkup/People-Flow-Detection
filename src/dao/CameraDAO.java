package dao;

import java.sql.*;

import entity.Camera;
import util.DBConn;

public class CameraDAO {
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
}
