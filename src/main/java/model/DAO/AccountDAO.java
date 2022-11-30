package model.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Bean.Account;

public class AccountDAO {
	public static Account getAccount(String id, String pass) {
		try {
			Connection con = ConnectionUtil.getConnection();
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

	public static ArrayList<Account> getListAccounts() {
		List<Account> list = new ArrayList<>();
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from user";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Account(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("role"), rs.getString("name"), rs.getString("email"), rs.getString("phone")));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return (ArrayList<Account>) list;
	}
	public static int add(Account account) {
		int rs = 0;
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "insert into user (username,password,role,name,email,phone)" + " values ('"
					+ account.getUsername() + "','" + account.getPassword() + "','" + account.getRole() + "','"
					+ account.getName() + "','" + account.getEmail() + "','" + account.getPhone() + "')";
			rs = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int update(Account account) {
		int rs = 0;
		try {
			Connection con = ConnectionUtil.getConnection();
			Statement stmt = con.createStatement();
			String sql = "update user set username = '" + account.getUsername() + "',password = '"
					+ account.getPassword() + "',role = '" + account.getRole() + "',name = '" + account.getName()
					+ "',email = '" + account.getEmail() + "',phone = '" + account.getPhone() + "' where id = "
					+ account.getId();
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
			String sql = "delete from user where id = " + id;
			rs = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
