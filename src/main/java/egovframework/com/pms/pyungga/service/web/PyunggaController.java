package egovframework.com.pms.pyungga.service.web;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.bud.service.BudgetService;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.bud.service.impl.BudgetDAO;

import egovframework.com.pms.pyungga.service.Pyungga;
import egovframework.com.pms.pyungga.service.PyunggaManageService;
import egovframework.com.pms.pyungga.service.PyunggaVo;
import egovframework.com.pms.pyungga.service.Pyunggawewon;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class PyunggaController {
	//콘솔에 로그 생성을 위한 로거
		private static final Logger LOGGER = LoggerFactory.getLogger(PyunggaController.class);
		//@Resource 어노테이션은 이름으로 @Autowired 어노테이션은 타입으로 빈을 연결해 준다. 

		@Resource(name="propertiesService")
		protected EgovPropertyService propertiesService;
		
		@Resource(name="PyunggaManageService")
		private PyunggaManageService pyunggaMngService;
		
		@Resource(name = "budgetServiceImpl")
		private BudgetService budgetService;
		@Resource(name = "BudgetDAO")
		private BudgetDAO budgetDao;
		/*
		 * 사업 리스트
		 */
		@IncludedInfo(name="평가위원",order = 4003 ,gid = 110)
		@RequestMapping("/pyungga/boardListView.do")
	    public String PyunggaListView(@ModelAttribute("pyungga")  Pyungga pyungga,Pyunggawewon pyunggawewon, @ModelAttribute("pyunggaVO") PyunggaVo pyunggaVO,ModelMap model) throws Exception 
		{

			boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			model.addAttribute("isAuthenticated", isAuthenticated);
			
		  //** EgovPropertyService.sample *//*
			pyunggaVO.setPageUnit(propertiesService.getInt("pageUnit"));
			pyunggaVO.setPageSize(propertiesService.getInt("pageSize"));

	    	//** pageing *//*
	    	PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(pyunggaVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(pyunggaVO.getPageUnit());
			paginationInfo.setPageSize(pyunggaVO.getPageSize());

			pyunggaVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			pyunggaVO.setLastIndex(paginationInfo.getLastRecordIndex());
			pyunggaVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			List<?> PyunggaList = pyunggaMngService.selectPyunggaList(pyunggaVO);
			System.out.println("1."+PyunggaList);
			model.addAttribute("resultList",PyunggaList);
			
//			List<?> PyunggawewonList = pyunggaMngService.selectPyunggawewonList(projectVO);
//			model.addAttribute("resultList1",PyunggawewonList);
//			
			System.out.println("이건 평가위원입니다.");
			
			
			
			return "egovframework/com/pms/pyungga/pyungga";
		
	    }
		

		
		@RequestMapping("/pyungga/insertView.do")
	    public String PyunggainsertView(@ModelAttribute("projectVO") ProjectVO projectVO,ModelMap model) throws Exception {

			System.out.println("이건 평가입니다.");
			
			

			 
			
			
	
			return "egovframework/com/pms/pyungga/pyunggaForm";
	    }
		@RequestMapping("/pyungga/test.do")
	    public String Pyunggatest(@ModelAttribute("pyunggaVO") PyunggaVo pyunggaVO,@ModelAttribute("pyungga") Pyungga pyungga, ModelMap model) throws Exception {
			/** EgovPropertyService.sample */
			pyunggaVO.setPageUnit(propertiesService.getInt("pageUnit"));
			pyunggaVO.setPageSize(propertiesService.getInt("pageSize"));

	    	/** pageing */
	    	PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(pyunggaVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(pyunggaVO.getPageUnit());
			paginationInfo.setPageSize(pyunggaVO.getPageSize());

			pyunggaVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			pyunggaVO.setLastIndex(paginationInfo.getLastRecordIndex());
			pyunggaVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			
			return "egovframework/com/pms/pyungga/pyunggatest";
	    }
		@Resource(name="EgovFileMngService")
		private EgovFileMngService fileMngService;
		@Resource(name="EgovFileMngUtil")
		private EgovFileMngUtil fileUtil;
		@RequestMapping("/pyungga/insert.do")
	    public String Pyunggainsert(@ModelAttribute("pyungga") Pyungga pyungga,HttpServletRequest request,MultipartHttpServletRequest multiRequest) throws Exception {

			pyunggaMngService.insertPyungga(pyungga);
			System.out.println("이건 평가위원입니다.");
			
			System.out.println("insert Data => ");
			System.out.println("pyunggapNum:" + pyungga.getpNum() + ", taskid:" +pyungga.getTask_id() + ", pyunggaid:" + pyungga.getProjectid()+ ", pyungga:" + pyungga.getPyungga() + ", start:" + pyungga.getStart()+", end:"+ pyungga.getEnd()+", 평가위원id:"+ pyungga.getPyunggaid() );
			String storePath = request.getParameter("savePath");
			List<FileVO> result = null;
			String atchFileId = "";
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if(!files.isEmpty()) {
				result = fileUtil.parseFileInf(files, "upfile_", 0, "", storePath);
				atchFileId = fileMngService.insertFileInfs(result);
			}
			return "forward:/pyungga/boardListView.do";
	    }
		
		@RequestMapping("/pyungga/downloadFile.do")
		public void downLoadFile(ModelMap model,HttpServletRequest request, HttpServletResponse response,FileVO fileVo) throws Exception{
		      System.out.println("Download File :: " + fileVo.getAtchFileId());
		        System.out.println("fileSn : " + fileVo.getFileSn());
		        
		        FileVO File = fileMngService.selectFileInf(fileVo);
		        
		        String streFileNm = File.getStreFileNm();
		        String orignFileNm = File.getOrignlFileNm();
		        
		        byte fileByte[] = FileUtils.readFileToByteArray(new File("C:/egovframework/upload/"+streFileNm));
		        response.setContentType("application/octet-stream");
		        response.setContentLength(fileByte.length);
		        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(orignFileNm,"UTF-8")+"\";");
		        response.setHeader("Content-Transfer-Encoding", "binary");
		        
		        response.getOutputStream().write(fileByte);
		        response.getOutputStream().flush();
		        response.getOutputStream().close();/*return "copycoding/util/FileUpDownlad";*/
		}
		@RequestMapping("/pyungga/projectList1.do") //사업 리스트확인(장시형 추가)__임시용
	    public String projectList1(@ModelAttribute("projectVO") ProjectVO projectVO, @ModelAttribute("taskVO") TaskVO taskVO,ModelMap model) throws Exception {

			projectVO.setPageUnit(propertiesService.getInt("pageUnit"));
			projectVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			
			paginationInfo.setCurrentPageNo(projectVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(projectVO.getPageUnit());
			paginationInfo.setPageSize(projectVO.getPageSize());
			
			projectVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			projectVO.setLastIndex(paginationInfo.getLastRecordIndex());
			projectVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
		
			System.out.println("이건 사업 이름 목록 입니다3333.");

			Map<String, Object> map = budgetService.selectTaskInfs(taskVO);

			model.addAttribute("resultList", map.get("resultList"));
			//model.addAttribute("resultList", map.get("resultCnt"));
			model.addAttribute("paginationInfo", paginationInfo);
			
			return "egovframework/com/pms/pyungga/projectList";
	    }
		
		
		@RequestMapping("/pyungga/projectList.do") //프로젝트 리스트확인
	    public String projectList(@ModelAttribute("projectVO") ProjectVO projectVO, @ModelAttribute("taskVO") TaskVO taskVO,ModelMap model) throws Exception {

			projectVO.setPageUnit(propertiesService.getInt("pageUnit"));
			projectVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			
			paginationInfo.setCurrentPageNo(projectVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(projectVO.getPageUnit());
			paginationInfo.setPageSize(projectVO.getPageSize());
			
			projectVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			projectVO.setLastIndex(paginationInfo.getLastRecordIndex());
			projectVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
		
			System.out.println("이건 사업 이름 목록 입니다22.");

			Map<String, Object> map = budgetService.selectTaskInfs(taskVO);

			model.addAttribute("resultList", map.get("resultList"));
			//model.addAttribute("resultList", map.get("resultCnt"));
			model.addAttribute("paginationInfo", paginationInfo);
			
			return "egovframework/com/pms/pyungga/projectList";
	    }
		
		
		@RequestMapping("/pyungga/projectListView.do")//프로젝트 과제 리스트
	    public String budgetListView(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
			
			projectVO.setPageUnit(propertiesService.getInt("pageUnit"));
			projectVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			
			paginationInfo.setCurrentPageNo(projectVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(projectVO.getPageUnit());
			paginationInfo.setPageSize(projectVO.getPageSize());
			
			projectVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			projectVO.setLastIndex(paginationInfo.getLastRecordIndex());
			projectVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			Map<String, Object> map = budgetService.selectProjectInfs(projectVO);
			System.out.println("이건 사업 이름 목록 입니다.");
			/*System.out.println("controller의 map ::");
			for(String key : map.keySet()) {
				System.out.println("키 값 :;" + key + " value값 :: " + map.get(key));
			}*/
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("paginationInfo", paginationInfo);
			
			return "egovframework/com/pms/pyungga/projectListView";
	    }
		
		
		@RequestMapping("/pyungga/pyunggaDetail.do")//평가 detail
		public String pyunggaDetailView(@ModelAttribute("pyungga") Pyungga pyungga,  ModelMap model/*, @ModelAttribute("file") FileVO fileVO*/) throws Exception {
			System.out.println("\n 평가 View 평가 ID :: " + pyungga.getpNum());

			Pyungga data = pyunggaMngService.selectPyunggaDetail(pyungga);
			model.addAttribute("result", data);
			System.out.println("pyungga : " +data);

			return "egovframework/com/pms/pyungga/pyunggaDetail";
		}
		
		
		@RequestMapping("/pyungga/pyunggaUpdate.do")//평가 update
		public String pyunggaUpdateView(@ModelAttribute("pyungga") Pyungga pyungga,  ModelMap model/*, @ModelAttribute("file") FileVO fileVO*/) throws Exception {
			System.out.println("\n 평가 View 평가 ID :: " + pyungga.getpNum());
			Pyungga data = pyunggaMngService.selectPyunggaDetail(pyungga);
		model.addAttribute("result", data);
		System.out.println("pyunggaupdate : " +data);

			return "egovframework/com/pms/pyungga/pyunggaUpdate";
		}
		
		@RequestMapping("/pyungga/Update.do")
	    public String PyunggaUpdate(@ModelAttribute("pyungga") Pyungga pyungga) throws Exception {

			pyunggaMngService.updatePyungga(pyungga);
			System.out.println("이건 평가위원입니다.");
			
			System.out.println("update Data => ");
			System.out.println("pyunggascore:" + pyungga.getScore() + ", pyunggapass:" + pyungga.getPass()+ ", pyungga:" + pyungga.getPyungga() + ", start:" + pyungga.getStart()+", end:"+ pyungga.getEnd()+", 평가위원id:"+ pyungga.getPyunggaid() );

			
			return "forward:/pyungga/boardListView.do";
	    }
		
		@RequestMapping("/pyungga/Delete.do")
	    public String PyunggaDelete(@ModelAttribute("pyungga") Pyungga pyungga) throws Exception {

			System.out.println("이건 평가위원입니다.");
			
			System.out.println("delete Data => ");
			System.out.println("삭제될 것 :" + pyungga.getpNum() );

			pyunggaMngService.deletePyungga(pyungga);

			return "forward:/pyungga/boardListView.do";
	    }
		
		
		@RequestMapping("/pyungga/pyunggawewonlist.do") //평가위원 리스트 확인
	    public String pyunggawewonlist(@ModelAttribute("searchVO") ProjectVO projectVO,Pyunggawewon pyunggawewon, ModelMap model) throws Exception {

			projectVO.setPageUnit(propertiesService.getInt("pageUnit"));
			projectVO.setPageSize(propertiesService.getInt("pageSize"));
			
			PaginationInfo paginationInfo = new PaginationInfo();
			
			paginationInfo.setCurrentPageNo(projectVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(projectVO.getPageUnit());
			paginationInfo.setPageSize(projectVO.getPageSize());
			
			projectVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			projectVO.setLastIndex(paginationInfo.getLastRecordIndex());
			projectVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			

			List<?> PyunggawewonList = pyunggaMngService.selectPyunggawewonList(projectVO);
			model.addAttribute("resultList1",PyunggawewonList);
			
			
			System.out.println("검색단어 "+ projectVO.getSearchWrd());
			System.out.println("이건 평가위원리스트입니다.!!!!!!");
			return "egovframework/com/pms/pyungga/pyunggawewonlist";
	    }
		
		
		
		
		
		
		//평가위원 등록
		@RequestMapping("/pyunggawewon/insert.do")
	    public String Pyunggawewoninsert(@ModelAttribute("pyunggawewon") Pyunggawewon pyunggawewon) throws Exception {
			pyunggaMngService.insertPyunggawewon(pyunggawewon);
			
					
			
			System.out.println("이건 평가위원등록입니다.!!!!!!");
			
			//System.out.println("insert Data => ");
			System.out.println("평가위원이름:" + pyunggawewon.getPyunggawewonname());
			//+ ", pyunggaid:" + pyungga.getProjectid()+ ", pyungga:" + pyungga.getPyungga() + ", start:" + pyungga.getStart()+", end:"+ pyungga.getEnd() );

			//return "egovframework/com/pms/pyungga/pyungga";
			
		return "forward:/pyunggawewon/insertView.do";
	    }
		
		
		@RequestMapping("/pyunggawewon/insertView.do")
	    public String PyunggawewoninsertView(@ModelAttribute("searchVO") ProjectVO projectVO,Pyunggawewon pyunggawewon, ModelMap model) throws Exception {

		
			
			
			
			return "egovframework/com/pms/pyungga/pyunggawewonregister";
	    }
		
		
}
