<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="pageTitle"><spring:message code="pms.workperformance.title"/></c:set>

<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript">

if(!${isAuthenticated}){
	alert("로그인 후 이용할 수 있습니다.");
	window.history.back();
}

function fn_viewDetail(task_id){
	var frm =  document.all["hForm"];
	frm.taskId.value = task_id;
	frm.action = "<c:url value='/workperform/workListView.do' />";
	frm.submit();
}

</script>

</head>
<body>
<div class="board">
	<h1>${pageTitle}</h1>
	
<form name="listForm" action="<c:url value='/workperform/WorkPerformListView.do'/>" method="post">
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCondition" class="select" title="" id = "searchCondition" >
				<option selected value=''><spring:message code="sym.cal.select" /></option><!-- --선택하세요-- -->
				<option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>><spring:message code="pms.workperformance.column2" /></option><!-- 사업명 -->
				<%-- <option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>><spring:message code="pms.databank.comName" /></option><!-- 기업명 --> --%>
				</select>
				<input id="searchKeyword" class="s_input2 vat" name="searchKeyword" type="text" value="${searchVO.searchKeyword}" maxlength="35" size="35" onkeypress="press();" />
				
				<span class="btn_b" style="text-align:center;"><a href="#noscript" onclick="fn_egov_search_data(); return false;" title="<spring:message code="button.inquire" />"><spring:message code="button.inquire" /></a></span>
			<%-- 	<input class="s_btn" type="submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="fn_egov_regist_data(); return false;" /> --%>
			</li>
		</ul>
	</div>
	
	<table class="board_list">
		<caption></caption>
		<colgroup>
			<col style="width:15%" />
			<col style="width:50%" />
			<col style="width:35%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><spring:message code="pms.workperformance.column1"></spring:message></th>	<!-- 번호 -->
				<th scope="col"><spring:message code="pms.workperformance.pro"></spring:message></th>	<!-- 사업명 -->
				<th scope="col"><spring:message code="pms.workperformance.column5"></spring:message></th>	<!-- 진행기간 -->
			</tr>
		</thead>
		<tbody class="ov">
			<c:forEach items="${fnsList}" var="projectInfo" varStatus="status">
				<tr style="cursor:pointer;cursor:hand;" onclick="fn_viewDetail('${projectInfo.taskId}');">
					<td><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
					<td>${projectInfo.taskNm}</td>
					<td>${projectInfo.taskStartDate} ~ ${projectInfo.taskEndDate}</td>
				</tr>
			</c:forEach>
			
			<c:if test="${fn:length(fnsList) == 0}">
				<tr>
					<td colspan=3>
						<spring:message code="common.nodata.msg" />
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</form>
</div>

<form name="hForm" method="post">
	<input type="hidden" name="taskId" value=''/>
	<input type="submit" id="invisible" class="invisible"/>
</form>
</body>
</html>