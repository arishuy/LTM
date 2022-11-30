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
				return new Product(rs.getInt("id"), rs.getInt("id_ncc"), rs.getString("name"), rs.getDouble("price"),
						rs.getString("type"), rs.getInt("amount"));
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
				list.add(new Product(rs.getInt("id"), rs.getInt("id_ncc"), rs.getString("name"), rs.getDouble("price"),
						rs.getString("type"), rs.getInt("amount")));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return (ArrayList<Product>) list;
	}

	public static ArrayList<Product> getListProductsByManufacture(int id_ncc) {
		List<Product> list = new ArrayList<>();
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from product where id_ncc = " + id_ncc;
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Product(rs.getInt("id"), rs.getInt("id_ncc"), rs.getString("name"), rs.getDouble("price"),
						rs.getString("type"), rs.getInt("amount")));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return (ArrayList<Product>) list;
	}

	public static int add(Product product) {
		int rs = 0;
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "insert into product (id_ncc,amount,name,type,price)" + " values ('" + product.getId_ncc()
					+ "','" + product.getAmount() + "','" + product.getName() + "','" + product.getType() + "','"
					+ product.getPrice() + ")";
			rs = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int update(Product product) {
		int rs = 0;
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "update product set id_ncc = '" + product.getId_ncc() + "',amount = '" + product.getAmount()
					+ "',name = '" + product.getName() + "',type = '" + product.getType() + "',price = '"
					+ product.getPrice() + " where id = " + product.getId();
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
			String sql = "delete from product where id = " + id;
			rs = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
