package com.tekskills.Util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Map.Entry;
import java.util.Set;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

import com.tekskills.Dto.MailingDto;

@Component
@EnableAsync
public class SendHtmlEmailNew {
	@Autowired
	private Environment env;
	private static final Logger logger = Logger.getLogger(SendHtmlEmailNew.class);

	@Async
	public void sendMail(List<String> toemailList, String subject, String html, String tktOwnermail,
			String tktOwnerName, String status, String ticketid, String tktRdate, String tktDesc, String categoryName,
			String subcategoryName, List<String> ccemailList) throws MessagingException {
		final String mailhost = env.getProperty("mailhost");
		final String password = env.getProperty("password");
		final String username = env.getProperty("mailusername");
		final String port = env.getProperty("port");

		try {

			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", mailhost);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.auth", "true");
			Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			MimeMessage message = new MimeMessage(session1);
			//message.setFrom(new InternetAddress(tktOwnermail));
			
			message.setFrom(new InternetAddress(env.getProperty("hpcl_mail")));
			
			//message.setFrom(new InternetAddress(env.getProperty("hpcl_mail"),"NoReply-JD"));
			/*
			 * message.setRecipient(Message.RecipientType.TO, new
			 * InternetAddress(toemailList));
			 */
			InternetAddress[] toCcList = null;
			if (toemailList != null) {
				for (String toemail : toemailList) {
					if (toemail != null) {
						toCcList = InternetAddress.parse(toemail);

					}
					message.addRecipients(Message.RecipientType.TO, toCcList);
				}
			}
			/*
			 * if(ccemailList!=null) { message.setRecipient(Message.RecipientType.CC, new
			 * InternetAddress(ccemailList)); }
			 */
			InternetAddress[] myCcList = null;
			if (ccemailList != null) {
				for (String ccmail : ccemailList) {
					if (ccmail != null) {
						myCcList = InternetAddress.parse(ccmail);

					}
					message.addRecipients(Message.RecipientType.CC, myCcList);
				}
			}

			message.setSubject(subject);
			message.setReplyTo(new javax.mail.Address[] { new javax.mail.internet.InternetAddress(tktOwnermail) });
			StringWriter writer = new StringWriter();
			IOUtils.copy(new FileInputStream(new File(html)), writer);

			Map<String, String> input = new HashMap<String, String>();

			input.put("ticketId", ticketid);
			input.put("ticketOwner", tktOwnerName);
			input.put("raisedDate", tktRdate);
			input.put("category", categoryName);
			input.put("subcategoryName", subcategoryName);
			input.put("ticketDesc", tktDesc);
			input.put("tktstatus", status);
			String logo = env.getProperty("logo");
			String htmlText = readEmailFromHtml(html, input);
			// creates message part
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");
			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			Map<String, String> inlineImages = new HashMap<String, String>();
			inlineImages.put("image1", logo);

			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();
				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);
					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}
					multipart.addBodyPart(imagePart);
				}
			}
			message.setContent(multipart);
			Transport.send(message);
		} catch (AddressException e) {
			logger.error("AddressException raised while sending New Ticket----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailedException raised while sending New Ticket----" + e);

		} catch (Exception e) {
			logger.error("Logic Exception raised while sending New Ticket----" + e);
		}

	}

	// Method to replace the values for keys
	protected String readEmailFromHtml(String filePath, Map<String, String> input) {

		String msg = readContentFromFile(filePath);
		try {
			Set<Entry<String, String>> entries = input.entrySet();
			for (Map.Entry<String, String> entry : entries) {
				msg = msg.replace(entry.getKey().trim(), entry.getValue().trim());
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return msg;
	}

	// Method to read HTML file as a String
	private String readContentFromFile(String fileName) {

		StringBuffer contents = new StringBuffer();

		try {
			// use buffering, reading one line at a time
			BufferedReader reader = new BufferedReader(new FileReader(fileName));
			try {
				String line = null;
				while ((line = reader.readLine()) != null) {
					contents.append(line);
					contents.append(System.getProperty("line.separator"));
				}
			} finally {
				reader.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return contents.toString();
	}

	@Async
	public void dayWiseSendMail(String from_mail, String tomail, String subject, String tablecontent,
			String bodycontent) throws MessagingException, IOException {
		final String mailhost = env.getProperty("mailhost");
		final String password = env.getProperty("password");
		final String username = env.getProperty("mailusername");
		final String port = env.getProperty("port");
		try {
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", mailhost);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.auth", "true");
			Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(from_mail));
			if (tomail != null) {
				message.setRecipients(Message.RecipientType.TO, tomail);
			}

			StringBuilder sb = new StringBuilder();
			sb.append("Hi,");
			sb.append("<br>");
			sb.append("<br>");
			sb.append(bodycontent);
			sb.append("<br>");
			sb.append("<br>");
			sb.append(tablecontent);
			sb.append("<br>");
			sb.append("<br>");
			sb.append("Thanks & Regards");
			sb.append("<br>");
			sb.append("HPCL");

			message.setSubject(subject);
			message.setContent(sb.toString(), "text/html");
			Transport.send(message);
		} catch (AddressException e) {
			System.out.println("AddressException raised while sending ----" + e);

		} catch (SendFailedException e) {
			System.out.println("SendFailedException raised while sending ----" + e);

		} catch (Exception e) {
			System.out.println("Logic Exception raised while sending ----" + e);
		}
	}
	
	@Async
    public void sendNewUserMail(String toemail, String subject, String  name, String userId, String pwd, String roleName, String link, String comment) throws MessagingException {
           
           final String mailhost = env.getProperty("mailhost");
           final String password = env.getProperty("password");
           final String username = env.getProperty("mailusername");
           final String port = env.getProperty("port");
           try {
                  java.util.Properties properties = System.getProperties();
                  properties.setProperty("mail.smtp.host", mailhost);
                  properties.put("mail.smtp.port", port);
                  properties.put("mail.smtp.auth", "true");
                  Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                               return new PasswordAuthentication(username, password);
                        }
                  });

                  MimeMessage message = new MimeMessage(session1);
                  message.setFrom(new InternetAddress(env.getProperty("hpcl_mail")));
                  if (toemail != null) {
                        message.setRecipients(Message.RecipientType.TO, toemail);
                  }

                     StringBuilder sb = new StringBuilder(); 
                     sb.append("<br>");
                     sb.append("<br>");
                     sb.append("Hi "+name+" <br>");
                     sb.append("<br>");
                     sb.append("<br>");
                     sb.append(comment+" "+roleName);
                     sb.append("<br>");
                     sb.append("<br>");
                     sb.append("User Name : "+userId+" <br>");
                     sb.append("Password :  "+pwd+" <br>");
                     sb.append("<br>");
                     sb.append("<br>");
                     sb.append("<a href='"+link+"'>click,here to login</a>"); 
                     sb.append("<br>");
                     sb.append("<br>");
                     sb.append("Thanks & Regards");
                     sb.append("<br>");
                     sb.append("HPCL");

                  message.setSubject(subject);
                  message.setContent(sb.toString(), "text/html");
                  Transport.send(message);
           } catch (AddressException e) {
                  System.out.println("AddressException raised while sending ----" + e);

           } catch (SendFailedException e) {
                  System.out.println("SendFailedException raised while sending ----" + e);

           } catch (Exception e) {
                  System.out.println("Logic Exception raised while sending ----" + e);
           }
    }
	
	@Async
	public void sendLinkToEmailId(String toemail, String candName, String candEmail, String candPwd, String subject) {
		 final String mailhost = env.getProperty("mailhost");
        final String password = env.getProperty("password");
        final String username = env.getProperty("mailusername");
        final String port = env.getProperty("port");
        try {
       	 	String fromMail="deepak.d@tekskills.in";
       	 
               java.util.Properties properties = System.getProperties();
               properties.setProperty("mail.smtp.host", mailhost);
               properties.put("mail.smtp.port", port);
               properties.put("mail.smtp.auth", "false");
               Session session1 = Session.getDefaultInstance(properties,null);
               /*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
                     protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                     }
               });*/

               MimeMessage message = new MimeMessage(session1);
               message.setFrom(new InternetAddress(fromMail));
               if (toemail != null) {
                     message.setRecipients(Message.RecipientType.TO, toemail);
               }

                  StringBuilder sb = new StringBuilder(); 
                  sb.append("<br>");
                  sb.append("<br>");
                  sb.append("Hi "+candName+" <br>");
                 // sb.append("<br>");
                  sb.append("<br>");
                 // sb.append(comment+" "+roleName);
                //  sb.append("<br>");
                 // sb.append("<br>");
                  sb.append("Email Id : "+candEmail+" <br>");
                  sb.append("Password :  "+candPwd+" <br>");
                 // sb.append("<br>");
                  sb.append("<br>");
               //   sb.append("<a href='"+link+"'>click,here to login</a>"); 
                 // sb.append("<br>");
                 // sb.append("<br>");
                  sb.append("Thanks & Regards");
                  sb.append("<br>");
                  sb.append("Tekskills Inc");
               message.setSubject(subject);
               message.setContent(sb.toString(), "text/html");
               Transport.send(message);
        } catch (AddressException e) {
               System.out.println("AddressException raised while sending ----" + e);

        } catch (SendFailedException e) {
               System.out.println("SendFailedException raised while sending ----" + e);

        } catch (Exception e) {
               System.out.println("Logic Exception raised while sending ----" + e);
        }
	}
	@Async
	public void assiginingProfileToCandidate(String frommail, String subject, String email_id, String full_name,
			String comment, String password) {
		/* 	final String mailhost = env.getProperty("mailhost");
	        final String password = env.getProperty("password");
	        final String username = env.getProperty("mailusername");
	        final String port = env.getProperty("port");*/
	        try {
	    		Properties properties = System.getProperties();
				properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
				properties.put("mail.smtp.port", env.getProperty("port"));
				properties.put("mail.smtp.auth", "false");
				Session session1 = Session.getDefaultInstance(properties,null);
			
	        	/*   java.util.Properties properties = System.getProperties();
	               properties.setProperty("mail.smtp.host", mailhost);
	               properties.put("mail.smtp.port", port);
	               properties.put("mail.smtp.auth", "false");
	               Session session1 = Session.getDefaultInstance(properties);
	              Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
	                     protected PasswordAuthentication getPasswordAuthentication() {
	                            return new PasswordAuthentication(username, password);
	                     }
	               });*/
System.out.println("frommail**********"+frommail+"   To email_id*******"+email_id);
	               MimeMessage message = new MimeMessage(session1);
	               message.setFrom(new InternetAddress(frommail));
	               if (email_id!= null) {
	                     message.setRecipients(Message.RecipientType.TO, email_id);
	                }

	                  StringBuilder sb = new StringBuilder(); 
	                  sb.append("<br>");
	                  sb.append("Hi "+full_name+" <br>");
	                  sb.append("<br>");
	                  sb.append(""+comment+" <br>");
	                  sb.append("<br>");
	                  sb.append("Please find below login credentials: ");
	                  sb.append("<br>");
	                  sb.append("Email Id : "+email_id+" <br>");
	                  sb.append("Password :  "+password+" <br>");
	                  sb.append("<br>");
	                  sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
	                  sb.append("<br>");
	                  sb.append("<br>");
	                  sb.append("Thanks & Regards");
	                  sb.append("<br>");
	                  sb.append("Tekskills Inc");
	               message.setSubject(subject);
	               message.setContent(sb.toString(), "text/html");
	               Transport.send(message);
	        } catch (AddressException e) {
	               System.out.println("AddressException raised while sending ----" + e);

	        } catch (SendFailedException e) {
	               System.out.println("SendFailedException raised while sending ----" + e);

	        } catch (Exception e) {
	               System.out.println("Logic Exception raised while sending ----" + e);
	        }
		
	}

	public void sendMailtoCandidate(String frommail, String subject, String tomail, String username, String comment) {
		// TODO Auto-generated method stub
		
	}

	@Async
	public void sendTaskStatusMail(String fromemail, String toemail, String subject, String tablecontent,
			String bodycontent) {
        try {
    		Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");
			Session session1 = Session.getDefaultInstance(properties,null);
	
               MimeMessage message = new MimeMessage(session1);
               message.setFrom(new InternetAddress(fromemail));
               if (toemail!= null) {
                     message.setRecipients(Message.RecipientType.TO, toemail);
                }

                  StringBuilder sb = new StringBuilder(); 
                  sb.append("Hi Team,");
                  sb.append("<br>");
                  sb.append(""+bodycontent+" <br>");
                  sb.append("<br>");
                  sb.append(""+tablecontent+" <br>");
                  sb.append("<br>");
                  sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
                  sb.append("<br>");
                  sb.append("<br>");
                  sb.append("Thanks & Regards");
                  sb.append("<br>");
                  sb.append("Tekskills Inc");
               message.setSubject(subject);
               message.setContent(sb.toString(), "text/html");
               Transport.send(message);
        } catch (AddressException e) {
               System.out.println("AddressException raised while sending ----" + e);

        } catch (SendFailedException e) {
               System.out.println("SendFailedException raised while sending ----" + e);

        } catch (Exception e) {
               System.out.println("Logic Exception raised while sending ----" + e);
        }
	}
	
	@Async
	public void sendTimesheetMail(String frommail, String tomail, String toname, String subject,String body,String fromname) {
		/* 	final String mailhost = env.getProperty("mailhost");
	        final String password = env.getProperty("password");
	        final String username = env.getProperty("mailusername");
	        final String port = env.getProperty("port");*/
	        try {
	    		Properties properties = System.getProperties();
				properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
				properties.put("mail.smtp.port", env.getProperty("port"));
				properties.put("mail.smtp.auth", "false");
				Session session1 = Session.getDefaultInstance(properties,null);
			
	        	/*   java.util.Properties properties = System.getProperties();
	               properties.setProperty("mail.smtp.host", mailhost);
	               properties.put("mail.smtp.port", port);
	               properties.put("mail.smtp.auth", "false");
	               Session session1 = Session.getDefaultInstance(properties);
	              Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
	                     protected PasswordAuthentication getPasswordAuthentication() {
	                            return new PasswordAuthentication(username, password);
	                     }
	               });*/
	               MimeMessage message = new MimeMessage(session1);
	               message.setFrom(new InternetAddress(frommail));
	               if (tomail!= null) {
	                     message.setRecipients(Message.RecipientType.TO, tomail);
	                }

	                  StringBuilder sb = new StringBuilder(); 
	                  sb.append("Hi "+toname+" <br>");
	                  sb.append("<br>");
	                  sb.append(""+body+" <br>");
	                  sb.append("<br>");
	                  sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
	                  sb.append("<br>");
	                  sb.append("<br>");
	                  sb.append("Thanks & Regards");
	                  sb.append("<br>");
	                  sb.append(""+fromname+" <br>");
	                  sb.append(""+frommail+"");
	               message.setSubject(subject);
	               message.setContent(sb.toString(), "text/html");
	               Transport.send(message);
	        } catch (AddressException e) {
	               System.out.println("AddressException raised while sending ----" + e);

	        } catch (SendFailedException e) {
	               System.out.println("SendFailedException raised while sending ----" + e);

	        } catch (Exception e) {
	               System.out.println("Logic Exception raised while sending ----" + e);
	        }
		
	}

	public void sendBGCStatusMail(String fromail, String tomail, String fromname, String toname, String subject,
			String body, String ccmail) {

        try {
    		Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");
			Session session1 = Session.getDefaultInstance(properties,null);
               MimeMessage message = new MimeMessage(session1);
               message.setFrom(new InternetAddress(fromail));
               if (tomail!= null) {
                     message.setRecipients(Message.RecipientType.TO, tomail);
                }
               if (ccmail!= null) {
                   message.setRecipients(Message.RecipientType.CC, ccmail);
              }

                  StringBuilder sb = new StringBuilder(); 
                  sb.append("Hi "+toname+", <br>");
                  sb.append("<br>");
                  sb.append(""+body+" <br>");
                  sb.append("<br>");
                  sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
                  sb.append("<br>");
                  sb.append("<br>");
                  sb.append("Thanks & Regards");
                  sb.append("<br>");
                  sb.append(""+fromname+" <br>");
                  sb.append(""+fromail+"");
               message.setSubject(subject);
               message.setContent(sb.toString(), "text/html");
               Transport.send(message);
        } catch (AddressException e) {
               System.out.println("AddressException raised while sending sendBGCStatusMail method ----" + e);

        } catch (SendFailedException e) {
               System.out.println("SendFailedException raised while sending sendBGCStatusMail method----" + e);

        } catch (Exception e) {
               System.out.println("Logic Exception raised while sending sendBGCStatusMail method----" + e);
        }
		
	}

	public void tsmailreminder(MailingDto maildto) {
		 try {
	    		Properties properties = System.getProperties();
				properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
				properties.put("mail.smtp.port", env.getProperty("port"));
				properties.put("mail.smtp.auth", "false");
				Session session1 = Session.getDefaultInstance(properties,null);
	               MimeMessage message = new MimeMessage(session1);
	               message.setFrom(new InternetAddress(maildto.getFrommail()));
	               if (maildto.getToamil()!= null) {
	                     message.setRecipients(Message.RecipientType.TO, maildto.getToamil());
	                }
	              

	                  StringBuilder sb = new StringBuilder(); 
	                  sb.append("Hi "+maildto.getToname()+", <br>");
	                  sb.append("<br>");
	                  sb.append(""+maildto.getComments()+" <br>");
	                  sb.append("<br>");
	                  sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
	                  sb.append("<br>");
	                  sb.append("<br>");
	                  sb.append("Thanks & Regards");
	                  sb.append("<br>");
	                  sb.append(""+maildto.getFromname()+" <br>");
	                  sb.append(""+maildto.getFrommail()+"");
	               message.setSubject(maildto.getSubject());
	               message.setContent(sb.toString(), "text/html");
	               Transport.send(message);
	        } catch (AddressException e) {
	               System.out.println("AddressException raised while sending sendBGCStatusMail method ----" + e);

	        } catch (SendFailedException e) {
	               System.out.println("SendFailedException raised while sending sendBGCStatusMail method----" + e);

	        } catch (Exception e) {
	               System.out.println("Logic Exception raised while sending sendBGCStatusMail method----" + e);
	        }
	}

	public void basicDetailsReminder(MailingDto maildto) {
		try {
    		Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");
			Session session1 = Session.getDefaultInstance(properties,null);
               MimeMessage message = new MimeMessage(session1);
               message.setFrom(new InternetAddress(maildto.getFrommail()));
              
               InternetAddress[] toCcList = null;
   			if (maildto.getCclist() != null) {
   				for (String toemail : maildto.getCclist()) {
   					if (toemail != null) {
   						toCcList = InternetAddress.parse(toemail);
   					}
   					message.addRecipients(Message.RecipientType.TO, toCcList);
   				}
   			}
               
              

                  StringBuilder sb = new StringBuilder(); 
                  sb.append("Hi "+maildto.getToname()+", <br>");
                  sb.append("<br>");
                  sb.append(""+maildto.getComments()+" <br>");
                  sb.append("<br>");
                  sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
                  sb.append("<br>");
                  sb.append("<br>");
                  sb.append("Thanks & Regards");
                  sb.append("<br>");
                  sb.append(""+maildto.getFromname()+" <br>");
                  sb.append(""+maildto.getFrommail()+"");
               message.setSubject(maildto.getSubject());
               message.setContent(sb.toString(), "text/html");
               Transport.send(message);
        } catch (AddressException e) {
               System.out.println("AddressException raised while sending sendBGCStatusMail method ----" + e);

        } catch (SendFailedException e) {
               System.out.println("SendFailedException raised while sending sendBGCStatusMail method----" + e);

        } catch (Exception e) {
               System.out.println("Logic Exception raised while sending sendBGCStatusMail method----" + e);
        }
		
	}

	public void h1binitiatemailToCandidate(MailingDto maildto) {
        try {
    		Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");
			Session session1 = Session.getDefaultInstance(properties,null);
		
               MimeMessage message = new MimeMessage(session1);
               message.setFrom(new InternetAddress(maildto.getFrommail()));
               if (maildto.getToamil()!= null) {
                     message.setRecipients(Message.RecipientType.TO, maildto.getToamil());
                }

                  StringBuilder sb = new StringBuilder(); 
                  sb.append("<br>");
                  sb.append("Hi "+maildto.getToname()+" <br>");
                  sb.append("<br>");
                  sb.append(""+maildto.getComments()+" <br>");
                  sb.append("<br>");
                  sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
                  sb.append("<br>");
                  sb.append("<br>");
                  sb.append("Thanks & Regards");
                  sb.append("<br>");
                  sb.append("Tekskills Inc");
                  sb.append("<br>");
                  sb.append(""+maildto.getFromname()+" <br>");
                  sb.append(""+maildto.getFrommail()+" <br>");
                  
               message.setSubject(maildto.getSubject());
               message.setContent(sb.toString(), "text/html");
               Transport.send(message);
        } catch (AddressException e) {
               System.out.println("AddressException raised while sending ----" + e);

        } catch (SendFailedException e) {
               System.out.println("SendFailedException raised while sending ----" + e);

        } catch (Exception e) {
               System.out.println("Logic Exception raised while sending ----" + e);
        }
   }
	public void triggerPendingDocumentsMail(String from_mail, String tomail, String name, String doclist) throws IOException {
		// TODO Auto-generated method stub
		java.util.Properties properties = System.getProperties();
		properties.setProperty("mail.smtp.host",  env.getProperty("mailhost"));
		properties.put("mail.smtp.port", env.getProperty("port"));
		properties.put("mail.smtp.auth", "false");
		 try
	     {
		Session session1 = Session.getDefaultInstance(properties,null);
		MimeMessage message = new MimeMessage(session1);
		message.setFrom(new InternetAddress(from_mail));
		if (tomail != null) {
			message.setRecipients(Message.RecipientType.TO, tomail);
		}
		StringBuilder sb = new StringBuilder();
		sb.append("Hi "+name+",");
		sb.append("<br>");
		sb.append("<br>");
		sb.append("You have pending documents, please submit ASAP.");
		sb.append("<br>");sb.append("<br>");
		sb.append(doclist);
		sb.append("<br>");
		sb.append("<a href='usportal.tekskillsinc.com'>click-here to login</a>");
		sb.append("<br>");
		sb.append("<br>");
		sb.append("Thanks & Regards");
		sb.append("<br>");
		sb.append("Tekskills Inc");
		
		message.setSubject("Reminder to submit pending documents");
		message.setContent(sb.toString(),"text/html"); 
		Transport.send(message);
	     }
	     catch (AddressException e) {
	         System.out.println("AddressException raised while sending ----"+e);

	     } catch (SendFailedException e) {
	    	 System.out.println("SendFailedException raised while sending ----"+e);

	     } catch (Exception e) {
	    	 System.out.println("Logic Exception raised while sending ----"+e);
	     }  

	}
}
