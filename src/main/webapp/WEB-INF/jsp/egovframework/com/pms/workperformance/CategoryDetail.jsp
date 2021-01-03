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
<title>상세정보</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript">
/* (function() {
	if(${performCat} == 0) {
		var viewTbl = document.getElementById('Tech');
		alert(viewTbl);
		viewTbl.style.visibility = "visible";
	} else if(${performCat} == 1) {
		var viewTbl = document.getElementById('Mon');
		alert(viewTbl);
		viewTbl.style.visibility = "visible";
	} else if(${performCat} == 2) {
		var viewTbl = document.getElementById('Recruit');
		alert(viewTbl);
		viewTbl.style.visibility = "visible";
	}
})() */
</script>

</head>
<body>
<div class="board">
	<h1>상세정보</h1>
	<table class="board_list" style="text-align:center;">
		
			<c:if test="${performCat == 0}">
			<colgroup>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
			</colgroup>
			<thead>
				<tr>
					<th>연도</th>
					<th>등록일</th>
					<th>특허권</th>
					<th>지식재산권</th>
					<th>논문등록</th>
					<th>총 등록수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list}" var="resList" varStatus="status">
				<tr>
					<td>${resList.performDate}</td>
					<td>${resList.updateDate}</td>
					<td>${resList.patent}</td>
					<td>${resList.intel}</td>
					<td>${resList.article}</td>
					<td>${resList.patent+resList.intel+resList.article}</td>
				</tr>
				</c:forEach>

			</tbody>
			</c:if>
			
			<c:if test="${performCat == 1}">
			<colgroup>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
			</colgroup>
			<thead>
				<tr>
					<th>연도</th>
					<th>등록일</th>
					<th>사업화매출</th>
					<th>기술료지원액</th>
					<th>총매출</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="resList" varStatus="status">
				<tr>
					<td>${resList.performDate}</td>
					<td>${resList.updateDate}</td>
					<td>${resList.take}</td>
					<td>${resList.subTake}</td>
					<td>${resList.take+resList.subTake}</td>
				</tr>
				</c:forEach>
			</tbody>
			</c:if>
			<c:if test="${performCat == 2}">
			<colgroup>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
				<col style="width:20%"/>
			</colgroup>
			<thead>
				
				<tr>
					<th>연도</th>
					<th>등록일</th>
					<th>신규인력채용 (명)</th>
					<th>청년채용 (명)</th>
					<th>비정규직전환 (명)</th>
					<th>총 고용창출 성과(명)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="resList" varStatus="status">
					<tr>
						<td>${resList.performDate}</td>
						<td>${resList.updateDate}</td>
						<td>${resList.emplNum}</td>
						<td>${resList.youthRecruit}</td>
						<td>${resList.regWorker}</td>
						<td>${resList.emplNum+resList.youthRecruit+resList.regWorker}</td>
					</tr>
				</c:forEach>
			</tbody>
			</c:if>		
	</table>
</div>
</body>
</html>