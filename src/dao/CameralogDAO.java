package dao;

import java.sql.*;
import java.util.ArrayList;

import entity.Cameralog;
import util.DBConn;

public class CameralogDAO {
	
	/**
	 * This function is used to update the log
	 * 
	 * @param cameralog
	 */
	public void updateCameralog(Cameralog cameralog) {
		int id = cameralog.getId();
		Timestamp time = cameralog.getTime();
		int count = cameralog.getCount();

		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "insert into cameralog values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setTimestamp(2, time);
			ps.setInt(3, count);
			ResultSet rs = ps.executeQuery();
			DBConn.closeConnection(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * This function is used to predict the number.
	 * 
	 * @param double[] fs
	 * @return predict number
	 */
	public int predict(double[] fs) {

		int size = fs.length;
		int tsize = fs.length - 1;
		double[] arr = fs;
		double[] arr1 = new double[size];
		double sum = 0;
		for (int i = 0; i < size; i++) {
			sum += arr[i];
			arr1[i] = sum;
		}
		double[] arr2 = new double[tsize];
		for (int i = 0; i < tsize; i++) {
			arr2[i] = (double) (arr1[i] + arr1[i + 1]) / 2;
		}

		double[][] B = new double[tsize][2];
		for (int i = 0; i < tsize; i++) {
			for (int j = 0; j < 2; j++) {
				if (j == 1)
					B[i][j] = 1;
				else
					B[i][j] = -arr2[i];
			}

		}

		double[][] YN = new double[tsize][1];
		for (int i = 0; i < tsize; i++) {
			for (int j = 0; j < 1; j++) {
				YN[i][j] = arr[i + 1];
			}
		}

		double[][] BT = new double[2][tsize];
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < tsize; j++) {
				BT[i][j] = B[j][i];
			}
		}

		double[][] B2T = new double[2][2];
		for (int i = 0; i < 2; i++) {

			{
				for (int j = 0; j < 2; j++) {
					for (int k = 0; k < tsize; k++) {
						B2T[i][j] = B2T[i][j] + BT[i][k] * B[k][j];
					}
				}

			}
		}

		double[][] B_2T = new double[2][2];
		B_2T[0][0] = (1 / (B2T[0][0] * B2T[1][1] - B2T[0][1] * B2T[1][0])) * B2T[1][1];
		B_2T[0][1] = (1 / (B2T[0][0] * B2T[1][1] - B2T[0][1] * B2T[1][0])) * (-B2T[0][1]);
		B_2T[1][0] = (1 / (B2T[0][0] * B2T[1][1] - B2T[0][1] * B2T[1][0])) * (-B2T[1][0]);
		B_2T[1][1] = (1 / (B2T[0][0] * B2T[1][1] - B2T[0][1] * B2T[1][0])) * B2T[0][0];

		double[][] A = new double[2][tsize];
		for (int i = 0; i < 2; i++) {
			{
				for (int j = 0; j < tsize; j++) {
					for (int k = 0; k < 2; k++) {
						A[i][j] = A[i][j] + B_2T[i][k] * BT[k][j];
					}
				}

			}
		}

		double[][] C = new double[2][1];
		for (int i = 0; i < 2; i++) {

			{
				for (int j = 0; j < 1; j++) {
					for (int k = 0; k < tsize; k++) {
						C[i][j] = C[i][j] + A[i][k] * YN[k][j];
					}
				}

			}
		}

		double a = C[0][0], b = C[1][0];
		int i = 3;
		double Y = (arr[0] - b / a) * Math.exp(-a * (i + 1)) - (arr[0] - b / a) * Math.exp(-a * i);

		return (new Double(Y)).intValue();
	}


	/**
	 * This function is used to get the predict number of a camera using id.
	 * 
	 * 
	 * @param id
	 * @return predictNumber
	 */
	public int getPredict(int id) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		int predict =0;
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "select * from cameralog where id=? and  time between date_add(now(), interval - 10.5 minute) and date_add(now(), interval - 9.5 minute)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list2.add(rs.getInt("count"));
			}
			list.add(getBiggest(list2));
			list2.clear();

			sql = "select * from cameralog where id=? and  time between date_add(now(), interval - 8.5 minute) and date_add(now(), interval - 7.5 minute)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list2.add(rs.getInt("count"));
			}
			list.add(getBiggest(list2));
			list2.clear();

			sql = "select * from cameralog where id=? and  time between date_add(now(), interval - 6.5 minute) and date_add(now(), interval - 5.5 minute)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list2.add(rs.getInt("count"));
			}
			list.add(getBiggest(list2));
			list2.clear();

			sql = "select * from cameralog where id=? and  time between date_add(now(), interval - 4.5 minute) and date_add(now(), interval - 3.5 minute)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list2.add(rs.getInt("count"));
			}
			list.add(getBiggest(list2));
			list2.clear();

			sql = "select * from cameralog where id=? and  time between date_add(now(), interval - 0.5 minute) and now()";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list2.add(rs.getInt("count"));
			}
			list.add(getBiggest(list2));
			list2.clear();
			
			DBConn.closeConnection(conn, ps, rs);
			int length = list.size();
			for(int i=length; i<6; i++) {
				list2.add(0);
			}
			double[] fs = new double[6];
			for (int i = 0; i < list2.size(); i++) {
				fs[i] = list2.get(i);
			}
			for(int i=0; i<length; i++) {
				fs[i+list2.size()] = list.get(i);
			}
			predict = predict(fs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return predict;
	}
	
	/**
	 * This function is used to get the information of internals
	 * front page get the real-time data
	 * 
	 * @return values [two minutes latter],[now][2 minutes ago],[4 minutes ago],[6
	 *         minutes ago],[8 minutes ago],[10 minutes ago]
	 */
	public String getValues(int id) {
		String str = "";
		String result = "";
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "select count from cameralog where id=? and time between date_add(now(), interval - 10.5 minute) and date_add(now(), interval - 9.52 minute)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt("count"));
			}
			str = str + getBiggest(list) + ",";
			list.clear();

			sql = "select count from cameralog where id=? and time between date_add(now(), interval - 8.5 minute) and date_add(now(), interval - 7.52 minute)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt("count"));
			}
			str = str + getBiggest(list) + ",";
			list.clear();

			sql = "select count from cameralog where id=? and time between date_add(now(), interval - 6.5 minute) and date_add(now(), interval - 5.52 minute)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt("count"));
			}
			str = str + getBiggest(list) + ",";
			list.clear();

			sql = "select count from cameralog where id=? and time between date_add(now(), interval - 4.5 minute) and date_add(now(), interval - 3.52 minute)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt("count"));
			}
			str = str + getBiggest(list) + ",";
			list.clear();

			sql = "select count from cameralog where id=? and time between date_add(now(), interval - 2.5 minute) and date_add(now(), interval - 1.52 minute)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt("count"));
			}
			str = str + getBiggest(list) + ",";
			list.clear();

			sql = "select count from cameralog where id=? and time between date_add(now(), interval - 0.5 minute) and now()";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt("count"));
			}
			str = str + getBiggest(list) + ",";
			list.clear();

			DBConn.closeConnection(conn, ps, rs);
			
			
			String [] strs = str.split(",");
			int length = strs.length;
			for(int j=length; j<6; j++) {
				result = "0,"+result;
			}
			for(int j=0; j<length; j++) {
				result= result + strs[j] + ",";
			}

			result =result+ String.valueOf(getPredict(id));
			Timestamp time = new Timestamp(System.currentTimeMillis());
//			System.out.println(time);
//			System.out.println('\n');
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * This function is used to get biggest number of list.
	 * 
	 * @param list
	 * @return biggest
	 */
	public int getBiggest(ArrayList<Integer> list) {
		int biggest = 0;
		int length = list.size();
		for (int i = 0; i < length; i++) {
			if (list.get(i) >= biggest) {
				biggest = list.get(i);
			}
		}
		return biggest;
	}
	
	public String getCameraStatus(int id){
		String result = "";
		try{
			Connection conn = DBConn.getINSTANCE().getConnection();
			String sql = "select count from cameralog where id=? and time between date_add(now(), interval - 1 second) and now()";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			rs = ps.executeQuery();
			while (rs.next()) {
				result = String.valueOf(rs.getInt("count"));
//				System.out.println("count" + rs.getInt("count"));
			}
			DBConn.closeConnection(conn, ps, rs);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result.equals(""))
			return "close";
		else
			return "open";
	}
}
