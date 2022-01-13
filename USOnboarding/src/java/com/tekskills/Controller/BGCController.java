package com.tekskills.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.poi.xwpf.model.XWPFHeaderFooterPolicy;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.UnderlinePatterns;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFHeader;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSectPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tekskills.Dto.AssignedCandidateDto;
import com.tekskills.Dto.CandidateBGCAddressDetailsDto;
import com.tekskills.Dto.CandidateBGCPersonalDetailsDto;
import com.tekskills.Dto.CandidateBgvEducationDto;
import com.tekskills.Dto.CandidateBgvEmploymentDto;
import com.tekskills.Dto.CategoreisDTO;
import com.tekskills.Dto.ContractsPanelDetails_DTO;
import com.tekskills.Dto.DocEmpBean;
import com.tekskills.Dto.DocumentTypeDto;
import com.tekskills.Dto.ProfileMasterDTO;
import com.tekskills.Dto.TempCandidateDetailsDTO;
import com.tekskills.Dto.commentHistoryDto;
import com.tekskills.Dto.fileHistoryDto;
import com.tekskills.Entity.BGCCandidateFormsStatusEntity;
import com.tekskills.Entity.CandidateBGCCheckList;
import com.tekskills.Entity.CandidateBGCDetails;
import com.tekskills.Entity.CategoryEntity;
import com.tekskills.Entity.DocumentTypeEntity;
import com.tekskills.Entity.ProfileLableMaster;
import com.tekskills.Entity.ProfileMasterCheckList;
import com.tekskills.Entity.SubCategoryEntity;
import com.tekskills.Entity.TemporaryCandidateDetails;
import com.tekskills.Service.BGCService;
import com.tekskills.Util.SendHtmlEmailNew;


@Controller
@PropertySource("/WEB-INF/mail.properties")
public class BGCController {
	private static final Logger logger = Logger.getLogger(BGCController.class);
	private static final String UPLOAD_DIRECTORY = "temp_pdf";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 5; // 5	MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	@Autowired
	private BGCService bgcService;

	@Autowired
	private Environment env;

	@Autowired
	private SendHtmlEmailNew sendmail;
	@Autowired
	ServletContext context;

	@RequestMapping(value = { "/category" }, method = RequestMethod.GET)
	public String category(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<CategoryEntity> categoryList = bgcService.getAllCategeories();

			model.addAttribute("categoryList", categoryList);

			String bgc = "bgc";
			session.setAttribute("candidates", null);
			session.setAttribute("templates", null);
			session.setAttribute("mdashboard",null);
			session.setAttribute("stsreports", null);
			session.setAttribute("myDashboard", null);
			session.setAttribute("bgc", null);
			session.setAttribute("timesheet", null);
			session.setAttribute("mydocuments", null);
			session.setAttribute("immigration", null);
			session.setAttribute("bgc", bgc);
			}
		} catch (Exception e) {
			logger.error("Error in CategoryList" + e);
		}
		return "Categories";
	}

	@RequestMapping(value = { "/category" }, method = RequestMethod.POST)
	@ResponseBody
	public String categorySave(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String Category = request.getParameter("Category");
				int categoryid = bgcService.saveCategory(Category, lgempno);
				if (categoryid != 0) {
					message = Category + " added successfully";
				}
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveCategory" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/updatecategory" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatecategory(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String categoryid = request.getParameter("categoryid");
				String Category = request.getParameter("Category");
				String msg = bgcService.updatecategory(Category, categoryid);
				message = msg;
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatecategory" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/subcategory" }, method = RequestMethod.GET)
	public String subcategory(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			// List<SubCategoryEntity> subcategoryList = bgcService.getAllSubCategeories();
			List<CategoryEntity> categoryList = bgcService.getAllCategeories();
			List<CategoreisDTO> subcategoryList = bgcService.getSubCategeoriesList();
			List<DocumentTypeEntity> docTypeyList = bgcService.getDocumentTypeList();

			model.addAttribute("categoryList", categoryList);
			model.addAttribute("docTypeyList", docTypeyList);
			model.addAttribute("subcategoryList", subcategoryList);
			}
		} catch (Exception e) {
			logger.error("Error in get subcategory page" + e);
		}
		return "SubCategories";
	}

	@RequestMapping(value = { "/subcategory" }, method = RequestMethod.POST)
	@ResponseBody
	public String subcategorysave(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "document[]", required = false) MultipartFile document[]) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {

				String Category = request.getParameter("Category");
				String SubCategory = request.getParameter("SubCategory");
				String sameas_category = request.getParameter("sameas_category");
				String subcattype = request.getParameter("subcattype");
				String doctype = request.getParameter("doctype");
				String isdocupload = request.getParameter("docupload");
				System.out.println("docupload******"+isdocupload);
				System.out.println("document******"+document.length);

				int subcategoryid = bgcService.saveSubCategory(Category, SubCategory, sameas_category, lgempno,
						subcattype, doctype,isdocupload,document);
				if (subcategoryid > 0) {
					message = SubCategory + " Sub category added successfully";
				}
				
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveSubCategory" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/checkCategory" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkCategory(Model model, HttpServletRequest request) {
		String catName = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String Category = request.getParameter("Category");
				catName = bgcService.checkCategory(Category);
			} else {
				catName = null;
			}
		} catch (Exception e) {
			logger.error("Error in checkCategory" + e);
		}
		return catName;
	}

	@RequestMapping(value = { "/checkSubCategory" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkSubCategory(Model model, HttpServletRequest request) {
		String subcatName = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno == null) {
				return "redirect:/loginpage";
			} else {
				String SubCategory = request.getParameter("SubCategory");
				subcatName = bgcService.checkSubCategory(SubCategory);
			}
		} catch (Exception e) {
			logger.error("Error in checkSubCategory" + e);
		}
		return subcatName;
	}

	@RequestMapping(value = { "/getSubCategoriesByCatid" }, method = RequestMethod.GET)
	@ResponseBody
	public List<SubCategoryEntity> getSubCategoriesByCatid(Model model, HttpServletRequest request) {
		List<SubCategoryEntity> subcatList = null;
		try {
			String Categoryid = request.getParameter("Categoryid");
			subcatList = bgcService.getSubCategoriesByCatid(Categoryid);

		} catch (Exception e) {
			logger.error("Error in checkSubCategory" + e);
		}
		return subcatList;
	}

	@RequestMapping(value = { "/updatesubcategory" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatesubcategory(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "udocument[]", required = false) MultipartFile udocument[]) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				  
				String Category = request.getParameter("u_category");
				String SubCategory = request.getParameter("UsubCategoryname");
				String sameas_category = request.getParameter("sameas_category");
				String subcategoryid = request.getParameter("subcategoryid");
				String usubcattype = request.getParameter("usubcattype");
				String udoctype = request.getParameter("udoctype");
				System.out.println("--------udoctype>>>>>" + udoctype);
				String udocupload = request.getParameter("udocupload");
				String msg = bgcService.updatesubcategory(Category, SubCategory, sameas_category, lgempno,
						subcategoryid, usubcattype, udoctype,udocupload,udocument);
				message = msg;
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveSubCategory" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/tempregistration" }, method = RequestMethod.GET)
	public String tempregistration(HttpServletRequest req) {
		try {
		String userName = (String) req.getSession().getAttribute("username");
		if (userName == null) {
			return "redirect:/loginpage";
		} else {
			
		}
		} catch (Exception e) {
			logger.error("Error in tempregistration" + e.getStackTrace());
		}
		return "TempRegistration";
	}

	@RequestMapping(value = { "/tempregistration" }, method = RequestMethod.POST)
	public String tempregistrationsave(HttpServletRequest req) {
		try {
			String userName = (String) req.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				
			}
			} catch (Exception e) {
				logger.error("Error in tempregistration" + e.getStackTrace());
			}
		return "TempRegistration";
	}

	@RequestMapping(value = { "/profilemaster" }, method = RequestMethod.GET)
	public String profilemaster(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			// List<SubCategoryEntity> subcategoryList = bgcService.getAllSubCategeories();
			List<CategoryEntity> categoryList = bgcService.getAllCategeories();
			List<CategoreisDTO> subcategoryList = bgcService.getSubCategeoriesList();
			List<ProfileLableMaster> profileList = bgcService.getProfileList();
			List<ProfileLableMaster> inactiveProfiles = bgcService.getInactiveProfileList();
			model.addAttribute("profileList", profileList);
			model.addAttribute("inactiveProfiles", inactiveProfiles);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("subcategoryList", subcategoryList);
			}
		} catch (Exception e) {
			logger.error("Error in get profilemaster page" + e);
		}
		return "ProfileMaster";
	}

	@RequestMapping(value = { "/updateprofile" }, method = RequestMethod.GET)
	public String updateprofile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			String profileid = request.getParameter("profileid");
			// List<SubCategoryEntity> subcategoryList = bgcService.getAllSubCategeories();
			List<CategoryEntity> categoryList = bgcService.getAllCategeories();
			List<CategoreisDTO> subcategoryList = bgcService.getSubCategeoriesList();
			List<ProfileLableMaster> profileList = bgcService.getProfileList();
			List<ProfileMasterDTO> profileMasterList = bgcService.getProfileListByProfileId(profileid);
			List<ProfileMasterCheckList> profileListSize = bgcService.getProfileMasterListById(profileid);
			List<ProfileLableMaster> inactiveProfiles = bgcService.getInactiveProfileList();

			String profileName = bgcService.getProfileNameById(profileid);
			ProfileMasterDTO masterdto = new ProfileMasterDTO();

			masterdto.setProfilename(profileName);
			masterdto.setCategoryList(categoryList);
			masterdto.setSubcategoryList(subcategoryList);
			masterdto.setProfileMasterList(profileMasterList);
			masterdto.setProfileid(Integer.parseInt(profileid));
			model.addAttribute("inactiveProfiles", inactiveProfiles);
			model.addAttribute("masterdto", masterdto);
			model.addAttribute("profileList", profileList);
			model.addAttribute("profileListSize", profileListSize.size());
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("subcategoryList", subcategoryList);
			}
		} catch (Exception e) {
			logger.error("Error in  getprofilemaster page" + e);
		}
		return "UpdateProfileMaster";
	}

	@RequestMapping(value = { "/profilemaster" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveprofilemaster(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		String msg = "";
		try {
			String profilename = request.getParameter("profilename");
			Integer lableId = bgcService.saveGroupingProfileName(profilename, lgempno);
			String[] subcatArray = request.getParameterValues("subcatArray");
			String subcatString = null;
			for (int i = 0; i < subcatArray.length; i++) {
				subcatString = subcatArray[i];
				String[] subcategories = subcatString.split(",");
				for (String subcategoryId : subcategories) {
					msg = bgcService.saveProfileMaster(lableId, subcategoryId, lgempno);
				}
			}
		} catch (Exception e) {
			logger.error("Error in get saveprofilemaster page" + e);
		}
		return msg;
	}

	@RequestMapping(value = { "/checkprofilemaster" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkprofilemaster(Model model, HttpServletRequest request) {
		String chckprofile = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String profilename = request.getParameter("profilename");
				chckprofile = bgcService.checkprofilemaster(profilename);
			} else {
				chckprofile = null;
			}
		} catch (Exception e) {
			logger.error("Error in checkprofilemaster" + e);
		}
		return chckprofile;
	}

	@RequestMapping(value = { "/getProfileMasterListById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ProfileMasterCheckList> getProfileMasterListById(Model model, HttpServletRequest request) {
		List<ProfileMasterCheckList> profileList = null;
		try {
			String profile_id = request.getParameter("profile_id");
			profileList = bgcService.getProfileMasterListById(profile_id);

		} catch (Exception e) {
			logger.error("Error in getProfileMasterListById" + e);
		}
		return profileList;
	}

	@RequestMapping(value = { "/updateprofilemaster" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateprofilemaster(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		String msg = "";
		try {
			String profile_id = request.getParameter("profile_id");
			String profilename = request.getParameter("profilename");
			String[] subcatArray = request.getParameterValues("subcatArray");
			String[] uncheckArray = request.getParameterValues("uncheckArray");
			Integer profileid = 0;
			if (profile_id != "") {
				profileid = Integer.parseInt(profile_id);
			}
			bgcService.updateprofileName(profile_id, profilename);
			if (subcatArray.length > 0) {
				// bgcService.deleteMasterListById(profileid);
				/*
				 * List<ProfileMasterCheckList> profileList =
				 * bgcService.getProfileMasterListById(profile_id); if(profileList.size()==0) {
				 */
				String subcatString = null;
				if (subcatArray.length > 0) {
					for (int i = 0; i < subcatArray.length; i++) {
						subcatString = subcatArray[i];
						String[] subcategories = subcatString.split(",");
						for (String subcategoryId : subcategories) {
							msg = bgcService.updateprofilemaster(profileid, subcategoryId, lgempno);
						}
					}
					// }
				}
			}

			if (uncheckArray.length > 0) {
				List<Integer> commonSubcatList = new ArrayList<Integer>();
				List<Integer> profilesubList = bgcService.getSubCategoriesByProfileId(profile_id);
				List<Integer> unchecklist = new ArrayList<Integer>();
				String subString = null;
				Integer scatid = 0;
				for (int i = 0; i < uncheckArray.length; i++) {
					subString = uncheckArray[i];
					String[] subcategories = subString.split(",");
					for (String subcategoryId : subcategories) {
						if (!subcategoryId.isEmpty()) {
							// unchecklist.add(Integer.parseInt(subcategoryId))
							scatid = Integer.parseInt(subcategoryId);
							System.out.println("--scatidscatid----" + scatid);
							bgcService.deleteMasterListById(profileid, scatid);
						}
					}
					msg = "Grouping Profile Updated Successfully";
				}
				/*
				 * bgcService.deleteMasterListById(profileid);
				 * commonSubcatList.addAll(profilesubList.stream().filter(str ->
				 * !unchecklist.contains(str)).collect(Collectors.toList())); for (Integer
				 * sucatId : commonSubcatList) { msg =
				 * bgcService.updateprofilemaster(profileid,sucatId.toString(),lgempno); }
				 */
			}

			/*
			 * bgcService.deleteMasterListById(lableId); List<ProfileMasterCheckList>
			 * profileList = bgcService.getProfileMasterListById(profile_id);
			 * if(profileList.size()==0) {
			 * bgcService.updateprofileName(profile_id,profilename); String[] subcatArray =
			 * request.getParameterValues("subcatArray"); String subcatString=null;
			 * if(subcatArray.length>0) { for (int i = 0; i < subcatArray.length; i++) {
			 * subcatString=subcatArray[i]; String[] subcategories =
			 * subcatString.split(","); for (String subcategoryId : subcategories) { String
			 * msg1 = bgcService.updateprofilemaster(lableId,subcategoryId,lgempno); } } } }
			 */

		} catch (Exception e) {
			logger.error("Error in get updateprofilemaster page" + e);
		}
		return msg;
	}

	@RequestMapping(value = { "/assignprofile" }, method = RequestMethod.GET)
	public String assigncandidate(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<ProfileLableMaster> profileList = bgcService.getProfileList();
			List<TemporaryCandidateDetails> tempCandidateList = bgcService.getTempCandidateList();
			List<CategoryEntity> categoryList = bgcService.getAllCategeories();
			List<CategoreisDTO> subcategoryList = bgcService.getSubCategeoriesList();
			List<AssignedCandidateDto> assignedcandidateList = bgcService.getAssignedCandidateList();
			
			List<DocumentTypeEntity> docTypeyList = bgcService.getDocumentTypeList();
			model.addAttribute("docTypeyList", docTypeyList);

			model.addAttribute("profileList", profileList);
			model.addAttribute("tempCandidateList", tempCandidateList);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("subcategoryList", subcategoryList);
			model.addAttribute("assignedcandidateList", assignedcandidateList);
			}
		} catch (Exception e) {
			logger.error("Error in get assignprofiles page" + e);
		}
		return "AssignProfileToCandidate";
	}

	@RequestMapping(value = { "/assignprofile" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveAssignCandidate(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String profile = request.getParameter("profile");
				String candidate = request.getParameter("candidate");
				String status = request.getParameter("status");
				String result=null;
				
				StringJoiner joiner = new StringJoiner(",");
				String[] baicforms = request.getParameterValues("baicforms");
				for (int i = 0; i < baicforms.length; i++) {
					joiner.add(baicforms[i].toString());
					System.out.println("baicforms[i]******"+baicforms[i]);
				}
				String baicform =joiner.toString();
				Integer bgc_id = bgcService.saveCandidateBGCDetails(profile, candidate, status, lgempno,baicform);
				Integer profileid = 0;
				Integer candidateId = 0;
				if (profile != "") {
					profileid = Integer.parseInt(profile);
				}
				if (candidate != "") {
					candidateId = Integer.parseInt(candidate);
				}
				if (bgc_id != 0) {
					
					String[] subcatArray = request.getParameterValues("subcatArray");
					System.out.println(subcatArray);
					String subcatString = null;
					SubCategoryEntity subcatObj = null;
					List<ProfileMasterCheckList> profileList = bgcService.getProfileMasterListById(profile);
					for (ProfileMasterCheckList profileObj : profileList) {
						Integer subcatID = profileObj.getSubcategory_id();
						SubCategoryEntity subcatObject = bgcService.getCategoryBySubCatid(subcatID.toString());
						Integer catid = 0;
						if (subcatObject != null) {
							catid = subcatObject.getCategory_id();
						}
						bgcService.saveBGCCheckListByProfileId(candidate, profileObj.getSubcategory_id(), lgempno,profile, catid, bgc_id);
					//	message = "Profile Assigned To Candidate Successfully";
					}
					
					if (subcatArray.length > 0) {
						for (int i = 0; i < subcatArray.length; i++) {
							subcatString = subcatArray[i];
							System.out.println("************"+subcatString);
							if(!subcatString.isEmpty()) {
							String[] subcategories = subcatString.split(",");
							System.out.println(subcategories);
							for (String subcategoryId : subcategories) {
								subcatObj = bgcService.getCategoryBySubCatid(subcategoryId);
								Integer catid = 0;
								if (subcatObj != null) {
									catid = subcatObj.getCategory_id();
								}
								Integer profile_Id = 0;
								message = bgcService.saveCandidateBGCCheckList(candidate, subcategoryId, lgempno,
										profile_Id, catid, bgc_id);
							   }
							}
						}
						String frommail = "contracts@tekskillsinc.com";
						String subject = "Please upload Background Check documents";
						String comment = "You have to be upload your documents for futher proceedings, Please login with your credentials from below link.";
						TemporaryCandidateDetails candDbObj = bgcService.getTempCandidateByCandidateId(candidateId);
						if (candDbObj != null) {
							String tomail = candDbObj.getEmail_id();
							byte[] passworddecodedBytes = Base64.decode(candDbObj.getPassword());
							String password = new String(passworddecodedBytes);
							sendmail.assiginingProfileToCandidate(frommail, subject, tomail, candDbObj.getFull_name(),
									comment,password);
						}
						//message = "Profile Assigned To Candidate Successfully";
					}
					
				}
				message = "Profile Assigned To Candidate Successfully";
			} else {
				message = null;

			}
		} catch (Exception e) {
			logger.error("Error in save assignprofile" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/getCandidateSpecifics" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ProfileMasterDTO> getCandidateSpecifics(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<ProfileMasterDTO> tsdetailsList = null;
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				String profileid = request.getParameter("profileid");
				String Categoryid = request.getParameter("Categoryid");
				tsdetailsList = bgcService.getCandidateSpecifics(Categoryid, profileid);
			} else {
				tsdetailsList = null;
			}
		} catch (Exception e) {
			logger.error("Error in getCandidateSpecifics " + e);
		}
		return tsdetailsList;
	}

	@RequestMapping(value = { "/updatecandidateprofile" }, method = RequestMethod.GET)
	public String updatecandidateprofile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			String bgcid = request.getParameter("bgcid");
			CandidateBGCDetails bgcDetailsObj = bgcService.getBGCDetailsByCandidateId(bgcid);
			List<ProfileLableMaster> profileList = bgcService.getProfileList();
			List<TemporaryCandidateDetails> tempCandidateList = bgcService.getTempCandidateList();
			List<CategoryEntity> categoryList = bgcService.getAllCategeories();
			List<CategoreisDTO> subcategoryList = bgcService.getSubCategeoriesList();
			List<AssignedCandidateDto> assignedcandidateList = bgcService.getAssignedCandidateList();
			List<Integer> bgcCheckList = bgcService.getCandidateBGCCheckList(bgcid);
			String subcat = "";
			String subcatvalues = "";
			if (bgcCheckList.size() > 0) {
				for (Integer integer : bgcCheckList) {
					subcat = integer + "," + subcat;
				}
				subcatvalues = subcat.substring(0, subcat.length() - 1);
			}

			model.addAttribute("profileList", profileList);
			model.addAttribute("tempCandidateList", tempCandidateList);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("subcategoryList", subcategoryList);
			model.addAttribute("assignedcandidateList", assignedcandidateList);
			model.addAttribute("bgcDetailsObj", bgcDetailsObj);
			model.addAttribute("subcatvalues", subcatvalues);
			model.addAttribute("bgcCheckListSize", bgcCheckList.size());
			}
		} catch (Exception e) {
			logger.error("Error in updatecandidateprofile page" + e);
		}
		return "UpdateAssignedCandidate";
	}

	@RequestMapping(value = { "/updateassignprofile" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateassignprofile(Model model, HttpServletRequest request) {
		String msg = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {

				String profile = request.getParameter("profile");
				String candidate = request.getParameter("candidate");
				String status = request.getParameter("status");
				String[] subcatArray = request.getParameterValues("subcatArray");
				String[] uncheckArray = request.getParameterValues("uncheckArrayVal");
				String bgcid = request.getParameter("bgc_id");
				StringJoiner joiner = new StringJoiner(",");
				String[] baicforms = request.getParameterValues("baicforms");
				for (int i = 0; i < baicforms.length; i++) {
					joiner.add(baicforms[i].toString());
					System.out.println("baicforms[i]******"+baicforms[i]);
				}
				String baicform =joiner.toString();
				
				Integer profileid = 0;
				if (profile != "") {
					profileid = Integer.parseInt(profile);
				}
				Integer bgc_id = 0;
				if (bgcid != "") {
					bgc_id = Integer.parseInt(bgcid);
				}
				CandidateBGCDetails bgcDetailsObj = bgcService.getBGCDetailsByCandidateId(bgcid);
				Integer bgc_idNew=bgcService.updateCandidateBGCDetail(profileid, candidate, status, bgc_id, lgempno ,baicform);
				if (bgc_idNew==0) {
					System.out.println(bgc_id+"****if********"+bgc_idNew);
					if (subcatArray.length > 0) {
						SubCategoryEntity subcatObj = null;
						String subcatString = null;
						for (int i = 0; i < subcatArray.length; i++) {
							subcatString = subcatArray[i];
							String[] subcategories = subcatString.split(",");
							System.out.println("-subcatString--- " + subcatString);
							for (String subcategoryId : subcategories) {
								if (!subcategoryId.isEmpty()) {
									subcatObj = bgcService.getCategoryBySubCatid(subcategoryId);
									Integer catid = 0;
									System.out.println("-subcategoryId--- " + subcategoryId);
									if (subcatObj != null) {
										catid = subcatObj.getCategory_id();
									}
									Integer profile_id = 0;
									List<CandidateBGCCheckList> bgcList = bgcService.getBGCListByIds(catid,
											subcategoryId, bgc_id, candidate);

									/* if(bgcList==null || bgcList.size()<0) { */
									if (bgcList.size() == 0) {
										String msg1 = bgcService.saveCandidateBGCCheckList(candidate, subcategoryId,
												lgempno, profile_id, catid, bgc_id);
									}

								}
								msg = "Candidate Profile Updated Successfully";
							}
						}

					}

					if (uncheckArray.length > 0) {
						String subString = null;
						Integer scatid = 0;
						SubCategoryEntity unchecksubcatObj = null;
						for (int i = 0; i < uncheckArray.length; i++) {
							subString = uncheckArray[i];
							String[] subcategories = subString.split(",");
							for (String subcategoryId : subcategories) {
								System.out.println(subString + "-subcat2222222222222222egoryId---" + subcategoryId);
								if (!subcategoryId.isEmpty()) {
									unchecksubcatObj = bgcService.getCategoryBySubCatid(subcategoryId);
									Integer catid = 0;
									if (unchecksubcatObj != null) {
										System.out.println("subcatObj........");
										catid = unchecksubcatObj.getCategory_id();
										scatid = Integer.parseInt(subcategoryId);
										System.out.println(subString + "scatid44444444444444444444444" + subcategoryId);
										bgcService.deleteBGCCheckListById(catid, scatid, bgc_id);
									}
								}
							}
							// msg="Candidate Profile Updated Successfully";
						}

					}
					msg = "Candidate Profile Updated Successfully";
				}else {
					
					   System.out.println(bgc_id+"****else********"+bgc_idNew);
					   Integer candidateId = 0;
					   if (candidate != "") {
						candidateId = Integer.parseInt(candidate);
					     }			   
					   					   
						String subcatString = null;
						SubCategoryEntity subcatObj = null;
						List<ProfileMasterCheckList> profileList = bgcService.getProfileMasterListById(profile);
						for (ProfileMasterCheckList profileObj : profileList) {
							Integer subcatID = profileObj.getSubcategory_id();
							SubCategoryEntity subcatObject = bgcService.getCategoryBySubCatid(subcatID.toString());
							Integer catid = 0;
							if (subcatObject != null) {
								catid = subcatObject.getCategory_id();
							}
							bgcService.saveBGCCheckListByProfileId(candidate, profileObj.getSubcategory_id(), lgempno,profile, catid, bgc_idNew);
						//	message = "Profile Assigned To Candidate Successfully";
						}
						
						if (subcatArray.length > 0) {
							for (int i = 0; i < subcatArray.length; i++) {
								subcatString = subcatArray[i];
							
								if(!subcatString.isEmpty()) {
								String[] subcategories = subcatString.split(",");
								System.out.println(subcategories);
								for (String subcategoryId : subcategories) {
									subcatObj = bgcService.getCategoryBySubCatid(subcategoryId);
									Integer catid = 0;
									if (subcatObj != null) {
										catid = subcatObj.getCategory_id();
									}
									Integer profile_Id = 0;
									msg = bgcService.saveCandidateBGCCheckList(candidate, subcategoryId, lgempno,
											profile_Id, catid, bgc_idNew);
								   }
								}
							}
							String frommail = "contracts@tekskillsinc.com";
							String subject = "Please upload Background Check documents";
							String comment = "You have to be upload your documents for futher proceedings, Please login with your credentials from below link.";
							TemporaryCandidateDetails candDbObj = bgcService.getTempCandidateByCandidateId(candidateId);
							if (candDbObj != null) {
								String tomail = candDbObj.getEmail_id();
								byte[] passworddecodedBytes = Base64.decode(candDbObj.getPassword());
								String password = new String(passworddecodedBytes);
								sendmail.assiginingProfileToCandidate(frommail, subject, tomail, candDbObj.getFull_name(),
										comment,password);
							}
						}
						msg = "Candidate Profile Updated Successfully";
				}
				
		/*		else {
					String subcatString = null;
					SubCategoryEntity subcatObj = null;
					if (subcatArray.length > 0) {

						for (int i = 0; i < subcatArray.length; i++) {
							subcatString = subcatArray[i];
							String[] subcategories = subcatString.split(",");
							for (String subcategoryId : subcategories) {
								subcatObj = bgcService.getCategoryBySubCatid(subcategoryId);
								Integer catid = 0;
								if (subcatObj != null) {
									catid = subcatObj.getCategory_id();
								}
								String message = bgcService.saveCandidateBGCCheckList(candidate, subcategoryId, lgempno,
										profileid, catid, bgc_id);
								msg = "Candidate Profile Updated Successfully";
							}
						}
					}
				}*/
			} else {
				msg = null;

			}
		} catch (Exception e) {
			logger.error("Error in sve updateassignprofile : " + e);
		}
		return msg;
	}

	@RequestMapping(value = { "/getCandidateBGCCheckListBybgcId" }, method = RequestMethod.GET)
	@ResponseBody
	public String getCandidateBGCCheckListBybgcId(Model model, HttpServletRequest request) {
		String subcatvalues = "";
		try {
			String bgcid = request.getParameter("bgc_id");
			List<Integer> bgcCheckList = bgcService.getCandidateBGCCheckList(bgcid);
			String subcat = "";
			if (bgcCheckList.size() > 0) {
				for (Integer integer : bgcCheckList) {
					subcat = integer + "," + subcat;
				}
			}
			subcatvalues = subcat.substring(0, subcat.length() - 1);

		} catch (Exception e) {
			logger.error("Error in get getCandidateBGCCheckListBybgcId " + e);
		}
		return subcatvalues;
	}

	// Add New Candidate-- By Deepak Das

	@RequestMapping(value = { "/tempreg" }, method = RequestMethod.GET)
	public String addCandidate(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<TempCandidateDetailsDTO> candidateList = bgcService.getAllCandidates();
			model.addAttribute("candidateList", candidateList);
			}
		} catch (Exception e) {
			logger.error("Error in get addCandidate page" + e);
		}
		return "TempRegistration";
	}

	// saveCandidateDetails-- By Deepak

	@RequestMapping(value = { "/saveCandidateDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveCandidateDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String ssn = request.getParameter("ssn");
				String phne_no = request.getParameter("phne_no");
				String emailid = request.getParameter("emailid");
				int candidateId = bgcService.saveCandidateDetails(fname, ssn, phne_no, emailid, lgempno, lname);
				if (candidateId != 0) {
					message = fname + " " + lname + " added successfully";
				}
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveCandidateDetails" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/updateCandidateDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatecandidate(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String candidateId = request.getParameter("candidateId");
				String ssn = request.getParameter("essn");
				String fname = request.getParameter("efname");
				String lname = request.getParameter("elname");
				String phne_no = request.getParameter("ephne_no");
				String emailid = request.getParameter("eemailid");
				System.out.println("In controllrer ssn**" + ssn + "name&&&" + fname + "phne_no$$" + phne_no
						+ "emailid@@@@" + emailid);
				String msg = bgcService.updatecandidate(candidateId, ssn, fname, lname, phne_no, emailid, lgempno);
				message = msg;
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatecadidate" + e.getStackTrace());
		}
		return message;
	}

	// ContractsPanel ..by..Deepak...

	@RequestMapping(value = { "/contractspanel" }, method = RequestMethod.GET)
	public String contractpanle(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<TempCandidateDetailsDTO> candidateList = bgcService.getAllCandidates();
			model.addAttribute("candidateList", candidateList);
			List<ProfileLableMaster> profileList = bgcService.getAllProfiles();
			model.addAttribute("profileList", profileList);
			
			
			session.setAttribute("bgc", "bgc");
			session.setAttribute("candidates", null);
			session.setAttribute("templates", null);
			session.setAttribute("mdashboard",null);
			session.setAttribute("stsreports", null);
			session.setAttribute("myDashboard", null);
			session.setAttribute("timesheet", null);
			session.setAttribute("mydocuments", null);
			session.setAttribute("immigration", null);
			}
		} catch (Exception e) {
			logger.error("Error in get addCandidate page" + e);
		}
		return "contracts";
	}

	// contract panle
	@RequestMapping(value = { "/CandidatesByProfileId" }, method = RequestMethod.GET)
	@ResponseBody
	public List<TempCandidateDetailsDTO> CandidatesByProfileId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<TempCandidateDetailsDTO> candidateList = null;
		String profileId = request.getParameter("profileId");
		candidateList = bgcService.getCandidatesByProfileId(profileId);
		return candidateList;
	}

	@RequestMapping(value = { "/ContrctsPanelDetailsById" }, method = RequestMethod.GET)
	@ResponseBody
	public ContractsPanelDetails_DTO ContrctsPanelDetailsById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		ContractsPanelDetails_DTO contpanelDto = null;
		String candidateId = request.getParameter("candidateId");
		String profileId = request.getParameter("profileId");
		contpanelDto = bgcService.getContrctsPanelDetailsById(candidateId, profileId);
		return contpanelDto;
	}

	
	@RequestMapping(value = { "/ContrctsPanelHistoryById" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ContractsPanelDetails_DTO> ContrctsPanelHistoryById(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<ContractsPanelDetails_DTO> contpanelDto = null;
		String candidateId = request.getParameter("candidateId");
		String profileId = request.getParameter("profileId");
		contpanelDto = bgcService.ContrctsPanelHistoryById(candidateId, profileId);
		return contpanelDto;
	}
	
	// add comment by Deepak

	@RequestMapping(value = { "/saveComments" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveCommentDetails(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "bgcfile[]", required = false) MultipartFile bgcfile[]) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String bgcChkId = request.getParameter("bgcChkId");
				String bgcCandidateId = request.getParameter("bgcCandidateId");
				String bgcChkStatus = request.getParameter("bgcChkStatus");
				String comment = request.getParameter("comment");
				// System.out.println("bgcChkId"+bgcChkId+"bgcCandidateId"+bgcCandidateId+"bgcChkStatus"+bgcChkStatus+"comment"+comment);
				message = bgcService.saveCommentDetails(bgcChkId, bgcChkStatus, comment, lgempno, bgcfile,
						bgcCandidateId);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveCommentDetails" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/updatecanstatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatecanstatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		Integer logincandidateid = (Integer) request.getSession().getAttribute("candidateid");
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String bgcChkId = request.getParameter("bgcChkId");
				String bgcCandidateId = request.getParameter("bgcCandidateId");
				String bgcChkStatus = request.getParameter("approveStatus");
				String comment = request.getParameter("comment");
				message = bgcService.updatecanstatus(bgcChkId, bgcChkStatus, comment, lgempno, bgcCandidateId,logincandidateid);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatecanstatus" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/viewCommentHistoryByChkListId" }, method = RequestMethod.GET)
	@ResponseBody
	public List<commentHistoryDto> viewCommentHistoryByChkListId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<commentHistoryDto> commentHistoryList = null;
		String chkListId = request.getParameter("chkListId");
		commentHistoryList = bgcService.viewCommentHistoryById(chkListId);
		return commentHistoryList;
	}

	@RequestMapping(value = { "/viewFileHistoryByChkListId" }, method = RequestMethod.GET)
	@ResponseBody
	public List<fileHistoryDto> viewfileHistoryByChkListId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<fileHistoryDto> fileHistoryList = null;
		String chkListId = request.getParameter("chkListId");
		fileHistoryList = bgcService.viewfileHistoryByChkListId(chkListId);
		return fileHistoryList;
	}

	@RequestMapping(value = { "/profileStatus" }, method = RequestMethod.GET)
	@ResponseBody
	public String profileStatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message = "";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession ses = request.getSession(true);
				String profileid = request.getParameter("profileid");
				String status = request.getParameter("status");

				message = bgcService.updateProfileStatus(profileid, status);
			}
		} catch (Exception e) {
			logger.error("Error occured in profileStatus ---", e);
		}
		return message;
	}

	@RequestMapping(value = { "/bgcpendinglist" }, method = RequestMethod.GET)
	public String getBGCPendingList(Model model, HttpServletRequest request) {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			List<ContractsPanelDetails_DTO> bgcPendingList = bgcService.getBGCPendingList();
			model.addAttribute("bgcPendingList", bgcPendingList);
			// BgcPendingList
			}
		} catch (Exception e) {
			logger.error("Error in get getBGCPendingList page" + e);
		}
		return "PendingBgcList";
	}

	@RequestMapping(value = { "/saveBgcStatusById" }, method = RequestMethod.GET)
	@ResponseBody
	public String saveBgcStatusById(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String candidateId = request.getParameter("candidateId");
				String profileId = request.getParameter("profileId");
				String bgcStatus = request.getParameter("bgcStatus");
				message = bgcService.saveBgcStatusById(candidateId, profileId, bgcStatus);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in saveBgcStatusById" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/ssncheckInTempReg" }, method = RequestMethod.GET)
	@ResponseBody
	public String ssncheckInTempReg(Model model, HttpServletRequest request, HttpServletResponse response) {
		String ssn = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String ssn_emp = request.getParameter("ssn_emp");
				ssn = bgcService.ssncheckInTempReg(ssn_emp);
			} else {
				ssn = null;
			}
		} catch (Exception e) {
			logger.error("Error in ssncheckInTempReg" + e.getStackTrace());
		}
		return ssn;
	}

	@RequestMapping(value = { "/emailcheckInTempReg" }, method = RequestMethod.GET)
	@ResponseBody
	public String emailcheckInTempReg(Model model, HttpServletRequest request, HttpServletResponse response) {
		String email = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String email_emp = request.getParameter("email_emp");
				email = bgcService.emailcheckInTempReg(email_emp);
			} else {
				email = null;
			}
		} catch (Exception e) {
			logger.error("Error in emailcheckInTempReg" + e.getStackTrace());
		}
		return email;
	}

	@RequestMapping(value = { "/loginWithEmail" }, method = RequestMethod.GET)
	public String loginWithEmail(HttpServletRequest req) {
		try {
			/*String userName = (String) req.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {*/
		HttpSession session = req.getSession(true);
		session.setAttribute("invalid", null);
			//}
		} catch (Exception e) {
			logger.error("Error in loginWithEmail " + e);
		}
		return "LoginWithEmail";
	}

	@RequestMapping(value = { "/validateLoginWithEmailId" }, method = RequestMethod.POST)
	public String validateLoginWithEmailId(Model model, HttpServletRequest request, HttpServletResponse response) {
		String emailId = request.getParameter("emailId").trim();
		String Password = request.getParameter("epassword").trim();
		TemporaryCandidateDetails tempRegObj = bgcService.checkLoginWithEmailId(emailId, Password);

		HttpSession session = request.getSession(true);
		if (tempRegObj != null) {
			session.setAttribute("username", tempRegObj.getFull_name());
			session.setAttribute("lgemailid", tempRegObj.getEmail_id());
			session.setAttribute("empno", tempRegObj.getCandidate_id());
			session.setAttribute("emptype", null);
			session.setAttribute("role", null);
			session.setAttribute("dept", null);
			session.setAttribute("invalidEmail", null);
			String message = bgcService.ceckBGCCandidateIdExists(tempRegObj.getCandidate_id());
			if (message.equalsIgnoreCase("Exist")) {
				return "Dashboard";
			} else {
				session.setAttribute("invalidEmail", "Not assigned any task for you");
				session.setMaxInactiveInterval(10);
				return "redirect:/loginWithEmail";
			}
		} else {
			session.setAttribute("invalidEmail", "Invalid Email Id or Password");
			session.setMaxInactiveInterval(10);
			return "redirect:/loginWithEmail";
		}
	}

	/*
	 * @RequestMapping(value = { "/validateLoginWithEmailId" }, method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public String validateLoginWithEmailId(Model model,
	 * HttpServletRequest request, HttpServletResponse response) { String message =
	 * null; try { String emailId = request.getParameter("emailId").trim(); String
	 * password = request.getParameter("epassword").trim();
	 * System.out.println(emailId+"***********"+password); TemporaryCandidateDetails
	 * tempRegObj = bgcService.checkLoginWithEmailId(emailId, password); HttpSession
	 * session = request.getSession(true); if (tempRegObj != null) {
	 * session.setAttribute("username", tempRegObj.getFull_name());
	 * session.setAttribute("lgemailid", tempRegObj.getEmail_id());
	 * session.setAttribute("loginUserid", tempRegObj.getCandidate_id());
	 * session.setAttribute("emptype", null); session.setAttribute("role", null);
	 * session.setAttribute("dept", null); message=""; return "Dashboard"; }else {
	 * message="Invalid Email Id or Password"; } } catch (Exception e) {
	 * logger.error("Error in validateLoginWithEmailId" + e.getStackTrace()); }
	 * return message; }
	 */

	/*
	 * @RequestMapping(value = { "/forgotPassword" }, method = RequestMethod.GET)
	 * public String Loginform(HttpServletRequest req) { return "ForgotPassword"; }
	 */

	@RequestMapping(value = { "/forgotPassword" }, method = RequestMethod.GET)
	@ResponseBody
	public String forgotPassword(Model model, HttpServletRequest request, HttpServletResponse response) {
		String msg = null;
		try {
			String emailId = request.getParameter("emailId").trim();
			// String password = request.getParameter("password").trim();
			msg = bgcService.emailcheckInTempRegForgotPassword(emailId);
			if (msg.equalsIgnoreCase("Success")) {
				msg = "Success";
			} else {
				msg = "Error";
			}
		} catch (Exception e) {
			logger.error("Error in forgotPassword" + e.getStackTrace());
		}
		return msg;
	}

	@RequestMapping("/ChangePwdTempReg")
	public String ChangePwdTempReg(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				return "ChangePwdTempReg";
			}
		} catch (Exception e) {
			logger.error("Error in ChangePwdTempReg " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/ChangeLoginPasswordTempReg" }, method = RequestMethod.POST)
	@ResponseBody
	public String ChangeLoginPasswordTempReg(Map<String, Object> map, Model model, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		String message = null;
		try {
			String userName = (String) req.getSession().getAttribute("username");
			if (userName != null) {
				String lgemailid = (String) req.getSession().getAttribute("lgemailid");
				String currentPassword = req.getParameter("currentPwd");
				String confirmPassword = req.getParameter("confirmPassword");

				String checkPassword = bgcService.checkPasswordTempReg(lgemailid, currentPassword);
				if (checkPassword == null) {
					message = "Current password is not Correct";
				} else {
					String msg = bgcService.changePasswordTempReg(lgemailid, confirmPassword);
					if (msg.equalsIgnoreCase("success")) {
						message = "password changed Successfully";
					} else {
						message = "password not changed";
					}
				}
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in ChangePassword" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/emailCheckInforgotPassword" }, method = RequestMethod.POST)
	public String emailCheckInforgotPassword(Model model, HttpServletRequest request, HttpServletResponse response) {
		String emailId = request.getParameter("fmailId").trim();
		String email = bgcService.emailcheckInTempReg(emailId);
		HttpSession session = request.getSession(true);
		if (email != null) {
			// session.setAttribute("invalid",null);
			session.setAttribute("invalid", "Email sent to your Mail Id");
			return "redirect:/forgotPassword";
		} else {
			session.setAttribute("invalid", "Email Id not exists");
			return "redirect:/forgotPassword";
		}
	}

	@RequestMapping("/resetpwdtempreg")
	public String resetPwdTempReg(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				return "ResetPwdTempReg";
			}
		} catch (Exception e) {
			logger.error("Error in resetPwdTempReg " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/sendemailResetPassword" }, method = RequestMethod.POST)
	@ResponseBody
	public String emailCheckInResetPassword(Map<String, Object> map, Model model, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		String message = null;
		try {
			String userName = (String) req.getSession().getAttribute("username");
			if (userName != null) {
				String emailId = req.getParameter("emailId");
				String msg = bgcService.resetPasswordTempReg(emailId);
				if (msg.equalsIgnoreCase("success")) {
					message = "password reset Successfully";
				} else {
					message = "password reset not Successfull";
				}
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in emailCheckInResetPassword" + e);
		}
		return message;
	}

	@RequestMapping(value = { "/emailcheckInResetPwdTempReg" }, method = RequestMethod.GET)
	@ResponseBody
	public String emailcheckInResetPwdTempReg(Model model, HttpServletRequest request, HttpServletResponse response) {
		String email = null;
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName != null) {
				String email_emp = request.getParameter("email_emp");
				email = bgcService.emailcheckInTempReg(email_emp);
			} else {
				email = null;
			}
		} catch (Exception e) {
			logger.error("Error in emailcheckInTempReg" + e.getStackTrace());
		}
		return email;
	}

	@RequestMapping(value = { "/bgvFormsUser" }, method = RequestMethod.GET)
	public String bgvFormsUser(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String personaldetails = "personaldetails";
				session.setAttribute("personaldetails", personaldetails);
				session.setAttribute("templates", null);
				session.setAttribute("stsreports", null);
				session.setAttribute("timesheet", null);
				session.setAttribute("bgc", null);
				ContractsPanelDetails_DTO formsDto = null;
				// String candidateId = request.getParameter("candidateId");
				Integer candidateId = (Integer) session.getAttribute("empno");
				formsDto = bgcService.getBgvDocFormsDetailsById(candidateId);
				session.setAttribute("formsDto", formsDto);
				return "bgvFormsUser";
			}
		} catch (Exception e) {
			logger.error("Error in personalDetails " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/addpersonaldetails" }, method = RequestMethod.GET)
	public String addpersonaldetails(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String candidateId = request.getParameter("candidateId");
				return "PersonalDetails";
			}
		} catch (Exception e) {
			logger.error("Error in personalDetails " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/viewpersonaldetails" }, method = RequestMethod.GET)
	public String viewpersonaldetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String candidateId = request.getParameter("candidateId");
				CandidateBGCPersonalDetailsDto personalDetailsObj = bgcService
						.viewCandidateBGCPersonalDetailsById(candidateId);
				
				model.addAttribute("personalDetailsObj", personalDetailsObj);
				return "UpdateBgvCandidatePersonal";
			}
		} catch (Exception e) {
			logger.error("Error in viewpersonaldetails " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/employmentdetails" }, method = RequestMethod.GET)
	public String employementDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidateId = request.getParameter("candidateId");
				List<CandidateBgvEmploymentDto> employmentDetailsList = bgcService
						.viewCandidateBgvEmploymentDetailsById(candidateId);
				
				BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcService.getBGCFormsStatusByCandidateId(candidateId);
				model.addAttribute("candformsStatusDBObj", candformsStatusDBObj);
				session.setAttribute("candidateId", candidateId);
				model.addAttribute("employmentDetailsList", employmentDetailsList);
				return "EmploymentDetails";
			}
		} catch (Exception e) {
			logger.error("Error in employementDetails " + e);
		}
		return null;
	}

	/*
	 * @RequestMapping(value = { "/viewemploymentdetails" }, method =
	 * RequestMethod.GET) public String viewemploymentdetails(Model
	 * model,HttpServletRequest request, HttpServletResponse response) { String
	 * userName = (String) request.getSession().getAttribute("username"); try { if
	 * (userName == null) { return "redirect:/loginpage"; } else { HttpSession
	 * session = request.getSession(true); String candidateId =
	 * request.getParameter("candidateId"); List<CandidateBgvEmploymentDto>
	 * employmentDetailsList =
	 * bgcService.viewCandidateBgvEmploymentDetailsById(candidateId);
	 * session.setAttribute("candidateId", candidateId);
	 * model.addAttribute("employmentDetailsList", employmentDetailsList); return
	 * "UpdateBgvCandidateEmployment"; } }catch (Exception e) {
	 * logger.error("Error in viewemploymentdetails " + e); } return null; }
	 */

	@RequestMapping(value = { "/vieweducationaldetails" }, method = RequestMethod.GET)
	public String vieweducationaldetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidateId = request.getParameter("candidateId");
				List<CandidateBgvEducationDto> educationDetailsList = bgcService
						.viewCandidateBgvEducationDetailsById(candidateId);
				BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcService.getBGCFormsStatusByCandidateId(candidateId);
				model.addAttribute("candformsStatusDBObj", candformsStatusDBObj);
				session.setAttribute("candidateId", candidateId);
				model.addAttribute("educationDetailsList", educationDetailsList);
				return "UpdateBgvCandidateEducational";
			}
		} catch (Exception e) {
			logger.error("Error in vieweducationaldetails " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/educationaldetails" }, method = RequestMethod.GET)
	public String educationalDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidateId = request.getParameter("candidateId");
				List<CandidateBgvEducationDto> educationDetailsList = bgcService
						.viewCandidateBgvEducationDetailsById(candidateId);
				BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcService.getBGCFormsStatusByCandidateId(candidateId);
				model.addAttribute("candformsStatusDBObj", candformsStatusDBObj);
				
				session.setAttribute("candidateId", candidateId);
				model.addAttribute("educationDetailsList", educationDetailsList);
				return "EducationalDetails";
			}
		} catch (Exception e) {
			logger.error("Error in educationalDetails " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/savePersonalDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String savePersonalDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			String ssn_emp = request.getParameter("ssn_emp");
			String title = request.getParameter("titleName");
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName");
			String familyName = request.getParameter("familyName");
			String fatherName = request.getParameter("fatherName");
			String nationality = request.getParameter("nationality");
			String mobile = request.getParameter("mobile");
			String genderType = request.getParameter("genderType");
			String email_id = request.getParameter("email");
			String contactTeleNo = request.getParameter("contactTeleNo");
			String dob = request.getParameter("dob");
			/*
			 * String currentAddress = request.getParameter("currentAddress"); String
			 * fromDate = request.getParameter("fromDate"); String toDate =
			 * request.getParameter("toDate"); String myCheck =
			 * request.getParameter("myCheck"); System.out.println("myCheck****"+myCheck);
			 * String prevAddress = null; String prevfromDate = null; String prevtoDate =
			 * null; if(myCheck!=null) {
			 * 
			 * }else { prevAddress = request.getParameter("prevAddress"); prevfromDate =
			 * request.getParameter("prevfromDate"); prevtoDate =
			 * request.getParameter("prevtoDate"); }
			 */

			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zipcode = request.getParameter("zipcode");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");

			String[] othr_line1s = request.getParameterValues("othr_line1[]");
			String[] othr_line2s = request.getParameterValues("othr_line2[]");
			String[] othr_citys = request.getParameterValues("othr_city[]");
			String[] othr_states = request.getParameterValues("othr_state[]");
			String[] othr_zipcodes = request.getParameterValues("othr_zipcode[]");
			String[] othr_fromDates = request.getParameterValues("othr_fromDate[]");
			String[] othr_toDates = request.getParameterValues("othr_toDate[]");

			Integer loginempno = (Integer) session.getAttribute("empno");
			// message = bgcService.savePersonalDetails(ssn_emp, firstName, middleName,
			// familyName, fatherName, dob, genderType , nationality,
			// contactTeleNo,email_id,mobile,
			// loginempno,title,currentAddress,fromDate,toDate,myCheck,prevAddress,prevfromDate,prevtoDate);

			message = bgcService.savePersonalDetails(ssn_emp, firstName, middleName, familyName, fatherName, dob,
					genderType, nationality, contactTeleNo, email_id, mobile, loginempno, title, line1, line2, city,
					state, zipcode, fromDate, toDate, othr_line1s, othr_line2s, othr_citys, othr_states, othr_zipcodes,
					othr_fromDates, othr_toDates);
		} catch (Exception e) {
			logger.error("Error in savePersonalDetails" + e.getMessage());
		}
		return message;
	}

	/*
	 * @RequestMapping(value = { "/saveEmploymentDetails" }, method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public String saveEmploymentDetails(Model model,
	 * HttpServletRequest request, HttpServletResponse response) { String message
	 * =null; try { HttpSession session = request.getSession(true); String userName
	 * = (String) request.getSession().getAttribute("username"); String company_name
	 * = request.getParameter("company_name"); String reported_to_name =
	 * request.getParameter("reported_to_name"); String reported_to_position =
	 * request.getParameter("reported_to_position"); String hrmgr =
	 * request.getParameter("hrmgr"); String positionheld =
	 * request.getParameter("positionheld"); String employmentType =
	 * request.getParameter("employmentType"); String company_tele =
	 * request.getParameter("company_tele"); String fromDate =
	 * request.getParameter("fromDate"); String toDate =
	 * request.getParameter("toDate"); String cpname =
	 * request.getParameter("cpname"); String cpemail =
	 * request.getParameter("cpemail"); String cpnumber =
	 * request.getParameter("cpnumber"); String acpname =
	 * request.getParameter("acpname"); String acpnumber =
	 * request.getParameter("acpnumber"); String line1 =
	 * request.getParameter("line1"); String line2 = request.getParameter("line2");
	 * String city = request.getParameter("city"); String state =
	 * request.getParameter("state"); String zipcode =
	 * request.getParameter("zipcode");
	 * 
	 * String currentAddress = request.getParameter("currentAddress"); String
	 * fromDate = request.getParameter("fromDate"); String toDate =
	 * request.getParameter("toDate"); String myCheck =
	 * request.getParameter("myCheck"); System.out.println("myCheck****"+myCheck);
	 * String prevAddress = null; String prevfromDate = null; String prevtoDate =
	 * null; if(myCheck!=null) {
	 * 
	 * }else { prevAddress = request.getParameter("prevAddress"); prevfromDate =
	 * request.getParameter("prevfromDate"); prevtoDate =
	 * request.getParameter("prevtoDate"); }
	 * 
	 * String[] othr_company_names =
	 * request.getParameterValues("othr_company_name[]"); String[]
	 * othr_reported_to_names =
	 * request.getParameterValues("othr_reported_to_name[]"); String[]
	 * othr_reported_to_positions =
	 * request.getParameterValues("othr_reported_to_position[]");
	 * 
	 * String[] othr_hrmgrs = request.getParameterValues("othr_hrmgr[]"); String[]
	 * othr_positionhelds = request.getParameterValues("othr_positionheld[]");
	 * String[] othr_employmentTypes =
	 * request.getParameterValues("othr_employmentType[]"); String[]
	 * othr_company_teles = request.getParameterValues("othr_company_tele[]");
	 * String[] othr_cpnames = request.getParameterValues("othr_cpname[]"); String[]
	 * othr_cpemails = request.getParameterValues("othr_cpemail[]"); String[]
	 * othr_cpnumbers = request.getParameterValues("othr_cpnumber[]"); String[]
	 * othr_acpnames = request.getParameterValues("othr_acpname[]"); String[]
	 * othr_acpnumbers = request.getParameterValues("othr_acpnumber[]"); String[]
	 * othr_line1s = request.getParameterValues("othr_line1[]"); String[]
	 * othr_line2s = request.getParameterValues("othr_line2[]"); String[] othr_citys
	 * = request.getParameterValues("othr_city[]"); String[] othr_states =
	 * request.getParameterValues("othr_state[]"); String[] othr_zipcodes =
	 * request.getParameterValues("othr_zipcode[]"); String[] othr_fromDates =
	 * request.getParameterValues("othr_fromDate[]"); String[] othr_toDates =
	 * request.getParameterValues("othr_toDate[]");
	 * 
	 * Integer loginempno = (Integer) session.getAttribute("empno");
	 * 
	 * message =
	 * bgcService.saveEmploymentDetails(company_name,reported_to_name,hrmgr,
	 * positionheld,employmentType,company_tele,fromDate,toDate,cpname,cpemail,
	 * cpnumber,acpname,acpnumber, line1, line2, city, state
	 * ,zipcode,othr_company_names,othr_reported_to_names,othr_hrmgrs,
	 * othr_positionhelds,othr_employmentTypes,othr_company_teles,othr_cpnames,
	 * othr_cpemails,
	 * othr_cpnumbers,othr_acpnames,othr_acpnumbers,othr_line1s,othr_line2s,
	 * othr_citys,othr_states,othr_zipcodes,othr_fromDates,othr_toDates,
	 * reported_to_position,othr_reported_to_positions,loginempno); } catch
	 * (Exception e) { logger.error("Error in saveEmploymentDetails" +
	 * e.getMessage()); } return message; }
	 */

	@RequestMapping(value = { "/saveEmploymentDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveEmploymentDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			/* String currentlyWorking = null; */
			String userName = (String) request.getSession().getAttribute("username");
			String company_name = request.getParameter("company_name");
			String reported_to_name = request.getParameter("reported_to_name");
			String reported_to_position = request.getParameter("reported_to_position");
			String hrmgr = request.getParameter("hrmgr");
			String positionheld = request.getParameter("positionheld");
			String employmentType = request.getParameter("employmentType");
			String company_tele = request.getParameter("company_tele");
			String cpname = request.getParameter("cpname");
			String cpemail = request.getParameter("cpemail");
			String cpnumber = request.getParameter("cpnumber");
			String acpname = request.getParameter("acpname");
			String acpnumber = request.getParameter("acpnumber");
			String line1 = request.getParameter("line1");
			String line2 = request.getParameter("line2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zipcode = request.getParameter("zipcode");
			Integer loginempno = (Integer) session.getAttribute("empno");

			String startedYear = request.getParameter("startedYear");
			String startedMonth = request.getParameter("startedMonth");
			String workedTillYear = request.getParameter("workedTillYear");
			String workedTillMonth = request.getParameter("workedTillMonth");
			/*
			 * String fromDate = request.getParameter("fromDate"); String toDate =
			 * request.getParameter("toDate");
			 * 
			 * String currentWorking = request.getParameter("currentlyWorking");
			 * if(currentWorking!=null) { currentlyWorking=currentWorking; }else {
			 * currentlyWorking="No"; }
			 */

			message = bgcService.saveBgvEmploymentDetails(company_name, reported_to_name, hrmgr, positionheld,
					employmentType, company_tele, cpname, cpemail, cpnumber, acpname, acpnumber, line1, line2, city,
					state, zipcode, reported_to_position, loginempno, startedYear, startedMonth, workedTillYear,
					workedTillMonth);
		} catch (Exception e) {
			logger.error("Error in saveEmploymentDetails" + e.getMessage());
		}
		return message;
	}

	@RequestMapping(value = { "/saveEducationDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveEducationDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			String collegeNameAddr = request.getParameter("collegeNameAddr");
			String universityNameAddr = request.getParameter("universityNameAddr");
			String graduatedYear = request.getParameter("graduatedYear");
			String enrollNo = request.getParameter("enrollNo");
			String typeofeducation = request.getParameter("typeofeducation");
			/* String gradDate = request.getParameter("gradDate"); */
			String subMajor = request.getParameter("subMajor");
			String qualification = request.getParameter("qualification");
			String courseType = request.getParameter("courseType");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");

			/*
			 * String line1 = request.getParameter("line1"); String line2 =
			 * request.getParameter("line2"); String city = request.getParameter("city");
			 * String state = request.getParameter("state"); String zipcode =
			 * request.getParameter("zipcode");
			 */
			Integer loginempno = (Integer) session.getAttribute("empno");
			message = bgcService.saveEducationDetails(collegeNameAddr, universityNameAddr, graduatedYear, enrollNo,
					typeofeducation, subMajor, qualification, fromDate, toDate, courseType, loginempno);
		} catch (Exception e) {
			logger.error("Error in saveEducationDetails" + e.getMessage());
		}
		return message;
	}

	@RequestMapping(value = { "/updateCandidatePersonalDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateCandidateBGCPersonalDetails(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			String ssn_emp = request.getParameter("ssn_emp");
			String title = request.getParameter("titleName");
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName");
			String familyName = request.getParameter("familyName");
			String fatherName = request.getParameter("fatherName");
			String nationality = request.getParameter("nationality");
			String mobile = request.getParameter("mobile");
			String genderType = request.getParameter("genderType");
			String email_id = request.getParameter("email");
			String contactTeleNo = request.getParameter("contactTeleNo");
			String dob = request.getParameter("dob");
			/*
			 * String currentAddress = request.getParameter("currentAddress"); String
			 * fromDate = request.getParameter("fromDate"); String toDate =
			 * request.getParameter("toDate"); String myCheck =
			 * request.getParameter("myCheck"); System.out.println("myCheck****"+myCheck);
			 * String prevAddress = null; String prevfromDate = null; String prevtoDate =
			 * null; if(myCheck!=null) {
			 * 
			 * }else { prevAddress = request.getParameter("prevAddress"); prevfromDate =
			 * request.getParameter("prevfromDate"); prevtoDate =
			 * request.getParameter("prevtoDate"); }
			 */
			String[] contact_id = request.getParameterValues("contact_id");
			String[] line1s = request.getParameterValues("line1");
			String[] line2s = request.getParameterValues("line2");
			String[] citys = request.getParameterValues("city");
			String[] states = request.getParameterValues("state");
			String[] zipcodes = request.getParameterValues("zipcode");
			String[] fromDates = request.getParameterValues("fromDate");
			String[] toDates = request.getParameterValues("toDate");

			String[] othr_line1s = request.getParameterValues("othr_line1[]");
			String[] othr_line2s = request.getParameterValues("othr_line2[]");
			String[] othr_citys = request.getParameterValues("othr_city[]");
			String[] othr_states = request.getParameterValues("othr_state[]");
			String[] othr_zipcodes = request.getParameterValues("othr_zipcode[]");
			String[] othr_fromDates = request.getParameterValues("othr_fromDate[]");
			String[] othr_toDates = request.getParameterValues("othr_toDate[]");

			Integer loginempno = (Integer) session.getAttribute("empno");
			// message = bgcService.savePersonalDetails(ssn_emp, firstName, middleName,
			// familyName, fatherName, dob, genderType , nationality,
			// contactTeleNo,email_id,mobile,
			// loginempno,title,currentAddress,fromDate,toDate,myCheck,prevAddress,prevfromDate,prevtoDate);
			message = bgcService.updateCandidateBGCPersonalDetails(ssn_emp, firstName, middleName, familyName,
					fatherName, dob, genderType, nationality, contactTeleNo, email_id, mobile, loginempno, title,
					contact_id, line1s, line2s, citys, states, zipcodes, fromDates, toDates, othr_line1s, othr_line2s,
					othr_citys, othr_states, othr_zipcodes, othr_fromDates, othr_toDates);
		} catch (Exception e) {
			logger.error("Error in updateCandidatePersonalDetails" + e.getMessage());
		}
		return message;
	}

	@RequestMapping(value = { "/updateEmploymentDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateEmploymentDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			String employment_id = request.getParameter("employment_id");
			String contact_id = request.getParameter("contact_id");
			String company_name = request.getParameter("edcompany_name");
			String reported_to_name = request.getParameter("edreported_to_name");
			String reported_to_position = request.getParameter("edreported_to_position");
			String hrmgr = request.getParameter("edhrmgr");
			String positionheld = request.getParameter("edpositionheld");
			String employmentType = request.getParameter("edemploymentType");
			String company_tele = request.getParameter("edcompany_tele");
			String cpname = request.getParameter("edcpname");
			String cpemail = request.getParameter("edcpemail");
			String cpnumber = request.getParameter("edcpnumber");
			String acpname = request.getParameter("edacpname");
			String acpnumber = request.getParameter("edacpnumber");
			String line1 = request.getParameter("edline1");
			String line2 = request.getParameter("edline2");
			String city = request.getParameter("edcity");
			String state = request.getParameter("edstate");
			String zipcode = request.getParameter("edzipcode");

			String startedYear = request.getParameter("edstartedYear");
			String startedMonth = request.getParameter("edstartedMonth");
			String workedTillYear = request.getParameter("edworkedTillYear");
			String workedTillMonth = request.getParameter("edworkedTillMonth");

			Integer loginempno = (Integer) session.getAttribute("empno");

			message = bgcService.updateBgvEmploymentDetails(company_name, reported_to_name, hrmgr, positionheld,
					employmentType, company_tele, cpname, cpemail, cpnumber, acpname, acpnumber, line1, line2, city,
					state, zipcode, reported_to_position, startedYear, startedMonth, workedTillYear, workedTillMonth,
					loginempno, employment_id, contact_id);
		} catch (Exception e) {
			logger.error("Error in updateEmploymentDetails" + e.getMessage());
		}
		return message;
	}

	/*
	 * @RequestMapping(value = { "/updateEmploymentDetails" }, method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public String updateEmploymentDetails(Model model,
	 * HttpServletRequest request, HttpServletResponse response) { String message
	 * =null; try { HttpSession session = request.getSession(true); String userName
	 * = (String) request.getSession().getAttribute("username"); String[]
	 * employment_ids = request.getParameterValues("employment_id"); String[]
	 * contact_ids = request.getParameterValues("contact_id"); String[]
	 * company_names = request.getParameterValues("company_name"); String[]
	 * reported_to_names = request.getParameterValues("reported_to_name"); String[]
	 * reported_to_positions = request.getParameterValues("reported_to_position");
	 * String[] hrmgrs = request.getParameterValues("hrmgr"); String[] positionhelds
	 * = request.getParameterValues("positionheld"); String[] employmentTypes =
	 * request.getParameterValues("employmentType"); String[] company_teles =
	 * request.getParameterValues("company_tele"); String[] fromDates =
	 * request.getParameterValues("fromDate"); String[] toDates =
	 * request.getParameterValues("toDate"); String[] cpnames =
	 * request.getParameterValues("cpname"); String[] cpemails =
	 * request.getParameterValues("cpemail"); String[] cpnumbers =
	 * request.getParameterValues("cpnumber"); String[] acpnames =
	 * request.getParameterValues("acpname"); String[] acpnumbers =
	 * request.getParameterValues("acpnumber"); String[] line1s =
	 * request.getParameterValues("line1"); String[] line2s =
	 * request.getParameterValues("line2"); String[] citys =
	 * request.getParameterValues("city"); String[] states =
	 * request.getParameterValues("state"); String[] zipcodes =
	 * request.getParameterValues("zipcode");
	 * 
	 * String[] othr_company_names =
	 * request.getParameterValues("othr_company_name[]"); String[]
	 * othr_reported_to_names =
	 * request.getParameterValues("othr_reported_to_name[]"); String[]
	 * othr_reported_to_positions =
	 * request.getParameterValues("othr_reported_to_position[]");
	 * 
	 * String[] othr_hrmgrs = request.getParameterValues("othr_hrmgr[]"); String[]
	 * othr_positionhelds = request.getParameterValues("othr_positionheld[]");
	 * String[] othr_employmentTypes =
	 * request.getParameterValues("othr_employmentType[]"); String[]
	 * othr_company_teles = request.getParameterValues("othr_company_tele[]");
	 * String[] othr_cpnames = request.getParameterValues("othr_cpname[]"); String[]
	 * othr_cpemails = request.getParameterValues("othr_cpemail[]"); String[]
	 * othr_cpnumbers = request.getParameterValues("othr_cpnumber[]"); String[]
	 * othr_acpnames = request.getParameterValues("othr_acpname[]"); String[]
	 * othr_acpnumbers = request.getParameterValues("othr_acpnumber[]"); String[]
	 * othr_line1s = request.getParameterValues("othr_line1[]"); String[]
	 * othr_line2s = request.getParameterValues("othr_line2[]"); String[] othr_citys
	 * = request.getParameterValues("othr_city[]"); String[] othr_states =
	 * request.getParameterValues("othr_state[]"); String[] othr_zipcodes =
	 * request.getParameterValues("othr_zipcode[]"); String[] othr_fromDates =
	 * request.getParameterValues("othr_fromDate[]"); String[] othr_toDates =
	 * request.getParameterValues("othr_toDate[]"); Integer loginempno = (Integer)
	 * session.getAttribute("empno");
	 * 
	 * 
	 * System.out.println("othr_employmentTypes****"+othr_employmentTypes); message
	 * = bgcService.updateEmploymentDetails(company_names,reported_to_names,hrmgrs,
	 * positionhelds,employmentTypes,company_teles,reported_to_positions,fromDates,
	 * toDates,cpnames,cpemails,cpnumbers,acpnames,acpnumbers, line1s, line2s,
	 * citys, states ,zipcodes,othr_company_names,othr_reported_to_names,
	 * othr_reported_to_positions,othr_hrmgrs,othr_positionhelds,
	 * othr_employmentTypes,othr_company_teles,othr_cpnames,othr_cpemails,
	 * othr_cpnumbers,othr_acpnames,othr_acpnumbers,othr_line1s,othr_line2s,
	 * othr_citys,othr_states,othr_zipcodes,othr_fromDates,othr_toDates,loginempno,
	 * employment_ids,contact_ids); } catch (Exception e) {
	 * logger.error("Error in updateEmploymentDetails" + e.getMessage()); } return
	 * message; }
	 */

	@RequestMapping(value = { "/updatepersonalstatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatepersonalstatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			Integer logincandidateid = (Integer) request.getSession().getAttribute("candidateid");
			if (lgempno != null) {
				String candidate_id = request.getParameter("candidate_id");
				String bgcChkStatus = request.getParameter("status");
				String comment = request.getParameter("comment");
				message = bgcService.updatepersonalstatus(bgcChkStatus, comment, lgempno, candidate_id,logincandidateid);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updatepersonalstatus" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/updateeducationstatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateeducationstatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			Integer logincandidateid = (Integer) request.getSession().getAttribute("candidateid");
			if (lgempno != null) {
				String candidate_id = request.getParameter("candidate_id");
				String bgcChkStatus = request.getParameter("status");
				String comment = request.getParameter("comment");
				message = bgcService.updateeducationstatus(bgcChkStatus, comment, lgempno, candidate_id,logincandidateid);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updateeducationstatus" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/updateemploymentstatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateemploymentstatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			Integer logincandidateid = (Integer) request.getSession().getAttribute("candidateid");
			if (lgempno != null) {
				String candidate_id = request.getParameter("candidateId");
				String bgcChkStatus = request.getParameter("status");
				String comment = request.getParameter("comment");
				message = bgcService.updateemploymentstatus(bgcChkStatus, comment, lgempno, candidate_id,logincandidateid);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in updateemploymentstatus" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/viewformshistory" }, method = RequestMethod.GET)
	@ResponseBody
	public List<commentHistoryDto> viewpersonalhistory(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<commentHistoryDto> commentHistoryList = null;
		try {

			String candidateId = request.getParameter("candidateId");
			String formtype = request.getParameter("formtype");
			System.out.println(formtype+"candidateId"+candidateId);
			commentHistoryList = bgcService.viewpersonalhistory(candidateId, formtype);
		} catch (Exception e) {
			logger.error("Error in viewformshistory" + e.getStackTrace());
		}
		return commentHistoryList;
	}

	@RequestMapping(value = { "/viewemploymentdetails" }, method = RequestMethod.GET)
	public String viewemploymentdetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidateId = request.getParameter("candidateId");
				List<CandidateBgvEmploymentDto> employmentDetailsList = bgcService
						.viewCandidateBgvEmploymentDetailsById(candidateId);
				String top1status = bgcService.getEmploymentLastrowStatus(candidateId);
				

				BGCCandidateFormsStatusEntity candformsStatusDBObj = bgcService.getBGCFormsStatusByCandidateId(candidateId);
				model.addAttribute("candformsStatusDBObj", candformsStatusDBObj);
				
				session.setAttribute("candidateId", candidateId);
				model.addAttribute("employmentDetailsList", employmentDetailsList);
				model.addAttribute("top1status", top1status);
				return "UpdateBgvCandidateEmployment";
			}
		} catch (Exception e) {
			logger.error("Error in viewemploymentdetails " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/updateEducationDetails" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateEducationDetails(Model model, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		try {
			HttpSession session = request.getSession(true);
			String userName = (String) request.getSession().getAttribute("username");
			String educationId = request.getParameter("ededucationId");
			String collegeNameAddr = request.getParameter("edcollegeNameAddr");
			String universityNameAddr = request.getParameter("eduniversityNameAddr");
			String graduatedYear = request.getParameter("edgraduatedYear");
			String enrollNo = request.getParameter("edenrollNo");
			String typeofeducation = request.getParameter("edtypeofeducation");
			String gradDate = request.getParameter("edgradDate");
			String subMajor = request.getParameter("edsubMajor");
			String qualification = request.getParameter("edqualification");
			String courseType = request.getParameter("edcourseType");
			String fromDate = request.getParameter("edfromDate");
			String toDate = request.getParameter("edtoDate");

			Integer loginempno = (Integer) session.getAttribute("empno");

			message = bgcService.updateBgvEducationDetails(collegeNameAddr, universityNameAddr, graduatedYear, enrollNo,
					typeofeducation, gradDate, subMajor, qualification, fromDate, toDate, courseType, loginempno,
					educationId);
		} catch (Exception e) {
			logger.error("Error in updateEducationDetails" + e.getMessage());
		}
		return message;
	}

	@RequestMapping(value = { "/savebgvcandidatedocs" }, method = RequestMethod.POST)
	@ResponseBody
	public String savebgvcandidatedocs(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "bgcfile[]", required = false) MultipartFile bgcfile[]) {
		String message = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String bgcChkId = request.getParameter("bgcChkId");
				String bgcCandidateId = request.getParameter("CandidateId");
				String comment = request.getParameter("comment");
				message = bgcService.savebgvcandidatedocs(bgcChkId, comment, lgempno, bgcfile, bgcCandidateId);
			} else {
				message = null;
			}
		} catch (Exception e) {
			logger.error("Error in savebgvcandidatedocs" + e.getStackTrace());
		}
		return message;
	}

	@RequestMapping(value = { "/profilesbycandidate" }, method = RequestMethod.GET)
	public String profilesearch(Model model, HttpServletRequest request) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				List<AssignedCandidateDto> candidateList = bgcService.getAssignedCandidatesList();
				model.addAttribute("candidateList", candidateList);
				/*
				 * List<ProfileLableMaster> profileList = bgcService.getAllProfiles();
				 * model.addAttribute("profileList", profileList);
				 */
				return "ProfileSearch";
			}
		} catch (Exception e) {
			logger.error("Error in profilesearch " + e);
		}
		return null;
	}

	@RequestMapping(value = { "/ProfilelistByCandidateId" }, method = RequestMethod.GET)
	@ResponseBody
	public List<ProfileMasterDTO> ProfilesByCandidateId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<ProfileMasterDTO> profileList = null;
		try {
			String candidateId = request.getParameter("candidateId");
			profileList = bgcService.getProfilesByCandidateId(candidateId);
		} catch (Exception e) {
			logger.error("Error in profilesearch " + e);
		}
		return profileList;
	}

	@RequestMapping(value = { "/profilehistory" }, method = RequestMethod.GET)
	public String profilehistory(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
			HttpSession session = request.getSession(true);
			Integer candidateId = (Integer) session.getAttribute("empno");
			List<ProfileMasterDTO> profileList = bgcService.getProfilesByCandidateId(candidateId.toString());
			model.addAttribute("profileList", profileList);
			}
		} catch (Exception e) {
			logger.error("Error in profilehistory GET Method" + e);
		}
		return "ProfilesHistory";
	}

	@RequestMapping(value = { "/profilehistory" }, method = RequestMethod.POST)
	@ResponseBody
	public List<ProfileMasterDTO> profilehistoryDetails(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<ProfileMasterDTO> profileList = null;
		try {
			HttpSession session = request.getSession(true);
			Integer candidateId = (Integer) session.getAttribute("empno");
			profileList = bgcService.getProfilesByCandidateId(candidateId.toString());
		} catch (Exception e) {
			logger.error("Error in profilehistory POST Method" + e);
		}
		return profileList;
	}

	@RequestMapping(value = { "/candoctype" }, method = RequestMethod.GET)
	public String candidateDocuments(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				List<TempCandidateDetailsDTO> candidateList = bgcService.getAllCandidates();
				List<DocumentTypeEntity> docTypeyList = bgcService.getDocumentTypeList();
				model.addAttribute("docTypeyList", docTypeyList);
				model.addAttribute("candidateList", candidateList);
				return "SearchDocuments";
			}
		} catch (Exception e) {
			logger.error("Error in candoctype GET Method" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/searchdocumnet" }, method = RequestMethod.POST)
	public String candidateDocumentsByType(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				HttpSession session = request.getSession(true);
				String candidateId = request.getParameter("candidateid");
				String documentId = request.getParameter("documenttype");
				List<DocEmpBean> documnetList = bgcService.candidateDocumentsByType(candidateId, documentId);
				List<TempCandidateDetailsDTO> candidateList = bgcService.getAllCandidates();
				List<DocumentTypeEntity> docTypeyList = bgcService.getDocumentTypeList();

				model.addAttribute("candidateList", candidateList);
				model.addAttribute("docTypeyList", docTypeyList);
				model.addAttribute("documnetList", documnetList);
				model.addAttribute("candidateId", candidateId);
				model.addAttribute("documentId", documentId);
			}
		} catch (Exception e) {
			logger.error("Error in searchdocumnet GET Method" + e);
		}
		return "SearchDocuments";
	}

	@RequestMapping(value = { "/downloadbgvdocs" }, method = RequestMethod.GET)
	public void downloadbgvdocs(HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='login.jsp'");
				out.println("</script>");
				out.close();
			} else {
				Integer candidateId = null;
				String candidate_id = request.getParameter("candidate_id");
				
				String filename = request.getParameter("filename");
				String filepath = null;
				String workingDir = env.getProperty("documents");
				String path = workingDir + File.separator + "BGV";
				if (!candidate_id.isEmpty()) {
					candidateId = Integer.parseInt(candidate_id);
					filepath = path + File.separator + candidateId + File.separator + filename;
				}else {
					filepath = path + File.separator + "SubCategoryDocuments" + File.separator + filename;
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
			logger.error("Error while downloadbgvdocs action in BGCController" + e);
		}
	}

	@RequestMapping(value = { "/documenttype" }, method = RequestMethod.GET)
	public String doctypemaster(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				List<DocumentTypeEntity> docTypeyList = bgcService.getDocumentTypeList();
				model.addAttribute("docTypeyList", docTypeyList);
				return "DocumentsTypeMaster";
			}
		} catch (Exception e) {
			logger.error("Error in doctypemaster GET Method" + e);
		}
		return null;
	}

	@RequestMapping(value = { "/savedoctype" }, method = RequestMethod.POST)
	@ResponseBody
	public String savedoctype(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		Integer lgempno = (Integer) request.getSession().getAttribute("empno");
		String message="";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String docname = request.getParameter("docname");
				message=bgcService.savedoctype(docname, lgempno);
				List<DocumentTypeEntity> docTypeyList = bgcService.getDocumentTypeList();
				model.addAttribute("docTypeyList", docTypeyList);
				//return "DocumentsTypeMaster";
			}
		} catch (Exception e) {
			logger.error("Error in savedoctype GET Method" + e);
		}
		return message;
	}
	@RequestMapping(value = { "/updatedoctype" }, method = RequestMethod.POST)
	@ResponseBody
	public String updatedoctype(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message="";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String docname = request.getParameter("udocname");
				String docid = request.getParameter("udocid");
				message=bgcService.updatedoctype(docname, docid);
			}
		} catch (Exception e) {
			logger.error("Error in updatedoctype GET Method" + e);
		}
		return message;
	}
	@RequestMapping(value = { "/checkDocumentType" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkDocumentType(Model model, HttpServletRequest request) {
		String doc_name = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String docname = request.getParameter("docname");
				doc_name = bgcService.checkDocumentType(docname);
			} else {
				doc_name = null;
			}
		} catch (Exception e) {
			logger.error("Error in checkDocumentType" + e);
		}
		return doc_name;
	}
	
	@RequestMapping(value = { "/getCandidateEmploymentDetailsByEmploymentId" }, method = RequestMethod.GET)
	@ResponseBody
	public CandidateBgvEmploymentDto getCandidateEmploymentDetailsByEmploymentId(Model model, HttpServletRequest request) {
		CandidateBgvEmploymentDto candidateEmplomentDetailsObj = null;
		try {
			String employmentId = request.getParameter("employmentId");
			candidateEmplomentDetailsObj = bgcService.getCandidateEmploymentDetailsByEmploymentId(employmentId);
		} catch (Exception e) {
			logger.error("Error in getCandidateEmploymentDetailsByEmploymentId" + e);
		}
		return candidateEmplomentDetailsObj;
	}
	
	@RequestMapping(value = { "/viewSubCatDocListBySubCatId" }, method = RequestMethod.GET)
	@ResponseBody
	public List<DocumentTypeDto> viewSubCatDocListBySubCatId(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		List<DocumentTypeDto> subCatDocList = null;
		String subCatId = request.getParameter("subCatId");
		//subCatDocList = bgcService.viewSubCatDocListBySubCatId(subCatId);
		subCatDocList = bgcService.viewSubCatDocListBySubCategories(subCatId);
		return subCatDocList;
	}
	
	@RequestMapping(value = { "/updateSubCatDocumentStatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateSubCatDocumentStatus(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("username");
		String message="";
		try {
			if (userName == null) {
				return "redirect:/loginpage";
			} else {
				String docstatus = request.getParameter("docstatus");
				String docid = request.getParameter("documentid");
				message=bgcService.updateSubCatDocumentStatus(docid,docstatus);
			}
		} catch (Exception e) {
			logger.error("Error in updateSubCatDocumentStatus Method" + e);
		}
		return message;
	}
	
	@RequestMapping(value = { "/downloadzip" }, method = RequestMethod.GET)
    public void downloadzip(HttpServletResponse response, HttpServletRequest request) throws Exception {
           try {
                  String userName = (String) request.getSession().getAttribute("username");
                  if (userName == null) {
                        PrintWriter out = response.getWriter();
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.location.href='login.jsp'");
                        out.println("</script>");
                        out.close();
                  } else {
                	  String subcat_id = request.getParameter("subcat_id");
                        List<String> doclist=bgcService.getSubcategoryDocuments(subcat_id);                 
                        if(doclist.size()>0) {
                        	FileOutputStream fos = null; ZipOutputStream zipOut = null;        FileInputStream fis = null;
                            try {
                            	String workingDir = env.getProperty("documents");
                                fos = new FileOutputStream(workingDir+ File.separator +"SubcategoryDocuments.zip");
                                zipOut = new ZipOutputStream(new BufferedOutputStream(fos));
                                for(String filename:doclist){
                                	String path = workingDir + File.separator + "BGV"+ File.separator + "SubCategoryDocuments"+ File.separator +filename;
                                    File input = new File(path);
                                    fis = new FileInputStream(input);
                                    ZipEntry ze = new ZipEntry(input.getName());
                                    zipOut.putNextEntry(ze);
                                    byte[] tmp = new byte[4*1024];
                                    int size = 0;
                                    while((size = fis.read(tmp)) != -1){
                                        zipOut.write(tmp, 0, size);
                                    }
                                    zipOut.flush();
                                    fis.close();
                                }
                                zipOut.close();
                                File ff = new File(workingDir+ File.separator +"SubcategoryDocuments.zip");
                                
                				if (ff.exists() == true) {
                					FileInputStream fiss = new FileInputStream(ff);
                					byte[] inputBytes = new byte[(int) ff.length()];
                					fiss.read(inputBytes);
                					response.setContentType("application/zip");
                					response.setHeader("Content-Disposition", "attachment; filename=SubcategoryDocuments.zip");
                					ServletOutputStream os = response.getOutputStream(); // file output stream
                					os.write(inputBytes);
                					os.close();
                					fiss.close();
                					System.out.println("Zip downloaded..");
                				}
                				
                            } catch (FileNotFoundException e) {
                                e.printStackTrace();
                            } catch (IOException e) {
                                e.printStackTrace();
                            } finally{
                                try{
                                    if(fos != null) fos.close();
                                } catch(Exception ex){
                                     
                                }

                               }
                        }
                    
                  }
                  } catch (Exception e) {
                  logger.error("Error while downloadzip action in BGCController" + e);
           }
    }
	
	/*@RequestMapping(value = { "/downloadbgvdocs" }, method = RequestMethod.GET)
	public void viewdocuments(HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			String userName = (String) request.getSession().getAttribute("username");
			if (userName == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='login.jsp'");
				out.println("</script>");
				out.close();
			} else {
				Integer candidateId = null;
				String candidate_id = request.getParameter("candidate_id");				
				String filename = request.getParameter("filename");
				String filepath = null;
				String workingDir = env.getProperty("documents");
				String path = workingDir + File.separator + "BGV";
				if (!candidate_id.isEmpty()) {
					candidateId = Integer.parseInt(candidate_id);
					filepath = path + File.separator + candidateId + File.separator + filename;
				}else {
					filepath = path + File.separator + "SubCategoryDocuments" + File.separator + filename;
				}
				System.out.println(filepath);
				File ff = new File(filepath);
				if (ff.exists() == true) {
					//File file = new File(filename + ".pdf");
					InputStream in = new FileInputStream(ff);
					response.setContentType("application/octet-stream;");
					response.setHeader("Content-Disposition", "inline;filename=" + ff.getName());
					response.setHeader("Content-Length", String.valueOf(ff.length()));
					FileCopyUtils.copy(in, response.getOutputStream());
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
			logger.error("Error while downloadbgvdocs action in BGCController" + e);
		}
	}*/
	
	@RequestMapping(value = { "/bgccheckDocumentTypeissame" }, method = RequestMethod.GET)
	@ResponseBody
	public DocumentTypeDto bgccheckDocumentTypeissame(Model model, HttpServletRequest request) {
		DocumentTypeDto docDto = null;
		try {
			Integer lgempno = (Integer) request.getSession().getAttribute("empno");
			if (lgempno != null) {
				String docTypeid = request.getParameter("docTypeid");
				docDto = bgcService.bgccheckDocumentTypeissame(docTypeid);
			} else {
				docDto = null;
			}
		} catch (Exception e) {
			logger.error("Error in bgccheckDocumentTypeissame" + e);
		}
		return docDto;
	}
	@RequestMapping(value = { "/downloadbgcquestionnaires" }, method = RequestMethod.GET)
	public String downloadQuestionnaires(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userName = (String) request.getSession().getAttribute("username");
		try {
			if (userName != null) {
				
				String doctype = request.getParameter("qns_type");
				String candidateid = request.getParameter("candidateid");
				String initiateid = request.getParameter("initiateid");
				//ContractsPanelDetails_DTO contpanelDto = bgcService.getContrctsPanelDetailsById(candidateid, initiateid);
				CandidateBGCPersonalDetailsDto personalDetailsObj = bgcService.viewCandidateBGCPersonalDetailsById(candidateid);
				XWPFDocument doc= null;
				  XWPFParagraph paragraph = null;
				  String headername=null;String formname=""; int k=1;
				if(doctype.equalsIgnoreCase("Personal")) {
					
					if (personalDetailsObj != null) {
						doc= new XWPFDocument();
						 paragraph = doc.createParagraph();
					headername="BGC CANDIDATE PERSONAL DETAILS";
					formname="Personal Details";
					  XWPFTable table = doc.createTable();
					  CTTblWidth width3 = table.getCTTbl().addNewTblPr().addNewTblW();
					  
					  width3.setType(STTblWidth.DXA);
					  width3.setW(BigInteger.valueOf(10000));
					  
					   XWPFTableRow tr1 = table.getRow(0);
					   tr1.getCell(0).setText("Title");
					   tr1.addNewTableCell().setText(personalDetailsObj.getTitle());
					  
					    XWPFTableRow tr2 = table.createRow();
					    tr2.getCell(0).setText("First Name");
					    tr2.getCell(1).setText(personalDetailsObj.getFirst_name());
					   
					    
					    XWPFTableRow tr3 = table.createRow();
					    tr3.getCell(0).setText("Middle Name");
					    tr3.getCell(1).setText(personalDetailsObj.getMiddle_name());
					   
					    XWPFTableRow tr4 = table.createRow();
					    tr4.getCell(0).setText("Last Name");
					    tr4.getCell(1).setText(personalDetailsObj.getLast_name());
					    
					    XWPFTableRow tr5 = table.createRow();
					    tr5.getCell(0).setText("Father's Name");
					    tr5.getCell(1).setText(personalDetailsObj.getDob());
					    
					    XWPFTableRow tr6 = table.createRow();
					    tr6.getCell(0).setText("Nationality");
					    tr6.getCell(1).setText(personalDetailsObj.getNationality());
					    
					    XWPFTableRow tr7 = table.createRow();
					    tr7.getCell(0).setText("Date Of Birth");
					    tr7.getCell(1).setText(personalDetailsObj.getDob());
					    
					    XWPFTableRow tr8 = table.createRow();
					    tr8.getCell(0).setText("Gender");
					    tr8.getCell(1).setText(personalDetailsObj.getGender());
					    
					    XWPFTableRow tr9 = table.createRow();
					    tr9.getCell(0).setText("SSN Number");
					    tr9.getCell(1).setText(personalDetailsObj.getSsn_no());
					    
					    XWPFTableRow tr10 = table.createRow();
					    tr10.getCell(0).setText("Contact Telephone No.(Specify Location Codes)");
					    tr10.getCell(1).setText(personalDetailsObj.getContact_no());
					    
					    XWPFTableRow tr11 = table.createRow();
					    tr11.getCell(0).setText("Mobile");
					    tr11.getCell(1).setText(personalDetailsObj.getMobile_number());
					   
					    XWPFTableRow tr12 = table.createRow();
					    tr12.getCell(0).setText("Email Address");
					    tr12.getCell(1).setText(personalDetailsObj.getEmail_id());
					    
					    List<CandidateBGCAddressDetailsDto> addressList=personalDetailsObj.getAddressList();
					   
					    if(addressList!=null && addressList.size()>0) {
					    	for (CandidateBGCAddressDetailsDto obj : addressList) {
					    XWPFParagraph xp = doc.createParagraph();
						XWPFRun xp1=xp.createRun(); 
					   // xp1.addBreak(BreakType.PAGE);					    
					    XWPFParagraph hline4 = doc.createParagraph();
						  XWPFRun runhl4=hline4.createRun(); 
						  runhl4.setText("Contact Details "+k+":");
						  runhl4.setBold(true);
						  runhl4.setFontFamily("Times New Roman");
						  runhl4.setFontSize(14);
						  runhl4.setUnderline(UnderlinePatterns.SINGLE);
						  hline4.setAlignment(ParagraphAlignment.LEFT);
						  
						  XWPFParagraph paragraph1 = doc.createParagraph();
						
						  XWPFTable tbl1 = doc.createTable();
						  CTTblWidth widt = tbl1.getCTTbl().addNewTblPr().addNewTblW();
						  
						  widt.setType(STTblWidth.DXA);
						  widt.setW(BigInteger.valueOf(10000));
						  
						   XWPFTableRow t1 = tbl1.getRow(0);
						   t1.getCell(0).setText("Period Of Stay");
						   t1.addNewTableCell().setText("From Date: "+obj.getFrom_date()+" & To Date: "+obj.getTo_date());
						  
						    XWPFTableRow t2 = tbl1.createRow();
						    t2.getCell(0).setText("Line1");
						    t2.getCell(1).setText(obj.getLine1());
						   
						    
						    XWPFTableRow t3 = tbl1.createRow();
						    t3.getCell(0).setText("Line2");
						    t3.getCell(1).setText(obj.getLine2());
						   
						    XWPFTableRow t4 = tbl1.createRow();
						    t4.getCell(0).setText("City");
						    t4.getCell(1).setText(obj.getCity());
						    
						    XWPFTableRow t5 = tbl1.createRow();
						    t5.getCell(0).setText("State");
						    t5.getCell(1).setText(obj.getState());
						    
						    XWPFTableRow t6 = tbl1.createRow();
						    t6.getCell(0).setText("Zipcode");
						    t6.getCell(1).setText(obj.getZipcode());
						    
						  k++; 
						  
					    }}
					}
					
				}
				
				else if(doctype.equalsIgnoreCase("Employment")) {
					 
					 headername="BGC CANDIDATE EMPLOYMENT DETAILS";
					formname="Employment Details";
					List<CandidateBgvEmploymentDto> employmentDetailsList = bgcService.viewCandidateBgvEmploymentDetailsById(candidateid);
					if (employmentDetailsList != null && employmentDetailsList.size()>0) {
						 doc= new XWPFDocument();
						   paragraph = doc.createParagraph();
					for (CandidateBgvEmploymentDto obj : employmentDetailsList) {
					  
						XWPFParagraph xp = doc.createParagraph();
						XWPFRun xp1=xp.createRun(); 
					   // xp1.addBreak(BreakType.PAGE);					    
					    XWPFParagraph hline1 = doc.createParagraph();
						  XWPFRun run4=hline1.createRun(); 
						  
						  run4.setText("Employment "+k+":");
						  run4.setBold(true);
						  run4.setFontFamily("Times New Roman");
						  run4.setFontSize(14);
						  run4.setUnderline(UnderlinePatterns.SINGLE);
						  hline1.setAlignment(ParagraphAlignment.LEFT);
						  run4.addBreak();
						  
					   XWPFTable tbl1 = doc.createTable();
					   CTTblWidth width3 = tbl1.getCTTbl().addNewTblPr().addNewTblW();
					  
					   width3.setType(STTblWidth.DXA);
					   width3.setW(BigInteger.valueOf(10000));
					  
					   XWPFTableRow tr0 = tbl1.getRow(0);
					   tr0.getCell(0).setText("Company Name");
					   tr0.addNewTableCell().setText(obj.getCompany_name());
					  
					    XWPFTableRow tr1 = tbl1.createRow();
					    tr1.getCell(0).setText("Position Held");
					    tr1.getCell(1).setText(obj.getPositionheld());
					    
					    XWPFTableRow t2 = tbl1.createRow();
					    t2.getCell(0).setText("Line1");
					    t2.getCell(1).setText(obj.getLine1());
					    
					    XWPFTableRow t3 = tbl1.createRow();
					    t3.getCell(0).setText("Line2");
					    t3.getCell(1).setText(obj.getLine2());
					   
					    XWPFTableRow t4 = tbl1.createRow();
					    t4.getCell(0).setText("City");
					    t4.getCell(1).setText(obj.getCity());
					    
					    XWPFTableRow t5 = tbl1.createRow();
					    t5.getCell(0).setText("State");
					    t5.getCell(1).setText(obj.getState());
					    
					    XWPFTableRow t6 = tbl1.createRow();
					    t6.getCell(0).setText("Zipcode");
					    t6.getCell(1).setText(obj.getZipcode());
					    
					    XWPFTableRow t7 = tbl1.createRow();
					    t7.getCell(0).setText("Company Telephone");
					    t7.getCell(1).setText(obj.getCompany_phone());
					    
					    XWPFTableRow tr8 = tbl1.createRow();
					    tr8.getCell(0).setText("Started Working From");
					    tr8.getCell(1).setText("Month: "+obj.getStartedMonth()+" && Year: "+obj.getStartedYear());
					    
					    XWPFTableRow tr9 = tbl1.createRow();
					    tr9.getCell(0).setText("Worked Till");
					    tr9.getCell(1).setText("Month: "+obj.getWorkedTillMonth()+" && Year: "+obj.getWorkedTillYear());
					   
					    XWPFTableRow tr10 = tbl1.createRow();
					    tr10.getCell(0).setText("Reported to (Name & Position)");
					    tr10.getCell(1).setText("Name: "+obj.getReported_to_name()+" Position: "+obj.getReported_to_position());
					    
					    XWPFTableRow tr11 = tbl1.createRow();
					    tr11.getCell(0).setText("Name of HR Manager");
					    tr11.getCell(1).setText(obj.getHrmgr_name());
					    
					    XWPFTableRow tr12 = tbl1.createRow();
					    tr12.getCell(0).setText("Employment Type");
					    tr12.getCell(1).setText(obj.getEmploymentType());
					   
					    XWPFTableRow tr13 = tbl1.createRow();
					    tr13.getCell(0).setText("Contact Person Name");
					    tr13.getCell(1).setText(obj.getCpname());
					    
					    XWPFTableRow tr14 = tbl1.createRow();
					    tr14.getCell(0).setText("Contact Person Number");
					    tr14.getCell(1).setText(obj.getCpnumber());
					    
					    XWPFTableRow tr15 = tbl1.createRow();
					    tr15.getCell(0).setText("Contact Person Email Id");
					    tr15.getCell(1).setText(obj.getCpemail());
					    
					    XWPFTableRow tr16 = tbl1.createRow();
					    tr16.getCell(0).setText("Additional: Contact Person Name");
					    tr16.getCell(1).setText(obj.getCpemail());
					    
					    XWPFTableRow tr17 = tbl1.createRow();
					    tr17.getCell(0).setText("Additional: Contact Person Number");
					    tr17.getCell(1).setText(obj.getCpemail());
					    
					    k++;
					}
					}
					
				
				}
				else if(doctype.equalsIgnoreCase("Education")) {
					
					 headername="BGC CANDIDATE EDUCATION DETAILS";
					formname="Education Details";
					List<CandidateBgvEducationDto> educationDetailsList = bgcService.viewCandidateBgvEducationDetailsById(candidateid);
					if (educationDetailsList != null && educationDetailsList.size()>0) {
						 doc= new XWPFDocument();
						   paragraph = doc.createParagraph();
					for (CandidateBgvEducationDto obj : educationDetailsList) {
					  
						XWPFParagraph xp = doc.createParagraph();
						XWPFRun xp1=xp.createRun(); 
					   // xp1.addBreak(BreakType.PAGE);					    
					   XWPFParagraph hline1 = doc.createParagraph();
						  XWPFRun run4=hline1.createRun(); 
						  
						  run4.setText("Education "+k+":");
						  run4.setBold(true);
						  run4.setFontFamily("Times New Roman");
						  run4.setFontSize(14);
						  run4.setUnderline(UnderlinePatterns.SINGLE);
						  hline1.setAlignment(ParagraphAlignment.LEFT);
						  run4.addBreak();
						  
					   XWPFTable tbl1 = doc.createTable();
					   CTTblWidth width3 = tbl1.getCTTbl().addNewTblPr().addNewTblW();
					  
					   width3.setType(STTblWidth.DXA);
					   width3.setW(BigInteger.valueOf(10000));
					  
					   XWPFTableRow tr01 = tbl1.getRow(0);
					   tr01.getCell(0).setText("College Name and Address");
					   tr01.addNewTableCell().setText(obj.getCollege_name());
					   
					   XWPFTableRow tr = tbl1.createRow();
					   tr.getCell(0).setText("University Name and Address");
					   tr.getCell(1).setText(obj.getUniversity_name());
					  
					    XWPFTableRow tr1 = tbl1.createRow();
					    tr1.getCell(0).setText("Course Type");
					    tr1.getCell(1).setText(obj.getCourse_Type());
					    
					    XWPFTableRow tr8 = tbl1.createRow();
					    tr8.getCell(0).setText("Graduation Period");
					    tr8.getCell(1).setText("From: "+obj.getEducation_fromDate()+" && To: "+obj.getEducation_toDate());
					    
					    XWPFTableRow tr10 = tbl1.createRow();
					    tr10.getCell(0).setText("Graduated");
					    tr10.getCell(1).setText(obj.getGraduation());
					    
					    XWPFTableRow tr11 = tbl1.createRow();
					    tr11.getCell(0).setText("Student Id No./Enrollment No.");
					    tr11.getCell(1).setText(obj.getStudent_id());
					    
					    XWPFTableRow tr12 = tbl1.createRow();
					    tr12.getCell(0).setText("Type of Degree");
					    tr12.getCell(1).setText(obj.getType_of_degree());
					   
					    XWPFTableRow tr13 = tbl1.createRow();
					    tr13.getCell(0).setText("Subject Major");
					    tr13.getCell(1).setText(obj.getMajor_subject());
					    
					    XWPFTableRow tr14 = tbl1.createRow();
					    tr14.getCell(0).setText("Qualification");
					    tr14.getCell(1).setText(obj.getQualification());
					    
					    
					    k++;
					}
					}
					
				
				
				}
				
				try {
					  // create header start
					  CTSectPr sectPr = doc.getDocument().getBody().addNewSectPr();
					  XWPFHeaderFooterPolicy headerFooterPolicy = new XWPFHeaderFooterPolicy(doc, sectPr);
					  XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);
					  paragraph = header.getParagraphArray(0);
					  paragraph.setAlignment(ParagraphAlignment.LEFT);
					  //XWPFRun runh=paragraph.createRun(); 
					  XWPFRun runh1=paragraph.createRun(); 
					  XWPFRun runh2=paragraph.createRun(); 
						  
						  
						  runh1.setText(""+headername+"");
						  runh1.setBold(true);
						  runh1.setFontFamily("Garamond");
						  runh1.setFontSize(15);
						  paragraph.setAlignment(ParagraphAlignment.CENTER);
						  runh1.addBreak();
						
					  runh2.setText(" ____________________________________________________________________________________");
					  
					  String filetitle =""+personalDetailsObj.getFirst_name()+" : "+formname+"";
						String filename = filetitle + ".doc";
						DiskFileItemFactory factory = new DiskFileItemFactory();
						factory.setSizeThreshold(THRESHOLD_SIZE);
						factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
						ServletFileUpload upload = new ServletFileUpload(factory);
						upload.setFileSizeMax(MAX_FILE_SIZE);
						upload.setSizeMax(MAX_REQUEST_SIZE);
						
						// constructs the directory path to store upload file
						String uploadPath = context.getRealPath("") + UPLOAD_DIRECTORY;

						if (!new File(uploadPath).exists()) {
							new File(uploadPath).mkdir();
							logger.info("directory created  ");
						}
						String desFile = uploadPath + File.separator + filetitle;
						File dest = new File(uploadPath + File.separator + filename);
						try {
						
							  doc.write(new FileOutputStream(dest));
							logger.info("File created with content ");
						} catch (IOException e) {
							e.printStackTrace();
						}
						

						File file = new File(desFile + ".doc");
						FileInputStream in = new FileInputStream(file);
						response.setContentType("application/ocet");
						response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
						response.setHeader("Content-Length", String.valueOf(file.length()));
						FileCopyUtils.copy(in, response.getOutputStream());
					
					}
					catch (Exception e) {
						e.printStackTrace();
					}
}} catch (Exception e) {
	logger.error("Error in downloadQuestionnaires " + e);
}
		
return null;
	}
	
}
