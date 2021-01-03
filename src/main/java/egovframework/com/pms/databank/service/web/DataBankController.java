package egovframework.com.pms.databank.service.web;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.pms.ann.service.Task;
import egovframework.com.pms.ann.service.TaskService;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.ann.service.impl.TaskServiceImpl;
import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.databank.service.Databank;
import egovframework.com.pms.databank.service.DatabankManageService;
import egovframework.com.pms.databank.service.DatabankVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/*
 * databank 컨트롤러
 * 2020 11 02 박현정 생성
 * 왜안되는거야
 */

@Controller
public class DataBankController {

	//콘솔에 로그 생성을 위한 로거
	private static final Logger LOGGER = LoggerFactory.getLogger(DataBankController.class);
	//@Resource 어노테이션은 이름으로 @Autowired 어노테이션은 타입으로 빈을 연결해 준다. 
	
	//다중파일업로드 resource
	@Resource(name="EgovFileMngService")
	private EgovFileMngService fileMngService;
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	@Resource(name="DatabankManageService")
	private DatabankManageService databankMngService;
	@Resource(name="egovRestDeIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Resource(name = "TaskServiceImpl")
	private TaskService taskService;
	
	@IncludedInfo(name="데이터 뱅크 관리",order = 4002 ,gid = 110)
	@RequestMapping(value = "/pms/databank/boardListView.do")
    public String databankListView(@ModelAttribute("searchVO") DatabankVO searchVO, ModelMap model) throws Exception {
		
		boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		model.addAttribute("isAuthenticated", isAuthenticated);
		
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        List<?> CmmnCodeList = databankMngService.selectDatabankList(searchVO);
        System.out.println("listList" + CmmnCodeList);
        model.addAttribute("resultList", CmmnCodeList);
        
        int totCnt = databankMngService.selectDatabankListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/pms/databank/DatabankList";
    }
	
	@RequestMapping(value = "/pms/databank/databankForm.do")
	public String databankFormView(@ModelAttribute("databank") Databank databank, TaskVO taskVO, ModelMap model) throws Exception {
		System.out.println("Databank Form");
		List<?> taskLst = taskService.selectComList(taskVO);
		
		System.out.println("list" + taskLst);
		model.addAttribute("taskLst", taskLst);
		
		return "egovframework/com/pms/databank/DatabankForm";
	}
	
	@RequestMapping(value = "/pms/databank/insertData.do")
	public String insertData(final MultipartHttpServletRequest multiRequest, HttpServletRequest request, SessionVO sessionVO, ModelMap model, @ModelAttribute("databank") Databank databank) throws Exception{
		List<FileVO> result = null;
		String atchFileId = "";
		String storePath = request.getParameter("savePath");
		
		// 데이터뱅크 글 등록
		databank.setDataId(idgenService.getNextIntegerId()%1000000);
		System.out.println("taskid" + databank.getTaskId());
		
		// 첨부파일 등록
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if(!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "databankfile_"+databank.getDataId(), 0, "", storePath);
			atchFileId = fileMngService.insertFileInfs(result);
		}
		databank.setAtchFileId(atchFileId);
		databankMngService.insertDatabank(databank);
		
		System.out.println("Insert Data");

		return "forward:/pms/databank/boardListView.do";
	}
	
	@RequestMapping("/pms/databank/databankDetail.do")
	public String dataDetailView(@ModelAttribute("databank") Databank databank, ModelMap model, @ModelAttribute("file") FileVO fileVO) throws Exception {
		System.out.println("\nDatabankDetail View 사업 ID :: " + databank.getTaskId() +"\nDatabank ID : "+ databank.getDataId());
		
		//데이터뱅크 게시글
		Databank vo = databankMngService.selectDatabankDetail(databank);
		
		String atchFileId = vo.getAtchFileId();
		
        int fileCnt = databankMngService.selectFileListToCnt(atchFileId);
        List<?> fileList = databankMngService.selectFileList(atchFileId);
        System.out.println("atchFileId :: "+atchFileId);
        
        model.addAttribute("fileCnt", fileCnt);
        model.addAttribute("fileList", fileList);
		model.addAttribute("result", vo);

		return "egovframework/com/pms/databank/DatabankDetail";
	}
	
	@RequestMapping("/pms/databank/databankModify.do")
	public String databankModify(@ModelAttribute("databank") Databank databank, ModelMap model) throws Exception {
		System.out.println("\nModify Databank Id :: " + databank.getDataId());
		
		Databank vo = databankMngService.selectDatabankDetail(databank);
		System.out.println("bussNm " + vo.getBussNm());
		System.out.println("bussNm " + vo.getBussEx());
		String atchFileId = vo.getAtchFileId();
		System.out.println("atchFileId :: "+atchFileId);
		
        int fileCnt = databankMngService.selectFileListToCnt(atchFileId);
        List<?> fileList = databankMngService.selectFileList(atchFileId);
        
        model.addAttribute("fileCnt", fileCnt);
        model.addAttribute("fileList", fileList);
		
		model.addAttribute("result", vo);
		
		return "egovframework/com/pms/databank/DatabankModify";
	}
	
	@RequestMapping("/pms/databank/databankRemove.do")
	public String deleteDatabank(Databank databank, ModelMap model) throws Exception {
		
		System.out.println("\nDelete data :: " + databank.getDataId());
		databankMngService.deleteDatabank(databank);
		
		return "forward:/pms/databank/boardListView.do";
	}
	
	@RequestMapping("/pms/databank/dataUpdate.do")
	public String databankUpdate(final MultipartHttpServletRequest multiRequest, HttpServletRequest request, @ModelAttribute("databank") Databank databank, FileVO file, ModelMap model) throws Exception {
		System.out.println("\ndata Update :: " + databank.getDataId());
		String stListVal = request.getParameter("fList");
		
		List<FileVO> result = null;
		String atchFileId = file.getAtchFileId();
		String storePath = request.getParameter("savePath");
		System.out.println("atchFileId :: "+atchFileId);
		
		// 첨부파일 등록
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if(!files.isEmpty()) {
			
			if("".equals(atchFileId) || atchFileId == null) {
				System.out.println("if inn");
				result = fileUtil.parseFileInf(files, "databankfile_"+databank.getDataId(), 0, "", storePath);
				atchFileId = fileMngService.insertFileInfs(result);
				System.out.println("atchFileId :: "+atchFileId);
				databank.setAtchFileId(atchFileId);
			} else {
				System.out.println("else inn");
				FileVO fvo = new FileVO();
				fvo.setAtchFileId(atchFileId);
				int cnt = fileMngService.getMaxFileSN(fvo);
				
				result = fileUtil.parseFileInf(files, "databankfile_"+databank.getDataId(), cnt, atchFileId, storePath);
				fileMngService.updateFileInfs(result);
			}
		}
		
		// 첨부파일 삭제된게 있.없
		if(stListVal.equals("")) {
			databankMngService.updateDatabank(databank);
		} else {
			String[] listArr = stListVal.split(",");
			
			for(int i=0; i<listArr.length; i++) {
				System.out.println(listArr[i]);
				databankMngService.deleteFile(atchFileId, listArr[i]);
			}
			databankMngService.updateDatabank(databank);
		}
		
		return "forward:/pms/databank/boardListView.do";
	}
	
	@RequestMapping("/pms/databank/downloadFile.do")
	public void downloadFile(HttpServletRequest request, HttpServletResponse response, FileVO file) throws Exception {
        System.out.println("Download File :: " + file.getAtchFileId());
        System.out.println("fileSn : " + file.getFileSn());
        
        FileVO dFile = fileMngService.selectFileInf(file);
        
        String streFileNm = dFile.getStreFileNm();
        String orignFileNm = dFile.getOrignlFileNm();
        
        byte fileByte[] = FileUtils.readFileToByteArray(new File("C:/egovframework/upload/databank/"+streFileNm));
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(orignFileNm,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        response.getOutputStream().write(fileByte);
        response.getOutputStream().flush();
        response.getOutputStream().close();
	}
}
