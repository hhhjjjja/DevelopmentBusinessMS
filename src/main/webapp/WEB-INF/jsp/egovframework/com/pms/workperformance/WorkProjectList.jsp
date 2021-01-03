<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">

<title>성과조회</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript">

function fn_viewPerform(proId){
  	var varForm = document.all["Form"];
	varForm.action           = "<c:url value='/workperform/WorkPerformView.do'/>";
	varForm.proId.value = proId;
	varForm.submit();
}

</script>

</head>
<body>
<div class="board">
	<h1> 성과조회</h1>
	
	<table class="board_list">
		<caption></caption>
		<colgroup>
			<col style="width:10%" />
			<col style="width:40%" />
			<col style="width:20%" />
			<col style="width:30%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><spring:message code="pms.workperformance.column1"></spring:message></th>	<!-- 번호 -->
				<th scope="col"><spring:message code="pms.workperformance.column2"></spring:message></th>	<!-- 과제명 -->
				<th scope="col"><spring:message code="pms.workperformance.column3"></spring:message></th>	<!-- 담당기업 -->
				<th scope="col" colspan="2"><spring:message code="pms.workperformance.column4"></spring:message></th>	<!-- 성과보기 -->
			</tr>
		</thead>
		<tbody class="ov">
 			<c:forEach items="${result}" var="projectInfo" varStatus="status">
				<tr style="cursor:pointer;cursor:hand;">
					<td><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
					<td>${projectInfo.proNm}</td>
					<td>${projectInfo.comNm}</td>
					<td><a class="btn_submit" href="#noscript" onclick="fn_viewPerform('${projectInfo.proId}');"><spring:message code="pms.workperformance.viewPerform" /></a></td>
				</tr>
				<input type="hidden" id="taskName" value="${projectInfo.taskNm}"/>
			</c:forEach>
			
			<c:if test="${fn:length(result) == 0}">
				<tr>
					<td colspan=5>
						<spring:message code="common.nodata.msg" />
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<form name="Form" method="post" action="">
	<input type=hidden name="taskId">
	<input type=hidden name="proId">
	<input type="submit" id="invisible" class="invisible">
</form>

</body>
</html>