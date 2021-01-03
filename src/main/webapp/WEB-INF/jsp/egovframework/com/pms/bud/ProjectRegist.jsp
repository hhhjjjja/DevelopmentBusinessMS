<%
/*
*	2020 11 10 옥승배 생성
*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comBudget.projectList.projectName"/></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle} <spring:message code="title.create" /></title><!-- 과제 등록 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

</head>
<body>
<form action="<c:url value='/pms/bud/insertProjectData.do'/>" method="post">
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle}<spring:message code="title.create"/></h2><!-- 선정과제 등록 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
		<caption>${pageTitle} <spring:message code="title.create" /></caption>
		<colgroup>
			<col style="width: 20%;">
			<col style="width: ;">
		</colgroup>
		<tbody>
			<!-- 입력 -->
			<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
			<!-- 게시판명 -->
			<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.bbsNm"/> </c:set>
			<tr>
				<th><spring:message code="comBudget.projectList.insert.proName" /> <span class="pilsu">*</span></th><!-- 과제명 -->
				<td class="left">
					<input type="text" id="proName" name="proName" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.insert.proName' />"/>
				</td>
			</tr>
			<tr>
				<th><spring:message code="comBudget.projectList.insert.proContent" /> <span class="pilsu">*</span></th><!-- 과제내용 -->
				<td class="left">
					<input type="text" id="proContent" name="proContent" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.insert.proContent' />"/>
				</td>
			</tr>
			<tr>
				<th><spring:message code="comBudget.projectList.insert.proYear" /> <span class="pilsu">*</span></th><!-- 과제연도 -->
				<td class="left" colspan="3">
					<input type="text" id="proDate" name="proDate" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.insert.proYear' />"/>
					<div><form:errors cssClass="error" /></div>       
					<div><form:errors cssClass="error" /></div>
				</td>
			</tr>
			<tr>
				<th><spring:message code="comBudget.projectList.insert.isSelect" /> <span class="pilsu">*</span></th><!-- 과제선정여부 -->
				<td class="left">
					<select name="isSelect" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
						<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.insert.isSelectY" /></option><!-- Y-->
						<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.insert.isSelectN" /></option><!-- N-->
					</select>
				</td>
			</tr>
			<tr>
				<th><spring:message code="comBudget.projectList.insert.isSuccess" /> <span class="pilsu">*</span></th><!-- 과제완료여부 -->
				<td class="left">
					<select name="isSuccess" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
						<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.insert.isSuccessY" /></option><!-- Y-->
						<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.insert.isSuccessN" /></option><!-- N-->
					</select>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /><!-- 등록 -->
		<span class="btn_s" onclick="history.back()"><a title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
	</div><div style="clear:both;"></div>
</div>
</form>

</body>
</html>