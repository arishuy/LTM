package model.BO;

import model.DAO.AccountDAO;
import model.Bean.Account;

public class AccountBO {

	public static Account getAccount(String id, String pass) {
		return AccountDAO.getAccount(id,pass);
	}

}
