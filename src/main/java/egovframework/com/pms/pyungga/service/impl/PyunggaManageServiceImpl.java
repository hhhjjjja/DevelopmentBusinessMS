package egovframework.com.pms.pyungga.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.pyungga.service.Pyungga;
import egovframework.com.pms.pyungga.service.PyunggaManageService;
import egovframework.com.pms.pyungga.service.PyunggaVo;
import egovframework.com.pms.pyungga.service.Pyunggawewon;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("PyunggaManageService")
public class PyunggaManageServiceImpl extends EgovAbstractServiceImpl implements PyunggaManageService{
	
	@Resource(name="PyunggaDAO")
	private PyunggaDAO pyunggaDAO;

	@Override//사업 입력
	public void insertPyunggatask(TaskVO taskVO) throws Exception {
		System.out.println("사업 리스트 출력 레츠고  => " + taskVO.getTask_id());
		pyunggaDAO.insertPyunggatask(taskVO);
	}
	
	
	@Override//평가 입력
	public void insertPyungga(Pyungga pyungga) throws Exception {
		System.out.println("dfdfdfdfd  => " + pyungga.getPyunggaid());
		pyunggaDAO.insertPyungga(pyungga);
	}
	@Override//평가 리스트 조회
	public List<?> selectPyunggaList(PyunggaVo pyunggaVO) throws Exception {
		return pyunggaDAO.selectPyunggaList(pyunggaVO);
	}
	@Override//평가 리스트 조회 검색
	public List<?> selectPyunggaList2(Pyungga pyungga) throws Exception {
		return pyunggaDAO.selectPyunggaList2(pyungga);
	}
	@Override//평가 데이터 조회 (디테일)
	public Pyungga selectPyunggaDetail(Pyungga pyungga) throws Exception {
		Pyungga data = pyunggaDAO.selectPyunggaDetail(pyungga);
		
		return data;
	}
	@Override//평가 데이터 업데이트
	public void updatePyungga(Pyungga pyungga) throws Exception {
		pyunggaDAO.updatePyungga(pyungga);
	}
	@Override//평가 데이터 삭제
	public void deletePyungga(Pyungga pyungga) throws Exception {
		pyunggaDAO.deletePyungga(pyungga);
	}

	@Resource(name="PyunggawewonDAO")
	private PyunggawewonDAO pyunggawewonDAO;
	
	@Override
	public void insertPyunggawewon(Pyunggawewon pyunggawewon) throws Exception 
	{
		System.out.println("갓승배");
		pyunggawewonDAO.insertPyunggawewon(pyunggawewon);
	}
	@Override
	public List<?> selectPyunggawewonList(ProjectVO projectVO) throws Exception {
		System.out.println("갓승배리스트출력");
		return pyunggawewonDAO.selectPyunggawewonList(projectVO);
	}


	
	
	

}
