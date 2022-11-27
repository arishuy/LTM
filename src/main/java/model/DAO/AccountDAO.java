package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.Bean.Account;

public class AccountDAO {

	public static Account getAccount(String id, String pass) {
		//Ket noi CSLD roi truy van!!
		//Hard Code
		List<Account> l = new ArrayList<Account>();
		Account a1 = new Account();
		a1.setUsername("admin");
		a1.setPassword("123456");
		l.add(a1);
		
		Account a2 = new Account();
		a2.setUsername("huy");
		a2.setPassword("982002");
		l.add(a2);
		for (Account a : l) {
			if (a.getUsername().equals(id) && a.getPassword().equals(pass))
				return a;
		}
		
		return null;
	}

}
