<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="pms.workprogress.registTitle"/></c:set>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>${pageTitle}</title>
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="pmsProgress" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript"> 
var bCancel = false; 

function validatePmsProgress(form) {                                                                   
    if (bCancel) 
  return true; 
    else 
   return validateRequired(form) && validateMaxLength(form); 
} 

function required () { 
 this.aa = new Array("proName", "과제명은 필수 입력값입니다.", new Function ("varName", "this.maxlength='30';  return this[varName];"));
 this.ab = new Array("typeCode", "과제유형 필수 입력값입니다.", new Function ("varName", " return this[varName];"));
 this.ac = new Array("taskName", "사업명은 필수 입력값입니다.", new Function ("varName", "this.maxlength='30';  return this[varName];"));
 this.ad = new Array("comName", "기업명은 필수 입력값입니다.", new Function ("varName", "this.maxlength='60';  return this[varName];"));
 this.ae = new Array("proContent", "과제설명은 필수 입력값입니다.", new Function  ("varName", "this.maxlength='300';  return this[varName];"));
 this.af = new Array("successCode", "결과는 필수 입력값입니다.", new Function ("varName", " return this[varName];"));
} 

function maxlength () { 
 this.aa = new Array("proName", "과제명은 30자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='30';  return this[varName];"));
 this.ab = new Array("taskName", "사업명은 30자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='30';  return this[varName];"));
 this.ac = new Array("comName", "기업명은 60자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='60';  return this[varName];"));
 this.ad = new Array("proContent", "사업설명은 300자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='300';  return this[varName];"));
}
</script>

<validator:javascript formName="pmsProgress" staticJavascript="false" xhtml="true" cdata="false"/>
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
   if(confirm("<spring:message code='common.save.msg' />"))
   {
	   if(!validatePmsProgress(form)){
	         return;
	      }else{
	         form.submit();
	      }
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
			<th><spring:message code="pms.workprogress.taskName" /> <span class="pilsu">*</span></th><!-- 사업명 -->
			<td class="left">
			    <form:input  path="taskName" size="60" maxlength="60" title="<spring:message code='pms.workprogress.taskName' />"/>
      			<form:errors path="taskName"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.comName" /> <span class="pilsu">*</span></th><!-- 기업명 -->
			<td class="left">
			    <form:input  path="comName" size="60" maxlength="60" title="<spring:message code='pms.workprogress.comName' />"/>
      			<form:errors path="comName"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.workDetail" /> <span class="pilsu">*</span></th><!-- 상세설명 -->
			<td class="left">
			    <form:textarea path="proContent" rows="3" cols="60" title="<spring:message code='pms.workprogress.workDetail' />"/>
      			<form:errors   path="proContent"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.success" /> <span class="pilsu">*</span></th><!-- 완료 -->
			<td class="left">
			    <form:select path="finishCode" title="<spring:message code='pms.workprogress.success' />">
				<form:options items="${finCode}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.workprogress.rsCategory" /> <span class="pilsu">*</span></th><!-- 결과 -->
			<td class="left">
			    <form:select path="successCode" title="<spring:message code='pms.workprogress.rsCategory' />">
				<form:options items="${sucCode}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>	
	</table>

   <!-- 하단 버튼 -->
   <div class="btn">
      <input class="s_submit" type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_PmsProgress(); return false;" /><!-- 목록 -->
      <span class="btn_s"><a href="#noscript" onclick="fn_egov_regist_PmsProgress(document.pmsProgress); return false;"><spring:message code="button.save" /></a></span><!-- 저장 -->
   </div>
   <div style="clear:both;"></div>
</div>


<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>

</body>
</html>