package egovframework.com.pms.databank.service;

import java.util.List;

import egovframework.com.cmm.service.FileVO;


public interface DatabankManageService {
	/**
	 * 데이터 목록을 조회
	 */
	List<?> selectDatabankList(DatabankVO searchVO) throws Exception;

    /**
     * 총 갯수를 조회
     */
    int selectDatabankListTotCnt(DatabankVO searchVO) throws Exception;
    
    /**
     * 데이터 등록
     */
    void insertDatabank(Databank databank) throws Exception;
    
    Databank selectDatabankDetail(Databank databank) throws Exception;
    
    void deleteDatabank(Databank databank) throws Exception;
    
    List<?> selectFileList(String fileSvNm) throws Exception;
    
    int selectFileListToCnt(String fileSvNm) throws Exception;
    
    void updateDatabank(Databank databank) throws Exception;
    
    void deleteFile(String atchFileId, String fileSn) throws Exception;
}
