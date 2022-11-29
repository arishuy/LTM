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
}
