<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="pageTitle"><spring:message code="pms.databank.form.title"/></c:set>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_databank_list_view(){
	location.href = "<c:url value='/pms/databank/boardListView.do' />";
}

function set_selectVal(obj) {
 	var setForm = document.getElementById("frm");
	var sel = document.getElementById("taskSelect");
	var txt = document.getElementById("bussNm");

	var data = obj.split(",");
	var id = data[0];
	var com = data[1];
	
	setForm.taskId.value = id;
	setForm.comNm.value = com;
	txt.value = sel.options[sel.selectedIndex].text;
}
</script>
</head>

<body>

<div class="board">
	<h1>${pageTitle}</h1>
	
	<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="<c:url value='/pms/databank/insertData.do'/>">
		<input type="hidden" name="savePath" value="Globals.databankFilePath"/>
		<input type="hidden" name="atchPosblFileNumber" id="atchPosblFileNumber" value="10"/>		<!-- 최대첨부가능갯수 -->
		<input type="hidden" name="taskId" value=''/>
	
	<!-- 등록폼 -->
	<table class="wTable">

		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="pms.databank.busName" /> <span class="pilsu">*</span></th><!-- 사업명 -->
			<td class="left">
				<select name="taskSelect" class="select" title="" id="taskSelect" onChange="set_selectVal(this.value);">
					<option selected value=''>사업명을 선택하세요</option>
					<c:forEach items="${taskLst}" var="taskInfo" varStatus="status">
						<option value="${taskInfo.asId},${taskInfo.comName}">${taskInfo.asName}</option>
					</c:forEach>
				</select>
				<input type="hidden" id="bussNm" name="bussNm" title="<spring:message code='pms.databank.busName' />"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.comName" /> <span class="pilsu">*</span></th><!-- 기업명 -->
			<td class="left">
				<input type="text" id="comNm" name="comNm" size="50" maxlength="50" title="<spring:message code='pms.databank.comName' />"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.ex" /> <span class="pilsu">*</span></th><!-- 사업설명 -->
			<td class="left">
				<textarea name="bussEx" rows="3" cols="60"  title="<spring:message code='pms.databank.ex' />"></textarea>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.data" /> <span class="pilsu"></span></th><!-- 첨부 -->
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