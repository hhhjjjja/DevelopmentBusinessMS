<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="pageTitle"><spring:message code="comAnnouncement.businessManagement.bName"/></c:set>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

</head>
<body>
<div class="board">
	<h1>${pageTitle} 등록</h1>
	
	<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="<c:url value='/pms/ann/insertTask.do'/>">
		<input type="hidden" name="savePath" value="Globals.databankFilePath"/>
		<input type="hidden" name="atchPosblFileNumber" id="atchPosblFileNumber" value="10"/>		<!-- 최대첨부가능갯수 -->
	
	<!-- 등록폼 -->
	<table class="wTable">

		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="comAnnouncement.searchBusiness.bName" /> <span class="pilsu">*</span></th><!-- 사업이름 -->
			<td class="left">
				<input type="text" id="taskNm" name="taskNm" size="50" maxlength="50" title="<spring:message code='comAnnouncement.searchBusiness.bName' />"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comAnnouncement.businessList.bInfo" /> <span class="pilsu">*</span></th><!-- 모집정보 -->
			<td class="left">
				<textarea name="taskCntnt" rows="3" cols="60"  title="<spring:message code='comAnnouncement.businessList.bInfo' />"></textarea>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comAnnouncement.businessList.date" /> <span class="pilsu">*</span></th><!-- 사업연도 -->
			<td class="left">
				<input type="date" name="taskStartDate" title="<spring:message code='comAnnouncement.businessList.date' />" />
				&nbsp;&nbsp;~&nbsp;&nbsp;
				<input type="date" name="taskEndDate" title="<spring:message code='comAnnouncement.businessList.date' />" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comAnnouncement.businessList.file" /> <span class="pilsu"></span></th><!-- 첨부 -->
			<td>
				<table>
					<tr>
						<td><input name="file_1" id="egovComFileUploader" type="file" /></td>
					</tr>
					<tr>
						<td><div id="egovComFileList" align="left"></div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.list" />" onclick="fn_databank_list_view(); return false;" /><!-- 목록 -->
		<span class="btn_s"><input class="s_submit" type="submit" value="<spring:message code="button.save" />"></span><!-- 저장 -->
	</div>
	<div style="clear:both;"></div>
	
	</form>
</div>

<!-- 첨부파일 다중선택 list -->
<script type="text/javascript">
	var maxFileNum = document.getElementById('atchPosblFileNumber').value;
	if(maxFileNum == null || maxFileNum == "") {
		maxFileNum = 3;
	}
	var multi_selector = new MultiSelector(document.getElementById('egovComFileList'), maxFileNum);
	multi_selector.addElement(document.getElementById('egovComFileUploader'));
</script>
</body>
</html>