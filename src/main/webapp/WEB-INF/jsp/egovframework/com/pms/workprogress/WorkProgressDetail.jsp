<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="pageTitle"><spring:message code="pms.workprogress.detailTitle"/></c:set>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>${pageTitle}</title>
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_PmsProgress(){
	location.href = "<c:url value='/pms/workprogress/WorkProgressListView.do' />";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify_PmsProgress(){
	var varForm				 = document.all["Form"];
	varForm.action           = "<c:url value='/pms/workprogress/WorkProgressModify.do'/>";
	varForm.proId.value   = "${result.proId}";
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_PmsProgress(){
	if (confirm("<spring:message code='common.delete.msg'/>")) {
		var varForm				 = document.all["Form"];
		varForm.action           = "<c:url value='/pms/workprogress/WorkProgressRemove.do'/>";
		varForm.proId.value   = "${result.proId}";
		varForm.submit();
	}
}

</script>
</head>
<body>
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle}</h2>

	<!-- 출력폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="pms.workprogress.comName" /> <span class="pilsu">*</span></th> <!-- 기업명 -->
			<td class="left">
			    ${result.comName}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.taskName" /> <span class="pilsu">*</span></th><!-- 사업명 -->
			<td class="left">
				${result.taskName}
			</td>
		</tr>
        <tr>
			<th><spring:message code="pms.workprogress.taskContent" /> <span class="pilsu">*</span></th><!-- 사업내용 -->
			<td class="left">
			    <textarea class="textarea"  cols="75" rows="14"  style="height:190px;" disabled title="<spring:message code="pms.workprogress.taskContent" />">${result2.taskCntnt}</textarea>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.typeName" /> <span class="pilsu">*</span></th><!-- 과제유형 -->
			<td class="left">
				${result.typeName}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.workName" /> <span class="pilsu">*</span></th><!-- 과제명 -->
			<td class="left">
				${result.proName}
			</td>
		</tr>
	
		<tr>
			<th><spring:message code="pms.workprogress.workDetail" /> <span class="pilsu">*</span></th><!-- 과제설명 -->
			<td class="left">
			    <textarea class="textarea"  cols="75" rows="14"  style="height:190px;" disabled title="<spring:message code="pms.workprogress.workDetail" />">${result.proContent}</textarea>
			</td>
		</tr>		
		
		<tr>
			<th><spring:message code="pms.workprogress.taskStartDate" /> <span class="pilsu">*</span></th><!-- 사업시작날짜 -->
			<td class="left">
				${result2.taskStartDate}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.taskEndDate" /> <span class="pilsu">*</span></th><!-- 사업종료날짜 -->
			<td class="left">
				${result2.taskEndDate}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.success" /> <span class="pilsu">*</span></th><!-- 성공여부 -->
			<td class="left">
			    ${result.successName}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.finishDate" /> <span class="pilsu">*</span></th><!-- 처리날짜 -->
			<td class="left">
			    ${result.finDate}
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="결과처리" onclick="fn_egov_modify_PmsProgress(); return false;" /><!-- 수정 -->
		<span class="btn_s"><a href="#noscript" onclick="fn_egov_list_PmsProgress(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>
</div>


<form name="Form" method="post" action="">
	<input type=hidden name="proId">
	<input type="submit" id="invisible" class="invisible">
</form>
</body>
</html>
