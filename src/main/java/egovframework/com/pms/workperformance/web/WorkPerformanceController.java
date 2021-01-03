package egovframework.com.pms.workperformance.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.workperformance.service.WorkPerformanceMngService;
import egovframework.com.pms.workperformance.service.WorkPerformance;

@Controller
public class WorkPerformanceController {
	//콘솔에 로그 생성을 위한 로거
	private static final Logger LOGGER = LoggerFactory.getLogger(WorkPerformanceController.class);
	
	//@Resource 어노테이션은 이름으로 @Autowired 어노테이션은 타입으로 빈을 연결해 준다. 
	@Resource(name="WorkPerformanceMngService")
	private WorkPerformanceMngService workperformanceMngService;
	
	@IncludedInfo(name="사업성과 관리",order = 4004 ,gid = 110)
	@RequestMapping("/workperform/WorkPerformListView.do")
	public String WorkPerformanceListView(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model) throws Exception {
		
		boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		model.addAttribute("isAuthenticated", isAuthenticated);
		
		//종료된 사업 리스트
		List<?> list = workperformanceMngService.selectProjectInfs(projectVO);
		model.addAttribute("fnsList", list);
		
		return "egovframework/com/pms/workperformance/WorkPerformanceList";
	}
	
	@RequestMapping("/workperform/workListView.do")
	public String workListView(ModelMap model, WorkPerformance work, HttpServletRequest req) throws Exception {
		System.out.println("req : " + req.getParameter("taskId"));
		work.setTaskId(Integer.parseInt(req.getParameter("taskId")));
		List<?> list = workperformanceMngService.selectPerformDetail(work);
		
		System.out.println("list view " + list);
		model.addAttribute("result", list);
		
		return "egovframework/com/pms/workperformance/WorkProjectList";
	}
	
	@RequestMapping("/workperform/WorkPerformView.do")
	public String workPerformView(ModelMap model, HttpServletRequest request) throws Exception {
		WorkPerformance wk = new WorkPerformance();
		String proId = request.getParameter("proId");
		
		wk.setProId(Integer.parseInt(proId));
		
		List<?> performList = workperformanceMngService.selectPerform(wk);
		model.addAttribute("performList", performList);
		System.out.println("performList : " + performList);
		
		return "egovframework/com/pms/workperformance/WorkPerformDetail";
	}
	
	@RequestMapping("/workperform/WorkPerformRegist.do")
	public String workPerformRegist() throws Exception {
		return "egovframework/com/pms/workperformance/WorkPerformRegist";
	}
	
	@RequestMapping("/workperform/CatDetail.do")
	public String categoryDetail(HttpServletRequest request, ModelMap model) throws Exception {
		String performDate = request.getParameter("performDate");
		String proId =request.getParameter("proId");
		String performCat = request.getParameter("performCat");

		WorkPerformance wk = new WorkPerformance();
		
		wk.setProId(Integer.parseInt(proId));
		wk.setPerformDate(performDate);
		
		List<?> resList = workperformanceMngService.categoryClassf(wk);
		
		model.addAttribute("performCat", performCat);
		model.addAttribute("list", resList);
		
		return "egovframework/com/pms/workperformance/CategoryDetail";
	}
}