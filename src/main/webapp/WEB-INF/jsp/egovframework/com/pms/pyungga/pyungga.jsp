<%
 /**
  * 2020 11 05 ㅈㅅㅎ ㅇㅎㅅ
  *
  */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="pms.pyungga.title"/></c:set>



<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title><!-- 게시판 목록 -->

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<meta charset="UTF-8">
<script type="text/javaScript" language="javascript">
if(!${isAuthenticated}){
	alert("로그인 후 이용할 수 있습니다.");
	window.history.back();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/pms/databank/boardListView.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_egov_search_data(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_data(){
	location.href = "<c:url value='/pms/databank/databankForm.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_pyungga(proId){
 	var varForm				 = document.all["Form"]; 
 	varForm.action           = "<c:url value='/pyungga/pyunggaDetail.do'/>";
 	varForm.pNum.value   = proId; 
 	varForm.submit();
}
function detail(pNum){
var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/pyungga/pyunggaDetail.do?pNum="+pNum+"&width=850&height=360'/>";
var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

retVal = window.showModalDialog(url,"pyungga", openParam);

 var retVal;
var url = "<c:url value='/cop/adb/openPopup.do?requestUrl=/pyungga/projectList.do&width=850&height=360'/>";
var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

retVal = window.showModalDialog(url,"projectVO", openParam);

if(retVal != null){
	var temp = retVal.split(",");
	

	parent.window.returnValue = retVal;
				alert('retVal parent = ' + retVal);
			document.getElementById("projectid").value = retVal;
	showModalDialogCallback(retVal)

}  


</script>
</head>
<body>

<!-- <form name="ProjectListForm" action="<c:url value='/cop/bbs/selectBBSMasterInfs.do'/>" method="post" onSubmit="fn_egov_search_bbssj(); return false;">-->
<form name="PyunggaForm" method = "get">
<div class="board">
   <h1>${pageTitle} <spring:message code="title.list" /></h1><!-- 게시판 목록 -->
   <!-- 하단 버튼 -->
   <div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
      <ul>
         <li>
            <select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
               <option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="pms.pyungga.tName" /></option><!-- 사업이름명 -->
               <option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="pms.pyungga.pName" /></option><!-- 평가위원-->
               <option value="2"  <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> ><spring:message code="pms.pyungga.fName" /></option><!-- 평가위원-->
               
            </select>
         </li>
         <!-- 검색키워드 및 조회버튼 -->
         <li>
            <input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
            <input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" /><!-- 조회 -->
            <span class="btn_b"><a href=" <c:url value='/pyungga/insertView.do' /><%-- <c:url value='/pyungga/insertView?cmmntyId=${searchVO.cmmntyId}' /> --%> "  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span><!-- 등록 -->
         </li>
      </ul>
   </div>
   
   <!-- 목록영역 -->
   <table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
   <caption>${pageTitle}<spring:message code="title.list" /></caption>
   <colgroup>
      <col style="width: 8%;">
      <col style="width: 15%;">
      <col style="width: 15%;">
      <col style="width: 14%;">
      <col style="width: 14%;">
      <col style="width: 14%;">
      <col style="width: 11%;">
      <col style="width: 9%;">
   </colgroup>
   <thead>
   <tr>
      <th scope="col"><spring:message code="pms.pyungga.column1" /></th><!-- 순번 -->
      <th scope="col"><spring:message code="pms.pyungga.column2" /></th><!-- 사업이름-->
      <th scope="col" class="board_th_link"><spring:message code="pms.pyungga.column8" /></th><!-- 사업이름 -->
      <th scope="col"><spring:message code="pms.pyungga.column3" /></th><!-- 평가시작일자-->
      <th scope="col"><spring:message code="pms.pyungga.column4" /></th><!-- 평가종료일자 -->
      <th scope="col"><spring:message code="pms.pyungga.column5" /></th><!-- 평가위원 -->
      <th scope="col"><spring:message code="pms.pyungga.column6" /></th><!-- 점수 -->
      <th scope="col"><spring:message code="pms.pyungga.column7" /></th><!-- 합격여부 -->
         
   </tr>
   </thead>
   
   <tbody class="ov">
   <c:if test="${fn:length(resultList) == 0}">
   <tr>
      <td colspan="7"><spring:message code="common.nodata.msg" /></td>
   </tr>
   </c:if>
   <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
   <%-- <tr>
      <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
      <td class="left"><a href="<c:url value='/cop/bbs/selectBBSMasterDetail.do?bbsId=${resultInfo.bbsId}'/>" onClick="fn_egov_inquire_bbsdetail('<c:out value="${resultInfo.bbsId}"/>');return false;"><c:out value='${fn:substring(resultInfo.bbsNm, 0, 40)}'/></a></td>
      <td><c:out value='${resultInfo.frstRegisterNm}'/></td>
      <td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
      <td><c:out value='${resultInfo.useAt}'/></td>      
   </tr> --%>
    
    <tr>
   <%--  <a href="<c:url value='/cop/bbs/selectBBSMasterDetail.do?bbsId=${resultInfo.pNum}'/>" onClick="fn_egov_inquire_bbsdetail('<c:out value="${resultInfo.bbsId}"/>');return false;"> --%>
<%--      <a href="<c:url value='/pyungga/pyunggaDetail.do?pNum=${resultInfo.pNum}'/>" onClick="fn_egov_detail_pyungga('<c:out value="${resultInfo.pNum}"/>');return false;"> 
 --%>   
      <%-- <td><c:out value='${resultInfo.projectName}'/></td> --%>
     
      <td><c:out value="${resultInfo.pNum}"/></td>
	  <td><c:out value="${resultInfo.taskNm}"/></td>
      <td><a href="<c:url value='/pyungga/pyunggaDetail.do?pNum=${resultInfo.pNum}'/>"><c:out value='${resultInfo.projectName}'/></a><!-- 과제명 -->
</td>
      <td><c:out value='${resultInfo.start}'/></td>
      <td><c:out value='${resultInfo.end}'/></td>
      <td><c:out value='${resultInfo.pyunggaName}'/></td>      
      <td><c:out value='${resultInfo.score}'/></td>      
      <td><c:out value='${resultInfo.pass}'/></td>            
  
   </tr>
   </c:forEach>
   </tbody>
   </table>
   
   

</div>

</form>






</body>
</html>