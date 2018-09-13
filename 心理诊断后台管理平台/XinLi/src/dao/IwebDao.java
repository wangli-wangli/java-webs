//20163623 王莉

package dao;

import java.util.List;


import model.User;
import model.patient;
import model.question;
import model.web;

public interface IwebDao {
	public web load(int id);
	public int load_couts();
	List<web> seek_webs(String[] seek, int limit, int pages);
	List<web> load_webs(int limit, int pages);
	void add(web web);
	void delete_webs(int[] ids);
	void update(web web);
	List<web> load2(String web_type);
	List<question> load_question();
  
}
