package egovframework.com.pms.ann.service;

import java.util.List;
/*
 * 공모사업 관리 service 클래스
 * @author 사업비관리_윤태준 생성
 * @since 2020.11.09
 * @version 1.0
 * 
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일                수정자               수정내용
 *  -------     --------   ----------------------------
 *  2020.11.09   윤태준             생성  
 *   
 * </pre>
 */
import java.util.Map;

public interface TaskService {
	List<?> selectTaskInfs(TaskVO taskVO);
	
	void insertTask(Task task) throws Exception;
	
	Task selectTaskDetail(Task task) throws Exception;
	
	List<?> selectComList(TaskVO taskVO);
	
	Task findTaskId(Task task) throws Exception;

	List<Task> findTaskName(TaskVO taskVO);

}