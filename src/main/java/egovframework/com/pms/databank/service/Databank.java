package egovframework.com.pms.databank.service;

import java.sql.Date;

/**
 * 데이터뱅크 모델
 * 2020.11.04 생성
 */

public class Databank {

	private int dataId=0;			//데이터뱅크id
	private String bussNm="";		//사업명
	private String comNm="";		//기업명
	private String bussEx="";		//데이터뱅크내용
	private Date date=null;			//데이터뱅크날짜
	private String atchFileId=null;	//첨부파일 id
	private int taskId=0;
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}
	public String getBussNm() {
		return bussNm;
	}
	public void setBussNm(String bussNm) {
		this.bussNm = bussNm;
	}
	public String getComNm() {
		return comNm;
	}
	public void setComNm(String comNm) {
		this.comNm = comNm;
	}
	public String getBussEx() {
		return bussEx;
	}
	public void setBussEx(String bussEx) {
		this.bussEx = bussEx;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
