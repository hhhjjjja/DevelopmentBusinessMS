package egovframework.com.pms.pyungga.service;

import java.util.List;

import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.bud.service.ProjectVO;


public interface PyunggaManageService 
{
	 /**
     * 데이터 등록
     */
	
	void insertPyungga(Pyungga pyungga) throws Exception;
	
	List<?> selectPyunggaList(PyunggaVo pyunggaVO) throws Exception;
	
	List<?> selectPyunggaList2(Pyungga pyungga) throws Exception;


	Pyungga	selectPyunggaDetail(Pyungga pyungga) throws Exception;
	
	void updatePyungga(Pyungga pyungga) throws Exception;
	
	void deletePyungga(Pyungga pyungga) throws Exception;
	
	void insertPyunggawewon(Pyunggawewon pyunggawewon) throws Exception;
	
	List<?> selectPyunggawewonList(ProjectVO projectVO) throws Exception;

	void insertPyunggatask(TaskVO taskVO) throws Exception;
	
}
