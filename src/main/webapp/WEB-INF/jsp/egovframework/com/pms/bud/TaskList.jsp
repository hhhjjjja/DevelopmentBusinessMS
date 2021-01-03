<%
 /**
  * 2020 11 13 옥승배 생성
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comBudget.taskList.title"/></c:set>
<script type="text/javascript">
function fn_egov_pageview(pageNo){
	   document.listForm.pageIndex.value = pageNo;
	   document.listForm.action = "<c:url value='/pms/bud/taskList.do'/>";
	    document.listForm.submit();
	}

if(!${isAuthenticated}){
	alert("로그인 후 이용할 수 있습니다.");
	window.history.back();
}

</script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>${pageTitle} <spring:message code="title.list" /></title><!-- 사업공고 목록 -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

</head>
<body>
<div class="board">
<h1>${pageTitle} <spring:message code="title.list" /></h1><!-- 사업공고 목록 -->
<form name="ProjectListForm" >
	
	
		<!-- 하단 버튼 -->
		<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
					<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comBudget.taskList.taskName" /></option><!-- 사업이름 -->
					<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comBudget.taskList.taskContent" /></option><!-- 사업내용-->
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
		<col style="width: 20%;">
		<col style="width: 50%;">
		<col style="width: 20%;">
		<col style="width: 20%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th class="board_th_link"><spring:message code="comBudget.taskList.taskName" /></th><!-- 사업명 -->
		<th><spring:message code="comBudget.taskList.taskContent" /></th><!-- 사업내용 -->
		<th><spring:message code="comBudget.taskList.taskSrtDate" /></th><!-- 사업시작날짜 -->
		<th><spring:message code="comBudget.taskList.taskEndDate" /></th><!-- 사업종료날짜 -->
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
				<a href="<c:url value='/pms/bud/budgetProjectListView.do?taskId=${resultInfo.taskId}'/>"><c:out value='${resultInfo.taskName}'/></a><!-- 과제명 -->
			</td><!-- 사업명 -->
			<td><c:out value='${resultInfo.taskContent}'/></td><!-- 사업내용 -->
			<td><c:out value='${resultInfo.taskSrtDate}'/></td><!-- 사업시작날짜-->
			<td><c:out value='${resultInfo.taskEndDate}'/></td><!-- 사업종료날짜-->
		</tr>
	</c:forEach>
	</tbody>
	</table>
	 <!-- paging navigation -->
   <div class="pagination">
      <ul>
         <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_pageview"/>
      </ul>
   </div>
   <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
   
</form>


</div>

</body>
</html>