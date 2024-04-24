package account.dao;

import entities.Account;
import entities.Category;

public interface AccountDao {
	public Account getAccount(String username);
	public void updateAccount(Account a);
	public void insertAccoutn(Account a);
	public Account getAccountById(String id);
	public void updateAcc(Account a);
}
