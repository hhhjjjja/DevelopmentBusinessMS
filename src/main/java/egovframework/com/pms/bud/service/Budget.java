package egovframework.com.pms.bud.service;

/*
 * 예산 데이터 처리 모델 클래스
 * 2020 10 30 옥승배 생성
 */

// @SuppressWarnings어노테이션은 이클립스에서 제공하는 컴파일 경고(노란색 경고)를 사용하지 않도록 한다.
@SuppressWarnings("serial")
public class Budget {

	//2020 11 05 test\
	//2020 11 05 오후4시 16분 옥승배 test
	private int budget_id;		//예산id
	private int project_id;		//사업id
	private String item;		//비목
	private String detail;		//세목
	private String moreDetail;	//세세목
	private String purpose;		//사용용도
	private int initBudget;		//최초예산
	private int changeBudget;	//변경예산
	private int budgetExecuteIs;	//예산집행여부
	private String registerDate;		//등록일
	
	public int getBudget_id() {
		return budget_id;
	}
	public void setBudget_id(int budget_id) {
		this.budget_id = budget_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getMoreDetail() {
		return moreDetail;
	}
	public void setMoreDetail(String moreDetail) {
		this.moreDetail = moreDetail;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public int getInitBudget() {
		return initBudget;
	}
	public void setInitBudget(int initBudget) {
		this.initBudget = initBudget;
	}
	public int getChangeBudget() {
		return changeBudget;
	}
	public void setChangeBudget(int changeBudget) {
		this.changeBudget = changeBudget;
	}
	
	public int getBudgetExecuteIs() {
		return budgetExecuteIs;
	}
	public void setBudgetExecuteIs(int budgetExecuteIs) {
		this.budgetExecuteIs = budgetExecuteIs;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	
}
