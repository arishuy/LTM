package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.Bean.Account;

public class AccountDAO {

	public static Account getAccount(String id, String pass) {
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url = "jdbc:mysql://127.0.0.1:3306/ltm";
			Connection con = DriverManager.getConnection(url, "root", "");
			Statement stmt = con.createStatement();
			String sql = "select * from user where username='" + id + "' and password='" + pass + "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				return new Account(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("role"), rs.getString("name"), rs.getString("email"), rs.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
