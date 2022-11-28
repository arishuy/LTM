package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtil {
	private static String url = "jdbc:mysql://127.0.0.1:3306/ltm";
	private static String user = "root";
	private static String pass = "";
	public static Connection getConnection() {
		Connection con = null;
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			con = DriverManager.getConnection(url, user,pass);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return con;
	}
}
