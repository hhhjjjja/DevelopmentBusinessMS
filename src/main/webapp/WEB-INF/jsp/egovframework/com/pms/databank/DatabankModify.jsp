<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<html>
<head>
<meta charset="UTF-8">
<title>데이터 수정</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript">

/* 삭제 파일 list */
var arr = [];
arr.length = 0;

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list(){
	location.href = "<c:url value='/pms/databank/boardListView.do' />";
}

/* ********************************************************
 * 수정사항 저장
 ******************************************************** */
function fn_save_btn(form) {
	if(confirm("<spring:message code='common.save.msg'/>")){
		form.action           = "<c:url value='/pms/databank/dataUpdate.do'/>";
		form.fList.value = arr;
		form.submit();
	}
}

/* ********************************************************
 * 첨부파일 삭제
 ******************************************************** */
function fn_file_delete(index, fileSn) {
	var listIdx = document.getElementById('fileList_'+index);
	var sn = fileSn;
	
	listIdx.style.display = 'none';
 	arr.push(sn);
}
</script>

</head>
<body>
<div class="board">
	<h1>데이터 수정</h1>
	
	<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="<c:url value='/pms/databank/dataUpdate.do'/>">
		<input type="hidden" name="savePath" value="Globals.databankFilePath"/>
		<input type="hidden" name="atchPosblFileNumber" id="atchPosblFileNumber" value="5"/>		<!-- 최대첨부가능갯수 -->
	
	<!-- 등록폼 -->
	<table class="wTable">

		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="pms.databank.busName" /> <span class="pilsu">*</span></th><!-- 사업명 -->
			<td class="left">
				<input type="text" id="bussNm" name="bussNm" size="50" maxlength="50" value="${result.bussNm}" title="<spring:message code='pms.databank.busName' />"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.comName" /> <span class="pilsu">*</span></th><!-- 기업명 -->
			<td class="left">
				<input type="text" id="comNm" name="comNm" size="50" maxlength="50" value="${result.comNm}" title="<spring:message code='pms.databank.comName' />"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.ex" /> <span class="pilsu">*</span></th><!-- 사업설명 -->
			<td class="left">
				<textarea name="bussEx" rows="3" cols="60" title="<spring:message code='pms.databank.ex' />">${result.bussEx}</textarea>
			</td>
		</tr>
		<tr>
			<th><spring:message code="pms.databank.data" /> <span class="pilsu"></span></th><!-- 첨부 -->
			<td>
				<table>
					<tr>
						<td><input name="file_1" id="egovComFileUploader" type="file" /></td>
					</tr>
					<tr><td style="text-align:left;"><div id="egovComFileList"></div></tr>
					<tr>
						<table style="margin-top:10px;">
							<c:forEach items="${fileList}" var="fileList" varStatus="status">
								<tr id="fileList_${status.index}" style="padding:11px 5px; border-top:1px solid #d9d9d9; border-bottom:1px solid #d9d9d9;">
									<td style="text-align:left; padding:5px;">${fileList.orignlFileNm} 	&#40;${fileList.fileSize/1000} MB&#41;</td>
									<td style="text-align:right; padding:5px;"><span class="btn_s"><a href="#noscript" onclick="fn_file_delete(${status.index}, ${fileList.fileSn}); return false;"><spring:message code="button.delete" /></a></span></td>
								</tr>
							</c:forEach>
						</table>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
		<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fn_save_btn(document.frm); return false;" /><!-- 저장 -->
		<span class="btn_s"><a href="#noscript" onclick="fn_egov_list(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>
	
	<input type="hidden" name="dataId" value="${result.dataId}"/>
	<input type="hidden" name="fList"/>
	<input type="hidden" name="atchFileId" value="${result.atchFileId}"/>
	
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