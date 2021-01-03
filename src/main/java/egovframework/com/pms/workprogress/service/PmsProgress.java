package egovframework.com.pms.workprogress.service;

import java.io.Serializable;

public class PmsProgress implements Serializable
{
	private static final long serialVersionUID = -8509545779844669658L;

	/*
	 * 번호
	 */
    private int pmspsNo       = 0;

    /*
     *과제명
     */
    private String workNm      = "";

    /*
     *상세정보
     */
    private String workDc       = "";

    /*
     * 기업명
     */
    private String comNm       = "";

    /*
     * 진행여부 구분
     */
    private String pmspsSe       = "";
    
    /*
     * 진행여부 코드
     */
    private String pmspsCode       = "";

    /*
     * 성공여부 구분
     */
    private String pmsrsSe ="";
   
    /*
     * 성공여부 코드
     */
    private String pmsrsCode   = "";

    /*
     * 최초등록자ID
     */
    private String frstRegisterId = "";

    /*
     * 최종수정자ID
     */
    private String lastUpdusrId   = "";

    
	public int getPmspsNo() {
		return pmspsNo;
	}

	public void setPmspsNo(int pmspsNo) {
		this.pmspsNo = pmspsNo;
	}

	public String getWorkNm() {
		return workNm;
	}

	public void setWorkNm(String workNm) {
		this.workNm = workNm;
	}

	public String getWorkDc() {
		return workDc;
	}

	public void setWorkDc(String workDc) {
		this.workDc = workDc;
	}

	public String getComNm() {
		return comNm;
	}

	public void setComNm(String comNm) {
		this.comNm = comNm;
	}

	public String getPmspsCode() {
		return pmspsCode;
	}

	public void setPmspsCode(String pmspsCode) {
		this.pmspsCode = pmspsCode;
	}

	public String getPmsrsCode() {
		return pmsrsCode;
	}

	public void setPmsrsCode(String pmsrsCode) {
		this.pmsrsCode = pmsrsCode;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	public String getPmsrsSe() {
		return pmsrsSe;
	}

	public void setPmsrsSe(String pmsrsSe) {
		this.pmsrsSe = pmsrsSe;
	}

	public String getPmspsSe() {
		return pmspsSe;
	}

	public void setPmspsSe(String pmspsSe) {
		this.pmspsSe = pmspsSe;
	}

  
	


}
