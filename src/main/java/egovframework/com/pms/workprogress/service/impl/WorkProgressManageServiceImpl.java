package egovframework.com.pms.workprogress.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.pms.bud.service.Project;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.workprogress.service.PmsProgress;
import egovframework.com.pms.workprogress.service.PmsProgressVO;
import egovframework.com.pms.workprogress.service.WorkProgressManageService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("WorkProgressManageService")
public class WorkProgressManageServiceImpl extends EgovAbstractServiceImpl implements WorkProgressManageService   {

	@Resource(name="WorkProgressManageDAO")
	private WorkProgressManageDAO workProgressManageDAO;
	
	@Override
	public void deletePmsProgress(Project pmsprogress) throws Exception {
		// TODO Auto-generated method stub
		workProgressManageDAO.deletePmsProgress(pmsprogress);
		
	}

	@Override
	public void insertPmsProgress(Project pmsprogress) throws Exception {
		// TODO Auto-generated method stub
		workProgressManageDAO.insertPmsProgress(pmsprogress);
	}

	@Override
	public Project selectPmsProgressDetail(Project pmsprogress) throws Exception {
		// TODO Auto-generated method stub
    	System.out.println("디테일서비스임플");
		return workProgressManageDAO.selectPmsProgressDetail(pmsprogress);
	}

	@Override
	public List<?> selectPmsProgressList(ProjectVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return workProgressManageDAO.selectPmsProgressList(searchVO);
	}

	@Override
	public int selectPmsProgressListTotCnt(ProjectVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return workProgressManageDAO.selectPmsProgressListTotCnt(searchVO);
	}

	@Override
	public void updatePmsProgress(Project pmsprogress) throws Exception {
		// TODO Auto-generated method stub
		workProgressManageDAO.updatePmsProgress(pmsprogress);
	}

	@Override
	public void updateWork(Project PmsProgress) throws Exception {
		// TODO Auto-generated method stub
		workProgressManageDAO.updateWork(PmsProgress);
	}

	
}
