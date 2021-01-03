<%
/*
*	2020 11 09 옥승배 생성
*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle"><spring:message code="comBudget.projectList.projectName"/></c:set>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle}<spring:message code="title.detail"/></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

</head>
<body>
<!--<form name="BBSMasterForm" action="<c:url value='/cop/bbs/updateBBSMasterView.do'/>" method="post">-->
<from action="<c:url value='/pms/bud/budgetProjectListView.do'/>" method="post">
	<div class="wTableFrm">
		<!-- 타이틀 -->
		<h2>${pageTitle} <spring:message code="title.detail"/></h2><!-- 선정과제 상세조회 -->
		
		<!-- 상세조회 -->
		<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
		<caption>${pageTitle} <spring:message code="title.detail"/></caption>
		<colgroup>
			<col style="width: ;">
			<col style="width: ;">
			<col style="width: ;">
			<col style="width: ;">
			<col style="width: ;">
			<col style="width: ;">
		</colgroup>
		<tbody>
			<!-- 과제명 -->
			<tr>
				<th><spring:message code="comBudget.projectList.detail.proName"/></th>
				<td colspan="5" class="left">${resultProject.proName}</td>
				
			</tr>
			<!-- 과제 내용 -->
			<tr>
				<th><spring:message code="comBudget.projectList.detail.proContent"/></th>
				<td colspan="5" class="cnt">
					${resultProject.proContent}
				</td>
			</tr>
			<!-- 과제 연도, 과제 선정 여부 , 과제 완료 여부  -->
			<th><spring:message code="comBudget.projectList.detail.proDate"/></th>
			<td class="left">${resultProject.proDate}</td>
			<th><spring:message code="comBudget.projectList.detail.proIsSelect"/></th>
			<td class="left">${resultProject.selectName}</td>
			<th><spring:message code="comBudget.projectList.detail.proIsSuccess"/></th>
			<td class="left">${resultProject.successName}</td>
		</tbody>
		</table>
		<!-- 하단버튼 -->
		<div class="btn">
			<span class="btn_s" onclick="history.back()"><a <c:if test='${result.cmmntyId != null}'>?cmmntyId=${result.cmmntyId}</c:if>"  title="<spring:message code="title.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
		</div>
	</div>
	
</from>

</body>
</html>