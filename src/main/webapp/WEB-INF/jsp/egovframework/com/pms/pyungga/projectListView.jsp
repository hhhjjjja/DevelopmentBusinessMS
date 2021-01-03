
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
/* 		alert('retVal child = ' + retVal);
 */
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

<!-- <form name="ProjectListForm" action="<c:url value='/cop/bbs/selectBBSMasterInfs.do'/>" method="post" onSubmit="fn_egov_search_bbssj(); return false;">-->
<form name="PyunggaForm" method = "get">
<div class="board">
   <h1>${pageTitle} <spring:message code="title.list" /></h1><!-- 게시판 목록 -->
   <!-- 하단 버튼 -->
   <div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
      <ul>
         <li>
            <select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
               <option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="pms.pyungga.busName" /></option><!-- 과제명 -->
               <option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="pms.pyungga.ComName" /></option><!-- 과제선정여부-->
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
		<col style="width: 10%;">
		<col style="width: 40%;">
		<col style="width: 20%;">
		<col style="width: 20%;">
		<col style="width: 10%;">
		
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th class="board_th_link"><spring:message code="comBudget.projectList.searchProjectName" /></th><!-- 과제명 -->
		<th><spring:message code="comBudget.projectList.listBudget" /></th><!-- 예산관리 -->
		<th><spring:message code="comBudget.projectList.listSelection" /></th><!-- 과제선정여부 -->
			<th><spring:message code="table.select" /></th><!-- 선택 -->
		
		
	</tr>
	</thead>
	
	<tbody class="ov">
	<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td colspan="5"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		<tr>
			<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
			<td>
				<a href="<c:url value='/pms/bud/selectProjectDetail.do'/>"><c:out value='${resultInfo.proName}'/></a><!-- 과제명 -->
			</td>	
			<td>
				<a class="btn_submit" href="<c:url value='/pms/bud/budgetListView.do?proId=${resultInfo.proId}'/>"><spring:message code="comBudget.projectList.listItemConfig" /></a>	<!-- 예산항목 설정 -->
			</td>
			<!-- <td class="right"><a href="<c:url value='/cop/bbs/selectBBSMasterDetail.do?bbsId=${resultInfo.proId}'/>" onClick="fn_egov_inquire_bbsdetail('<c:out value="${resultInfo.proId}"/>');return false;"><c:out value='예산관리'/></a></td> -->
			<td><c:out value='${resultInfo.isSelect}'/></td><!-- 과제선정여부 -->
			<td>
				<button class="btn_style3" onClick="javascript:fn_egov_returnUserInfo('<c:out value="${resultInfo.proId}" />'); return false;" title="<spring:message code="button.select" /> <spring:message code="input.button" />"><spring:message code="button.select" /></button>
			
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
   
   

</div>
<input name="cmmntyId" type="hidden" value="<c:out value='${searchVO.cmmntyId}'/>">
<input name="bbsId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>





</body>
</html>