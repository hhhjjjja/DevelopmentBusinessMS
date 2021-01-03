<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="pageTitle"><spring:message code="pms.workprogress.registTitle"/></c:set>
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
function fn_egov_list(){
   location.href = "<c:url value='/pms/workprogress/WorkListView.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
 function fn_egov_regist(form){
   if(confirm("<spring:message code='common.save.msg' />"))
   {
	   form.submit();
   }
}
</script>
</head>

<body>
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form:form commandName="pmsProgress" name="pmsProgress" method="post">

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
			<th><spring:message code="pms.workprogress.taskName" /> <span class="pilsu">*</span></th><!-- 사업명 -->
			<td class="left">
			    <form:select path="taskName" title="<spring:message code='pms.workprogress.taskName' />">
				<c:forEach var="taskList" items="${taskList}">
			    <form:options items=<c:out value="${taskList.taskNm}"/>/>					
				</c:forEach>
				</form:select>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.workName" /> <span class="pilsu">*</span></th><!-- 과제명 -->
			<td class="left">
			    <form:input  path="proName" size="60" maxlength="60" title="<spring:message code='pms.workprogress.workName' />"/>
      			<form:errors path="proName"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.typeName" /> <span class="pilsu">*</span></th><!-- 과제유형 -->
			<td class="left">
			    <form:select path="typeCode" title="<spring:message code='pms.workprogress.typeName' />">
				<form:options items="${tpCode}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.workDetail" /> <span class="pilsu">*</span></th><!-- 과제설명 -->
			<td class="left">
			    <form:textarea path="proContent" rows="3" cols="60" title="<spring:message code='pms.workprogress.workDetail' />"/>
      			<form:errors   path="proContent"/>
			</td>
		</tr>		
		<tr>
			<th><spring:message code="pms.workprogress.comName" /> <span class="pilsu">*</span></th><!-- 기업명 -->
			<td class="left">
			    <form:input  path="comName" size="60" maxlength="60" title="<spring:message code='pms.workprogress.comName' />"/>
      			<form:errors path="comName"/>
			</td>
		</tr>
	</table>

   <!-- 하단 버튼 -->
   <div class="btn">
      <input class="s_submit" type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list(); return false;" /><!-- 목록 -->
      <span class="btn_s"><a href="#noscript" onclick="fn_egov_regist(document.pmsProgress); return false;"><spring:message code="button.save" /></a></span><!-- 저장 -->
   </div>
   <div style="clear:both;"></div>
</div>


<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>

</body>
</html>