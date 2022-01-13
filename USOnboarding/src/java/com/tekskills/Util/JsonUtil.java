package com.tekskills.Util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {
	
	private static ObjectMapper objectmapper;
	static {
		objectmapper=new ObjectMapper();
	}
	
	
	public static String convertJavaToJson(Object obj) {
		String jsonString="";
		try {
			jsonString=objectmapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			System.out.println("exception while converting"+e);
			
			e.printStackTrace();
		}
		
		
		return jsonString;
	}

}
