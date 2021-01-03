<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>eGovFrame <spring:message code="comCmm.unitContent.1"/></title>
</head>
<body>
	<c:if test="${loginVO != null}">
		${loginVO.name }<spring:message code="comCmm.unitContent.2"/> <a href="${pageContext.request.contextPath }/uat/uia/actionLogout.do"><spring:message code="comCmm.unitContent.3"/></a>
	</c:if>
	<c:if test="${loginVO == null }">
		<jsp:forward page="/uat/uia/egovLoginUsr.do"/>
	</c:if>
	<p/><p/><p/>
	
	  <div id="wrapper" class="animate">
    <div class="container-fluid" >
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body" style= "background-color:#D3D3D3">
              <h5 class="card-title">공모사업 관리</h5>
              <h6 class="card-subtitle mb-2 text-muted">지원사업 공고 관리, 지원 유형 및 지원항목 정보 등록 및 관리</h6>
              <p class="card-text">지원사업 정보를 공고하고 모집 정보를 등록 및 관리할 수 있습니다. 기업이 신청한 과제 리스트 및 상세정보 보기를 관리할 수 있습니다.</p>
              <a href="http://localhost:8080/PMS_ex/pms/ann/taskListView.do" class="card-link">공모사업 관리</a>
              <!-- <a href="http://websitedesigntamilnadu.com" class="card-link">Another link</a> -->
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <div class="card-body" style= "background-color:#D3D3D3">
              <h5 class="card-title">예산 관리</h5>
              <h6 class="card-subtitle mb-2 text-muted">예산항목 설정, 예산배정 설정, 예산집행 관리, 증빙자료 관리</h6>
              <p class="card-text">사업공고 확인 및 사업공고별 과제목록 확인, 과제목록별 예산관리를 할 수 있습니다.</p>
              <a href="http://localhost:8080/PMS_ex/pms/bud/taskList.do" class="card-link">예산 관리</a>
              <!-- <a href="http://websitedesigntamilnadu.com" class="card-link">Another link</a> -->
            </div>
          </div>
        </div>
        <div class="col" >
          <div class="card">
            <div class="card-body" style= "background-color:#D3D3D3">
              <h5 class="card-title">데이터뱅크</h5>
              <h6 class="card-subtitle mb-2 text-muted">공유데이터 및 파일 관리, 사업 자료정보 관리</h6>
              <p class="card-text">사업공고별 공유데이터 및 파일 조회 및 관리, 업데이트 자료의 정보를 관리할 수 있습니다.</p>
              <a href="http://localhost:8080/PMS_ex/pms/databank/boardListView.do" class="card-link">데이터뱅크</a>
              <!-- <a href="http://websitedesigntamilnadu.com" class="card-link">Another link</a> -->
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <div class="card-body" style= "background-color:#D3D3D3">
              <h5 class="card-title">지원사업 평가 관리</h5>
              <h6 class="card-subtitle mb-2 text-muted">평가위원 관리, 지원사업 평과관리, 지원사업 평가, 평가 자료 공유</h6>
              <p class="card-text">지원사업 평과 관리는 사업에 따른 과제들을 평가위원이 평가할 수 있습니다. </p>
              <a href="http://localhost:8080/PMS_ex/pyungga/boardListView.do" class="card-link">지원사업 평가 관리</a>
              <!-- <a href="http://websitedesigntamilnadu.com" class="card-link">Another link</a> -->
            </div>
          </div>
        </div>
      </div>
      
      
      
      
      <br><br><br><br><br><br>
      
      
      
      <div class="container-fluid">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body" style= "background-color:#D3D3D3">
              <h5 class="card-title">사업성과 관리</h5>
              <h6 class="card-subtitle mb-2 text-muted">완료사업 선정과제별 성과, 연도별 기업성과, 분류별 성과정보 조회</h6>
              <p class="card-text">진행완료된 사업의 사업별, 선정과제별 성과조회와 연도별, 분류별 성과정보를 조회 및 관리할 수 있습니다.</p>
              <a href="http://localhost:8080/PMS_ex/workperform/WorkPerformListView.do" class="card-link">사업성과 관리</a>
             <!--  <a href="http://websitedesigntamilnadu.com" class="card-link">Another link</a> -->
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <div class="card-body" style= "background-color:#D3D3D3">
              <h5 class="card-title">사업진행 관리</h5>
              <h6 class="card-subtitle mb-2 text-muted">선정과제 조회, 선정과제 성공/실패 처리</h6>
              <p class="card-text">평가에서 선정된 과제를 조회하고 선정과제별 결과를 성공/실패 처리할 수 있습니다.</p>
              <a href="http://localhost:8080/PMS_ex/pms/workprogress/WorkProgressListView.do" class="card-link">사업진행 관리</a>
              <!-- <a href="http://websitedesigntamilnadu.com" class="card-link">Another link</a> -->
            </div>
          </div>
        </div>
        
        <div class="col">
          <div class="card">
            <div class="card-body" style= "background-color:#D3D3D3	">
              <h5 class="card-title">과제현황 관리</h5>
              <h6 class="card-subtitle mb-2 text-muted">사업 과제 조회, 과제 정보 수정</h6>
              <p class="card-text">모든 사업의 과제를 조회할 수 있으며 과제별 정보를 수정할 수 있습니다.</p>
              <a href="http://localhost:8080/PMS_ex/pms/workprogress/WorkListView.do" class="card-link">과제현황 관리</a>
              <!-- <a href="http://websitedesigntamilnadu.com" class="card-link">Another link</a> -->
            </div>
          </div>
        </div>
        
        <div class="col">
        	<div width = "25%"></div>
        </div>
        
      </div>
      
	
	
	<%-- 
	
	
	
	<b><spring:message code="comCmm.unitContent.4"/><br /><br/><!-- 실행 시 오류 사항이 있으시면 표준프레임워크센터로 연락하시기 바랍니다. -->
	<b>
	
	<img src="${pageContext.request.contextPath }/images/egovframework/com/cmm/icon/tit_icon.png"> <spring:message code="comCmm.unitContent.5"/></b><p/><!-- 화면 설명 -->
	<spring:message code="comCmm.unitContent.6"/><p/><!-- 왼쪽 메뉴는 메뉴와 관련된 컴포넌트(메뉴관리, 사이트맵 등)들의 영향을 받지 않으며, -->
	<spring:message code="comCmm.unitContent.7"/><p/><!-- 각 컴포넌트를 쉽게 찾아볼 수 있는 바로 가기 링크페이지입니다. -->

	<br /><b><img src="${pageContext.request.contextPath }/images/egovframework/com/cmm/icon/tit_icon.png"> egovframework.com.cmm.web.EgovComIndexController.java</b><p/>

	<spring:message code="comCmm.unitContent.8"/><p/><!-- 컴포넌트 설치 후 설치된 컴포넌트들을 IncludedInfo annotation을 통해 찾아낸 후 -->
	<spring:message code="comCmm.unitContent.9"/><p/><br /><!-- 화면에 표시할 정보를 처리하는 Controller 클래스입니다. -->
	<spring:message code="comCmm.unitContent.10"/><p/><!-- 개발 시 메뉴 구조가 잡히기 전에 배포 파일들에 포함된 공통 컴포넌트들의 목록성 화면에 URL을 제공하여 -->
	<spring:message code="comCmm.unitContent.11"/><p/><!-- 개발자가 편리하게 활용할 수 있도록 작성되었습니다. -->
	<spring:message code="comCmm.unitContent.12"/> <p/><!-- 운영 시에 본 컨트롤을 사용하여 메뉴를 구성하는 경우, -->
	<spring:message code="comCmm.unitContent.13"/><p/><!-- 성능 문제를 일으키거나 사용자별 메뉴 구성에 오류를 발생할 수 있기 때문에 -->
	<spring:message code="comCmm.unitContent.14"/><p /><!-- 실 운영 시에는 삭제해서 배포하는 것을 권장해 드립니다. --> --%>
</body>
</html>