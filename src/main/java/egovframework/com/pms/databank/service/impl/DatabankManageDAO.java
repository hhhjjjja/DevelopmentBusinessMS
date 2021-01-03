package egovframework.com.pms.databank.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.pms.databank.service.Databank;
import egovframework.com.pms.databank.service.DatabankVO;

@Repository("DatabankManageDAO")
public class DatabankManageDAO extends EgovComAbstractDAO{
	
    public List<?> selectDatabankList(DatabankVO searchVO) throws Exception {
    	//queryId, parameterObject
        return selectList("DatabankManageDAO.selectDatabankList", searchVO);
    }
    
    public int selectDatabankListTotCnt(DatabankVO searchVO) throws Exception {
        return (Integer)selectOne("DatabankManageDAO.selectDatabankListTotCnt", searchVO);
    }
    
    public void insertDatabank(Databank databank) throws Exception {
    	insert("DatabankManageDAO.insertDatabank", databank);
    }
    
    public Databank selectDatabankDetail(Databank databank) throws Exception {
    	return (Databank) selectOne("DatabankManageDAO.selectDatabankDetail", databank);
    }
    
    public void deleteDatabank(Databank databank) throws Exception {
    	delete("DatabankManageDAO.deleteDatabank", databank);
    }
    
    public List<?> selectFileList(String fileSvNm) throws Exception {
    	return selectList("DatabankManageDAO.selectFileList", fileSvNm);
    }
    
    public int selectFileListToCnt(String fileSvNm) throws Exception {
    	return (Integer)selectOne("DatabankManageDAO.selectFileListToCnt", fileSvNm);
    }
    
    public void updateDatabank(Databank databank) throws Exception {
    	update("DatabankManageDAO.updateDatabank", databank);
    }
    
    public void deleteFile(String atchFileId, String fileSn) throws Exception {
    	HashMap<String, String> parameterObject = new HashMap<>();
    	parameterObject.put("atchFileId", atchFileId);
    	parameterObject.put("fileSn", fileSn);
    	
    	delete("DatabankManageDAO.deleteFile", parameterObject);
    }
}
