package egovframework.com.pms.bud.service;

import java.util.Map;

import egovframework.com.pms.ann.service.TaskVO;

/*
 * 2020 10 30 옥승배 생성
 */

public interface BudgetService {

	//선정과제 정보 불러오기 Project.jsp
	Map<String, Object> selectProjectInfs(ProjectVO projectVO);
	
	//선정과제 -> 예산항목설정 -> 예산불러오기 budgetListView.jsp
	Map<String, Object> selectBudgetList(ProjectVO projectVO) throws Exception;
	
	//선정과제 -> 등록 -> 등록
	boolean insertProjectInfo(Project project);
	
	//선정과제 -> 과제명 상세보기
	Project selectProjectInfo(Project project);
	
	//예산관리 -> 사업공고목록 select
	Map<String, Object> selectTaskInfs(TaskVO taskVO) throws Exception;
	
	void insertBudgetInfo(Budget budget);
	
	int selectTaskInfsCnt(TaskVO taskVO);
}
