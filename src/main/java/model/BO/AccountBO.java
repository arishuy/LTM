package model.BO;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import model.Bean.Account;
import model.DAO.AccountDAO;

public class AccountBO {

	public static Account getAccount(String id, String pass) {
		return AccountDAO.getAccount(id, pass);
	}

	public static ArrayList<Account> getListAccounts() {
		return AccountDAO.getListAccounts();
	}

	public static int add(Account account) {
		return AccountDAO.add(account);
	}

	public static int update(Account account) {
		return AccountDAO.update(account);
	}

	public static int delete(int id) {
		return AccountDAO.delete(id);
	}

	public static Account getAccountById(int id) {
		return AccountDAO.getAccountById(id);
	}

	public static boolean isExistUsername(String username) {
		for (Account account : getListAccounts()) {
			if (account.getUsername().equals(username)) {
				return true;
			}
		}
		return false;
	}

	public static boolean isValidPhoneNumber(String phone) {
		Pattern pattern = Pattern.compile("^[\\d]{10}$");
		Matcher matcher = pattern.matcher(phone);
		return matcher.find();
	}

	public static boolean isValidEmail(String email) {
		Pattern pattern = Pattern.compile("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
		Matcher matcher = pattern.matcher(email);
		return matcher.find();
	}
	public static void changePassword(int id, String password) {
		AccountDAO.changePassword(id, password);
	}

}
