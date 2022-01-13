package com.tekskills.Util;

import static java.time.temporal.TemporalAdjusters.lastDayOfMonth;
import static java.time.temporal.TemporalAdjusters.previousOrSame;

import java.io.File;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.mail.MessagingException;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.tekskills.Dto.TimesheetDto;

@Component
@PropertySource("/WEB-INF/mail.properties")
public class Commons {
	@Autowired
	private Environment env;
	private static final Logger logger = Logger.getLogger(Commons.class);

	public void fileToDirectory(Integer candidateId, MultipartFile filename, String vendorName, String customerName)
			throws MessagingException {
		final String directorypath = env.getProperty("documents");
		if (!new File(directorypath).exists()) {
			new File(directorypath).mkdir();
		}
		File dest = null;
		String finaldirectorypath = null;
		if (vendorName != null) {
			if (!filename.isEmpty()) {
				finaldirectorypath = directorypath + File.separator + vendorName;
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to fileToDirectory vendor:", ex);
					}
				} else {
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to fileToDirectory vendor:", ex);
					}
				}
			}
		} else if (customerName != null) {
			if (!filename.isEmpty()) {
				finaldirectorypath = directorypath + File.separator + customerName;
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to fileToDirectory customer:", ex);
					}
				} else {
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to fileToDirectory vendor:", ex);
					}
				}
			}
		} else if (candidateId != null) {
			String userIdFolder = candidateId.toString();
			if (!filename.isEmpty()) {
				finaldirectorypath = directorypath + File.separator + userIdFolder;
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to fileToDirectory :", ex);
					}
				} else {
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to fileToDirectory vendor:", ex);
					}
				}
			}
		} else {

		}
	}
	
	public void bgvfileToDirectory(Integer candidateId, MultipartFile filename, String subCategoryName)
			throws MessagingException {
		String directorypath2  = null;
		final String directorypath = env.getProperty("documents");
		if (!new File(directorypath).exists()) {
			new File(directorypath).mkdir();
			directorypath2 = directorypath + File.separator + "BGV";
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}else {
			directorypath2 = directorypath + File.separator + "BGV";
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}
		File dest = null;
		String finaldirectorypath = null;
		 if (candidateId != null) {
			String userIdFolder = candidateId.toString();
			if (!filename.isEmpty()) {
				finaldirectorypath = directorypath2 + File.separator + userIdFolder;
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to bgvfileToDirectory :", ex);
					}
				} else {
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to bgvfileToDirectory:", ex);
					}
				}
			}
		} else {
				/*String directorypath3  = null;
				directorypath3 = directorypath2 + File.separator + "SubCategoryDocuments";
				if (!new File(directorypath3).exists()) {
					new File(directorypath3).mkdir();
				}*/
			if (!filename.isEmpty()) {
				finaldirectorypath = directorypath2 + File.separator + "SubCategoryDocuments";
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to bgvfileToDirectory :", ex);
					}
				} else {
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to bgvfileToDirectory:", ex);
					}
				}
			}
			
		}
	}

	

	public void ImmigrationfileToDirectory(Integer candidateId, MultipartFile file, String lcaDocumentDate)
			throws MessagingException {
		String directorypath2  = null;
		final String directorypath = env.getProperty("documents");
		if (!new File(directorypath).exists()) {
			new File(directorypath).mkdir();
			directorypath2 = directorypath + File.separator + candidateId.toString();
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}else {
			directorypath2 = directorypath + File.separator + candidateId.toString();
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}
		File dest = null;
		String finaldirectorypath = null;
		 if (candidateId != null) {
			//String userIdFolder = candidateId.toString();
			if (!file.getOriginalFilename().isEmpty()) {
				finaldirectorypath = directorypath2 + File.separator + "Immigration";
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						 dest = new File(finaldirectorypath + File.separator + file.getOriginalFilename());
						  file.transferTo(dest); 
						  File newFile = new File(finaldirectorypath + File.separator + file.getOriginalFilename().replace(file.getOriginalFilename(), FilenameUtils.getBaseName(lcaDocumentDate) + "." + FilenameUtils.getExtension(file.getOriginalFilename())));
						 System.out.println("dest****"+dest);
						 System.out.println("file Renamed****"+newFile);
						  if(dest.renameTo(newFile)){
					            System.out.println("File rename success");;
					        }else{
					            System.out.println("File rename failed");
					      }
						 /* String filename=file.getOriginalFilename().replace(file.getOriginalFilename(), FilenameUtils.getBaseName(file.getOriginalFilename()).concat(lcaDocumentDate) + "." + FilenameUtils.getExtension(file.getOriginalFilename()));
						  String fname=getNewName(filename,newFile);  
						  System.out.println("fname*******"+fname);*/
						  
						  
					} catch (Exception ex) {
						logger.error("Exception due to ImmigrationfileToDirectory :", ex);
					}
				} else {
					try {
						    dest = new File(finaldirectorypath + File.separator + file.getOriginalFilename());
							file.transferTo(dest); 
							File newFile = new File(finaldirectorypath + File.separator + file.getOriginalFilename().replace(file.getOriginalFilename(), FilenameUtils.getBaseName(lcaDocumentDate) + "." + FilenameUtils.getExtension(file.getOriginalFilename())));
							/* System.out.println("dest**else**"+dest);
							 System.out.println("file Renamed***else*"+newFile);*/
							if(dest.renameTo(newFile)){
						            System.out.println("File rename success");;
						        }else{
						            System.out.println("File rename failed");
						      }
							 /* String filename=file.getOriginalFilename().replace(file.getOriginalFilename(), FilenameUtils.getBaseName(file.getOriginalFilename()).concat(lcaDocumentDate) + "." + FilenameUtils.getExtension(file.getOriginalFilename()));
							  String fname=getNewName(filename,newFile);  
							  System.out.println("fname*******"+fname);*/
					} catch (Exception ex) {
						logger.error("Exception due to ImmigrationfileToDirectory:", ex);
					}
				}
			}
		 }
	}
	
	public void saveH1BfilesToDirectory(Integer candidate_Id, MultipartFile filename) {
		String directorypath2  = null;
		final String directorypath = env.getProperty("documents");
		System.out.println(directorypath+"--directorypath");
		if (!new File(directorypath).exists()) {
			new File(directorypath).mkdir();
			directorypath2 = directorypath + File.separator + candidate_Id.toString();
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}else {
			directorypath2 = directorypath + File.separator + candidate_Id.toString();
			System.out.println(directorypath2+"--directorypath2");
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}
		File dest = null;
		String finaldirectorypath = null;
		 if (candidate_Id != null) {
			if (!filename.getOriginalFilename().isEmpty()) {
				
				finaldirectorypath = directorypath2 + File.separator + "H-1B";
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to saveH1BfilesToDirectory file path not exist :", ex);
					}
				} else {
					dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
					try {
					filename.transferTo(dest);
					}catch(Exception e) {
						
					}
				}
			  }
			
			
			 }
	}
	public List<String> getMonthsList() {
		List<String> monthsList = new ArrayList<String>();
		try {
			String[] months = new DateFormatSymbols().getMonths();
			for (int i = 0; i <= 11; i++) {
				monthsList.add(months[i]);
			}
		} catch (Exception e) {
			logger.error("Exception in Commons  getMonthsList :", e);
		}
		return monthsList;
	}

	public Date getSringDatetoSQLDate(String date) throws ParseException {
		java.sql.Date from_date = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date parsedDate = format.parse(date);
			from_date = new java.sql.Date(parsedDate.getTime());
		} catch (Exception e) {
			logger.error("Exception in Commons getSringDatetoSQLDate :", e);
		}
		return from_date;
	}

	public String getSQLDateToMMDDYYYY(Date date) throws ParseException {
		String stringdate = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			stringdate = sdf.format(date);
		} catch (Exception e) {
			logger.error("Exception in Commons getSQLDateToMMDDYYYY :", e);
		}
		return stringdate;
	}

	public List<TimesheetDto> getAllWeeksByYear(int year) throws ParseException {
		List<TimesheetDto> weeklytemplate = new ArrayList<TimesheetDto>();
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year - 1);
			cal.set(Calendar.MONTH, Calendar.DECEMBER);
			cal.set(Calendar.DAY_OF_MONTH, 31);

			int ordinalDay = cal.get(Calendar.DAY_OF_YEAR);
			int weekDay = cal.get(Calendar.DAY_OF_WEEK) - 1;
			int value=(ordinalDay - weekDay + 10);
			double numberOfWeeks1 = value/7 ;
			int numberOfWeeks=cal.getWeekYear();
			
			LocalDate endDate1=LocalDate.of(year, 12, 31).with(lastDayOfMonth()).with(previousOrSame(DayOfWeek.SUNDAY));
			Calendar calend = Calendar.getInstance();
		    int year1 = endDate1.getYear(); 
		    int month1 = endDate1.getMonthValue(); 
		    int day1 = endDate1.getDayOfMonth(); 
		    System.out.println("day1--"+day1);
		    calend.set(year1,month1,day1);
			int numberofWeeksNew=cal.getWeeksInWeekYear();
			
			for (int i = 1; i <= numberofWeeksNew; i++) {
				if(i<=52) {
				TimesheetDto dto = new TimesheetDto();
				cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
				DateFormat df = new SimpleDateFormat("MM/dd/yyyy", Locale.getDefault());
				String startDate = df.format(cal.getTime());
				
				
				cal.add(Calendar.DATE, 6);
				String endDate = df.format(cal.getTime());
				
				Date fd = new Date();
				Date td = new Date();
				fd = df.parse(startDate);
				td = df.parse(endDate);
				Calendar start = Calendar.getInstance();

				start.setTime(fd);
				Calendar end = Calendar.getInstance();
				end.setTime(td);

				SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
				dto.setMonth(sdf.format(fd));
				Calendar caln = new GregorianCalendar();
				caln.setTime(fd);
				int y = caln.get(caln.YEAR);
				dto.setYear(year);
				dto.setWeekno(i);
				dto.setFromdate(startDate);
				dto.setTodate(endDate);
				weeklytemplate.add(dto);
				}else if(i==53){
					
					TimesheetDto dto1 = new TimesheetDto();
					cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
					DateFormat df = new SimpleDateFormat("MM/dd/yyyy", Locale.getDefault());
					String startDate = df.format(cal.getTime());
					
					DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
					String startDate1 = df1.format(cal.getTime());
					LocalDate dateBefore = LocalDate.parse(startDate1);
					LocalDate dateAfter = LocalDate.of(year, 12, 31);
					System.out.println("dateBefore----"+dateBefore+"===========dateAfter======="+dateAfter);
					//calculating number of days in between
					int noOfDaysBetween = (int) ChronoUnit.DAYS.between(dateBefore, dateAfter);
					
					
					
					
					int diff=31-cal.DATE;
					System.out.println("===========else======="+noOfDaysBetween);
					cal.add(Calendar.DATE, noOfDaysBetween);
				
					String endDate = df.format(cal.getTime());

					Date fd = new Date();
					Date td = new Date();
					fd = df.parse(startDate);
					td = df.parse(endDate);
					Calendar start = Calendar.getInstance();

					start.setTime(fd);
					Calendar end = Calendar.getInstance();
					end.setTime(td);
					
					
					int dayname=dateAfter.getDayOfWeek().getValue();
					System.out.println("end.DAY_OF_WEEK====="+dateAfter.getDayOfWeek()+"bnvnvnnbvnv----"+dateAfter.getDayOfWeek().getValue());
					
if(dayname==7) {
System.out.println("ttttttttttt");
SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
dto1.setMonth(sdf.format(fd));
Calendar caln = new GregorianCalendar();
caln.setTime(fd);
int y = caln.get(caln.YEAR);
dto1.setYear(year);
dto1.setWeekno(i);
dto1.setFromdate(startDate);
dto1.setTodate(endDate);
weeklytemplate.add(dto1);
	
				
				}
else {
	
	System.out.println("ttttaaaaaaaaaaaaaaaaattttttt");
	/*SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
	dto1.setMonth(sdf.format(fd));
	Calendar caln = new GregorianCalendar();
	caln.setTime(fd);
	int y = caln.get(caln.YEAR);
	dto1.setYear(y);
	dto1.setWeekno(i);
	dto1.setFromdate(startDate);
	dto1.setTodate(endDate);
	weeklytemplate.add(dto1);

*/	}
				}
			}
		} catch (Exception e) {
			logger.error("Exception in Commons getAllWeeksByYear :", e);
		}
		return weeklytemplate;
	}

	public List<TimesheetDto> getMonthlyTemplate(Integer yr) {
		List<TimesheetDto> weeklytemplate = new ArrayList<TimesheetDto>();
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, yr );
			int numberOfMonths = 12;

			for (int i = 1; i <= numberOfMonths; i++) {
				TimesheetDto dto = new TimesheetDto();
				YearMonth yearMonth = YearMonth.of(yr, i); // January of 2015.
				LocalDate firstOfMonth = yearMonth.atDay(1);
				LocalDate lastOfMonth = yearMonth.atEndOfMonth();

				String startDate = firstOfMonth.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
				String endDate = lastOfMonth.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));

				String mn = firstOfMonth.getMonth().name();
				String fl = mn.substring(0, 1);
				String li = mn.substring(1, mn.length()).toLowerCase();
				dto.setMonth(fl+li);
				dto.setWeekno(i);
				dto.setYear(yr);
				dto.setFromdate(startDate);
				dto.setTodate(endDate);
				weeklytemplate.add(dto);
			}
		} catch (Exception e) {
			logger.error("Exception in Commons getMonthlyTemplate :", e);
		}
		return weeklytemplate;
	}

	public List<TimesheetDto> getBiweeklyTemplate_1(Integer yr) {
		List<TimesheetDto> biweeklytemplate = new ArrayList<TimesheetDto>();
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, yr - 1);
			cal.set(Calendar.MONTH, Calendar.DECEMBER);
			cal.set(Calendar.DAY_OF_MONTH, 31);

			int ordinalDay = cal.get(Calendar.DAY_OF_YEAR);
			int weekDay = cal.get(Calendar.DAY_OF_WEEK);
			int numberOfWeeks = (ordinalDay - weekDay + 10) / 14;
			for (int i = 1; i <= numberOfWeeks; i++) {
				TimesheetDto dto = new TimesheetDto();
				cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
				DateFormat df = new SimpleDateFormat("MM/dd/yyyy", Locale.getDefault());
				String startDate = df.format(cal.getTime());
				cal.add(Calendar.DATE, 13);
				String endDate = df.format(cal.getTime());

				Date fd = new Date();
				Date td = new Date();
				fd = df.parse(startDate);
				td = df.parse(endDate);
				Calendar start = Calendar.getInstance();

				start.setTime(fd);
				Calendar end = Calendar.getInstance();
				end.setTime(td);

				SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
				dto.setMonth(sdf.format(fd));
				Calendar caln = new GregorianCalendar();
				caln.setTime(fd);
				int y = caln.get(caln.YEAR);
				dto.setYear(yr);
				dto.setWeekno(i);
				dto.setFromdate(startDate);
				dto.setTodate(endDate);
				biweeklytemplate.add(dto);
			}
		} catch (Exception e) {
			logger.error("Exception in Commons getBiweeklyTemplate1 :", e);
		}
		return biweeklytemplate;
	}

	public List<TimesheetDto> getBiweeklyTemplate_2(Integer yr) {
		List<TimesheetDto> biweeklytemplate = new ArrayList<TimesheetDto>();
		try {
			Calendar cal = Calendar.getInstance();
			Calendar mycal = Calendar.getInstance(new Locale("us"));
			int weekday = mycal.get(Calendar.DAY_OF_WEEK);
			System.out.println("weekday"+weekday);
			if (weekday != Calendar.MONDAY) {
				int days = (Calendar.SATURDAY - weekday + 2) % 7;
				mycal.add(Calendar.DAY_OF_YEAR, days);
			} // else {
			mycal.set(Calendar.YEAR, yr - 1);
			mycal.set(Calendar.MONTH, 12);
			mycal.set(Calendar.DAY_OF_MONTH, 31);
			mycal.set(Calendar.DAY_OF_WEEK_IN_MONTH, 1);
			// }
			int ordinalDay = cal.getActualMaximum(Calendar.DAY_OF_YEAR);
			int weekDay = cal.get(Calendar.DAY_OF_WEEK) - 1;
			int numberOfWeeks = (ordinalDay - weekDay + 10) / 14;

			for (int i = 1; i <= numberOfWeeks; i++) {
				TimesheetDto dto = new TimesheetDto();
				mycal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);

				DateFormat df = new SimpleDateFormat("MM/dd/yyyy", Locale.getDefault());
				String startDate = df.format(mycal.getTime());
				mycal.add(Calendar.DATE, 13);
				String endDate = df.format(mycal.getTime());

				Date fd = new Date();
				Date td = new Date();
				fd = df.parse(startDate);
				td = df.parse(endDate);
				Calendar start = Calendar.getInstance();

				start.setTime(fd);
				Calendar end = Calendar.getInstance();
				end.setTime(td);

				SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
				dto.setMonth(sdf.format(fd));
				Calendar caln = new GregorianCalendar();
				caln.setTime(fd);
				int y = caln.get(caln.YEAR);
				dto.setYear(yr);
				dto.setWeekno(i);
				dto.setFromdate(startDate);
				dto.setTodate(endDate);
				biweeklytemplate.add(dto);
			}

		} catch (Exception e) {
			logger.error("Exception in Commons getBiweeklyTemplate2 :", e);
		}
		return biweeklytemplate;
	}

	public List<TimesheetDto> getSemiMonthTemplate(Integer yr) {
		List<TimesheetDto> semimonthtemplate = new ArrayList<TimesheetDto>();
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, yr );
			int numberOfMonths = 12;
			for (int i = 1; i <= numberOfMonths; i++) {
				int temp=2;
				YearMonth yearMonth = YearMonth.of(yr, i); // January of 2015.
				for (int j = 1; j<=temp; j++) {
					if(j==1) {
						TimesheetDto dtotemp1 = new TimesheetDto();
						LocalDate period1 = yearMonth.atDay(1);
						LocalDate period2 = yearMonth.atDay(15);
						String startDate = period1.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
						String endDate = period2.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
				        java.sql.Date from_date = java.sql.Date.valueOf(period1);
				        java.sql.Date to_date = java.sql.Date.valueOf(period2);
						
						dtotemp1.setFromdate(startDate);
						dtotemp1.setTodate(endDate);
						String mn = period1.getMonth().name();
						String fl = mn.substring(0, 1);
						String li = mn.substring(1, mn.length()).toLowerCase();
						dtotemp1.setMonth(fl+li);
						dtotemp1.setWeekno(i);
						dtotemp1.setYear(yr);
						dtotemp1.setPeriod_name("P1");
						dtotemp1.setPeriod("1-15");
						dtotemp1.setFrom_date(from_date);
						dtotemp1.setTo_date(to_date);
						semimonthtemplate.add(dtotemp1);
						
					}else {
						TimesheetDto dto = new TimesheetDto();
						LocalDate period3 = yearMonth.atDay(16);
						LocalDate period4 = yearMonth.atEndOfMonth();
						String startDate = period3.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
						String endDate = period4.format(DateTimeFormatter.ofPattern("MM/dd/yyyy"));
						 java.sql.Date from_date = java.sql.Date.valueOf(period3);
					        java.sql.Date to_date = java.sql.Date.valueOf(period4);
													
						dto.setFromdate(startDate);
						dto.setTodate(endDate);
						String mn = period3.getMonth().name();
						String fl = mn.substring(0, 1);
						String li = mn.substring(1, mn.length()).toLowerCase();
						dto.setMonth(fl+li);
						dto.setWeekno(i);
						dto.setYear(yr);
						dto.setPeriod_name("P2");
						dto.setPeriod("16-"+period4.toString().substring(period4.toString().length()-2));
						dto.setFrom_date(from_date);
						dto.setTo_date(to_date);
						semimonthtemplate.add(dto);
					}
				}
				
			}
		} catch (Exception e) {
			logger.error("Exception in Commons getSemiMonthTemplate :", e);
		}
		return semimonthtemplate;
	}
	
	public Integer ParseInt(String id) {
		Integer parsId =0;
		try {
		if(id!="") {
			parsId=Integer.parseInt(id);
		  }
		} catch (Exception e) {
			logger.error("Exception in Commons ParseInt :", e);
		}
		return parsId;
	}
	
	public static int getWeeksBetween (Date a, Date b) {

	    if (b.before(a)) {
	        return -getWeeksBetween(b, a);
	    }
	    a = resetTime(a);
	    b = resetTime(b);

	    Calendar cal = new GregorianCalendar();
	    cal.setTime(a);
	    int weeks = 0;
	    while (cal.getTime().before(b)) {
	        // add another week
	        cal.add(Calendar.WEEK_OF_YEAR, 1);
	        weeks++;
	    }
	    return weeks;
	}

	public static Date resetTime (Date d) {
	    Calendar cal = new GregorianCalendar();
	    cal.setTime(d);
	    cal.set(Calendar.HOUR_OF_DAY, 0);
	    cal.set(Calendar.MINUTE, 0);
	    cal.set(Calendar.SECOND, 0);
	    cal.set(Calendar.MILLISECOND, 0);
	    return cal.getTime();
	}
	
	public String
    getDayMonthYear(String date)
    {
		String sdate = null;
        // Get an instance of LocalTime
        // from date
        LocalDate currentDate
            = LocalDate.parse(date);
 
        // Get day from date
        int day = currentDate.getDayOfMonth();
 
        // Get month from date
        Month month = currentDate.getMonth();
 
        // Get year from date
        int year = currentDate.getYear();
 
        // Print the day, month, and year
        System.out.println("Day: " + day);
        System.out.println("Month: " + month);
        System.out.println("Year: " + year);
        sdate=day+" "+month;
		return sdate;
    }
 
	
	public void PAFfilesToDirectory(Integer candidate_Id, MultipartFile filename, String paf_type) {
		String directorypath2  = null;String directorypath3  = null;
		final String directorypath = env.getProperty("documents");
		if (!new File(directorypath).exists()) {
			new File(directorypath).mkdir();
			directorypath2 = directorypath + File.separator + candidate_Id.toString();
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}else {
			directorypath2 = directorypath + File.separator + candidate_Id.toString();
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}
		if (!new File(directorypath2).exists()) {
			new File(directorypath2).mkdir();
			directorypath3 = directorypath + File.separator + candidate_Id.toString()+File.separator+"PAF";
			if (!new File(directorypath3).exists()) {
				new File(directorypath3).mkdir();
			}
		}else {
			directorypath3 = directorypath + File.separator + candidate_Id.toString()+File.separator+"PAF";
			if (!new File(directorypath3).exists()) {
				new File(directorypath3).mkdir();
			}
		}
		
		File dest = null;
		String finaldirectorypath = null;
		 if (candidate_Id != null) {
			if (!filename.getOriginalFilename().isEmpty()) {
				
				finaldirectorypath = directorypath3 + File.separator+paf_type;
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
					try {
						dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
						filename.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to saveModifiedPAFfilesToDirectory file path not exist :", ex);
					}
				} else {
					dest = new File(finaldirectorypath + File.separator + filename.getOriginalFilename());
					try {
					filename.transferTo(dest);
					}catch(Exception e) {
						
					}
				}
			  }
			 }
	}

}