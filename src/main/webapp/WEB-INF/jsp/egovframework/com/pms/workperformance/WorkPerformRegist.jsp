<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성과등록</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

</head>
<body>
<div class="board">
	<h1>성과등록</h1>
	
	<table class="board_list">
		<thead>
			<tr>
				<th>연도</th>
				<th>과제명</th>
				<th>기업명</th>
				<th>매출액</th>
				<th>고용인원</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${result}" var="list" varStatus="status">
				<tr>
					<td>${list.performDate}</td>		<!-- 연도 -->
					<td>${list.proNm}</td>		<!-- 연도 -->
					<td>${list.comNm}</td>		<!-- 연도 -->
					<td>${list.take} (만원)</td>		<!-- 연도 -->
					<td>${list.emplNum} (명)</td>		<!-- 연도 -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>