<%
 /**
  * @Class Name : EgovArticleRegist.jsp
  * @Description : EgovArticleRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2016.06.13   김연호              표준프레임워크 v3.6 개선
  *   2018.06.05   신용호              CK Editor V4.9.2 Upgrade
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="pms.pyungga.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="pms.pyungga.insert.title" /></title><!-- 게시글 등록 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script> 
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFiles.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<%-- <validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>
 --%>
 
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/popup.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
 
 <script type="text/javascript">

$(function() {
	$("#ntceBgnde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});
	$("#ntceEndde").datepicker(   
	        {dateFormat:'yy-mm-dd' 
	         , showOn: 'button' 
	         , buttonImage: '<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif'/>'   
	         , buttonImageOnly: true 
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});
});

/* ********************************************************
 * 초기화
 ******************************************************** */

 function fn_egov_init(){
	
	//filebrowserUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImage.do', // 파일 업로드를 처리 할 경로 설정.
	var ckeditor_config = {
		//filebrowserImageUploadUrl: '${pageContext.request.contextPath}/utl/wed/insertImageCk.do', // 파일 업로드를 처리 할 경로 설정.
		filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckUploadImage', // 파일 업로드를 처리 할 경로 설정(CK필터).
	};
/* 	CKEDITOR.replace('insert',ckeditor_config);
 */	
	// 첫 입력란에 포커스
/*  	document.getElementById("articleVO").nttSj.focus();
 */ 	

	}
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_regist_article(form) {

/* 		CKEDITOR.instances.nttCn.updateElement();
 */
		//input item Client-Side validate
		if (!validateArticleVO(form)) {
			return false;
		} else {

			var validateForm = document.getElementById("insert");

			//게시기간 
			var ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
			var ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);

			if (ntceBgnde == '' && ntceEndde != '') {
				validateForm.ntceBgnde.value = '1900-01-01';
			}
			if (ntceBgnde != '' && ntceEndde == '') {
				validateForm.ntceEndde.value = '9999-12-31';
			}
			if (ntceBgnde == '' && ntceEndde == '') {
				validateForm.ntceBgnde.value = '1900-01-01';
				validateForm.ntceEndde.value = '9999-12-31';
			}

			ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
			ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);

			if (ntceBgnde > ntceEndde) {
				alert("<spring:message code="pms.pyungga.ntceDeError" />");
				return;
			}

			if (confirm("<spring:message code="common.regist.msg" />")) {
				form.submit();
			}
		}
	}
	
	
	
	
	function fn_egov_update_adbkInf(form){
		if (!validateAdbk(document.adbk)){
			return;
		}
		if(confirm("<spring:message code="common.save.msg" />")){
			document.adbk.action = "<c:url value='/cop/adb/UpdateAddressBook.do'/>";
			document.adbk.submit();
		}
	}

	function fn_egov_deleteUser(userId){
		document.adbk.checkWord.value = userId;
		document.adbk.checkCnd.value = "update";
		document.adbk.action = "<c:url value='/cop/adb/deleteUser.do'/>";
		document.adbk.submit();
	}

	function fn_egov_select_adbkInfs(){
		document.adbk.action = "<c:url value='/cop/adb/selectAdbkList.do'/>";
		document.adbk.submit();
	}
	function fn_egov_inqire_user(){
		var retVal;
		var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/cop/adb/selectManList.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam);

		if(retVal != null){
			var temp = retVal.split(",");
			var checkId = document.adbk.userId.value.split(",");

			for(var i = 0; i < checkId.length; i++){
				if(temp[0] == checkId[i]){
					alert("<spring:message code="comCopAdb.validate.isUser" />"); <%-- 이미 등록된 사람입니다. --%>
					return;
				}
			}

			document.adbk.userId.value += temp[0] + ",";
			document.adbk.userNm.value += temp[1] + ",";
			document.adbk.userEmail.value += temp[2] + ",";
			document.adbk.checkCnd.value = "update";

			document.adbk.action = "<c:url value='/cop/adb/addUser.do'/>";
			document.adbk.submit();

		}
	}
	
	function showModalDialogCallback(retVal) {
		if (retVal != null) {
			var temp = retVal.split(",");
			var checkId = document.adbk.userId.value.split(",");

			for(var i = 0; i < checkId.length; i++) {
				if(temp[0] == checkId[i]){
					alert("<spring:message code="comCopAdb.validate.isUser" />"); <%-- 이미 등록된 사람입니다. --%>
					return;
				}
			}

			document.adbk.userId.value += temp[0] + ",";
			document.adbk.userNm.value += temp[1] + ",";
			document.adbk.userEmail.value += temp[2] + ",";
			document.adbk.checkCnd.value = "update";

			document.adbk.action = "<c:url value='/cop/adb/addUser.do'/>";
			document.adbk.submit();

		}
	}

</script>

</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
<%-- <form:form commandName="articleVO" action="${pageContext.request.contextPath}/cop/bbs/insertArticle.do" method="post" onSubmit="fn_egov_regist_article(document.forms[0]); return false;" enctype="multipart/form-data">  
 --%><div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="pms.pyungga.insert.title" /></h2><!-- 게시글 등록 -->

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="pms.pyungga.insert.title" /></caption>
	<colgroup>
		<col style="width: 20%;">
		<col style="width: ;">
		<col style="width: ;">
		<col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
	 	<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
			<!-- 평가 id  -->
	
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyunggaid"/> </c:set>
		<tr>
			<th><label for="nttCn">${title} <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3">
			<input type="text"id="pyunggaid" name="pyunggaid" size="50" maxlength="50" title="<spring:message code='pms.pyungga.insert.pyunggaid' />"/>
			</td>
		</tr>
		
		<!-- 사업이름   -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.projectName"/> </c:set>
		<tr>
			<th><label for="nttSj">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			<input type="text"id="projectName" name="projectName" size="50" maxlength="50" title="<spring:message code='pms.pyungga.insert.projectName' />"/>
			</td>
		</tr>
	
		<!-- 평가 내용  -->
		
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyungga"/> </c:set>
		<tr>
			<th><label for="nttCn">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3">
			<input type="text"id="pyungga" name="pyungga" size="50" maxlength="50" title="<spring:message code='pms.pyungga.insert.pyungga' />"/>
		
			
			</td>
		</tr>

		
		
		
		<!-- 유효기간 설정  -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.start"/> </c:set>
		<tr>
			<th><label for="ntceBgnde">${title} </label></th>
			<td class="left" colspan="3">
	
			
			 <input id="ntceBgnde" name="ntceBgnde" title="${title} ${inputTxt}" style="width:70px;" readonly="readonly" type="text" value="" size="70" maxlength="70" >
			
			&nbsp;~&nbsp;
			
			<input id="ntceEndde" name="ntceEndde" title="${title} ${inputTxt}" style="width:70px;" readonly="readonly" type="text" value="" size="70" maxlength="70" >
			
				
			</td>
		</tr>
		
		
		<!-- 첨부파일  -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.addfile"/></c:set>
		<tr>
			<th><label for="file_1">${title}</label> </th>
			<td class="nopd" >
			<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="pms.pyungga.insert.addfile"/>" multiple/><!-- 첨부파일 -->
			    <div id="egovComFileList"></div>
			</td>
		</tr>
		
	  
	</tbody>
	</table>
	
<form name="adbk" action="${pageContext.request.contextPath}/cop/adb/UpdateAddressBook.do"  method="post" onSubmit="fn_egov_update_adbkInf(document.forms[0]); return false;"> 

 <input type = "hidden" name = "userId" value = '<c:out value="${adbkUserVO.userId}" />'>
<input type = "hidden" name = "userNm" value = '<c:out value="${adbkUserVO.userNm}" />'>
<input type = "hidden" name = "userEmail" value = '<c:out value="${adbkUserVO.userEmail}" />'>
<input type = "hidden" name = "adbkId" value = '<c:out value="${searchVO.adbkId}" />'>
<input type = "hidden" name = "checkWord" value = "" >
<input type = "hidden" name = "checkCnd" value = "">
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.update" /></h2>

	<!-- 수정 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.update" /></caption>
	<colgroup>
		<col style="width: 16%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- 주소록명 -->
		<c:set var="title"><spring:message code="comCopAdb.regist.adbkNm"/></c:set>
		<tr>
			<th><label for="diaryNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<c:if test="${writer == true}">
				<form:input path="searchVO.adbkNm" size="73"  maxlength="255" />
				</c:if>
				<c:if test="${writer != true}"> <c:out value="${searchVO.adbkNm}" /> </c:if>
			</td>
		</tr>
		<!--공개범위 -->
		<c:set var="title"><spring:message code="comCopAdb.regist.othbcScope"/></c:set>
		
		<c:set var="othbcScopeMan"><spring:message code="comCopAdb.regist.man"/></c:set>
		<c:set var="othbcScopePart"><spring:message code="comCopAdb.regist.part"/></c:set>
		<c:set var="othbcScopeCompany"><spring:message code="comCopAdb.regist.company"/></c:set>
		<tr>
			<th><label for="drctMatter">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<div style="float:left;"><input type="radio" name="othbcScope" value="<spring:message code="comCopAdb.regist.man"/>" <c:if test="${searchVO.othbcScope == othbcScopeMan ||  searchVO.othbcScope ==  '' }"> checked="checked"</c:if>/><spring:message code="comCopAdb.regist.man"/></div><!-- 개인 -->
				<div style="float:left; margin:0 0 0 10px"><input type="radio" name="othbcScope" value="<spring:message code="comCopAdb.regist.part"/>" <c:if test="${searchVO.othbcScope == othbcScopePart}"> checked="checked"</c:if>/><spring:message code="comCopAdb.regist.part"/> </div><!-- 부서 --> 
				<div style="float:left; margin:0 0 0 10px"><input type="radio" name="othbcScope" value="<spring:message code="comCopAdb.regist.company"/>" <c:if test="${searchVO.othbcScope == othbcScopeCompany}"> checked="checked"</c:if>/><spring:message code="comCopAdb.regist.company"/> </div><!-- 회사 -->
			</td>
		</tr>
		<!-- 구성원 -->
		<c:set var="title"><spring:message code="comCopAdb.regist.adbkUser"/></c:set>
		<tr>
			<th><label for="schdulCn">${title}</label> </th>
			<td class="left">
			   <input name="adbkUser" id="adbkUser" size="40" readonly="true" maxlength="255" style="width:94%;" />
			   <a href="#" onClick="fn_egov_inqire_user();return false;"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" alt=<spring:message code="comCopAdb.regist.findAdbkUser"/> title="<spring:message code="comCopAdb.regist.findAdbkUser"/>"></a>
			</td>
		</tr>
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.drctMatter"/></c:set>
	</tbody>
	</table>
	
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 13%;">
		<col style="width: 10%;">
		<col style="width: ;">
		
		<col style="width: 13%;">
		<col style="width: 13%;">
		<col style="width: 13%;">
		<col style="width: 13%;">
		<c:if test="${writer == true}">
		<col style="width: 10%;">
		</c:if>
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="comCopAdb.registList.id" /></th><!-- 아이디 -->
		<th><spring:message code="comCopAdb.registList.name" /></th><!-- 이름 -->
		<th><spring:message code="comCopAdb.registList.email" /></th><!-- 메일 -->
		<th><spring:message code="comCopAdb.registList.homeTel" /></th><!-- 집전화번호 -->
		<th><spring:message code="comCopAdb.registList.mobileTel" /></th><!-- 휴대폰번호 -->
		<th><spring:message code="comCopAdb.registList.officeTel" /></th><!-- 회사번호-->
		<th><spring:message code="comCopAdb.registList.faxNum" /></th><!-- 팩스번호 -->
		<c:if test="${writer == true}">	
		<th><spring:message code="title.delete" /></th><!-- 삭제 -->
		</c:if>
	</tr>
	</thead>
	<tbody class="ov">
	 <tbody>
		 <c:forEach var="result" items="${searchVO.adbkMan}" varStatus="status">
		  <tr>
		  
		    <c:if test="${result.ncrdId == '' || result.ncrdId == NULL}">
		    	<td class="left" ><c:out value="${result.emplyrId}" /></td>
		    </c:if>
		    <c:if test="${result.emplyrId == '' || result.emplyrId == NULL}">
		    	<td class="left" nowrap><c:out value="${result.ncrdId}" /></td>
		    </c:if>
		    <td><c:out value="${result.nm}"/></td>
		    <td><c:out value="${result.emailAdres}"/></td>
		    <td><c:out value="${result.homeTelno}"/></td>
		    <td><c:out value="${result.moblphonNo}"/></td>
		    <td><c:out value="${result.offmTelno}"/></td>
		    <td ><c:out value="${result.fxnum}"/></td>
		    <c:if test="${writer == true}">
				<c:if test="${result.ncrdId == '' || result.ncrdId == NULL}">
			<td>
		
 				<button class="btn_s2" onClick="javascript:fn_egov_deleteUser('<c:out value="${result.emplyrId}" />'); return false;" title="<spring:message code="title.delete" />"><spring:message code="title.delete" /></button>
				
				</td>
			</c:if>
			<c:if test="${result.emplyrId == '' || result.emplyrId == NULL}">
			<td>
		
 				<button class="btn_s2" onClick="javascript:fn_egov_deleteUser('<c:out value="${result.ncrdId}" />'); return false;" title="<spring:message code="title.delete" />"><spring:message code="title.delete" /></button>
				
				</td>
				</c:if>
			</c:if>
		  </tr>
		 </c:forEach>
		 
	 	<c:if test="${fn:length(searchVO.adbkMan) == 0}">
		  <tr>
		    <c:if test="${writer == true}">
				<td colspan="8" ></td>
		   	</c:if>
			<c:if test="${writer == false}">
	 			<td colspan="7"></td>
	      	</c:if>
		  </tr>
		 </c:if>
	</tbody>
	</table>
	
	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" /> <spring:message code="input.button" />" />
		<span class="btn_s"><a href="<c:url value='/cop/adb/selectAdbkList.do' />?pageIndex=<c:out value='${searchVO.pageIndex}'/>"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;"></div>
		
</form>

</div>
	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /><!-- 등록 -->
	<%-- 	<span class="btn_s"><a href="<c:url value='/cop/bbs/selectArticleList.do' />?bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
 --%>
 		<span class="btn_s"><a href="<c:url value='/pyungga/test.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
 	
 	</div><div style="clear:both;"></div>
	
</div>

 <input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
  <input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
 <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
 <input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
<input type="hidden" name="blogId" value="<c:out value='${searchVO.blogId}'/>" />
<input type="hidden" name="blogAt" value="<c:out value='${articleVO.blogAt}'/>"/>
<input type="hidden" name="cmd" value="<c:out value='save'/>">
<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">  
<%-- </form:form>
 --%>
 
 
<!-- 첨부파일 업로드 가능화일 설정 Start..-->  
<script type="text/javascript">
var maxFileNum = document.getElementById('atchPosblFileNumber').value;
if(maxFileNum==null || maxFileNum==""){
	maxFileNum = 3;
}
var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
</script> 
<!-- 첨부파일 업로드 가능화일 설정 End.-->

</body>
</html>

