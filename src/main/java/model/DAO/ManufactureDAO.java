package model.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Bean.Manufacture;

public class ManufactureDAO {
	public static ArrayList<Manufacture> getListManufactures() {
		List<Manufacture> list = new ArrayList<>();
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from manufacture";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Manufacture(rs.getInt("id"), rs.getString("name")));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return (ArrayList<Manufacture>) list;
	}

	public static int add(Manufacture manufacture) {
		int rs = 0;
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "insert into manufacture (name)" + " values ('" + manufacture.getName() + "')";
			rs = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int update(Manufacture manufacture) {
		int rs = 0;
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "update manufacture set name = '" + manufacture.getName() + " where id = "
					+ manufacture.getId();
			rs = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int delete(int id) {
		int rs = 0;
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "delete form manufacture where id = " + id;
			rs = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
