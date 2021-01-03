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
<title>Insert title here</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

</head>
<body>
<div class="board">
	<h1>과제별 성과조회</h1>
	<table class="board_list">
		<colgroup>
			<col style="width:15%" />
			<col style="width:25%" />
			<col style="width:25%" />
			<col style="width:25%" />
		</colgroup>
		<thead>
			<tr>
				<th>연도</th>
				<th>과학기술연구성과 (건)</th>
				<th>사업화 총매출 (만원)</th>
				<th>고용창출 (명)</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${performList}" var="list" varStatus="status">
				<tr>
					<td>${list.performDate}</td>
					
					<td><a href="CatDetail.do?performCat=0&performDate=${list.performDate}&proId=${list.proId}">${list.sPatent + list.sIntel + list.sArticle}</a></td>
					<td><a href="CatDetail.do?performCat=1&performDate=${list.performDate}&proId=${list.proId}">${list.sTake + list.sSubTake}</a></td>
					<td><a href="CatDetail.do?performCat=2&performDate=${list.performDate}&proId=${list.proId}">${list.sEmplNum + list.sYouth + list.sRegWorker}</a></td>
					
					<%-- <td><a href="CatDetail.do?performCat=0&performDate=${list.performDate}&patent=${list.sPatent}&intel=${list.sIntel}&article=${list.sArticle}">${list.sPatent + list.sIntel + list.sArticle}</a></td>
					<td><a href="CatDetail.do?performCat=1&performDate=${list.performDate}&take=${list.sTake}&subTake=${list.sSubTake}">${list.sTake + list.sSubTake}</a></td>
					<td><a href="CatDetail.do?performCat=2&performDate=${list.performDate}&emplNum=${list.sEmplNum}&youthRecruit=${list.sYouth}&regWorker=${list.sRegWorker}">${list.sEmplNum + list.sYouth + list.sRegWorker}</a></td> --%>
				</tr>
			</c:forEach>
			
			<c:if test="${fn:length(performList) == 0}">
				<tr>
					<td colspan=4>
						<spring:message code="common.nodata.msg" />
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
</body>
</html>