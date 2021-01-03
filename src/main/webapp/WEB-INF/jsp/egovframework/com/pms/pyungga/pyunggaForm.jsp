<%
 /**

	지원사업에 대한 평가 등록 페이지 
	이희성, 장시형
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<%-- <validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>
 --%>
 <script type="text/javascript">

$(function() {
	$("#start").datepicker(   
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
	$("#end").datepicker(   
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
	 function fn_egov_inqire_user(){
			var retVal;
			var project = document.getElementById("task_id").value 
			var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/pyungga/projectListView.do?taskId="+project+"&width=850&height=360'/>";
			var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

			retVal = window.showModalDialog(url,"projectVO", openParam);

			if(retVal != null){
				var temp = retVal.split(",");
				
	 
				parent.window.returnValue = retVal;
/* 				alert('retVal parent = ' + retVal);
 */				document.getElementById("projectid").value = retVal;
				//showModalDialogCallback(retVal)
			
			}
		}
	  function showModalDialogCallback(retVal) {
			alert('retVal123 = ' + retVal);

			if (retVal) {
				alert('retVal1234 = ' + retVal);

				projectid = document.getElementsByName(retVal).value;
				return retVal;
			}
			
		} 
	
	////평가위원 리스트 
	
 function fn_egov_inqire_user2(){
			var retVal;
			var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/pyungga/pyunggawewonlist.do&width=850&height=360'/>";
			var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

			retVal = window.showModalDialog(url,"projectVO", openParam);

			if(retVal != null){
				var temp = retVal.split(",");
/* 				var checkId = document.adbk.userId.value.split(",");
 */				parent.window.returnValue = retVal; //여기 추가함
/* 				alert('retVal parent3 = ' + retVal); 
 */				 			
				 document.getElementById("pyunggaid").value = retVal;//여기 추가함 

/* 
				for(var i = 0; i < checkId.length; i++){
					if(temp[0] == checkId[i]){
						alert("<spring:message code="comCopAdb.validate.isUser" />"); 이미 등록된 사람입니다.
						return;
					}
				}

				document.adbk.userId.value += temp[0] + ",";
				document.adbk.userNm.value += temp[1] + ",";
				document.adbk.userEmail.value += temp[2] + ",";
				document.adbk.checkCnd.value = "update";

				document.adbk.action = "<c:url value='/cop/adb/addUser.do'/>";
				document.adbk.submit(); 

				 */
			}
		}
	
	
 function fn_egov_inqire_user3(){
		var retVal;
		var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/pyungga/projectList.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"project", openParam);
		
		
		
/* 		alert('retVal parent3 = ' + retVal); 
 */

		if(retVal != null){
			var temp = retVal.split(",");
/* 				var checkId = document.adbk.userId.value.split(",");
*/				parent.window.returnValue = retVal; //여기 추가함
/* 				alert('retVal parent3 = ' + retVal); 
*/				 	

	/* 		alert('retVal parent3 = ' + retVal); 
	 */		 document.getElementById("task_id").value = retVal;//여기 추가함 


		}
	}
	
</script>

</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<%-- <form:form commandName="articleVO" action="${pageContext.request.contextPath}/cop/bbs/insertArticle.do" method="post" onSubmit="fn_egov_regist_article(document.forms[0]); return false;" enctype="multipart/form-data">  
 --%>
  	<form id="pyungga" name="pyungga" method="post" enctype="multipart/form-data" action="<c:url value='/pyungga/insert.do'/>">
 
 
 <div class="wTableFrm">
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
	
		
		
		<!-- 사업이름   (새로 추가)-->
		<c:set var="title"><spring:message code="pms.pyungga.insert.taskName"/> </c:set>
		<tr>
			<th><label for="nttSj">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<input id="task_id" name="task_id" size="50" maxlength="50" value="" title="<spring:message code='pms.pyungga.insert.taskName' />"/>
			</td>
			<td>
			   <a href="#" onClick="fn_egov_inqire_user3();return false;"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" ></a>
			</td>
		
		</tr>
		
		
		
		<!-- 과제이름(기존 사업이름)   -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.projectName"/> </c:set>
		<tr>
			<th><label for="nttSj">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<input id="projectid" name="projectid" size="50" maxlength="50" value="" title="<spring:message code='pms.pyungga.insert.projectName' />"/>
			</td>
			<td>
			   <a href="#" onClick="fn_egov_inqire_user();return false;"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" ></a>
			</td>
		
		</tr>
		
		<!-- 평가위원   -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyunggawewon"/> </c:set>
		<tr>
			<th><label for="nttSj">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			<input id="pyunggaid" name="pyunggaid" size="20" maxlength="20" title="<spring:message code='pms.pyungga.insert.pyunggawewon' />"/>
			</td>
			<td>
			   <a href="#" onClick="fn_egov_inqire_user2();return false;"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" ></a>
			</td>
				</tr>
	
		<!-- 평가 내용  -->
		
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyungga"/> </c:set>
		<tr>
			<th><label for="nttCn">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3" height = "200">
			<textarea rows="100" cols="100" id="pyungga" name="pyungga" style = "height:200px; width:600px;" title="<spring:message code='pms.pyungga.insert.pyungga' />" ></textarea>
			</td>
		</tr>
		
		
		<!-- 유효기간 설정  -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.start"/> </c:set>
		<tr>
			<th><label for="start">${title} </label></th>
			<td class="left" colspan="3">
			 <input id="start" name="start" title="${title} ${inputTxt}" style="width:70px;" readonly="readonly" type="text" value="" size="70" maxlength="70" >
				&nbsp;~&nbsp;
			<input id="end" name="end" title="${title} ${inputTxt}" style="width:70px;" readonly="readonly" type="text" value="" size="70" maxlength="70" >			
			</td>
		</tr>
		<!-- 첨부파일  -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.addfile"/></c:set>
		<tr>
		<th><label for="start">${title} </label></th>
		 <td class="nopd" >
			<input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="pms.pyungga.insert.addfile"/>" multiple/><!-- 첨부파일 -->
			    <div id="egovComFileList"></div>
			</td> 
		</tr>
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" /><!-- 등록 -->
		<span class="btn_s"><a href="<c:url value='/pyungga/boardListView.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
 	</div><div style="clear:both;"></div>
	
</div>
	</form>
 <input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="5" />
  <input type="hidden" id="savePath" name="savePath" value="Globals.fileTest1Path" />
 
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
