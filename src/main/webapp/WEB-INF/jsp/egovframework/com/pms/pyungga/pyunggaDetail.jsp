<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="pms.pyungga.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title><!-- 게시판 목록 -->

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script> 

<script type="text/javaScript" language="javascript">

function fn_egov_downFile(atchFileId,fileSn){
	window.open("<c:url value = '/pyungga/downloadFile.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
}

</script>
</head>
<body>

<!-- <form name="ProjectListForm" action="<c:url value='/cop/bbs/selectBBSMasterInfs.do'/>" method="post" onSubmit="fn_egov_search_bbssj(); return false;">-->
<form name="PyunggaForm" method = "post">
<div class="board">
   <h1>${pageTitle} <spring:message code="title.list" /></h1><!-- 게시판 목록 -->
   	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="pms.pyungga.insert.title" /></caption>
	<colgroup>
		<col style="width:20%" />
			<col style="" />
	</colgroup>
	<tbody>
		<!-- 평가 id  -->
	
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyunggaid"/> </c:set>
		
		<tr>
			<th>${title}</th>
			<%-- <td><input id="pNum" name="pNum" value="${result.pNum}" title="<spring:message code='pms.pyungga.insert.pyunggaid' />"/>
		</td> --%>
					<td>${result.pNum}	</td>
		</tr>
		<tr>
			<th>과제id</th>
			<td>${result.projectid}	</td>
		</tr>
		
		<!-- 사업이름   -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.projectName"/> </c:set>
		<tr>
			<th>${title}</th>
			<td>${result.projectName}	</td>
		</tr>
		
		<!-- 평가위원   -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyunggawewon"/> </c:set>
		<tr>
			<th>${title}</th>
			<td>${result.pyunggaid}	</td>
		</tr>
		<tr>
			<th>평가위원이름</th>
			<td>${result.pyunggawewonname}	</td>
		</tr>
	
		<!-- 평가 내용  -->
		
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyungga"/> </c:set>
		<tr>
			<th>${title}</th>
			<td>${result.pyungga}	</td>
		</tr>
		
		
		<!-- 유효기간 설정  -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.start"/> </c:set>
		<tr>
			<th>${title}</th>
			<td>${result.start}			
			&nbsp;~&nbsp;
				${result.end}
			</td>
		</tr>
		<tr>
			<th>점수</th>
			<td>${result.score}</td>
		</tr>
		<tr>
			<th>합격여부</th>
			<td>${result.pass}</td>
		</tr>
		
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyungga"/> </c:set>
		<tr>
			<th>최종선정여부</th>
			<td><c:if test="${result.final1 == null}">최종 평가 중</c:if> <c:if test="${result.final1 != null}">${result.final1}</c:if>	</td>
		</tr>
		<!-- 첨부파일  -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.addfile"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
				
			 <td>
				<a href="javascript:fn_egov_downFile('FILE_000000000000511','0')">파일다운로드</a>
			</td>
			
			<%-- <td class="nopd" >
			<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="pms.pyungga.insert.addfile"/>" multiple/><!-- 첨부파일 -->
			    <div id="egovComFileList"></div>
			</td> --%>
		</tr>
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		
 		<span class="btn_s"><a href="<c:url value='/pyungga/pyunggaUpdate.do?pNum=${result.pNum}'/>"  title="<spring:message code="button.update" />  <spring:message code="input.button" />"><spring:message code="button.update" /></a></span><!-- 목록 -->
 	 		<span class="btn_s"><a href="<c:url value='/pyungga/boardListView.do'/>"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
 	
 	</div><div style="clear:both;"></div>
	
</div>
</form>
   

