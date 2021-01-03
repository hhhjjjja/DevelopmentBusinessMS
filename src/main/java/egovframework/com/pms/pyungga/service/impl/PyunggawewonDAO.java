package egovframework.com.pms.pyungga.service.impl;

import java.util.List;



import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.pyungga.service.Pyunggawewon;
import egovframework.com.pms.pyungga.service.PyunggawewonVO;

@Repository("PyunggawewonDAO")
public class PyunggawewonDAO extends EgovComAbstractDAO
{

	public void insertPyunggawewon(Pyunggawewon pyunggawewon) throws Exception
	{
		insert("PyunggawewonDAO.insertPyunggawewon",pyunggawewon);
		
	}

	public List<?> selectPyunggawewonList(ProjectVO projectVO) {
		// TODO Auto-generated method stub
		return selectList("PyunggawewonDAO.selectPyunggawewon", projectVO);
		
	
	}

	
	
}



//public List<?> selectPyunggawewonList(PyunggawewonVO searchVO) throws Exception
//{
//	return selectList("PyunggawewonDAO.selectPyunggawewonList", searchVO);
//}
//
//public int selectPyunggawewonListTotCnt(PyunggawewonVO searchVO) throws Exception
//{
//	return (Integer)selectOne("PyunggawewonDAO.selectPyunggawewonListCnt", searchVO);
//}
//public void insertPyunggawewon(Pyunggawewon pyunggawewon) throws Exception
//{
//	insert("PyunggawewonDAO.insertPyunggawewon",pyunggawewon);
//}
//public Pyunggawewon selectPyunggawewonDetail(Pyunggawewon pyunggawewon) throws Exception
//{
//	return (Pyunggawewon) selectOne("PyunggawewonDAO.selectPyungawewonDetail",pyunggawewon);
//}
//public void deletePyungawewon(Pyunggawewon pyunggawewon) throws Exception
//{
//	delete("PyunggawewonDAO.deletePyunggawewon",pyunggawewon);
//}
//public List<?> selectFileList(String fileSvNm) throws Exception
//{
//	return selectList("PyunggawewonDAO.selectFileList", fileSvNm);
//}
//public int selectFileListToCnt(String fileSvNm) throws Exception
//{
//	return (Integer)selectOne("PyunggawewonDAO.selectFileListToCnt",fileSvNm);
//}
//