package egovframework.com.pms.workperformance.service;

import java.util.List;

import egovframework.com.pms.bud.service.ProjectVO;

public interface WorkPerformanceMngService {
	List<?> selectProjectInfs(ProjectVO projectVO) throws Exception;
	List<?> selectPerformDetail(WorkPerformance work) throws Exception;
	List<?> selectPerform(WorkPerformance work) throws Exception;
	List<?> categoryClassf(WorkPerformance work) throws Exception;
}