package egovframework.com.pms.bud.service;

/*
 * 선정과제 모델
 * 2020 11 11 옥승배 생성
 * 2020 11 13 손현우 변경
 */

// @SuppressWarnings어노테이션은 이클립스에서 제공하는 컴파일 경고(노란색 경고)를 사용하지 않도록 한다.
@SuppressWarnings("serial")
public class Project {

	private int proId;	//과제id
	private int taskId; //사업id
	private String taskName; //사업명
	private String proName;	//과제이름
	private String proContent;	//과제내용
	private String proDate;	//과제연도
	private String comName; //기업이름
	
	private String typeName; //과제유형
	private String typeCode;  //과제유형 코드 COM118(과제유형)01:자유 02:지정 03:사업화지원
	
	private String selectName; //과제선정
	private String selectCode; //과제선정여부 코드 COM119(과제선정여부)01:선정 02:미선정
	
	private String successName; //성공여부
	private String successCode; //과제성공여부 코드 COM120(과제성공여부)01:성공 02:실패
	
	private String finDate; //결과처리날짜
	
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProContent() {
		return proContent;
	}
	public void setProContent(String proContent) {
		this.proContent = proContent;
	}
	public String getProDate() {
		return proDate;
	}
	public void setProDate(String proDate) {
		this.proDate = proDate;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public String getSelectCode() {
		return selectCode;
	}
	public void setSelectCode(String selectCode) {
		this.selectCode = selectCode;
	}

	public String getSuccessCode() {
		return successCode;
	}
	public void setSuccessCode(String successCode) {
		this.successCode = successCode;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getSelectName() {
		return selectName;
	}
	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}

	public String getSuccessName() {
		return successName;
	}
	public void setSuccessName(String successName) {
		this.successName = successName;
	}
	public String getFinDate() {
		return finDate;
	}
	public void setFinDate(String finDate) {
		this.finDate = finDate;
	}

}
