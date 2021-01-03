package egovframework.com.pms.ann.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.pms.ann.service.Task;
import egovframework.com.pms.ann.service.TaskService;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/*
 * 공모사업 관리 Controller 클래스
 * @author 사업비관리_윤태준 생성
 * @since 2020.11.09
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일                수정자               수정내용
 *  -------     --------   ----------------------------
 *  2020.11.09   윤태준             생성  
 *  2020.11.12   박현정             등록 폼 생성
 *  2020.11.16   손현우             남은 부분 완성
 * </pre>
 */

@Controller
public class TaskController {
	
	//콘솔창에 원하는 로그를 보기 위한 객체
		private static final Logger LOGGER = LoggerFactory.getLogger(TaskController.class);
		
		@Resource(name = "TaskServiceImpl")
		private TaskService taskService;
		@Resource(name="egovRestDeIdGnrService")
		private EgovIdGnrService idgenService;
		
		@IncludedInfo(name="공모사업관리", order = 4000 , gid = 110)
		@RequestMapping("/pms/ann/taskListView.do")
		public String taskListView(TaskVO taskVO, ModelMap model) throws Exception {
			
			boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			model.addAttribute("isAuthenticated", isAuthenticated);
			
			List<?> result = taskService.selectTaskInfs(taskVO);
			for(int i=0; i<result.size(); i++) {
				System.out.println("공모사업 데이터" + result.get(i));
			}
			model.addAttribute("resultList", result);
			
			return "egovframework/com/pms/ann/TaskAnnouncement";
		}
		
		@RequestMapping("pms/ann/taskForm.do")
		public String taskForm() throws Exception {
			
			return "egovframework/com/pms/ann/TaskForm";
		}
		
		@RequestMapping("/pms/ann/insertTask.do")
		public String insertForm(Task task, ModelMap model) throws Exception {
			System.out.println("insertData");
			System.out.println(task.getTaskNm());
			System.out.println(task.getTaskEndDate());
			
			task.setTask_id(idgenService.getNextIntegerId()%1000000);
			
			taskService.insertTask(task);
			
			return null;
		}
}
