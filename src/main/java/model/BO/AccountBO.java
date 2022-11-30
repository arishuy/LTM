package model.BO;

import model.Bean.Account;
import model.DAO.AccountDAO;

public class AccountBO {

	public static Account getAccount(String id, String pass) {
		return AccountDAO.getAccount(id, pass);
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

}
