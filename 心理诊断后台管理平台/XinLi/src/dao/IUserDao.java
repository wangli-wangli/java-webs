//20163623 王莉

package dao;

import java.util.List;


import model.User;

public interface IUserDao {
	public void add(User user);
	public User load(int id);
	User load_username(String username);
	int load_couts();
	List<User> load_users(int limit, int pages);
	List<User> load_users(String[] seek, int limit, int pages);
	void delete_users(int[] ids);
	void update_password(int id, String new_password);

}
