package egovframework.com.pms.workperformance.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.pms.bud.service.ProjectVO;
import egovframework.com.pms.workperformance.service.WorkPerformance;

@Repository("WorkPerformanceMngDAO")
public class WorkPerformanceMngDAO extends EgovComAbstractDAO {
	public List<?> selectProjectInfs(ProjectVO projectVO) throws Exception {
		return selectList("WorkPerformanceMngDAO.selectProjectInfs", projectVO);
	}
	
	public List<?> selectPerformDetail(WorkPerformance work) throws Exception {
		List<?> result = selectList("WorkPerformanceMngDAO.selectPerformDetail", work);
		return result;
	}
	
	public List<?> selectPerform(WorkPerformance work) throws Exception {
		List<?> result = selectList("WorkPerformanceMngDAO.selectPerform", work);
		return result;
	}
	
	public List<?> categoryClassf(WorkPerformance work) throws Exception {
		return selectList("WorkPerformanceMngDAO.categoryClassf", work);
	}
}