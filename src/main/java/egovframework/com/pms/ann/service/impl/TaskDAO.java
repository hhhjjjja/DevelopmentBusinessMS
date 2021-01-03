package egovframework.com.pms.ann.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.pms.ann.service.Task;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.bud.service.BudgetVO;

/*
 * 공모사업 DAO(DB Access Object) 클래스
 * @author 사업비관리_윤태준 생성
 * @since 2020.11.09
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일                수정자               수정내용
 *  -------     --------   ----------------------------
 *  2020.11.09   윤태준             생성  
 *   
 * </pre>
 */
@Repository("TaskDAO")
public class TaskDAO extends EgovComAbstractDAO {
	
	public List<?> selectTaskInfs(TaskVO taskVO) {
		return selectList("TaskDAO.selectTaskInfs", taskVO);
		/*return list("TaskDAO.selectTaskInfs", taskVO);*/
	}
	
	public int selectTaskInfsCnt(TaskVO taskVO) {
		System.out.println("InfsCnt 갯수 method");
		return 109;
	}
	
	public void insertTask(Task task) {
		insert("TaskDAO.insertTask", task);
		/*insert("TaskDAO.dataInit", task);*/
	}
	
	public List<?> selectComList(TaskVO taskVO) {
		return selectList("TaskDAO.selectComList",taskVO);
	}

	public Task selectTaskDetail(Task task) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(task.getTask_id());
		return (Task)selectOne("TaskDAO.selectTaskDetail",task);
	}

	public Task findTaskId(Task task) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("---->"+task.getTaskNm());
		Task task2=(Task)selectOne("TaskDAO.findTaskId",task);
		System.out.println("##>"+task2);
		return (Task)selectOne("TaskDAO.findTaskId",task);
	}

	public List<Task> findTaskName(TaskVO taskVO) {
		// TODO Auto-generated method stub
		return selectList("TaskDAO.findTaskName",taskVO);
	}
}