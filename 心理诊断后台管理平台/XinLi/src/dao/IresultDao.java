//20163623 王莉

package dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;


import model.User;
import model.patient;
import model.result;

public interface IresultDao {
	public result load(int id);
	public int load_couts();
	List<result> load_results(int limit, int pages);
	void delete_results(int[] ids);
	List<result> load_results2(int[] ids);
	boolean write(String outPath, List<result> results) throws  IOException;
	List<String> load_QuestionTypes();
	List<String> load_Answers(String QUESTION_TYPE);
	int load_AnswerCounts(String QUESTION_TYPE, String answer);
	String load_Question(String QUESTION_TYPE);
	void add(result result);
	
  
}
