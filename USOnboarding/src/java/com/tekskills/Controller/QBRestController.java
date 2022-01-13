package com.tekskills.Controller;


import java.io.BufferedReader;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.apache.commons.io.FileUtils;
import java.util.Base64;
import okhttp3.*;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.intuit.oauth2.client.OAuth2PlatformClient;
import com.intuit.oauth2.config.OAuth2Config;
import com.intuit.oauth2.config.Scope;
import com.intuit.oauth2.data.BearerTokenResponse;
import com.intuit.oauth2.exception.InvalidRequestException;
import com.intuit.oauth2.exception.OAuthException;
import com.tekskills.Service.TimesheetService;
import com.tekskills.Util.OAuth2PlatformClientFactory;

@Controller
@PropertySource("/WEB-INF/mail.properties")
public class QBRestController { 
	private static final Logger logger = Logger.getLogger(QBRestController.class);

	@Autowired
	private Environment env;

	@Autowired
	OAuth2PlatformClientFactory factory;
	@Autowired
	private TimesheetService tsServie;
	@RequestMapping(value = { "/downloadinvoices" }, method = RequestMethod.GET)
	public void downloadinvoices(HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='login.jsp'");
				out.println("</script>");
				out.close();
			} else {
				
				String filename = request.getParameter("filename");
				String filepath = null;
				String workingDir = env.getProperty("documents");
		
				if (!filename.isEmpty()) {
					String path = workingDir + File.separator + "Invoices";
					filepath = path + File.separator + filename;
				}
		
				System.out.println(filepath);
				File ff = new File(filepath);
				if (ff.exists() == true) {
					FileInputStream fis = new FileInputStream(ff);
					byte[] inputBytes = new byte[(int) ff.length()];
					fis.read(inputBytes);
					response.setContentType("application/octet-stream;");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + filename);
					OutputStream os = response.getOutputStream(); // file output stream
					os.write(inputBytes);
					os.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('No file available');");
					out.println("window.history.back();");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			logger.error("Error while downloading invoice" + e);
		}
	}
	
	@RequestMapping(value = { "/getbillablehours" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getbillablehours(Model model, HttpServletRequest request) {
		  String jsonString=null;
		try {
			 String customerid = request.getParameter("customerid");
			 String fromdate = request.getParameter("fromdate");
			 String todate = request.getParameter("todate");
			 
	        URL url = new URL("http://192.168.0.160:8080/usp/getbillablehours/12/3/"+fromdate+"/"+todate+"");
	        
	        System.out.println("url--"+url);
		    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("Content-Type","application/text");
	        conn.setRequestMethod("GET");
	        
	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String output;
	        StringBuffer response = new StringBuffer();
	        while ((output = in.readLine()) != null) {
	            response.append(output);
	            response.append("\r");
	        }
	        jsonString=response.toString();
	        System.out.println("billable hours---"+jsonString);
	        
	} catch (Exception e) {
		e.printStackTrace();
		logger.error("Error in getbillablehours " + e);
	}
	return jsonString;
}
		
	@RequestMapping(value = { "/getportalemployees" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getportalemployees(Model model, HttpServletRequest request) {
		  String jsonString=null;
		try {
			    URL url = new URL("http://192.168.0.160:8080/usp/getemployees");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");
		        
		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		      
		        jsonString=response.toString();
		        System.out.println(jsonString);
		        in.close();
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getportalemployees " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/mapemployee" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String mapemployee(Model model, HttpServletRequest request) {
		  String jsonString=null;
		try {
			    String qbId = request.getParameter("qbId");
			    String candId = request.getParameter("candId");
			    
			    URL url = new URL("http://192.168.0.160:8080/usp/mapemployee/"+qbId+"/"+candId+"");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");
		        
		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		      
		        jsonString=response.toString();
		        System.out.println("mapping--"+jsonString);
		        in.close();
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in mapping employee " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/voidinvoice" }, method = RequestMethod.GET)
	@ResponseBody
	public String voidinvoice(Model model, HttpServletRequest request) {
		  String jsonString =null;
		  
		  String invoiceid = request.getParameter("invoiceid");
		  Integer invId=Integer.parseInt(invoiceid);
		  
		  String synctoken = request.getParameter("synctoken");
		  Integer SyToken=Integer.parseInt(synctoken);
		  
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");    
			    URL url = new URL(""+baseUrl+"/invoice?operation=void");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
		        conn.setDoOutput(true);
		        conn.setRequestMethod("POST");
		        String json ="{\r\n" + 
		        		"    \"Id\": \""+invId+"\",\r\n" + 
		        		"    \"SyncToken\": \""+SyToken+"\"\r\n" + 
		        		"}";
		        
		        System.out.println(json);
		        
		        OutputStream os = conn.getOutputStream();
		           os.write(json.getBytes("UTF-8"));
		           os.close();

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
                System.out.println("void-jsonString---"+jsonString);

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in Invoice void " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/deleteinvoice" }, method = RequestMethod.GET)
	@ResponseBody
	public String deleteinvoice(Model model, HttpServletRequest request) {
		  String jsonString =null;
		  String invoiceid = request.getParameter("invoiceid");
		  Integer invId=Integer.parseInt(invoiceid);
		  
		  String synctoken = request.getParameter("synctoken");
		  Integer SyToken=Integer.parseInt(synctoken);
		  
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");   
			    URL url = new URL(""+baseUrl+"/invoice?operation=delete");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
		        conn.setDoOutput(true);
		        conn.setRequestMethod("POST");
		        String json ="{\r\n" + 
		        		"    \"Id\": \""+invId+"\",\r\n" + 
		        		"    \"SyncToken\": \""+SyToken+"\"\r\n" + 
		        		"}";
		    
		        OutputStream os = conn.getOutputStream();
		           os.write(json.getBytes("UTF-8"));
		           os.close();

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in deleteInvoice " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/products" }, method = RequestMethod.GET)
	public String products(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			}
			String invoice = "invoice";
			session.setAttribute("candidates", null);
			session.setAttribute("templates", null);
			session.setAttribute("stsreports", null);
			session.setAttribute("mdashboard",null);
			session.setAttribute("invoice", invoice);
			session.setAttribute("mydocuments", null);
			session.setAttribute("myimmidocs", null);
			session.setAttribute("immigration", null);
			session.setAttribute("bgc", null);
		} catch (Exception e) {
			logger.error("Error in products page" + e);
		}
		return "products";
	}
	
	@RequestMapping(value = { "/paymentspage" }, method = RequestMethod.GET)
	public String paymentspage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {

			String custName = request.getParameter("custname");
			String custId = request.getParameter("custid");
			String balance = request.getParameter("bal");

			model.addAttribute("custName", custName);
			model.addAttribute("custId", custId);
			model.addAttribute("balance", balance);
			
		} catch (Exception e) {
			logger.error("Error in paymentspage page" + e);
		}
		return "receivepay";
	}
	
	@RequestMapping(value = { "/allinvoices" }, method = RequestMethod.GET)
	public String allinvoices(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} 
			String invoice = "invoice";
			session.setAttribute("candidates", null);
			session.setAttribute("templates", null);
			session.setAttribute("stsreports", null);
			session.setAttribute("mdashboard",null);
			session.setAttribute("invoice", invoice);
			session.setAttribute("mydocuments", null);
			session.setAttribute("myimmidocs", null);
			session.setAttribute("immigration", null);
			session.setAttribute("bgc", null);
		} catch (Exception e) {
			logger.error("Error in allinvoices page" + e);
		}
		return "allinvoices";
	}
	
	@RequestMapping(value = { "/genreports" }, method = RequestMethod.GET)
	public String genreport(Model model, HttpServletRequest request) {
		try {
			
		} catch (Exception e) {
			logger.error("Error in reports page" + e);
		}
		return "genreport";
	}
	
	
	@RequestMapping(value = { "/getaragingreport" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getaragingreport(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");   
			    String range = request.getParameter("range");
			    String range1=null;
			    
			    if(range.contains(" ")) {
	                    range1=range.replaceAll(" ","%20");
				    }else {
				    	range1=range;
				    }
			    
			    URL url = new URL(""+baseUrl+"/reports/AgedReceivables?date_macro="+range1+"&minorversion=63");
			    
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json");
		        conn.setRequestMethod("GET");

		        System.out.println(url);
		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        jsonString= response.toString();
		        in.close();
		        System.out.println("araging report---"+jsonString);
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in AR Aging Summary report " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/getcustbaldetailreport" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getcustbaldetailreport(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String cust="";
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");   
			    String customerid = request.getParameter("custid");
			    System.out.println(customerid);
			   
			    if(customerid.isEmpty()) {
			    	cust="";
			    }else {
			    	cust="customer="+customerid+"&";
			    }
			  //  URL url = new URL(""+baseUrl+"/reports/CustomerBalanceDetail?customer=1&start_duedate=2021-08-01&end_duedate=2022-09-30&minorversion=63");
			    URL url = new URL(""+baseUrl+"/reports/CustomerBalanceDetail?"+cust+"minorversion=63");
			
// https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365179399620/reports/CustomerBalanceDetail?customer=1&start_duedate=2021-08-01&end_duedate=2022-09-30&minorversion=63    
// https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365179399620/reports/CustomerBalanceDetail?minorversion=63
			    	
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json");
		        conn.setRequestMethod("GET");

		        System.out.println(url);
		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        jsonString= response.toString();
		        in.close();
		       /* JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();*/
		        System.out.println("cust bal report---"+jsonString);
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in customerBalance detail report " + e);
		}
		return jsonString;
	}
	
	/*@RequestMapping(value = { "/attachables" }, method = RequestMethod.POST)
	@ResponseBody
	public String attachables(Model model, HttpServletRequest request) {
		  String jsonString="Success";
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  String invoiceid = request.getParameter("invid");
		  String fileName = request.getParameter("fileName");
		  String candidateid = request.getParameter("candidate_id");
		try {
			System.out.println("invoiceid****"+invoiceid);
			   String directorypath   = env.getProperty("documents");
			   String directorypath2  = null;
			 //  String stringArray[] = { "g.jpg", "pan.pdf", "logo.png", "k.jpg" };
			   
			  // String names=fileName.trim();			 
				  String stringArray[]=fileName.split(",");
				  //System.out.println(stringArray[2]);
			   
				for (int i = 0; i < stringArray.length; i++) {
					 String baseUrl = env.getProperty("baseUrl");   
					     
					    String f1 = stringArray[i].substring(stringArray[i].indexOf(".")+1);
		    		    f1.trim();
		    		   
		    			 directorypath2 = directorypath + File.separator + candidateid +  File.separator + stringArray[i];
		    			 System.out.println("directorypath2****"+directorypath2);
						 byte[] fileContent = FileUtils.readFileToByteArray(new File(directorypath2));
						 String encodedfile= Base64.getEncoder().encodeToString(fileContent);
						 
						 OkHttpClient client = new OkHttpClient().newBuilder().build();
						   
						    MediaType mediaType = MediaType.parse("multipart/form-data;boundary=37a1965f87babd849241a530ad71e169");
						    RequestBody body =null;
						    
						    if(f1.contains("jpeg") || f1.contains("jpg") || f1.equalsIgnoreCase("jpg") || f1.equalsIgnoreCase("jpeg")){
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"image/jpeg\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.jpg\"\nContent-Type: image/jpeg\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("pdf") || f1.equalsIgnoreCase("pdf")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"application/pdf\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.pdf\"\nContent-Type: application/pdf\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("png") || f1.equalsIgnoreCase("png")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"image/png\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.png\"\nContent-Type:image/png\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
					    
					    
					    //RequestBody body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \"attachment"+i+".jpg\",\n    \"ContentType\": \"image/jpeg\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.jpg\"\nContent-Type: image/jpeg\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
					    Request request1 = new Request.Builder()
					      .url(""+baseUrl+"/upload?minorversion=40")
					      .method("POST", body)
					      .addHeader("User-Agent", "{{UserAgent}}")
					      .addHeader("Content-Type", "multipart/form-data;boundary=37a1965f87babd849241a530ad71e169")
					      .addHeader("Accept", "application/json")
					      .addHeader("Authorization", "Bearer "+ access_token)
					      .build();
					    Response response1 = client.newCall(request1).execute();
					    System.out.println("RESPONSE-->"+response1.body().string());
				}
				
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in attachables " + e);
		}
		return jsonString;
		
	}
	@RequestMapping(value = { "/sendmail" }, method = RequestMethod.POST)
	public String sendmail(Model model, HttpServletRequest request) {
		  String jsonString ="Success";
		  String mail = request.getParameter("mail");
		  String invoiceid = request.getParameter("invoiceId");
		  System.out.println(mail+"invoiceid****"+invoiceid);
		  String access_token = (String) request.getSession().getAttribute("access_token");
		try {
			
			  String baseUrl = env.getProperty("baseUrl");    
			    URL url = new URL(""+baseUrl+"/invoice/"+invoiceid+"/send?sendTo="+mail+"&minorversion=40");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestMethod("POST");
	
	            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString = obj_JSONObject.toString();
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in sendmail " + e);
		}
		//return jsonString;
		return "redirect:/allinvoices";
	}*/
	@RequestMapping(value = { "/getproducts" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getproducts(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");   
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20Item%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getproducts " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/getallpaymentmethods" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallpaymentmethods(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");   
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20paymentmethod%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallpaymentmethods " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/getallcredits" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallcredits(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");   
			    String customerId= request.getParameter("custid"); 
			    URL url = new URL(""+baseUrl+"/query?query=select%20PaymentRefNum,TotalAmt,UnappliedAmt,Id,TxnDate%20from%20payment%20where%20CustomerRef='"+customerId+"'%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");
		        
                //System.out.println("credits--"+url);
                
		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        System.out.println("credits--"+jsonString);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in credits " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/addemployee" }, method = RequestMethod.GET)
	public String addemployee(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} 
			String invoice = "invoice";
			session.setAttribute("candidates", null);
			session.setAttribute("templates", null);
			session.setAttribute("stsreports", null);
			session.setAttribute("mdashboard",null);
			session.setAttribute("invoice", invoice);
			session.setAttribute("mydocuments", null);
			session.setAttribute("myimmidocs", null);
			session.setAttribute("immigration", null);
			session.setAttribute("bgc", null);
		} catch (Exception e) {
			logger.error("Error in addemployee page" + e);
		}
		return "addemp";
	}
	@RequestMapping(value = { "/getallemployees" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallemployees(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		 // String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");   
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20Employee%20maxresults%201000&minorversion=40");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallemployees " + e);
		}
		return jsonString;
	}
	
	
	
	@RequestMapping(value = { "/allqbcustomers" }, method = RequestMethod.GET)
	public String addcustomer(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} 
		} catch (Exception e) {
			logger.error("Error in AllQbCustomers page" + e);
		}
		return "AllQbCustomers";
	}
	@RequestMapping(value = { "/getQbEmpId" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getQbEmpId(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String productName = request.getParameter("productName");
		  String empname=productName.replace(" ", "%20");
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/query?query=select%20Id%20from%20Employee%20where%20DisplayName='"+empname+"'&minorversion=40");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getQbEmpId " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/getUnitPricebyId" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getUnitPricebyId(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String productid = request.getParameter("productid");
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/item/"+productid+"?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getUnitPricebyId " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/getcustomerbyid" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getcustomerbyid(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String customerid = request.getParameter("customerid");
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/customer/"+customerid+"?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getcustomerbyid " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/getpaymentterms" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getpaymentterms(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		  String  payterm= request.getParameter("paytermId");
		  Integer paytermId=0;
			if (payterm!="") {
				paytermId = Integer.parseInt(payterm);
			}
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/term/"+paytermId+"?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
			      System.out.println("payterms--"+jsonString);
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getpaymentterms" + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/getallcustomers" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallcustomers(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20Customer%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallcustomers " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/checktokens" }, method = RequestMethod.GET)
	@ResponseBody
	public String checktokens(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String msg=null;
		try {
			  String access_token = (String) request.getSession().getAttribute("access_token");
			//String access_token = env.getProperty("Token");  
			  System.out.println("access_token--"+access_token);
			  String baseUrl = env.getProperty("baseUrl");  
			  URL url = new URL(""+baseUrl+"/companyinfo/4620816365179399620?minorversion=40");
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+ access_token);
		        int code = conn.getResponseCode();
			  if(access_token==null || code == 401) {
				 msg="Token expired" ;
			  }else {
				 msg="Token available" ;
			  }
			  System.out.println(msg);
		} catch (Exception e) {
			logger.error("Error in tokens" + e);
		}
		return msg;
	}

	@RequestMapping(value = { "/invoicepage" }, method = RequestMethod.GET)
	public String invoicepage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} 
		} catch (Exception e) {
			logger.error("Error in invoice page" + e);
		}
		return "invoicegen";
	}

	@RequestMapping(value = { "/reports" }, method = RequestMethod.GET)
	public String reports(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/login";
			} 
		} catch (Exception e) {
			logger.error("Error in reports page" + e);
		}
		return "reports";
	}
	
	@RequestMapping(value = { "/expensepage" }, method = RequestMethod.GET)
	public String invoicegeneration(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} 
		} catch (Exception e) {
			logger.error("Error in expense page" + e);
		}
		return "expensegen";
	}

	@RequestMapping(value = { "/generateinvoice" }, method = RequestMethod.GET,consumes="application/json")
	@ResponseBody
	public String generateinvoice(Model model, HttpServletRequest request) {
		  String jsonString=null;
		try {
			String invoice = request.getParameter("invoiceid");
			 String baseUrl = env.getProperty("baseUrl");  
			  URL url = new URL(""+baseUrl+"/invoice/"+invoice+"?minorversion=40");
			  String access_token = (String) request.getSession().getAttribute("access_token");
			  //String access_token = env.getProperty("Token");  
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+ access_token);
		        conn.setRequestProperty("Content-Type","application/json");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in generateinvoice " + e);
		}
		return jsonString;
	}
	
	
	@RequestMapping(value = { "/getpurcharsebyId" }, method = RequestMethod.GET,consumes="application/json")
	@ResponseBody
	public String getpurcharsebyId(Model model, HttpServletRequest request) {
		  String jsonString=null;
		try {
			String purchaseid = request.getParameter("purchaseid");
			 String baseUrl = env.getProperty("baseUrl");  
			  URL url = new URL(""+baseUrl+"/purchase/"+purchaseid+"?minorversion=40");
			  String access_token = (String) request.getSession().getAttribute("access_token");
			  //String access_token = env.getProperty("Token");  
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+ access_token);
		        conn.setRequestProperty("Content-Type","application/json");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in purchase by ID" + e);
		}
		return jsonString;
	}
	
	
	@RequestMapping(value = { "/getallpurchases" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallpurchases(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20purchase%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallpurchases " + e);
		}
		return jsonString;
	}

	@RequestMapping(value = { "/getallInvoiceIds" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallInvoiceIds(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20Invoice%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallInvoiceIds " + e);
		}
		return jsonString;
	}
	
	
	@RequestMapping(value = { "/getallInvoiceIdsbyCustomer" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallInvoiceIdsbyCustomer(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		  String customerId= request.getParameter("custid"); 
		try {
			 String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20Invoice%20where%20CustomerRef='"+customerId+"'%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallInvoiceIds by customer " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/getinvoicepdf" }, method = RequestMethod.GET, produces = "application/pdf")
	@ResponseBody
	public String getinvoicepdf(Model model, HttpServletRequest request) {
		  String msg=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			   String invoiceid = request.getParameter("invoiceid");
			   String invoiceno = request.getParameter("invoiceno");
			   String baseUrl = env.getProperty("baseUrl");  
			   URL url = new URL(""+baseUrl+"/invoice/"+invoiceid+"/pdf?minorversion=40");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/pdf");
		        conn.setRequestMethod("GET");
		     
		        String filename=null;
		        String finalpath=null;
		        filename="Invoice_"+invoiceno+"_from_Tekskills_Inc.pdf";
				 String directorypath = env.getProperty("documents");
				 String directorypath2 =null;
				 directorypath2 = directorypath + File.separator + "Invoices";
				if (!new File(directorypath).exists()) {
					new File(directorypath).mkdir();
					if (!new File(directorypath2).exists()) {
						new File(directorypath2).mkdir();
					}
				}else {
					if (!new File(directorypath2).exists()) {
						new File(directorypath2).mkdir();
					}
				}
				finalpath=directorypath2 + File.separator + filename;
				 InputStream is = conn.getInputStream(); 
			        OutputStream os = new FileOutputStream(finalpath); 
			        byte[] bytes = IOUtils.toByteArray(is);
		
		        os.write(bytes);
		        os.flush();
		        os.close();
		 
		msg="Invoice downloaded";
			      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getinvoicepdf " + e);
		}
		return msg;
	}
	
	@RequestMapping(value = { "/createproduct" }, method = RequestMethod.POST)
	@ResponseBody
	public String createproduct(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String productname = request.getParameter("productName");
			    String hiredate = request.getParameter("hiredate");
			 /*   String client = request.getParameter("client");*/
			    String unitprice = request.getParameter("unitprice");
			    String description = request.getParameter("description");
			    System.out.println("hiredate****"+hiredate);
			    
			    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			//    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			    Date date = format.parse (hiredate);  
			    System.out.println("date****"+date);
                SimpleDateFormat mdyFormat = new SimpleDateFormat("MM-dd-yyyy");
			    String newdate=mdyFormat.format(date);
			    System.out.println("newdate****"+newdate);
			    String hireddate=newdate.replace("-","");
		
			 //   String name=productname+"_"+client+hireddate;
			    String name=productname+hireddate;
			    String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/item?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
		        conn.setDoOutput(true);
		        conn.setRequestMethod("POST");
		   
		        String json = "{\r\n" + 
		        		"  \"Name\": \""+name+"\",\r\n" + 
		        		"  \"IncomeAccountRef\": {\r\n" + 
		        		"    \"value\": \"79\",\r\n" + 
		        		"    \"name\": \"Sales of Product Income\"\r\n" + 
		        		"  },\r\n" + 
		        		" \r\n" + 
		        		"  \"ExpenseAccountRef\": {\r\n" + 
		        		"    \"value\": \"80\",\r\n" + 
		        		"    \"name\": \"Cost of Goods Sold\"\r\n" + 
		        		"  },\r\n" + 
		        		"  \"AssetAccountRef\": {\r\n" + 
		        		"    \"value\": \"81\",\r\n" + 
		        		"    \"name\": \"Inventory Asset\"\r\n" + 
		        		"  },\r\n" + 
		        		"  \"UnitPrice\": "+unitprice+", \r\n" + 
		        		"  \"Type\": \"Service\",\r\n" + 
		        		"  \"InvStartDate\": \"2015-01-01\",\r\n" + 
		        		"  \"Description\": \""+description+"\"\r\n" + 
		        		"}";
		        
		        OutputStream os = conn.getOutputStream();
		           os.write(json.getBytes("UTF-8"));
		           os.close();

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in createproduct " + e);
		}
		return jsonString;
	}
	@RequestMapping(value = { "/receivepayment" }, method = RequestMethod.POST)
	@ResponseBody
	public String receivepayment(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String loopjson2="";
		  String depositref1 = "";
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  String baseUrl = env.getProperty("baseUrl");  
		  //String access_token = env.getProperty("Token");  
		try {
			    String customerid = request.getParameter("custid");
			    String refno = request.getParameter("refno");
			    String payamt = request.getParameter("payamt");
			    String paydate = request.getParameter("paydate");
			//    String paysum = request.getParameter("pay_sum");
			    String paymethod = request.getParameter("paymethod");
			    String depositref = request.getParameter("depositto");
			    
			    if(depositref!="") {
			    	depositref1=depositref;
			    }
			    
			    String invoice_arr = request.getParameter("invoicesarr");
			    String payments_arr = request.getParameter("paymentsarr");
			    String credpay = request.getParameter("creditpayarr");
			    String payid = request.getParameter("paymentidarr");
			    
			    String invArray[]=invoice_arr.split(",");
			    String paymentsArray[]=payments_arr.split(",");
			    String creditpaymentArray[]=credpay.split(",");
			    String paymentIdArray[]=payid.split(",");
			
				    URL url = new URL(""+baseUrl+"/payment?minorversion=40");

				    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestProperty("Authorization","Bearer "+access_token);
			        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
			        conn.setDoOutput(true);
			        conn.setRequestMethod("POST");
			        
			        StringJoiner joiner = new StringJoiner(",");
			        for (int i = 0; i < invArray.length; i++) {
		                //   System.out.println(invArray[i]+"--"+paymentsArray[i]);
			        	String json2="{\r\n" + 
			        		"        \"Amount\":"+paymentsArray[i]+",\r\n" + 
			        		"        \"LinkedTxn\": [\r\n" + 
			        		"        {\r\n" + 
			        		"            \"TxnId\": \""+invArray[i]+"\",\r\n" + 
			        		"            \"TxnType\": \"Invoice\"\r\n" + 
			        		"        }]\r\n" + 
			        		"}\r\n";
			        	 joiner.add(json2.toString());
	                    }
			        String loopjson =joiner.toString();
			        
			        if(!credpay.equalsIgnoreCase("")) {
			        	  StringJoiner joiner2 = new StringJoiner(",");
					        for (int i = 0; i < creditpaymentArray.length; i++) {
				                   //System.out.println(creditpaymentArray[i]+"--"+paymentIdArray[i]);
					        	String json3="{\r\n" + 
					        		"        \"Amount\":"+creditpaymentArray[i]+",\r\n" + 
					        		"        \"LinkedTxn\": [\r\n" + 
					        		"        {\r\n" + 
					        		"            \"TxnId\": \""+paymentIdArray[i]+"\",\r\n" + 
					        		"            \"TxnType\": \"Payment\"\r\n" + 
					        		"        }]\r\n" + 
					        		"}\r\n";
					        	 joiner2.add(json3.toString());
			                    }
					         loopjson2 =","+joiner2.toString();
			        }else {
			        	  loopjson2 ="";
			        }

			        String json ="{\r\n" + 
			        		"    \"CustomerRef\":\r\n" + 
			        		"    {\r\n" + 
			        		"        \"value\": \""+customerid+"\",\r\n" + 
			        		"        \"name\": \"infyyyyy\"\r\n" + 
			        		"    },\r\n" + 
			        		"     \"DepositToAccountRef\": {\r\n" + 
			        		"      \"value\": \""+depositref1+"\"\r\n" + 
			        		"    },\r\n" + 
			        		"    \"PaymentMethodRef\": {\r\n" + 
			        		"        \"value\": \""+paymethod+"\"\r\n" + 
			        		"     },\r\n" + 
			        		"    \"PaymentRefNum\": \""+refno+"\",\r\n" + 
			        		"    \"TotalAmt\": "+payamt+",\r\n" + 
			        		"    \"TxnDate\": \""+paydate+"\",\r\n" + 
			        		"    \"Line\": [\r\n" + 
			        		""+loopjson+loopjson2+"\r\n"+
			        		"\r\n" + 
							"    ]\r\n" + 
							"}";
					
                    System.out.println("final json**"+json);
        
			        OutputStream os = conn.getOutputStream();
			           os.write(json.getBytes("UTF-8"));
			           os.close();
			           
			           int code = conn.getResponseCode();
				        if(code == 200) {
				        	jsonString="success";
				        }else {
				        	jsonString="failed";
				        }
				        System.out.println(jsonString);
			           
			           /*BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				        String output;
				        StringBuffer response = new StringBuffer();
				        while ((output = in.readLine()) != null) {
				            response.append(output);
				            response.append("\r");
				        }
				        in.close();
				        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
				        jsonString=obj_JSONObject.toString();*/
				        
				      
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in receivepayment " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/createinvoice" }, method = RequestMethod.POST)
	@ResponseBody
	public String createinvoice(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  float discount=0;
		  String PercentBase="false";
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String customerid = request.getParameter("customerid");
			    String productid = request.getParameter("productid");
			    String quantity = request.getParameter("quantity");
			    String productrate = request.getParameter("productrate");
			    String amount = request.getParameter("amount");
			    String fromdate = request.getParameter("fromdate");
			    String duedate = request.getParameter("duedate");
			    String msg = request.getParameter("msg");
			    String discountamt =""; //request.getParameter("discountamt");
			    String prod_desc = request.getParameter("prod_desc");
			    String invstartdate = request.getParameter("invstartdate");
			    String invtodate = request.getParameter("invtodate");
			    String pay_term_id = request.getParameter("pay_term_id");
			    String candidate = request.getParameter("candidate_id");
			    String mail = request.getParameter("mail");
			    
			    String tsids = request.getParameter("tsids");
			    
			    String invfdate = request.getParameter("invfdate");
			    String invtdate = request.getParameter("invtdate");
			    
			    /*String disctype= request.getParameter("discount_type");
			    if(disctype.equalsIgnoreCase("percentbased")){
			    	PercentBase="true";
			    }else{
			    	PercentBase="false";
			    }
			    */
			    
			    String msg1="["+invstartdate+"-"+invtodate+"]";
			    msg1=msg1+" "+prod_desc;
			    if(discountamt!="") {
			    	 discount=Float.parseFloat(discountamt);
			    }else {
			    	 discount=0;
			    }
			    float amt=Float.parseFloat(amount);
			    float qty=Float.parseFloat(quantity);
			    float rate=Float.parseFloat(productrate);
			    
			    String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/invoice?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
		        conn.setDoOutput(true);
		        conn.setRequestMethod("POST");

		        String json = "{\r\n" + 
		        		"  \"Line\": [\r\n" + 
		        		"    {\r\n" + 
		        		"     \r\n" + 
		        		"      \"Description\": \""+msg1+"\",\r\n" +
		        		"      \"Amount\": "+amt+",\r\n" + 
		        		"      \"DetailType\": \"SalesItemLineDetail\",\r\n" + 
		        		"      \"SalesItemLineDetail\": {\r\n" + 
		        		"      \"Qty\": "+qty+", \r\n" + 
		        		"     \"UnitPrice\": "+rate+",\r\n" + 
		        		"        \"ItemRef\": {\r\n" + 
		        		"          \"value\": \""+productid+"\",\r\n" + 
		        		"          \"name\": \"Services\"\r\n" + 
		        		"        }\r\n" + 
		        		"      }\r\n" + 
		        		"    },\r\n" + 
		        		"       {\r\n" + 
		        		"    \"Amount\": "+discount+",\r\n" + 
		        		"    \"DetailType\": \"DiscountLineDetail\",\r\n" + 
		        		"    \"DiscountLineDetail\": {\r\n" + 
		        		"     \"PercentBased\": "+PercentBase+",\r\n" + 
		        		"    \"DiscountPercent\":"+discount+",\r\n" + 
		        		"     \"DiscountAccountRef\": {\r\n" + 
		        		"      \"value\": \"86\",\r\n" + 
		        		"      \"name\": \"Discounts given\"\r\n" + 
		        		"     }\r\n" + 
		        		"    }\r\n" + 
		        		"   }\r\n" + 
		        		"  ],\r\n" + 
		        		"  \"CustomerRef\": {\r\n" + 
		        		"    \"value\": \""+customerid+"\"\r\n" + 
		        		"  },\r\n" + 
		        		"  \"SalesTermRef\": {\r\n" + 
				  		"     \"value\": \""+pay_term_id+"\",\r\n" + 
				  		"     \"name\": \"Net 30\"\r\n" + 
				  		"    },\r\n" + 
		        		"     \"CustomerMemo\": {\r\n" + 
		        		"      \"value\": \""+msg+"\"\r\n" + 
		        		"    },\r\n" +
		        		"      \"BillEmail\": {\r\n" + 
		        		"      \"Address\": \""+mail+"\"\r\n" + 
		        		"    }, \r\n" + 
		        		"  \"TxnDate\": \""+fromdate+"\", \r\n" + 
		        		"\"DueDate\": \""+duedate+"\", \r\n" + 
		        		"    \"CurrencyRef\": {\r\n" + 
		        		"     \"value\": \"USD\",\r\n" + 
		        		"     \"name\": \"United States Dollar\"\r\n" + 
		        		"    }\r\n" + 
		        		"}";
		       System.out.println("Json*****"+json);
		        OutputStream os = conn.getOutputStream();
		           os.write(json.getBytes("UTF-8"));
		           os.close();

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        System.out.println("create--"+jsonString);
		        
		        JSONObject jo = new JSONObject(jsonString).getJSONObject("IntuitResponse").getJSONObject("Invoice");
		        Integer invoiceid = jo.getInt("Id");
		        tsServie.updateinvoicestatus(invfdate,invtdate,tsids,candidate,invoiceid);
		       
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in createinvoice " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/updateinvoice" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateinvoice(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String jsonString2=null;
		  String PercentBase=null;
		  float discount=0;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		try {
			    String invoiceid = request.getParameter("invid");
			    String synctoken = request.getParameter("synctoken");
			    String msg = request.getParameter("msg");
			    String mail = request.getParameter("mail");
			    String invdate = request.getParameter("invdate");
			    String duedate = request.getParameter("duedate");
			    String payterm_id = request.getParameter("payterm_id");
			    String invstatus = request.getParameter("invstatus");
			    String proddescription = request.getParameter("description");
			    String productid = request.getParameter("productid");
			    String quantity = request.getParameter("qty");
			    String productrate = request.getParameter("productrate");
			    String amount = request.getParameter("amount");
			    String discamt = request.getParameter("discount");
		
			    if(discamt!="") {
			    	discount=Float.parseFloat(discamt);
			    }else {
			    	discount=0;
			    }
			    
			    String disctype= request.getParameter("discount_type");
			    if(disctype.equalsIgnoreCase("percentbased")){
			    	PercentBase="true";
			    }else{
			    	PercentBase="false";
			    }
			    
			    float amt=Float.parseFloat(amount);
			    float qty=Float.parseFloat(quantity);
			    float rate=Float.parseFloat(productrate);
			    
			    String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/invoice?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
		        conn.setDoOutput(true);
		        conn.setRequestMethod("POST");

		        String json="{\r\n" + 
		        		"  \"SyncToken\": \""+synctoken+"\", \r\n" + 
		        		"  \"Id\": \""+invoiceid+"\", \r\n" + 
		        		"  \"sparse\": true, \r\n" + 
		        		"   \"SalesTermRef\": {\r\n" + 
		        		"     \"value\": \""+payterm_id+"\",\r\n" + 
		        		"     \"name\": \"Net 30\"\r\n" + 
		        		"    },\r\n" + 
		        		"  \"Line\": [\r\n" + 
		        		"    {  \r\n" + 
		        		"    \"Amount\": "+discount+",\r\n" + 
		        		"    \"DetailType\": \"DiscountLineDetail\",\r\n" + 
		        		"    \"DiscountLineDetail\": {\r\n" + 
		        		"     \"PercentBased\": "+PercentBase+",\r\n" + 
		        		"    \"DiscountPercent\":"+discount+",\r\n" + 
		        		"     \"DiscountAccountRef\": {\r\n" + 
		        		"      \"value\": \"86\",\r\n" + 
		        		"      \"name\": \"Discounts given\"\r\n" + 
		        		"     }\r\n" + 
		        		"    }\r\n" + 
		        		"   },\r\n" + 
		        		"       {\r\n" + 
		        		"      \"Description\": \""+proddescription+"\",\r\n" + 
		        		"      \"Amount\": "+amt+",\r\n" + 
		        		"      \"DetailType\": \"SalesItemLineDetail\",\r\n" + 
		        		"      \"SalesItemLineDetail\": {\r\n" + 
		        		"      \"Qty\": "+qty+", \r\n" + 
		        		"     \"UnitPrice\": "+rate+",\r\n" + 
		        		"        \"ItemRef\": {\r\n" + 
		        		"          \"value\": \""+productid+"\",\r\n" + 
		        		"          \"name\": \"Services\"\r\n" + 
		        		"        }\r\n" + 
		        		"      }\r\n" + 
		        		"    }\r\n" + 
		        		"  ],\r\n" + 
		        		"     \"CustomerMemo\": {\r\n" + 
		        		"      \"value\": \""+msg+"\"\r\n" + 
		        		"    },    \r\n" + 
		        		"\"TxnDate\": \""+invdate+"\", \r\n" + 
		        		"\"DueDate\": \""+duedate+"\"\r\n" + 
		        		"}";
		        
		        System.out.println("update Json*****"+json);
		        OutputStream os = conn.getOutputStream();
		           os.write(json.getBytes("UTF-8"));
		           os.close();

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
				//send mail functionality
				if(invstatus.equalsIgnoreCase("send")) {
			    URL url2 = new URL(""+baseUrl+"/invoice/"+invoiceid+"/send?sendTo="+mail+"&minorversion=40");
			    HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
		        conn2.setRequestProperty("Authorization","Bearer "+access_token);
		        conn2.setRequestMethod("POST");
		        
	            BufferedReader in2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
		        String output2;
		        StringBuffer response2 = new StringBuffer();
		        while ((output2 = in2.readLine()) != null) {
		            response2.append(output2);
		            response2.append("\r");
		        }
		        in2.close();
		        JSONObject obj_JSONObject2 = XML.toJSONObject(response2.toString());
		        jsonString2 = obj_JSONObject2.toString();
				}
		System.out.println("send mail jsonString2--"+jsonString2);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in update invoice " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/updateinvoicepage" }, method = RequestMethod.GET)
	public String updateprofile(Model model, HttpServletRequest request) {
		  String invoiceid = request.getParameter("invoiceid");
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/invoice/"+invoiceid+"?minorversion=40");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        model.addAttribute("jsonString", jsonString);
	} catch (Exception e) {
		logger.error("Error in  update invoice page" + e);
	}
	return "invoicegen";
		}
	
	@RequestMapping(value = { "/getcustomerpage" }, method = RequestMethod.GET)
	public String getcustomer(Model model, HttpServletRequest request) {
		  String customerId = request.getParameter("custid");
		  String custdetails=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String baseUrl = env.getProperty("baseUrl");  
			    
			    //get customer details
			    URL url = new URL(""+baseUrl+"/customer/"+customerId+"?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        custdetails=obj_JSONObject.toString();
                System.out.println("custdetails--"+custdetails);
		        //to get all invoices by customer

		        model.addAttribute("custdetails", custdetails);
		
		        
	} catch (Exception e) {
		logger.error("Error in getcustomerpage" + e);
	}
	return "allinvoicesbycust";
		}
	@RequestMapping(value = { "/attachables" }, method = RequestMethod.POST)
	@ResponseBody
	public String attachables(Model model, HttpServletRequest request) {
		  String jsonString="";
		  String jsonString2="";
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		  String invoiceid = request.getParameter("invid");
		  String fileName = request.getParameter("fileName");
		  String mail = request.getParameter("custmail1");
		  String invstatus = request.getParameter("invstatus");
		  String candidateid = request.getParameter("candidate_id");
		  
		try {
			System.out.println("invoiceid****"+invoiceid);
			   String directorypath   = env.getProperty("documents");
			   String directorypath2  = null;
			   String stringArray[]=fileName.split(",");
			   String baseUrl = env.getProperty("baseUrl");  
			   
				for (int i = 0; i < stringArray.length; i++) {
					     
					     String f1 = stringArray[i].substring(stringArray[i].indexOf(".")+1);
		    		     f1.trim();
		    			 directorypath2 = directorypath + File.separator + candidateid +  File.separator + stringArray[i];
		    			 System.out.println("directorypath2****"+directorypath2);
						 byte[] fileContent = FileUtils.readFileToByteArray(new File(directorypath2));
						 String encodedfile= Base64.getEncoder().encodeToString(fileContent);
						 
						 OkHttpClient client = new OkHttpClient().newBuilder().build();
						   
						    MediaType mediaType = MediaType.parse("multipart/form-data;boundary=37a1965f87babd849241a530ad71e169");
						    RequestBody body =null;

						    if(f1.contains("jpeg") || f1.equalsIgnoreCase("jpeg")){
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"image/jpeg\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.jpeg\"\nContent-Type: image/jpeg\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("jpg") || f1.equalsIgnoreCase("jpg")){
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"image/jpg\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.jpg\"\nContent-Type: image/jpeg\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("pdf") || f1.equalsIgnoreCase("pdf")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"application/pdf\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.pdf\"\nContent-Type: application/pdf\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("png") || f1.equalsIgnoreCase("png")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"image/png\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.png\"\nContent-Type:image/png\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("doc") || f1.equalsIgnoreCase("doc")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"image/png\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.doc\"\nContent-Type:application/msword\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("docx") || f1.equalsIgnoreCase("docx")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"application/vnd.openxmlformats-officedocument.wordprocessingml.document\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.docx\"\nContent-Type:application/vnd.openxmlformats-officedocument.wordprocessingml.document\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("txt") || f1.equalsIgnoreCase("txt")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"text/plain\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.txt\"\nContent-Type:text/plain\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("xls") || f1.equalsIgnoreCase("xls")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"application/vnd.ms-excel\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.xls\"\nContent-Type:application/vnd.ms-excel\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }
						    if(f1.contains("xlsx") || f1.equalsIgnoreCase("xlsx")) {
						    	 body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \""+stringArray[i]+"\",\n    \"ContentType\": \"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.xlsx\"\nContent-Type:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
						    }

					    //RequestBody body = RequestBody.create(mediaType, "--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_metadata_"+i+"\"\nContent-Type: application/json; charset=UTF-8\nContent-Transfer-Encoding: 8bit\n\n{\n    \"AttachableRef\": [\n    {\n     \"IncludeOnSend\": true, \n    \"EntityRef\": {\n        \"type\": \"Invoice\",\n        \"value\": \""+invoiceid+"\"\n      }\n    }\n  ],\n   \"FileName\": \"attachment"+i+".jpg\",\n    \"ContentType\": \"image/jpeg\"\n  }\n--37a1965f87babd849241a530ad71e169\nContent-Disposition: form-data; name=\"file_content_"+i+"\"; filename=\"398535758.jpg\"\nContent-Type: image/jpeg\nContent-Transfer-Encoding: base64\n\n"+encodedfile+"\n\n--37a1965f87babd849241a530ad71e169--");
					    Request request1 = new Request.Builder()
					      .url(""+baseUrl+"/upload?minorversion=40")
					      .method("POST", body)
					      .addHeader("User-Agent", "{{UserAgent}}")
					      .addHeader("Content-Type", "multipart/form-data;boundary=37a1965f87babd849241a530ad71e169")
					      .addHeader("Accept", "application/json")
					      .addHeader("Authorization", "Bearer "+ access_token)
					      .build();
					    Response response1 = client.newCall(request1).execute();
					    System.out.println("RESPONSE-->"+response1.body().string());

					    System.out.println("response1--"+response1);
					    if(response1!=null) {
					    	jsonString="success";
					    }
				}
				//send mail functionality
				if(invstatus.equalsIgnoreCase("send")) {
					
			    URL url = new URL(""+baseUrl+"/invoice/"+invoiceid+"/send?sendTo="+mail+"&minorversion=40");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestMethod("POST");
		        
	            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString2 = obj_JSONObject.toString();
		        
				}
				
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in attachables/mails " + e);
		}
		System.out.println("jsonString---"+jsonString);
		return jsonString;
		
	}

	@RequestMapping(value = { "/createpurchase" }, method = RequestMethod.POST)
	@ResponseBody
	public String createpurchase(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			    String vendorid = request.getParameter("vendorid");
			    String purchaseamt = request.getParameter("purchaseamt");
			    float amt=Float.parseFloat(purchaseamt);
			    String paytype = request.getParameter("paytype");
			    String paymode = request.getParameter("paymode");
			
			    String baseUrl = env.getProperty("baseUrl");  
			    URL url = new URL(""+baseUrl+"/purchase?minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
		        conn.setDoOutput(true);
		        conn.setRequestMethod("POST");
		   
		        String json = "{\r\n" + 
		        		"  \"PaymentType\": \""+paytype+"\", \r\n" + 
		        		"   \"EntityRef\": {\r\n" + 
		        		"   \"value\": \""+vendorid+"\",\r\n" +    
		        		"   \"name\": \"tekskills\",\r\n" + 
		        		"   \"type\": \"Vendor\"\r\n" + 
		        		"  },\r\n" + 
		        		"  \"AccountRef\": {\r\n" + 
		        		"    \"name\": \"Visa\", \r\n" + 
		        		"    \"value\": \""+paymode+"\"\r\n" + 
		        		"  }, \r\n" + 
		        		"  \"Line\": [\r\n" + 
		        		"    {\r\n" + 
		        		"      \"DetailType\": \"AccountBasedExpenseLineDetail\", \r\n" + 
		        		"      \"Amount\": "+amt+", \r\n" + 
		        		"      \"AccountBasedExpenseLineDetail\": {\r\n" + 
		        		"        \"AccountRef\": {\r\n" + 
		        		"          \"name\": \"Meals and Entertainment\", \r\n" + 
		        		"          \"value\": \"13\"\r\n" + 
		        		"        }\r\n" + 
		        		"      }\r\n" + 
		        		"    }\r\n" + 
		        		"  ]\r\n" + 
		        		"}";
		        
		        OutputStream os = conn.getOutputStream();
		           os.write(json.getBytes("UTF-8"));
		           os.close();

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in createpurchase " + e);
		}
		return jsonString;
	}
	
	
	@RequestMapping(value = { "/getallpaymentterms" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallpaymentterms(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl"); 
			 
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20term%20maxresults%201000&minorversion=40");

			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        System.out.println(jsonString);
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallpaymentterms " + e);
		}
		return jsonString;
	}
	
	@RequestMapping(value = { "/getallattachables" }, method = RequestMethod.GET,consumes="application/text")
	@ResponseBody
	public String getallattachables(Model model, HttpServletRequest request) {
		  String jsonString=null;
		  String access_token = (String) request.getSession().getAttribute("access_token");
		  String invoiceid = request.getParameter("invid");
		  //String access_token = env.getProperty("Token");  
		try {
			 String baseUrl = env.getProperty("baseUrl"); 
			 
			    URL url = new URL(""+baseUrl+"/query?query=select%20*%20from%20attachable%20where%20AttachableRef.EntityRef.Type='Invoice'%20and%20AttachableRef.EntityRef.value%20='"+invoiceid+"'&minorversion=40");
			    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestProperty("Authorization","Bearer "+access_token);
		        conn.setRequestProperty("Content-Type","application/text");
		        conn.setRequestMethod("GET");

		        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String output;
		        StringBuffer response = new StringBuffer();
		        while ((output = in.readLine()) != null) {
		            response.append(output);
		            response.append("\r");
		        }
		        in.close();
		        JSONObject obj_JSONObject = XML.toJSONObject(response.toString());
		        jsonString=obj_JSONObject.toString();
		        System.out.println("attachables--"+jsonString);
		        
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error in getallattachables " + e);
		}
		return jsonString;
	}
		
	@RequestMapping("/connectToQuickbooks")
    public String connectToQuickbooks(HttpSession session,HttpServletResponse response) {
		
          String clientId = env.getProperty("OAuth2AppClientId"); 
          String  clientSecret = env.getProperty("OAuth2AppClientSecret"); 
          OAuth2Config oauth2Config = new OAuth2Config.OAuth2ConfigBuilder(clientId, clientSecret)
        		  .callDiscoveryAPI(com.intuit.oauth2.config.Environment.SANDBOX).buildConfig();
          
          String redirectUri = env.getProperty("OAuth2AppRedirectUri"); 
          String csrf = oauth2Config.generateCSRFToken();      
         session.setAttribute("csrfToken", csrf);
          try {           
               List<Scope> scopes = new ArrayList<Scope>();
               scopes.add(Scope.Accounting);
               //Get the authorization URL
               String url = oauth2Config.prepareUrl(scopes, redirectUri, csrf); //redirectUri - pass the callback url
               try {
                    response.sendRedirect(url);
               } catch (IOException e) {
                    e.printStackTrace();
               }
          } catch (InvalidRequestException e) {
               logger.error("Exception calling connectToQuickbooks ", e);
          }
          return null;
    }
    
      @RequestMapping("/oauth2redirect")
        public String  callBackFromOAuth(@RequestParam("code") String authCode, @RequestParam("state") String state,
        		@RequestParam(value = "realmId", required = false) String realmId, HttpSession session) {   
    	  System.out.println("inside oauth2redirect+++++>>>>>>");
            try {
                  String csrfToken = (String) session.getAttribute("csrfToken");
                  if (csrfToken.equals(state)) {
                      session.setAttribute("realmId", realmId);
                      session.setAttribute("auth_code", authCode);
          
                      OAuth2PlatformClient client  = factory.getOAuth2PlatformClient();
                      String redirectUri = env.getProperty("OAuth2AppRedirectUri"); 
                      
                      BearerTokenResponse bearerTokenResponse = client.retrieveBearerTokens(authCode, redirectUri);
                          
                      session.setAttribute("access_token", bearerTokenResponse.getAccessToken());
                      session.setAttribute("refresh_token",bearerTokenResponse.getRefreshToken());
                      
                      logger.info("refresh_token==>>" + bearerTokenResponse.getRefreshToken()+"access_token==>>"+bearerTokenResponse.getAccessToken());
                      return "Dashboard";
                  }
                  logger.info("csrf token mismatch " );
            } catch (OAuthException e) {
               logger.error("Exception in callback handler ", e);
               }
			 return "redirect:/loginpage";
        }
 
}
