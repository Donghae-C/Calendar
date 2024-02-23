package kr.co.service;

import kr.co.domain.MgroupListVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.MgroupVO;
import kr.co.mapper.MgroupMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MgroupServiceImpl implements MgroupService {


	@Setter(onMethod_ = @Autowired)
	private MgroupMapper mapper;
	
	@Override
	public MgroupVO getOneGroup(MgroupVO mgroup) {
		return mapper.getOneGroup(mgroup);
	}

	@Override
	public boolean insertMyCalGroup(MgroupVO mgroup) {
		int result = mapper.insertMyCalGroup(mgroup);
		boolean result2 = false;
		if(result > 0){
			result2 = true;
		}
		return result2;
	}

	@Override
	public boolean makeGroupList(MgroupListVO mgroupList) {
		int result = mapper.makeGroupList(mgroupList);
		boolean result2 = false;
		if(result > 0){
			result2 = true;
		}
		return result2;
	}

	@Override
	public boolean makeGroup(MgroupVO mgroup) {
		int result = mapper.makeGroup(mgroup);
		boolean result2 = false;
		if(result > 0){
			result2 = true;
		}
		return result2;
	}

	@Override
	public MgroupListVO getGroupByNo(MgroupListVO mgroupList) {
		return mapper.getGroupByNo(mgroupList);
	}

	@Override
	public MgroupListVO getGroupByName(MgroupListVO mgroupList) {
		return mapper.getGroupByName(mgroupList);
	}

	@Override
	public boolean deleteGroup(MgroupListVO mgroupList) {
		int result = mapper.deleteGroup(mgroupList);
		boolean result2 = false;
		if(result > 0){
			result2 = true;
		}
		return result2;
	}

}
