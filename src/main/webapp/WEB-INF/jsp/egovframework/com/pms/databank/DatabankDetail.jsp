<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8");%>

<c:set var="pageTitle"><spring:message code="pms.databank.form.title"/></c:set>
<c:set var="fileCnt" value="${fileCnt}" ></c:set>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<html>
<head>
<meta charset="UTF-8">
<title>데이터 상세</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list(){
	location.href = "<c:url value='/pms/databank/boardListView.do' />";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify(){
	var varForm				 = document.all["Form"];
	varForm.action           = "<c:url value='/pms/databank/databankModify.do'/>";
	varForm.taskId.value   = "${result.taskId}";
	varForm.dataId.value   = "${result.dataId}";
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete(){
	if (confirm("<spring:message code='common.delete.msg'/>")) {
		var varForm				 = document.all["Form"];
		varForm.action           = "<c:url value='/pms/databank/databankRemove.do'/>";
		varForm.taskId.value   = "${result.taskId}";
		varForm.dataId.value   = "${result.dataId}";
		varForm.submit();
	}
}
/* ********************************************************
 * 파일 다운로드
 ******************************************************** */
function fn_downloadFile(fileId, originNm, fileSn) {
	var atchId = fileId;
	var origin = originNm;
	var sn = fileSn;
	
	var subForm = document.createElement('form');
	
	subForm.setAttribute("method", "post");
	subForm.setAttribute("target", "_blank");
	subForm.setAttribute("action", "<c:url value='/pms/databank/downloadFile.do'/>");
	
	var input1 = document.createElement('input');
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "atchFileId");
	input1.setAttribute("value", atchId);
	
	var input2 = document.createElement('input');
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "fileSn");
	input2.setAttribute("value", sn);
	
	subForm.appendChild(input1);
	subForm.appendChild(input2);
	
	document.body.appendChild(subForm);
	subForm.submit();
}
</script>

</head>
<body>

<div class="board">
	<h1>데이터 상세</h1>
		
	<table class="wTable">
		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="pms.databank.busName" /></th><!-- 사업명 -->
			<td class="left">
			    ${result.bussNm}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.comName" /></th> <!-- 기업명 -->
			<td class="left">
			    ${result.comNm}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.ex" /></th><!-- 자료정보 -->
			<td class="left">
			    <textarea class="textarea"  cols="75" rows="14"  style="height:190px;" disabled title="<spring:message code="pms.databank.ex" />"><c:if test="${result.bussEx == ''}">- 업데이트 내용 없음 -</c:if>${result.bussEx}</textarea><!-- 자료정보 -->
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.data"/></th>	<!-- 첨부 -->
			<td>	<!-- 첨부파일 List 출력 -->
				<c:if test="${fileCnt == 0}">첨부파일이 없습니다</c:if>
				<c:if test="${fileCnt != 0}">
					<table>
						<c:forEach items="${fileList}" var="fileList" varStatus="status">
							<tr style="cursor:pointer;cursor:hand;" >
								<td style="text-align:left;"><a href="#noscript" onclick="fn_downloadFile('${fileList.fileId}', '${fileList.orignlFileNm}', '${fileList.fileSn}'); return false;">${fileList.orignlFileNm}</a> &nbsp; &#40;${fileList.fileSize/1000} MB&#41;</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.column4" /></th><!-- 업데이트 날짜 -->
			<td class="left">
			    ${result.date}
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify(); return false;" /><!-- 수정 -->
		<span class="btn_s"><a href="#noscript" onclick="fn_egov_delete(); return false;"><spring:message code="button.delete" /></a></span><!-- 삭제 -->
		<span class="btn_s"><a href="#noscript" onclick="fn_egov_list(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>

</div>

<form name="Form" method="post" action="">
	<input type=hidden name="taskId">
	<input type=hidden name="dataId">
	<input type=hidden name="atchFileId">
	<input type="submit" id="invisible" class="invisible">
</form>

</body>
</html>