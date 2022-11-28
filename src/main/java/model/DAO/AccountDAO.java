package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Bean.Account;

public class AccountDAO {
	public String connectionURL = "jdbc:mysql://127.0.0.1:3306/ltm";
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	public Account getAccount(String id, String pass) {
		//Ket noi CSLD roi truy van!!
		try {
			Connection connection = getConnection();
			Statement stat = connection.createStatement();
			String sql = "SELECT * FROM user WHERE username='" + id +"'";
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				if (rs.getString("password").equals(pass))
					return new Account(rs.getString("id"),rs.getString("username"),rs.getString("password"),rs.getString("role"),rs.getString("name"),rs.getString("email"),rs.getString("phone"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
