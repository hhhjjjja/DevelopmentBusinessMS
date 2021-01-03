
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<meta charset="UTF-8">
<script type="text/javascript">
	/* function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_userInfo('1');
		}
	} */
	function fn_egov_returnUserInfo(uniqId){
		
		var retVal = uniqId;
		 parent.fn_egov_returnValue(retVal);
		
	}

	/* function fn_egov_select_userInfo(pageIndex){
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/cop/adb/selectManList.do'/>";
		document.frm.submit();
	} */

	function fn_egov_close(){
		parent.closeWindow();
	}
</script>
</head>
<body>

<form name="Pyunggawewonlist" method = "get">
<div class="board">
   <h1>${pageTitle} <spring:message code="pms.pyungga.select.title" /></h1><!-- 게시판 목록 -->
   <!-- 하단 버튼 -->
   <div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
      <ul>
         <li>
            <select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
               <option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="pms.pyungga.bName" /></option><!-- 과제명 -->
               <option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="pms.pyungga.cName" /></option><!-- 과제선정여부-->
            </select>
         </li>
         <!-- 검색키워드 및 조회버튼 -->
         <li>
            <input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
            <input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" /><!-- 조회 -->
            <span class="btn_b"><a href=" <c:url value='/pyunggawewon/insertView.do' /><%-- <c:url value='/pyungga/insertView?cmmntyId=${searchVO.cmmntyId}' /> --%> "  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span><!-- 등록 -->

         
         </li>
      </ul>
   </div>
   
   <!-- 목록영역 -->
   <table class="board_list" summary="<spring:message code="pms.pyungga.select.title" arguments="${pageTitle}" />">
   <caption>${pageTitle}<spring:message code="title.list" /></caption>
   <colgroup>
      <col style="width: 8%;">
      <col style="width: 15%;">
      <col style="width: 15%;">
      <col style="width: 19%;">
      <col style="width: 25%;">
      <col style="width: 9%;">
      <col style="width: 9%;">
      
   </colgroup>
   <thead>
   <tr>
      <th scope="col"><spring:message code="pms.pyungga.select.column1" /></th><!-- 순번 -->
      <th scope="col"><spring:message code="pms.pyungga.select.column2" /></th><!-- 평가위원이름 -->
      <th scope="col"><spring:message code="pms.pyungga.select.column3" /></th><!-- 평가위원소속기관-->
      <th scope="col"><spring:message code="pms.pyungga.select.column4" /></th><!-- 평가위원연락처-->
      <th scope="col"><spring:message code="pms.pyungga.select.column5" /></th><!-- 평가위원 이메일-->
      <th scope="col"><spring:message code="pms.pyungga.select.column7" /></th><!-- 경력-->
      <th scope="col"><spring:message code="pms.pyungga.select.column8" /></th><!-- 선택-->

   </tr>
   </thead>
   
   <tbody class="ov">
   <c:if test="${fn:length(resultList1) == 0}">
   <tr>
      <td colspan="7"><spring:message code="common.nodata.msg" /></td>
   </tr>
   </c:if>
   <c:forEach items="${resultList1}" var="resultInfo1" varStatus="status">

    <tr>
      <td><c:out value="${resultInfo1.pyunggaid}"/></td>
      <td><c:out value='${resultInfo1.pyunggawewonname}'/></td>
      <td><c:out value='${resultInfo1.pyunggwewoncompanay}'/></td>
      <td><c:out value='${resultInfo1.pyunggawewonphone}'/></td>
      <td><c:out value='${resultInfo1.pyunggawewonemail}'/></td>
      <td><c:out value='${resultInfo1.pyunggawewoncareer}'/></td>  
      <td>
	<button class="btn_style3" onClick="javascript:fn_egov_returnUserInfo('<c:out value="${resultInfo1.pyunggaid}" />'); return false;" title="<spring:message code="button.select" /> <spring:message code="input.button" />"><spring:message code="button.select" /></button>
		
	</td>     
   </tr>
   </c:forEach>
   </tbody>
   </table>
   
   

</div>

<input name="bbsId" type="hidden" value="">

</form>









</body>
</html>