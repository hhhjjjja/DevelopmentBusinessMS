package egovframework.com.pms.ann.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.pms.ann.service.Task;
import egovframework.com.pms.ann.service.TaskService;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
/*
 * 공모사업 관리 service implement 클래스
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

@Service("TaskServiceImpl")
public class TaskServiceImpl extends EgovAbstractServiceImpl implements TaskService {
	
	@Resource(name = "TaskDAO")
	private TaskDAO taskDAO;
	
	@Override
	public List<?> selectTaskInfs(TaskVO taskVO) {
		List<?> result = taskDAO.selectTaskInfs(taskVO);
		return result;
	}

	@Override
	public void insertTask(Task task) throws Exception {
		taskDAO.insertTask(task);
	}


	@Override
	public List<?> selectComList(TaskVO taskVO) {
		return taskDAO.selectComList(taskVO);
	}


	@Override
	public Task selectTaskDetail(Task task) throws Exception {
		// TODO Auto-generated method stub
		return taskDAO.selectTaskDetail(task);
	}
	
	@Override
	public Task findTaskId(Task task) throws Exception {
		// TODO Auto-generated method stub
		return taskDAO.findTaskId(task);
	}
	
	@Override
	public List<Task> findTaskName(TaskVO taskVO) {
		List<Task> result = taskDAO.findTaskName(taskVO);
		return result;
	}

}
