<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<meta charset="UTF-8">
</head>
<body>
<form id="pyunggawewon  name="PyunggawewonForm" style="width: 80%; method="post" enctype="multipart/form-data" action="<c:url value='/pyunggawewon/insert.do'/>">

<div class="wTableFrm">
<h2>${pageTitle} <spring:message code="pms.pyungga.update.title" /></h2><!-- 게시글 등록 -->
</div>
	
	<!-- 평가위원등록폼 -->
	<table class="wTable" style="width: 100%;" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="pms.pyungga.update.title" /></caption>
	<colgroup>
		<col style="width: 40%;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
	 	<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		
		<!-- 평가위원 id  -->
	
		<c:set var="title"><spring:message code="pms.pyungga.update.column1"/> </c:set>
		<tr>
			<th><label for="nttCn">${title} <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3">
			<input type="text"id="pyunggaid"  style="width: 40%;" name="pyunggaid" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column1' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 이름   -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column2"/> </c:set>
		<tr>
			<th><label for="nttSj">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			<input type="text"id="pyunggawewonname" style="width: 40%;" name="pyunggawewonname" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column2' />"/>
			</td>
		</tr>
	
		<!-- 주민등록번호  -->
		
		<c:set var="title"><spring:message code="pms.pyungga.update.column3"/> </c:set>
		<tr>
			<th><label for="nttCn">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3">
			<input type="text"id="pyunggawewonidnum" style="width: 40%;" name="pyunggawewonidnum" size="10" maxlength="30" title="<spring:message code='pms.pyungga.update.column3' />"/>
		
			
			</td>
		</tr>
	
				
		<!-- 평가위원 소속기관  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column4"/> </c:set>
		<tr>
			<th><label for="ntceBgnde">${title} <span class="pilsu">*</span></label></th>
			<td class="left" colspan="3">
	
			<input type="text"id="pyunggwewoncompanay" style="width: 40%;" name="pyunggwewoncompanay" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column4' />"/>
		
			</td>
		</tr>
		
		
		<!-- 평가위원 연락처  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column5"/></c:set>
		<tr>
			<th><label for="file_1">${title}<span class="pilsu">*</span></label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggawewonphone" style="width: 40%;"  name="pyunggawewonphone" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column5' />"/>
			</td>
		</tr>
		
		
		<!-- 평가위원 e-mail  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column6"/></c:set>
		<tr>
			<th><label for="file_1">${title}<span class="pilsu">*</span></label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggawewonemail"style="width: 40%;"  name="pyunggawewonemail" size="10" maxlength="30" title="<spring:message code='pms.pyungga.update.column6' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 주소  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column14"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggwewonadr" style="width: 40%;" name="pyunggwewonadr" size="10" maxlength="40" title="<spring:message code='pms.pyungga.update.column7' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 계좌번호  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column7"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggawewonaccnum" style="width: 40%;" name="pyunggawewonaccnum" size="10" maxlength="30" title="<spring:message code='pms.pyungga.update.column7' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 경력  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column8"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggawewoncareer" style="width: 40%;"  name="pyunggawewoncareer" size="10" maxlength="50" title="<spring:message code='pms.pyungga.update.column8' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 자격증  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column9"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggwewonsertification" style="width: 40%;" name="pyunggwewonsertification" size="20" maxlength="10" title="<spring:message code='pms.pyungga.update.column9' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 논문  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column10"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggawewononmoon" style="width: 40%;" name="pyunggawewononmoon" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column10' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 지식재산권  -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column11"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggawewonjeesik" style="width: 40%;"  name="pyunggawewonjeesik" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column11' />"/>
			</td>
		</tr>
		
		<!-- 평가위원 저서 -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column12"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggwewonjeoseo" style="width: 40%;" name="pyunggwewonjeoseo" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column12' />"/>
			</td>
		</tr>
	  
	  <!-- 평가위원 소속협회 -->
		<c:set var="title"><spring:message code="pms.pyungga.update.column13"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
		<input type="text"id="pyunggwewonsosok" style="width: 40%;" name="pyunggwewonsosok" size="10" maxlength="20" title="<spring:message code='pms.pyungga.update.column13' />"/>
			</td>
		</tr>
	  
	  
	
	</tbody>
	

	
	</table>

	<!-- 하단 버튼 -->
	<div class="btn" >
	
		<input type="submit" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" /> <spring:message code="input.button" />" />
		<span class="btn_s"><a href="<c:url value='/pyungga/pyunggawewonlist.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;" ></div>
			
	
</form>
</body>
</html>