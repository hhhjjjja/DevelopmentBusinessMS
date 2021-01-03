package egovframework.com.pms.workprogress.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.workprogress.service.PmsProgress;
import egovframework.com.pms.workprogress.service.PmsProgressVO;

@Repository("WorkProgressManageDAO")
public class WorkProgressManageDAO extends EgovComAbstractDAO {
	/**
	 * 선정과제 삭제한다.
	 * @param pmsprogress
	 * @throws Exception
	 */
	public void deletePmsProgress(Project pmsprogress) throws Exception {
		delete("WorkProgressManageDAO.deletePmsProgress", pmsprogress);
	}


	/**
	 * 선정과제 등록한다.
	 * @param pmsprogress
	 * @throws Exception
	 */
	public void insertPmsProgress(Project pmsprogress) throws Exception {
        insert("WorkProgressManageDAO.insertPmsProgress", pmsprogress);
	}

	/**
	 * 상세항목을 조회한다.
	 * @param pmsprogress
	 * @return PmsProgress(선정과제)
	 * @throws Exception
	 */
	public Project selectPmsProgressDetail(Project pmsprogress) throws Exception {
    	System.out.println("디테일다오");
		return (Project) selectOne("WorkProgressManageDAO.selectPmsProgressDetail", pmsprogress);
	}


    /**
     * 선정과제 목록을 조회한다.
     * @param searchVO
	 * @return List(선정과제 목록)
     * @throws Exception
     */
    public List<?> selectPmsProgressList(ProjectVO searchVO) throws Exception {
    	System.out.println("dao");
        return selectList("WorkProgressManageDAO.selectPmsProgressList", searchVO);
    }

    /**
     * 
     * 글 총 갯수를 조회한다.
     * @param searchVO
     * @return int(휴일 총 갯수)
     * @throws Exception
     */
    public int selectPmsProgressListTotCnt(ProjectVO searchVO) throws Exception {
        return (Integer)selectOne("WorkProgressManageDAO.selectPmsProgressListTotCnt", searchVO);
    }

	/**
	 * 선정과제를 수정한다.
	 * @param pmsprogress
	 * @throws Exception
	 */
	public void updatePmsProgress(Project pmsprogress) throws Exception {
		System.out.println("업데이트dao");
		update("WorkProgressManageDAO.updatePmsProgress", pmsprogress);
	}
	
	public void updateWork(Project pmsprogress) throws Exception {
		System.out.println("과제업뎃dao");
		update("WorkProgressManageDAO.updateWork", pmsprogress);
	}

}
