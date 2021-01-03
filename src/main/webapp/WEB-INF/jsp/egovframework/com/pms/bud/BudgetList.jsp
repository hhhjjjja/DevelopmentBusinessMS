<%
/*
* 2020 11 10 옥승배 생성
*/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="pageTitle"><spring:message code="comBudget.projectList.budgetList.title"/></c:set>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<html>
<head>
<title>${pageTitle}<spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

</head>
<body>

<div class="board">
	<form name="budgetForm" action="<c:url value='/pms/bud/budgetListView.do?proId=${proId}'/>" method="post">
		<h1>${pageTitle} <spring:message code="title.list"/></h1>	<!-- 예산 목록 -->
		<!-- 하단버튼 -->
		<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
			<ul>
				<li>
					<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
						<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.budgetList.bimok" /></option><!-- 글 제목  -->
						<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.budgetList.saemok" /></option><!-- 글 내용 -->
						<option value="2"  <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.budgetList.saesaemok" /></option><!-- 작성자 -->
					</select>
				</li>
				<!-- 검색키워드 및 조회버튼 -->
				<li>
					<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
					<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" /><!-- 조회 -->
					<c:if test="${preview != 'true'}">
						<span class="btn_b"><a href="<c:url value='/pms/bud/insertBudget.do?proId=${proId}' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span><!-- 등록 -->
					</c:if>
				</li>
			</ul>
		</div>
	</form>
	
	<!-- 목록 영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
		<caption>${pageTitle} <spring:message code="title.list"/></caption>
		<colgroup>
			<col style="width: 4%;">
			<col style="width: 6%;">
			<col style="width: 12%;">
			<col style="width: 15%;">
			<col style="width: 25%;">
			<col style="width: 7%;">
			<col style="width: 7%;">
			<col style="width: 6%;">
		</colgroup>
		<thead>
		<tr>
			<th><spring:message code="table.num" /></th><!-- 번호 -->
			<th><spring:message code="comBudget.projectList.budgetList.bimok" /></th><!--비목 -->
			<th><spring:message code="comBudget.projectList.budgetList.saemok" /></th><!-- 세목 -->
			<th><spring:message code="comBudget.projectList.budgetList.saesaemok" /></th><!-- 세세목-->
			<th><spring:message code="comBudget.projectList.budgetList.usage" /></th><!-- 사용용도  -->
			<th><spring:message code="comBudget.projectList.budgetList.frstBudget" /></th><!-- 최초예산 -->
			<th><spring:message code="comBudget.projectList.budgetList.secBudget" /></th><!-- 변경예산 -->
			<th><spring:message code="comBudget.projectList.budgetList.budgetExce" /></th><!-- 예산집행여부 -->
		</tr>
		</thead>
		<tbody class="ov">
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="5"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<tr>
				<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				<td><c:out value='${resultInfo.item}'/></td><!-- 비목 -->	
				<td><c:out value='${resultInfo.detail}'/></td><!-- 세목 -->
				<td><c:out value='${resultInfo.moreDetail}'/></td><!-- 세세목 -->
				<td><c:out value='${resultInfo.purpose}'/></td><!-- 사용용도 -->
				<td><c:out value='${resultInfo.initBudget}'/></td><!-- 최초예산(만원) -->
				<td><c:out value='${resultInfo.changeBudget}'/></td><!-- 변경예산(만원) -->
				<td><c:out value='${resultInfo.isBudgetExecute}'/></td><!-- 예산집행여부 -->
			</tr>	
			</c:forEach>
		</tbody>
	</table>

</div>


</body>
</html>