package egovframework.com.pms.bud.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.web.EgovArticleController;
import egovframework.com.pms.ann.service.Task;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.bud.service.Budget;
import egovframework.com.pms.bud.service.BudgetService;
import egovframework.com.pms.bud.service.BudgetVO;
import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/*
 * 
 * 예산관리 컨트롤러
 * 2020 10 30 옥승배 생성
 */

@Controller
public class BudgetController {

	//콘솔에 로그 생성을 위한 로거
	private static final Logger LOGGER = LoggerFactory.getLogger(BudgetController.class);
	//@Resource 어노테이션은 이름으로 @Autowired 어노테이션은 타입으로 빈을 연결해 준다. 

	
	@Resource(name = "budgetServiceImpl")
	private BudgetService budgetService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	

	@IncludedInfo(name="예산관리",order = 4001 ,gid = 110)
	@RequestMapping("/pms/bud/taskList.do")
	public String taskListView(@ModelAttribute("searchVO") TaskVO searchVO, ModelMap model) throws Exception{
		
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

		
		Map<String, Object> map = budgetService.selectTaskInfs(searchVO);
		
		List<?> list = (List<?>) map.get("resultList");
		int totCnt = list.size();
		System.out.println("totCnt :: " + totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultList", list);
		
		return "egovframework/com/pms/bud/TaskList";
	}
	
	
	/*
	 * 과제 리스트
	 */
	@RequestMapping("/pms/bud/budgetProjectListView.do")
    public String budgetListView(@ModelAttribute("searchVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		
		projectVO.setPageUnit(propertyService.getInt("pageUnit"));
		projectVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(projectVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(projectVO.getPageUnit());
		paginationInfo.setPageSize(projectVO.getPageSize());
		
		projectVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		projectVO.setLastIndex(paginationInfo.getLastRecordIndex());
		projectVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = budgetService.selectProjectInfs(projectVO);
		int taskId = projectVO.getTaskId();
		/*System.out.println("controller의 map ::");
		for(String key : map.keySet()) {
			System.out.println("키 값 :;" + key + " value값 :: " + map.get(key));
		}*/
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("taskId", taskId);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/pms/bud/ProjectList";
    }
	
	/*
	 * 2020 11 09 옥승배 생성
	 * 과제명 -> 선정 과제 detail
	 */	
	@RequestMapping("/pms/bud/selectProjectDetail.do")
	public String selectProjectDetail(@ModelAttribute("project") Project project, ModelMap model) throws Exception{
		
		Project resultProject = budgetService.selectProjectInfo(project);
/*		System.out.println("값 :: " + resultProject.getSuccessName() + resultProject.getFinishName());*/
		model.addAttribute("resultProject", resultProject);
		return "egovframework/com/pms/bud/SelectProDetail";
	}
	
	/*
	 * 2020 11 09 옥승배 생성
	 * 선정과제 목록 -> 해당 과제의 예산항목 설정버튼을 누르면 이동하는 페이지
	 */
	
	@RequestMapping("/pms/bud/budgetListView.do")
	public String budgetListViewDetail(@ModelAttribute("searchVO") ProjectVO searchVO, ModelMap model) throws Exception{
	
		
		Map<String, Object> map = budgetService.selectBudgetList(searchVO);
		
		int proId = searchVO.getProId();
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("proId", proId);
		
		return "egovframework/com/pms/bud/BudgetList";
	}
	
	/*
	 * 2020 11 10 옥승배 생성
	 * 선정과제 목록 -> 등록 ( insert )
	 */
	@RequestMapping("/pms/bud/insertProject.do")
    public String insertProject(ModelMap model) throws Exception {
		
		System.out.println("budgetRegister 페이지로 넘어가기");
		
		return "egovframework/com/pms/bud/ProjectRegist";
    }
	
	
	/*
	 * 2020 11 11 옥승배 생성
	 * 선정과제 목록 -> 등록 -> 등록
	 */
	@RequestMapping("/pms/bud/insertProjectData.do")
	public String insertPorjectData(@ModelAttribute("projectData") Project project, ModelMap model) throws Exception {
		
		budgetService.insertProjectInfo(project);
		
		return "forward:/pms/bud/budgetProjectListView.do";
	}
	
	/*
	 * 2020 11 12 옥승배 생성
	 * 선정과제 목록 -> 예산항목설정 -> 등록 ( insert ) (page)
	 */
	@RequestMapping("/pms/bud/insertBudget.do")
    public String insertBudget(int proId, ModelMap model) throws Exception {
		
		model.addAttribute("proId", proId);
		
		return "egovframework/com/pms/bud/BudgetRegist";
    }
	
	/*
	 * 
	 * 예산 등록
	 */
	@RequestMapping("/pms/bud/insertBudgetData.do")
	public String insertBudgetData(@ModelAttribute("budget") Budget budget, int proId, ModelMap model) throws Exception{
		
		budget.setProject_id(proId);
		budgetService.insertBudgetInfo(budget);
		return "forward:/pms/bud/budgetListView.do";
	}
}
