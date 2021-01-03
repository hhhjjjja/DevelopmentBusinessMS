package egovframework.com.pms.bud.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.bud.service.Budget;
import egovframework.com.pms.bud.service.BudgetService;
import egovframework.com.pms.bud.service.BudgetVO;
import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/*
 * 2020 10 30 옥승배 생성
 * 
 */

@Service("budgetServiceImpl")
public class BudgetServiceImpl extends EgovAbstractServiceImpl implements BudgetService {

	@Resource(name = "BudgetDAO")
	private BudgetDAO budgetDao;
	
	@Override
	public Map<String, Object> selectProjectInfs(ProjectVO projectVO) {

		List<?> result =budgetDao.selectProjectInfs(projectVO);
		//int cnt = budgetDao.selectProjectInfsCnt(projectVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		//map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	}

	@Override
	public Map<String, Object> selectBudgetList(ProjectVO projectVO) throws Exception {
		
		List<?> result = budgetDao.selectBudgetListInfs(projectVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		
		return map;
	}

	@Override
	public boolean insertProjectInfo(Project project) {
		
		budgetDao.insertProjectInfo(project);
		
		return false;
	}

	@Override
	public Project selectProjectInfo(Project project) {
		
		return budgetDao.selectProjectInfo(project);
	}

	//예산관리 -> 사업공고목록 select
	@Override
	public Map<String, Object> selectTaskInfs(TaskVO taskVO) throws Exception {
		
		List<?> result = budgetDao.selectTaskInfs(taskVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		
		return map;
	}

	@Override
	public void insertBudgetInfo(Budget budget) {
		budgetDao.insertBudgetInfo(budget);
		
	}

	@Override
	public int selectTaskInfsCnt(TaskVO taskVO) {
		return budgetDao.selectTaskInfoCnt(taskVO);
	}

}
