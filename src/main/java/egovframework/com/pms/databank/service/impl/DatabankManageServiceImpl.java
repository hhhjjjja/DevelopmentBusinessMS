package egovframework.com.pms.databank.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.pms.databank.service.Databank;
import egovframework.com.pms.databank.service.DatabankManageService;
import egovframework.com.pms.databank.service.DatabankVO;
import egovframework.com.pms.databank.service.impl.DatabankManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("DatabankManageService")
public class DatabankManageServiceImpl extends EgovAbstractServiceImpl implements DatabankManageService {
	
	@Resource(name="DatabankManageDAO")
	private DatabankManageDAO databankMngDAO;

	@Override
	public List<?> selectDatabankList(DatabankVO searchVO) throws Exception {
		return databankMngDAO.selectDatabankList(searchVO);
	}
	
	@Override
	public int selectDatabankListTotCnt(DatabankVO searchVO) throws Exception {
		return databankMngDAO.selectDatabankListTotCnt(searchVO);
	}
	
	@Override
	public void insertDatabank(Databank databank) throws Exception {
		databankMngDAO.insertDatabank(databank);
	}

	@Override
	public Databank selectDatabankDetail(Databank databank) throws Exception {
		Databank data = databankMngDAO.selectDatabankDetail(databank);
		return data;
	}

	@Override
	public void deleteDatabank(Databank databank) throws Exception {
		databankMngDAO.deleteDatabank(databank);
	}

	@Override
	public List<?> selectFileList(String fileSvNm) throws Exception {
		return databankMngDAO.selectFileList(fileSvNm);
	}

	@Override
	public int selectFileListToCnt(String fileSvNm) throws Exception {
		return databankMngDAO.selectFileListToCnt(fileSvNm);
	}

	@Override
	public void updateDatabank(Databank databank) throws Exception {
		databankMngDAO.updateDatabank(databank);
	}

	@Override
	public void deleteFile(String atchFileId, String fileSn) throws Exception {
		databankMngDAO.deleteFile(atchFileId, fileSn);
	}
}
