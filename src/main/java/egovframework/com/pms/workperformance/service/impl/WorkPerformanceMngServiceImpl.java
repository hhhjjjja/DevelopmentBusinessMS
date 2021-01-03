package egovframework.com.pms.workperformance.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.workperformance.service.WorkPerformanceMngService;
import egovframework.com.pms.workperformance.service.WorkPerformance;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("WorkPerformanceMngService")
public class WorkPerformanceMngServiceImpl extends EgovAbstractServiceImpl implements WorkPerformanceMngService {

	@Resource(name="WorkPerformanceMngDAO")
	private WorkPerformanceMngDAO workPerformMngDAO;
	
	@Override
	public List<?> selectProjectInfs(ProjectVO projectVO) throws Exception {
		return workPerformMngDAO.selectProjectInfs(projectVO);
	}

	@Override
	public List<?> selectPerformDetail(WorkPerformance work) throws Exception {
		return workPerformMngDAO.selectPerformDetail(work);
	}

	@Override
	public List<?> selectPerform(WorkPerformance work) throws Exception {
		return workPerformMngDAO.selectPerform(work);
	}

	@Override
	public List<?> categoryClassf(WorkPerformance work) throws Exception {
		return workPerformMngDAO.categoryClassf(work);
	}
}