<!DOCTYPE html>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="pageTitle"><spring:message code="pms.workprogress.title"/></c:set>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>${pageTitle}</title>
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
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
   document.listForm.action = "<c:url value='/pms/workprogress/WorkProgressListView.do'/>";
      document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_egov_search_WorkPmsProgress(){
   document.listForm.pageIndex.value = 1;
      document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_WorkPmsProgress(){
   location.href = "<c:url value='/pms/workprogress/WorkProgressModify.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_WorkPmsProgress(proId){
   console.log(4 * 5);
   var varForm             = document.all["Form"];
   varForm.action           = "<c:url value='/pms/workprogress/WorkProgressDetail.do'/>";
   varForm.proId.value   = proId;
   varForm.submit();
}

</script>
</head>

<body>
<div class="board">
   <h1>${pageTitle}</h1>

<form name="listForm" action="<c:url value='/pms/workprogress/WorkProgressListView.do'/>" method="post">
   <div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
      <ul>
         <li>
         <!--조회-->
            <select name="searchCnd" class="select" title="" id = "searchCnd" >
            <option selected value=''><spring:message code="pms.workprogress.select" /></option><!-- --선택하세요-- -->
            <option value='1' <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>><spring:message code="pms.workprogress.comName" /></option><!-- 기업명 -->
            <option value='2' <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if>><spring:message code="pms.workprogress.workName" /></option><!-- 과제명 -->
            <option value='3' <c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if>><spring:message code="pms.workprogress.taskName" /></option><!-- 사업명 -->
            </select>
            <input id="searchWrd" class="s_input2 vat" name="searchWrd" type="text" value="${searchVO.searchWrd}" maxlength="35" size="35" onkeypress="press();" /><!--입력란 -->
            <span class="btn_b"><a href="#noscript" onclick="fn_egov_search_WorkPmsProgress(); return false;" title="<spring:message code="button.inquire" />"><spring:message code="button.inquire" /></a></span><!-- 조회 버튼 -->
            
         </li>
      </ul>
   </div>

   <table class="board_list">
      <caption></caption>
      <colgroup>
         <col style="width:10%" />
         <col style="width:25%" />
         <col style="width:10%" />
         <col style="width:30%" />
         <col style="width:15%" />
         <col style="width:10%" />
      </colgroup>
      <thead>
         <tr>
            <th scope="col"><spring:message code="pms.workprogress.boardNo" /></th><!-- 순번 -->
            <th scope="col"><spring:message code="pms.workprogress.workName" /></th><!-- 과제명 -->
            <th scope="col"><spring:message code="pms.workprogress.typeName" /></th><!-- 과제유형 -->
            <th scope="col"><spring:message code="pms.workprogress.taskName" /></th><!-- 사업명 --> 
            <th scope="col"><spring:message code="pms.workprogress.comName" /></th><!-- 기업명 --> 
            <th scope="col"><spring:message code="pms.workprogress.success" /></th> <!-- 결과 -->
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
         <tr style="cursor:pointer;cursor:hand;" onclick="fn_egov_detail_WorkPmsProgress('${resultInfo.proId}');">
            <td><c:out value="${(paginationInfo.totalRecordCount+1)-((searchVO.pageIndex - 1) * searchVO.pageSize + status.count)}"/></td> <!--구분-->
            <td>${resultInfo.proName}</td> <!-- 과제명 -->
            <td>${resultInfo.typeName}</td> <!-- 과제유형-->
            <td>${resultInfo.taskName}</td> <!-- 사업명 -->
            <td>${resultInfo.comName}</td> <!-- 기업명 -->
            <td>${resultInfo.successName}</td> <!-- 결과 -->
         </tr>
         </c:forEach>
         
         <c:if test="${fn:length(resultList) == 0}">
            <tr>
               <td colspan=6>
                  <spring:message code="common.nodata.msg" />
               </td>
            </tr>
         </c:if>
      </tbody>
   </table>

   <!-- paging navigation -->
   <div class="pagination">
      <ul>
         <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_pageview"/>
      </ul>
   </div>
   
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
   
</form>
<form name="Form" method="post">
   <input type="hidden" name="proId">
   <input type="submit" id="invisible" class="invisible"/>
</form>

   
</div>


</body>
</html>