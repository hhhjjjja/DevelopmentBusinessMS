<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사업관리시스템</title>
<link href="<c:url value='/css/egovframework/com/cmm/main.css?1' />" rel="stylesheet" type="text/css">

<style type="text/css">
link { color: #666666; text-decoration: none; }
link:hover { color: #000000; text-decoration: none; }
</style>
</head>
<body>
<div id="lnb" class="left_bar">
<c:set var="isMai" value="false"/>
<c:set var="isUat" value="false"/>
<c:set var="isSec" value="false"/>
<c:set var="isSts" value="false"/>
<c:set var="isCop" value="false"/>
<c:set var="isUss" value="false"/>
<c:set var="isSym" value="false"/>
<c:set var="isSsi" value="false"/>
<c:set var="isDam" value="false"/>
<c:set var="isCom" value="false"/>
<c:set var="isExt" value="false"/>
<ul class="lnb_title">
	<c:forEach var="result" items="${resultList}" varStatus="status">
	
		<c:if test="${isMai == 'false' && result.gid == '0'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.mai.title"/></strong></strong><!-- 포털(예제) 메인화면 -->
			</li>
			<c:set var="isMai" value="true"/>
		</c:if>
		<c:if test="${isUat == 'false' && result.gid == '10'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.uat.title"/></strong></strong><!-- 사용자디렉토리/통합인증 -->
			</li>
			<c:set var="isUat" value="true"/>			
		</c:if>
		
		<c:if test="${isSec == 'false' && result.gid == '20'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.sec.title"/></strong></strong><!-- 보안 -->
			</li>
			<c:set var="isSec" value="true"/>
		</c:if>
		<c:if test="${isSts == 'false' && result.gid == '30'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.sts.title"/></strong></strong><!-- 통계/리포팅 -->
			</li>
			<c:set var="isSts" value="true"/>
		</c:if>
		<c:if test="${isCop == 'false' && result.gid == '40'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.cop.title"/></strong></strong><!-- 협업 -->
			</li>
			<c:set var="isCop" value="true"/>
		</c:if>
		<c:if test="${isUss == 'false' && result.gid == '50'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.uss.title"/></strong></strong><!-- 사용자지원 -->
			</li>
			<c:set var="isUss" value="true"/>
		</c:if>
		<c:if test="${isSym == 'false' && result.gid == '60'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.sym.title"/></strong></strong><!-- 시스템관리 -->
			</li>
			<c:set var="isSym" value="true"/>
		</c:if>
		<c:if test="${isSsi == 'false' && result.gid == '70'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.ssi.title"/></strong></strong><!-- 시스템/서비스연계  -->
			</li>
			<c:set var="isSsi" value="true"/>
		</c:if>
		<c:if test="${isDam == 'false' && result.gid == '80'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.dam.title"/></strong></strong><!-- 디지털 자산 관리 -->
			</li>
			<c:set var="isDam" value="true"/>
		</c:if>
		<c:if test="${isCom == 'false' && result.gid == '90'}">
			<li>
				<strong class="left_title_strong"><strong class="left2_title_strong"><spring:message code="comCmm.com.title"/></strong></strong> <!-- 요소기술 -->
			</li>
			<c:set var="isCom" value="true"/>
		</c:if>
		<c:if test="${isExt == 'false' && result.gid == '110'}">
			<li>
				
			</li>
			<c:set var="isExt" value="true"/>
		</c:if>
		
		<c:set var="componentMsgKey">comCmm.left.${result.order}</c:set>
		<ul class="2depth">
		<li style="font-family:'fantasy'; font-size:20px; margin-top:20px;"><a href="${pageContext.request.contextPath}<c:out value="${result.listUrl}"/>" target="_content" class="link"><spring:message code="${componentMsgKey}"/><!-- <c:out value="${result.name}"/> --></a></li>
		</ul>
	</c:forEach>
	
		
			<li style="font-family:'fantasy'; font-size:20px; margin-top:20px;">
				<a class="btn_submit" href="${pageContext.request.contextPath}/uat/uia/actionLogout.do" target="_content">로그아웃</a>
			</li>
		
</ul>

</body>
</html>
