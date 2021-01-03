package egovframework.com.pms.ann.service;

/*
 * 공모사업 관리 모델 클래스
 * @author 사업비관리_윤태준 생성
 * @since 2020.11.09
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일                수정자               수정내용
 *  -------     --------   ----------------------------
 *  2020.11.09   윤태준             생성  
 *  2020.11.12   박현정             테이블변경사항으로 수정했슴당
 *  
 * </pre>
 */
@SuppressWarnings("serial")
public class Task {
	
	private int task_id;      //사업 id
	private String taskNm;    //사업이름
	private String taskCntnt; //사업내용
	private String taskStartDate;  //사업시작날짜
	private String taskEndDate;	//사업종료날짜
	private int atchFileId;		//공고파일 id
	
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getTaskNm() {
		return taskNm;
	}
	public void setTaskNm(String taskNm) {
		this.taskNm = taskNm;
	}
	public String getTaskCntnt() {
		return taskCntnt;
	}
	public void setTaskCntnt(String taskCntnt) {
		this.taskCntnt = taskCntnt;
	}
	public String getTaskStartDate() {
		return taskStartDate;
	}
	public void setTaskStartDate(String taskStartDate) {
		this.taskStartDate = taskStartDate;
	}
	public String getTaskEndDate() {
		return taskEndDate;
	}
	public void setTaskEndDate(String taskEndDate) {
		this.taskEndDate = taskEndDate;
	}
	public int getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(int atchFileId) {
		this.atchFileId = atchFileId;
	}
	
}