<%
/*

 * << 개정이력(Modification Information) >>
 *   
 *   수정일                수정자               수정내용
 *  -------     --------   ----------------------------
 *  2020.11.12   	옥승배			생성  
 *   
 * </pre>
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comBudget.projectList.budgetList.insert.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title> 
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
</head>
<body>
<form action="<c:url value='/pms/bud/insertBudgetData.do?proId=${proId}'/>" method="post">
	<div class="wTableFrm">
		<!-- 타이틀 -->
		<h2>${pageTitle}<spring:message code="title.create"/></h2><!-- 예산 등록 -->
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
					<th><spring:message code="comBudget.projectList.budgetList.bimok" /> <span class="pilsu">*</span></th><!-- 비목 -->
					<td class="left">
						<input type="text" id="item" name="item" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.budgetList.bimok' />"/>
					</td>
				</tr>
				<tr>
					<th><spring:message code="comBudget.projectList.budgetList.saemok" /> <span class="pilsu">*</span></th><!-- 세목 -->
					<td class="left">
						<input type="text" id="detail" name="detail" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.budgetList.saemok' />"/>
					</td>
				</tr>
				<tr>
					<th><spring:message code="comBudget.projectList.budgetList.saesaemok" /> <span class="pilsu">*</span></th><!-- 세세목 -->
					<td class="left">
						<input type="text" id="moreDetail" name="moreDetail" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.budgetList.saesaemok' />"/>
					</td>
				</tr>
				<tr>
					<th><spring:message code="comBudget.projectList.budgetList.usage" /> <span class="pilsu">*</span></th><!-- 사용용도 -->
					<td class="left">
						<input type="text" id="purpose" name="purpose" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.budgetList.usage' />"/>
					</td>
				</tr>
				<tr>
					<th><spring:message code="comBudget.projectList.budgetList.frstBudget" /> <span class="pilsu">*</span></th><!-- 최초예산 -->
					<td class="left">
						<input type="text" id="initBudget" name="initBudget" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.budgetList.frstBudget' />"/>
					</td>
				</tr>
				<tr>
					<th><spring:message code="comBudget.projectList.budgetList.secBudget" /> <span class="pilsu">*</span></th><!-- 변경예산 -->
					<td class="left">
						<input type="text" id="changeBudget" name="changeBudget" size="50" maxlength="50" title="<spring:message code='comBudget.projectList.budgetList.secBudget' />"/>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 하단버튼 -->
		<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /><!-- 등록 -->
		<span class="btn_s" onclick="history.back()"><a title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
	</div><div style="clear:both;"></div>
	</div>
</form>
</body>
</html>