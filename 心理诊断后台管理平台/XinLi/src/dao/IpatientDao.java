//20163623 王莉

package dao;

import java.util.List;


import model.User;
import model.patient;

public interface IpatientDao {
	public patient load(int id);
	void add(patient patient);
	void update(patient patient);
	void delete_patients(int[] ids);
	public int load_couts();
	List<patient> load_patients(int limit, int pages);
	List<patient> seek_patients(String[] seek, int limit, int pages);
  
}
