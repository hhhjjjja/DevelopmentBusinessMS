package egovframework.com.pms.bud.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.bud.service.Budget;
import egovframework.com.pms.bud.service.BudgetVO;
import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.bud.service.ProjectVO;

/*
 * 2020 10 30 옥승배 생성
 * 
 */

//데이터 베이스 로직을 처리하기 위한 DAO
@Repository("BudgetDAO")
public class BudgetDAO extends EgovComAbstractDAO{

	public List<?> selectProjectInfs(ProjectVO projectVO){
		List<?> dList = list("BudgetManageDAO.selectProjectInfs", projectVO);
		/*System.out.println("selectProjectInfs DAO");
		for(int i=0; i<dList.size(); i++){
			System.out.println(dList.get(i));
		}*/
		return dList; 
	}
	
	public List<?> selectBudgetListInfs(ProjectVO projectVO) {
		//System.out.println("DAO클래스의 proID값 ::" + projectVO.getProId());
		
		
		/*/System.out.println("DAO클래스에서 뽑아온 리스트들 ::");
		for(int i=0; i<dList.size(); i++) {
			System.out.println(dList.get(i));
		}*/
		List<?> dList = list("BudgetManageDAO.selectBudgetListInfs", projectVO);
		
		return dList;
	}
	
	public void insertProjectInfo(Project project) {
		//System.out.println("DAO 클래스의 insertProjectInfo");
		//insert("BudgetManageDAO.insertProjectInfo",project);
	}
	
	public Project selectProjectInfo(Project project) {
		//System.out.println("DAO 프로젝트의 selectProjectInfo까지 넘어옴");
		return (Project) selectOne("BudgetManageDAO.selectProjectInfo", project);
		//return null;
	}
	
	public List<?> selectTaskInfs(TaskVO taskVO){
		
		List<?> dList = list("BudgetManageDAO.selectTaskInfs", taskVO);
		/*System.out.println("taskInfs 데이터 받아오기 ::");
		for(int i=0; i<dList.size(); i++) {
			System.out.println(dList.get(i));
		}*/
		return dList;
	}
	public void insertBudgetInfo(Budget budget) {
		insert("BudgetManageDAO.insertBudgetInfo", budget);
	}
	
	public int selectTaskInfoCnt(TaskVO taskVO) {
		return (int)selectOne("BudgetManageDAO.selectTaskInfoCnt", taskVO);
	}
}
