package egovframework.com.pms.workprogress.service;

import java.util.List;

import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.bud.service.ProjectVO;


public interface WorkProgressManageService {
	void deletePmsProgress(Project pmsprogress) throws Exception;

	/**
	 * 선정과제를 등록한다.
	 * @param PmsProgress
	 * @throws Exception
	 */
	void insertPmsProgress(Project pmsprogress) throws Exception;

	/**
	 * 상세항목을 조회한다.
	 * @param PmsProgress
	 * @return PmsProgress(휴일)
	 * @throws Exception
	 */
	Project selectPmsProgressDetail(Project pmsprogress) throws Exception;

	/**
	 * 선정과제 목록을 조회한다.
	 * @param searchVO
	 * @return List(휴일 목록)
	 * @throws Exception
	 */
	List<?> selectPmsProgressList(ProjectVO searchVO) throws Exception;

    /**
     * 선정과제 리스트 총 갯수를 조회한다.
     * @param searchVO
     * @return int(휴일 총 갯수)
     */
    int selectPmsProgressListTotCnt(ProjectVO searchVO) throws Exception;

	/**
	 * 선정과제를 수정한다.
	 * @param PmsProgress
	 * @throws Exception
	 */
	void updatePmsProgress(Project PmsProgress) throws Exception;

	void updateWork(Project PmsProgress) throws Exception;

}
