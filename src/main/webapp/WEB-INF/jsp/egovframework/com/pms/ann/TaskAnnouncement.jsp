<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
/*
 * 공모사업 관리 JSP 파일
 * @author 사업비관리_윤태준 생성
 * @since 2020.11.09
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일                수정자               수정내용
 *  -------     --------   ----------------------------
 *  2020.11.10   윤태준             생성  
 *   
 * </pre>
 */
%>
<c:set var="pageTitle"><spring:message code="comAnnouncement.businessManagement.bName"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.list" /></title> <!-- 공고사업 관리 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript">
if(!${isAuthenticated}){
	alert("로그인 후 이용할 수 있습니다.");
	window.history.back();
}
</script>
</head>

<body>
<form name="businessAnnForm" method = "get">
<div class="board">
	<h1>${pageTitle} <spring:message code="title.list" /></h1><!-- 공고사업 목록 -->
	<!-- 하단 버튼 -->
	<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
		<ul>
			<li>
				<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
					<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comAnnouncement.searchBusiness.bName" /></option><!-- 과제명 -->
				</select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
				<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" /><!-- 조회 -->
				<span class="btn_b"><a href="<c:url value='/pms/ann/taskForm.do' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span><!-- 등록 -->
			</li>
		</ul>
	</div>
	
	<!-- 목록영역 -->
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle}<spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 50%;">
		<col style="width: 20%;">
		<col style="width: 20%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th class="board_th_link"><spring:message code="comAnnouncement.searchBusiness.bName" /></th><!-- 과제명 -->
		<th><spring:message code="comAnnouncement.businessList.bStatus" /></th><!-- 예산관리 -->
		<th><spring:message code="comAnnouncement.businessList.bItems" /></th><!-- 과제선정여부 -->
	</tr>
	</thead>
	<tbody class="ov">
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<input type="hidden" name="eDate" id="eDate" value='${resultInfo.eDate}' >
				
				<tr>
					<td><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
					<td>${resultInfo.proNm}</td>
					<td id="st"></td>
					<td></td>
				</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan=4>
						<spring:message code="common.nodata.msg" />
					</td>
				</tr>
			</c:if>
	</tbody>
	
	</table>
	
	<!-- paging navigation -->
	<%-- <div class="pagination">
		<ul>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
		</ul>
	</div> --%>

</div>
<input name="cmmntyId" type="hidden" value="<c:out value='${searchVO.cmmntyId}'/>">
<input name="bbsId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<!-- <script type="text/javascript">
(function() {
		var eDate = document.getElementById('eDate').value;
		var edArr = eDate.split('-');
		
		eDate = edArr[0]+edArr[1]+edArr[2];
		
		var date = new Date();
		var y = date.getFullYear();
		var m = ""+(date.getMonth()+1);
		var d = ""+date.getDate();
		
		if(m.length < 2) m="0"+m;
		if(d.length < 2) d="0"+d;
		
		var today = y.toString()+m+d;
		var res;
		
		if(eDate > today) {
			res = "종료";
		} else {
			res = "진행중";
		}
		document.getElementById('st').innerHTML = res;
})()
</script> -->

<script type="text/javascript">
function dateCalc(ed) {
	/* var eDate = document.getElementById('eDate').value; */
	var eDate = ed;
	var edArr = eDate.split('-');
						
	eDate = edArr[0]+edArr[1]+edArr[2];
						
	var date = new Date();
	var y = date.getFullYear();
	var m = ""+(date.getMonth()+1);
	var d = ""+date.getDate();
						
	if(m.length < 2) m="0"+m;
	if(d.length < 2) d="0"+d;
						
	var today = y.toString()+m+d;
	var res;
						
	if(eDate > today) {
		res = "종료";
	} else {
		res = "진행중";
	}
		document.getElementById('st').innerHTML = res;
}
</script>
</body>
</html>