package kr.co.service;

import kr.co.domain.MemberVO;
import kr.co.domain.MgroupListVO;
import kr.co.domain.MgroupVO;

import java.util.List;

public interface MgroupService {
	public MgroupVO getOneGroup(MgroupVO mgroup);
	public boolean insertMyCalGroup(MgroupVO mgroup);
	public boolean makeGroupList(MgroupListVO mgroupList);
	public boolean makeGroup(MgroupVO mgroup);
	public MgroupListVO getGroupByNo(MgroupListVO mgroupList);
	public MgroupListVO getGroupByName(MgroupListVO mgroupList);
	public boolean deleteGroup(MgroupListVO mgroupList);
	public List<MgroupListVO> getAllGroup();

}
