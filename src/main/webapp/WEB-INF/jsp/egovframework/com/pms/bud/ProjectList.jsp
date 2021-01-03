<%
 /**
  * 2020 11 04 옥승배 생성
  *
  */
  
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comBudget.projectList.projectName"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title><!-- 선정과제 목록 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<meta charset="UTF-8">
<script type="text/javascript">

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_project(){
	document.ProjectListForm.pageIndex.value = 1;
	document.ProjectListForm.submit();
}
</script>
</head>
<body>

<!-- <form name="ProjectListForm" action="<c:url value='/cop/bbs/selectBBSMasterInfs.do'/>" method="post" onSubmit="fn_egov_search_bbssj(); return false;">-->
<form name="ProjectListForm" action="<c:url value='/pms/bud/budgetProjectListView.do?taskId=${taskId}'/>" method = "post">
<div class="board">
	<h1>${pageTitle} <spring:message code="title.list"/></h1><!-- 선정과제 목록 -->
	<!-- 하단 버튼 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
					<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.searchProjectName" /></option><!-- 과제명 -->
					<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comBudget.projectList.searchSelection" /></option><!-- 과제선정여부-->
				</select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" /><!-- 조회 -->
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle}<spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 50%;">
		<col style="width: 20%;">
		<col style="width: 20%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th class="board_th_link"><spring:message code="comBudget.projectList.searchProjectName" /></th><!-- 과제명 -->
		<th><spring:message code="comBudget.projectList.listBudget" /></th><!-- 예산관리 -->
		<th><spring:message code="comBudget.projectList.listSelection" /></th><!-- 과제선정여부 -->
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
			<td>
				<a href="<c:url value='/pms/bud/selectProjectDetail.do?proId=${resultInfo.proId}'/>"><c:out value='${resultInfo.proName}'/></a><!-- 과제명 -->
			</td>	
			<td>
				<a class="btn_submit" href="<c:url value='/pms/bud/budgetListView.do?proId=${resultInfo.proId}'/>"><spring:message code="comBudget.projectList.listItemConfig" /></a>	<!-- 예산항목 설정 -->
			</td>
			<!-- <td class="right"><a href="<c:url value='/cop/bbs/selectBBSMasterDetail.do?bbsId=${resultInfo.proId}'/>" onClick="fn_egov_inquire_bbsdetail('<c:out value="${resultInfo.proId}"/>');return false;"><c:out value='예산관리'/></a></td> -->
			<td><c:out value='${resultInfo.isSelect}'/></td><!-- 과제선정여부 -->
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
		</ul>
	</div>

</div>
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>


</body>
</html>