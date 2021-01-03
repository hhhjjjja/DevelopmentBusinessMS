<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="pageTitle"><spring:message code="pms.databank.title"/></c:set>

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javaScript" language="javascript">

if(!${isAuthenticated}){
	alert("로그인 후 이용할 수 있습니다.");
	window.history.back();
}
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/pms/databank/boardListView.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_egov_search_data(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_data(){
	location.href = "<c:url value='/pms/databank/databankForm.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_databank(proId, dataId){
	var varForm				 = document.all["Form"];
	varForm.action           = "<c:url value='/pms/databank/databankDetail.do'/>";
	varForm.taskId.value   = proId;
	varForm.dataId.value = dataId;
	varForm.submit();
}

</script>

</head>
<body>
<div class="board">
	<h1>${pageTitle}</h1>
	
<form name="listForm" action="<c:url value='/pms/databank/boardListView.do'/>" method="post">
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCondition" class="select" title="" id = "searchCondition" >
				<option selected value=''><spring:message code="sym.cal.select" /></option><!-- --선택하세요-- -->
				<option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>><spring:message code="pms.databank.busName" /></option><!-- 사업명 -->
				<option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>><spring:message code="pms.databank.comName" /></option><!-- 기업명 -->
				</select>
				<input id="searchKeyword" class="s_input2 vat" name="searchKeyword" type="text" value="${searchVO.searchKeyword}" maxlength="35" size="35" onkeypress="press();" />
				<span class="btn_b"><a href="#noscript" onclick="fn_egov_search_data(); return false;" title="<spring:message code="button.inquire" />"><spring:message code="button.inquire" /></a></span>
				
				<input class="s_btn" type="submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="fn_egov_regist_data(); return false;" />
			</li>
		</ul>
	</div>
	
	<table class="board_list">
		<caption></caption>
		<colgroup>
			<col style="width:10%" />
			<col style="width:40%" />
			<col style="width:20%" />
			<col style="width:20%" />
		</colgroup>
		<thead>
			<tr>
			   <th scope="col"><spring:message code="pms.databank.column1" /></th><!-- 순번 -->
			   <th scope="col"><spring:message code="pms.databank.column2" /></th><!-- 과제명 -->
			   <th scope="col"><spring:message code="pms.databank.column3" /></th><!-- 기업명 -->
			   <th scope="col"><spring:message code="pms.databank.column4" /></th><!-- 업데이트 날짜 -->
			</tr>
		</thead>
		<tbody class="ov">
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr style="cursor:pointer;cursor:hand;" onclick="fn_egov_detail_databank('${resultInfo.proId}', '${resultInfo.dataId}'); return false;">
					<td><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
					<td>${resultInfo.proNm}</td>
					<td>${resultInfo.comNm}</td>
					<td>${resultInfo.uDate}</td>
				</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan=4>
						<spring:message code="common.nodata.msg" />
					</td>
				</tr>
			</c:if>
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

<form name="Form" method="post">
	<input type="hidden" name="taskId"/>
	<input type="hidden" name="dataId"/>
	<input type="submit" id="invisible" class="invisible"/>
</form>

</div>

</body>
</html>