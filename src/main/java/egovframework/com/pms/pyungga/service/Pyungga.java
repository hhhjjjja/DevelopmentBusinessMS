package egovframework.com.pms.pyungga.service;


public class Pyungga {
	private int pNum=0; 			//순번
	private int task_id;		//사업id
	private int projectid=0;		//과제id
	private String projectName;
	private String pyungga="";		//평가내용
	private String start=null;			//게시기간 시작
	private String end=null;			//게시기간 끝
	private String pyunggaid;			//평가위원 id
	private String pyunggawewonname;//평가위원 이름
	private int score=0;			//점수
	private String pass;		//합격여부
	private String final1 ;		//최종합격여부


	public String getFinal1() {
		return final1;
	}

	public void setFinal1(String final1) {
		this.final1 = final1;
	}

	public int getpNum() {
		return pNum;
	}
	
	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getPyungga() {
		return pyungga;
	}
	public void setPyungga(String pyungga) {
		this.pyungga = pyungga;
	}
	

	public String getPyunggaid() {
		return pyunggaid;
	}

	public void setPyunggaid(String pyunggaid) {
		this.pyunggaid = pyunggaid;
	}

	public String getPyunggawewonname() {
		return pyunggawewonname;
	}

	public void setPyunggawewonname(String pyunggawewonname) {
		this.pyunggawewonname = pyunggawewonname;
	}

	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	
	
	
}
