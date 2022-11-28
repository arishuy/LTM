package model.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Bean.Product;

public class ProductDAO {
	public static Product getProduct(int id) {
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from product where id='" + id + "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				return new Product(rs.getInt("id"),rs.getInt("id_ncc"), rs.getString("name"), rs.getDouble("price"), rs.getString("type"),
						 rs.getInt("amount"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public static ArrayList<Product> getListProducts() {
		List<Product> list = new ArrayList<>();
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from product";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Product(rs.getInt("id"),rs.getInt("id_ncc"), rs.getString("name"), rs.getDouble("price"), rs.getString("type"),
						 rs.getInt("amount")));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return (ArrayList<Product>) list;
		}
	
}
