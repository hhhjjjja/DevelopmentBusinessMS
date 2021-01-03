package egovframework.com.pms.workprogress.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.ModelMap;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.pms.workprogress.service.WorkProgressManageService;
import egovframework.com.pms.ann.service.Task;
import egovframework.com.pms.ann.service.TaskService;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.ann.service.impl.TaskServiceImpl;
import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class WorkProgressController {
   
   @Resource(name = "WorkProgressManageService")
    private WorkProgressManageService workProgressManageService;
    
   @Resource(name = "TaskServiceImpl")
   private TaskService taskService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

   @Resource(name="egovRestDeIdGnrService")
   private EgovIdGnrService idgenService;

   @Resource(name="EgovCmmUseService")
   private EgovCmmUseService cmmUseService;

   @Autowired
   private DefaultBeanValidator beanValidator;

   public BindingResult checkRestdeWithValidator(Project pmsprogress, BindingResult bindingResult){
      pmsprogress.setSuccessCode("dummy");
      beanValidator.validate(pmsprogress, bindingResult);
      return bindingResult;
   }
   
	/**
	 * 과제를 수정한다.
    * @param loginVO
    * @param Project
    * @param bindingResult
    * @param commandMap
    * @param model
    * @return "egovframework/com/pms/workprogress/WorkProgressModify"
    * @throws Exception
    */
   @RequestMapping(value="/pms/workprogress/WorkUpdate.do")
	public String updateWork (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("pmsProgress") Project pmsProgress
			, @ModelAttribute("task") Task task
			, BindingResult bindingResult
			, @RequestParam Map<?, ?> commandMap
			, ModelMap model
			) throws Exception {
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
   	if (sCmd.equals("")) { //글 수정 눌렀을 때
   		Project vo = workProgressManageService.selectPmsProgressDetail(pmsProgress);
   		model.addAttribute("pmsProgress", vo);

   		task.setTask_id(vo.getTaskId());
   		Task vo2=taskService.selectTaskDetail(task);
   		model.addAttribute("pmsProgress2", vo2);

   		ComDefaultCodeVO vo3 = new ComDefaultCodeVO();
    	vo3.setCodeId("COM118"); //과제유형 코드
        List<?> tpCodeList = cmmUseService.selectCmmCodeDetail(vo3);	        
        model.addAttribute("tpCode", tpCodeList);
       
        return "egovframework/com/pms/workprogress/WorkUpdate";
   	} else if (sCmd.equals("Modify")) { //글 수정 완료 했을 때
   		System.out.println("sexd");
   		workProgressManageService.updateWork(pmsProgress);
   		System.out.println("sexd425");
	        return "forward:/pms/workprogress/WorkListView.do";
   	} else {
   		return "forward:/pms/workprogress/WorkListView.do";
   	}
   }
   
    /**
    * 사업진행관리 리스트를 조회한다.
     * @param loginVO
     * @param searchVO
     * @param model
     * @return "egovframework/com/pms/workprogress/WorkProgressList"
     * @throws Exception
     */
   @IncludedInfo(name="사업진행관리",order = 4005 ,gid = 110)
   @RequestMapping("/pms/workprogress/WorkProgressListView.do")
    public String WorkProgressListView(@ModelAttribute("loginVO") LoginVO loginVO
         , @ModelAttribute("searchVO") ProjectVO searchVO
         , ModelMap model
         ) throws Exception 
   {
	   
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
      
      List<?> CmmnCodeList = workProgressManageService.selectPmsProgressList(searchVO);
      model.addAttribute("resultList", CmmnCodeList);

      int totCnt = workProgressManageService.selectPmsProgressListTotCnt(searchVO);
      
      paginationInfo.setTotalRecordCount(totCnt);
      model.addAttribute("paginationInfo", paginationInfo);

      return "egovframework/com/pms/workprogress/WorkProgressList";
   }
   
   @IncludedInfo(name="사업진행관리",order = 4006 ,gid = 110)
   @RequestMapping("/pms/workprogress/WorkListView.do")
    public String WorkListView(@ModelAttribute("loginVO") LoginVO loginVO
         , @ModelAttribute("searchVO") ProjectVO searchVO
         , ModelMap model
         ) throws Exception 
   {
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
      
      List<?> CmmnCodeList = workProgressManageService.selectPmsProgressList(searchVO);
      model.addAttribute("resultList", CmmnCodeList);

      int totCnt = workProgressManageService.selectPmsProgressListTotCnt(searchVO);
      paginationInfo.setTotalRecordCount(totCnt);
      model.addAttribute("paginationInfo", paginationInfo);

      return "egovframework/com/pms/workprogress/WorkList";
   }
   
    /**
     * 과제를 등록한다.
     * @param loginVO
     * @param Project
     * @param bindingResult
     * @param model
     * @return "egovframework/com/pms/workprogress/WorkProgressRegist"
     * @throws Exception
     */
   @RequestMapping(value="/pms/workprogress/WorkRegist.do")
   public String insertPmsProgress(@ModelAttribute("loginVO") LoginVO loginVO, 
         @ModelAttribute("pmsProgress") Project pmsProgress, 
         TaskVO taskVO,
         Task task,
         BindingResult bindingResult,
         ModelMap model
         )throws Exception
   {
		if(pmsProgress.getProName() == null||pmsProgress.getProName().equals("")) 
		{
	        List<Task> taskList = taskService.findTaskName(taskVO);
	        model.addAttribute("taskList", taskList);

	    	ComDefaultCodeVO vo3 = new ComDefaultCodeVO();
	    	vo3.setCodeId("COM118"); //과제유형 코드
	        List<?> tpCodeList = cmmUseService.selectCmmCodeDetail(vo3);	        
	        model.addAttribute("tpCode", tpCodeList);
	        
	        return "egovframework/com/pms/workprogress/WorkRegist";
	    }
	   System.out.println(pmsProgress.getTaskName());
	   task.setTaskNm("시스템 반도체 육성사업");
	   Task tvo=taskService.findTaskId(task);
	   System.out.println(tvo.getTask_id());
	   //pmsProgress.setTaskId(tvo.getTask_id());
       //workProgressManageService.insertPmsProgress(pmsProgress);
       return "forward:/pms/workprogress/WorkProgressListView.do";
   }

   /**
    * 사업 세부내역을 조회한다.
    * @param loginVO
    * @param Project
    * @param model
    * @return "egovframework/com/pms/workprogress/WorkProgressDetail"
    * @throws Exception
    */
	@RequestMapping(value="/pms/workprogress/WorkProgressDetail.do")
	public String selectRestdeDetail (@ModelAttribute("loginVO") LoginVO loginVO
			, Project pmsProgress
			, Task task
			, ModelMap model
			) throws Exception {
		System.out.println(pmsProgress.getProId());
		Project vo = workProgressManageService.selectPmsProgressDetail(pmsProgress);
		System.out.println(vo.getTaskName());
		task.setTask_id(vo.getTaskId());
		Task vo2=taskService.selectTaskDetail(task);
		System.out.println("sdd"+vo2.getTaskNm());
		model.addAttribute("result", vo);
		model.addAttribute("result2",vo2);

		return "egovframework/com/pms/workprogress/WorkProgressDetail";
	}
	
	 /**
	    * 과제 세부내역을 조회한다.
	    * @param loginVO
	    * @param Project
	    * @param model
	    * @return "egovframework/com/pms/workprogress/WorkProgressDetail"
	    * @throws Exception
	    */
		@RequestMapping(value="/pms/workprogress/WorkDetail.do")
		public String selectWorkDetail (@ModelAttribute("loginVO") LoginVO loginVO
				, Project pmsProgress
				, Task task
				, ModelMap model
				) throws Exception {
			System.out.println(pmsProgress.getProId());
			Project vo = workProgressManageService.selectPmsProgressDetail(pmsProgress);
			System.out.println(vo.getTaskName());
			task.setTask_id(vo.getTaskId());
			Task vo2=taskService.selectTaskDetail(task);
			System.out.println("sdd"+vo2.getTaskNm());
			model.addAttribute("result", vo);
			model.addAttribute("result2",vo2);

			return "egovframework/com/pms/workprogress/WorkDetail";
		}
		
	/**
	 * 사업을 수정한다.
     * @param loginVO
     * @param Project
     * @param bindingResult
     * @param commandMap
     * @param model
     * @return "egovframework/com/pms/workprogress/WorkProgressModify"
     * @throws Exception
     */
    @RequestMapping(value="/pms/workprogress/WorkProgressModify.do")
	public String updateRestde (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("pmsProgress") Project pmsProgress
			, @ModelAttribute("task") Task task
			, BindingResult bindingResult
			, @RequestParam Map<?, ?> commandMap
			, ModelMap model
			) throws Exception {
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
    	if (sCmd.equals("")) { //글 수정 눌렀을 때
    		Project vo = workProgressManageService.selectPmsProgressDetail(pmsProgress);
    		model.addAttribute("pmsProgress", vo);

    		task.setTask_id(vo.getTaskId());
    		Task vo2=taskService.selectTaskDetail(task);
    		model.addAttribute("pmsProgress2", vo2);

	        ComDefaultCodeVO cvo2 = new ComDefaultCodeVO();
	    	cvo2.setCodeId("COM120");
	        List<?> scCodeList = cmmUseService.selectCmmCodeDetail(cvo2);
	
	        model.addAttribute("sucCode", scCodeList);
            return "egovframework/com/pms/workprogress/WorkProgressModify";
    	} else if (sCmd.equals("Modify")) { //글 수정 완료 했을 때
    		workProgressManageService.updatePmsProgress(pmsProgress);
	        return "forward:/pms/workprogress/WorkProgressListView.do";
    	} else {
    		return "forward:/pms/workprogress/WorkProgressListView.do";
    	}
    }

	/**
	 * 선정과제를 삭제한다.
	 * @param loginVO
	 * @param Project
	 * @param model
	 * @return "forward:/pms/workprogress/WorkProgressListView.do"
	 * @throws Exception
	 */
    @RequestMapping(value="/pms/workprogress/WorkRemove.do")
	public String deleteRestde (@ModelAttribute("loginVO") LoginVO loginVO
			, Project pmsProgress
			, ModelMap model
			) throws Exception {
    	workProgressManageService.deletePmsProgress(pmsProgress);
        return "forward:/pms/workprogress/WorkListView.do";
	}

}