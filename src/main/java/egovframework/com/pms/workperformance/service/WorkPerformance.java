package egovframework.com.pms.workperformance.service;

public class WorkPerformance {
	private int taskId;		//사업id
	private int proId;		//과제id
	private int performId;	//성과id
	private int performCat;	//성과분류 0:과학기술, 1:매출, 2:고용창출
	private String performDate;
	private String take;	//사업화매출
	private String subTake;	//기술료지원액
	private String emplNum;	//신규인력
	private String patent; //특허
	private String intel;	//지식재산권
	private String article;	//논문
	private String youthRecruit; //청년채용
	private String regWorker;	//비정규직 전환
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public int getPerformId() {
		return performId;
	}
	public void setPerformId(int performId) {
		this.performId = performId;
	}
	public String getPerformDate() {
		return performDate;
	}
	public void setPerformDate(String performDate) {
		this.performDate = performDate;
	}
	public String getTake() {
		return take;
	}
	public void setTake(String take) {
		this.take = take;
	}
	public String getEmplNum() {
		return emplNum;
	}
	public void setEmplNum(String emplNum) {
		this.emplNum = emplNum;
	}
	public int getPerformCat() {
		return performCat;
	}
	public void setPerformCat(int performCat) {
		this.performCat = performCat;
	}
	public String getSubTake() {
		return subTake;
	}
	public void setSubTake(String subTake) {
		this.subTake = subTake;
	}
	public String getPatent() {
		return patent;
	}
	public void setPatent(String patent) {
		this.patent = patent;
	}
	public String getIntel() {
		return intel;
	}
	public void setIntel(String intel) {
		this.intel = intel;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getYouthRecruit() {
		return youthRecruit;
	}
	public void setYouthRecruit(String youthRecruit) {
		this.youthRecruit = youthRecruit;
	}
	public String getRegWorker() {
		return regWorker;
	}
	public void setRegWorker(String regWorker) {
		this.regWorker = regWorker;
	}
	
}
