package com.tekskills.Dto;

import java.io.FileReader;

import org.json.simple.JSONArray;

import net.minidev.json.parser.JSONParser;

public class StatesAndCitiesDTO {
	public static void main(String[] args) {
		try {
		//JSON parser object to parse read file
        JSONParser jsonParser = new JSONParser();
         
         FileReader reader = new FileReader("statescities.json");
            //Read JSON file
            Object obj = jsonParser.parse(reader);
            System.out.println(obj);
            JSONArray employeeList = (JSONArray) obj;
            System.out.println(employeeList);
            //Iterate over employee array
            //employeeList.forEach( emp -> parseEmployeeObject( (JSONObject) emp ) );
 
        }  catch (Exception e) {
            e.printStackTrace();
		
	}
}
	/* private static void parseEmployeeObject(JSONObject stateslist) 
	    {
	        //Get employee object within list
	        JSONObject employeeObject = (JSONObject) stateslist.get("employee");
	         
	        //Get employee first name
	        String firstName = (String) employeeObject.get("firstName");    
	        System.out.println(firstName);
	         
	        //Get employee last name
	        String lastName = (String) employeeObject.get("lastName");  
	        System.out.println(lastName);
	         
	        //Get employee website name
	        String website = (String) employeeObject.get("website");    
	        System.out.println(website);
	    }*/
}