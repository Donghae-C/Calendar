package kr.co.service;

import org.springframework.stereotype.Service;

import kr.co.domain.MgroupVO;
import kr.co.mapper.MgroupMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MgroupServiceImpl implements MgroupService {
	
	private MgroupMapper mapper;
	
	@Override
	public MgroupVO getOneGroup(MgroupVO mgroup) {
		return mapper.getOneGroup(mgroup);
	}

}
