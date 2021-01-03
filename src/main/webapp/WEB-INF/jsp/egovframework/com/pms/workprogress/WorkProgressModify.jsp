<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="pageTitle"><spring:message code="pms.workprogress.modifyTitle"/></c:set>
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
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_PmsProgress(form){
	if(confirm("<spring:message code='common.save.msg'/>"))
	{
		form.submit();
	}
}
</script>
</head>
<body>
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form:form commandName="pmsProgress" name="pmsProgress" method="post">
<input name="cmd" type="hidden" value="Modify">
<form:hidden path="proId"/>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle}</h2>

	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="pms.workprogress.comName" /> <span class="pilsu">*</span></th> <!-- 기업명 -->
			<td class="left">
			    ${pmsProgress.comName}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.taskName" /> <span class="pilsu">*</span></th><!-- 사업명 -->
			<td class="left">
				${pmsProgress.taskName}
			</td>
		</tr>
        <tr>
			<th><spring:message code="pms.workprogress.taskContent" /> <span class="pilsu">*</span></th><!-- 사업내용 -->
			<td class="left">
			    <textarea class="textarea"  cols="75" rows="14"  style="height:190px;" disabled title="<spring:message code="pms.workprogress.taskContent" />">${pmsProgress2.taskCntnt}</textarea>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.typeName" /> <span class="pilsu">*</span></th><!-- 과제유형 -->
			<td class="left">
				${pmsProgress.typeName}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.workName" /> <span class="pilsu">*</span></th><!-- 과제명 -->
			<td class="left">
				${pmsProgress.proName}
			</td>
		</tr>
	
		<tr>
			<th><spring:message code="pms.workprogress.workDetail" /> <span class="pilsu">*</span></th><!-- 과제설명 -->
			<td class="left">
			    <textarea class="textarea"  cols="75" rows="14"  style="height:190px;" disabled title="<spring:message code="pms.workprogress.workDetail" />">${pmsProgress.proContent}</textarea>
			</td>
		</tr>		
		
		<tr>
			<th><spring:message code="pms.workprogress.taskStartDate" /> <span class="pilsu">*</span></th><!-- 사업시작날짜 -->
			<td class="left">
				${pmsProgress2.taskStartDate}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.taskEndDate" /> <span class="pilsu">*</span></th><!-- 사업종료날짜 -->
			<td class="left">
				${pmsProgress2.taskEndDate}
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.successEdit" /> <span class="pilsu">*</span></th><!-- 결과 -->
			<td class="left">
			    <form:select path="successCode" title="<spring:message code='pms.workprogress.success' />">
				<form:options items="${sucCode}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>	
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<span class="btn_s"><a href="#noscript" onclick="fn_egov_list_PmsProgress(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_regist_PmsProgress(document.pmsProgress); return false;" /><!-- 저장 -->
	</div>
	<div style="clear:both;"></div>
</div>


</form:form>

</body>
</html>
