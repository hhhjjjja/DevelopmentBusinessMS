package egovframework.com.pms.pyungga.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.pms.ann.service.TaskVO;
import egovframework.com.pms.pyungga.service.Pyungga;
import egovframework.com.pms.pyungga.service.PyunggaVo;

@Repository("PyunggaDAO")
public class PyunggaDAO extends EgovComAbstractDAO{
	
	public void insertPyungga(Pyungga pyungga) throws Exception {
    	insert("PyunggaDAO.insertPyungga", pyungga);
    }

	public List<?> selectPyunggaList(PyunggaVo pyunggaVO) throws Exception{
		return selectList("PyunggaDAO.selectPyungga", pyunggaVO);
	}
	public List<?> selectPyunggaList2(Pyungga pyungga) throws Exception{
		return selectList("PyunggaDAO.selectPyungga2", pyungga);
	}
	public Pyungga selectPyunggaDetail(Pyungga pyungga) throws Exception{
		return (Pyungga) selectOne("PyunggaDAO.selectPyunggaDetail", pyungga);	 
	}
	public void updatePyungga(Pyungga pyungga) throws Exception{
		update("PyunggaDAO.updatePyungga",pyungga);
	}
	public void deletePyungga(Pyungga pyungga) throws Exception{
		delete("PyunggaDAO.deletePyungga",pyungga);
	}

	public void insertPyunggatask(TaskVO taskVO) {
		// TODO Auto-generated method stub
		
	}
}
