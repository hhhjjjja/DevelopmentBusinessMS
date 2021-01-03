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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/ckeditor/ckeditor.js?t=B37D54V'/>" ></script>
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
			var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/pyungga/projectList.do&width=850&height=360'/>";
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

			retVal = window.showModalDialog(url,"p_userInqire", openParam);

			if(retVal != null){
				var temp = retVal.split(",");
				var checkId = document.adbk.userId.value.split(",");

			}
		}
	 function fn_egov_delete(){
			if (confirm("<spring:message code='common.delete.msg'/>")) {
				var varForm= document.all["pyunggaUpdate"];
				varForm.action           = "<c:url value='/pyungga/Delete.do'/>";
				 varForm.pNum.value   = "${result.pNum}";
				varForm.submit(); 
			}
		}
	 
</script>

</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<%-- <form:form commandName="articleVO" action="${pageContext.request.contextPath}/cop/bbs/insertArticle.do" method="post" onSubmit="fn_egov_regist_article(document.forms[0]); return false;" enctype="multipart/form-data">  
 --%>
  	<form id="pyunggaUpdate" name="pyunggaUpdate" method="post" enctype="multipart/form-data" action="<c:url value='/pyungga/Update.do'/>">
 
 
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
			<!-- 평가 id  -->
	
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyunggaid"/> </c:set>
		<tr>
			<th><label for="nttCn">${title} </label></th>
			<td class="nopd" colspan="3">
			<input id="pNum" name="pNum"  value="${result.pNum}"title="<spring:message code='pms.pyungga.insert.pyunggaid' />"/>
			</td>
		</tr>
		
		<!-- 사업이름   -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.projectName"/> </c:set>
		<tr>
			<th><label for="nttSj">${title} </label></th>
			<td class="left">
				<input id="projectid" name="projectid" value="${result.projectid}" value="" title="<spring:message code='pms.pyungga.insert.projectName' />"/>
				&nbsp;&nbsp;${result.projectName}
			</td>
			
			<%-- <td>
			   <a href="#" onClick="fn_egov_inqire_user();return false;"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" ></a>
			</td> --%>
		
		</tr>
		
		<!-- 평가위원   -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyunggawewon"/> </c:set>
		<tr>
			<th><label for="nttSj">${title}</label></th>
			<td class="left">
			<input id="pyunggaid" name="pyunggaid" value="${result.pyunggaid}"  title="<spring:message code='pms.pyungga.insert.pyunggawewon' />"/>
			&nbsp;&nbsp;${result.pyunggawewonname}
			</td>
			<%-- <td>
			   <a href="#" onClick="fn_egov_inqire_user2();return false;"><img src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.gif'/>" align="middle" style="border:0px" ></a>
			</td> --%>
		</tr>
	
		<!-- 평가 내용  -->
		
		<c:set var="title"><spring:message code="pms.pyungga.insert.pyungga"/> </c:set>
		<tr>
			<th>평가내용</th>
			<td class="nopd" colspan="3">
			<%-- <textarea rows="1" cols="1"id="pyungga" name="pyungga" values="${result.pyungga}"size="50" maxlength="50" title="<spring:message code='pms.pyungga.insert.pyungga' />"></textarea>
			 --%>
			<input type="text" id="pyungga" name="pyungga" value="${result.pyungga}"size="50" maxlength="50" title="<spring:message code='pms.pyungga.insert.pyungga' />"/>
			</td>
		</tr>
		
		
		<!-- 유효기간 설정  -->
		<c:set var="title"><spring:message code="pms.pyungga.insert.start"/> </c:set>
		<tr>
			<th><label for="start">${title} </label></th>
			<td class="left" colspan="3">
			 <input id="start" name="start" title="${title} ${inputTxt}" value="${result.start}"style="width:70px;" readonly="readonly" type="text" value="" size="70" maxlength="70" >
				&nbsp;~&nbsp;
			<input id="end" name="end" title="${title} ${inputTxt}" value="${result.end}"style="width:70px;" readonly="readonly" type="text" value="" size="70" maxlength="70" >			
			</td>
		</tr>
		<tr>
			<th>점수</th>
			<td>
			<input type="text"id="score" name="score" value="${result.score}"size="50" maxlength="50" />
			<c:set var="score" value="${result.score}" />
			<%-- <c:if test="${score>80}">

    			<c:out value="true" />

			</c:if>
			<c:if test="${score<80}">

    			<c:out value="false" />

			</c:if> --%>

			</td>
		</tr>
		<tr>
			<th>합격여부</th>
			<td>
			<input type="text"id="pass" name="pass" value="${result.pass}"size="50" maxlength="50" "/>
			</td>
		</tr>
		<tr>
			<th>최종선정여부</th>
			<td>  <input type="checkbox" id="final1" name="final1" value="최종합격">
			<label for="final1">최종합격선정</label><br>
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

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" /> <spring:message code="input.button" />" /><!-- 등록 -->
	<%-- 	<span class="btn_s"><a href="<c:url value='/cop/bbs/selectArticleList.do' />?bbsId=${boardMasterVO.bbsId}"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
 --%>
		

		<span class="btn_s"><a href="#noscript" onclick="fn_egov_delete(); return false;"><spring:message code="button.delete" /></a></span><!-- 삭제 -->
	
 		<span class="btn_s"><a href="<c:url value='/pyungga/boardListView.do'/>"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span><!-- 목록 -->
 	
 	</div><div style="clear:both;"></div>
	
</div>
	</form>
<input type="hidden" name="cmd" value="<c:out value='save'/>">
<%-- </form:form>
 --%>


</body>
</html>
