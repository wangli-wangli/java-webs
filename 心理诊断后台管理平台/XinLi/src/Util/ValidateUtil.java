
package Util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class ValidateUtil {
	public static  boolean validateNull(HttpServletRequest request,String[] fileds) {
		boolean validate = true;
	
		Map<String,String> errorMsg = new  HashMap();
		for(String filed :fileds) {
			String value = request.getParameter(filed);
			if (value == null || "".equals(value.trim())) {
				validate = false;
				errorMsg.put(filed, filed+"ЮЊПе");
			}
			if (!validate) {
				request.setAttribute("errormsg", errorMsg);
			}
			
		}
		
		return validate;
	}
	public static String showError(HttpServletRequest request , String filed) {
		Map<String, String> errorMsg = (Map<String,String>)request.getAttribute("errormsg");
		if (errorMsg == null) {
			return "";
		}
		String msg = errorMsg.get(filed);
		if (msg == null) {
			return "";
		}
		return msg;
	}
	
}
