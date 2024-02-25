package kr.co.mapper;

import kr.co.domain.MgroupListVO;
import kr.co.domain.MgroupVO;

import java.util.List;

public interface MgroupMapper {
	public MgroupVO getOneGroup(MgroupVO mgroup);
	public List<MgroupListVO> getList();
	public int insertMyCalGroup(MgroupVO mgroup);
	public int makeGroupList(MgroupListVO mgroupList);
	public int makeGroup(MgroupVO mgroup);
	public MgroupListVO getGroupByNo(MgroupListVO mgroupList);
	public MgroupListVO getGroupByName(MgroupListVO mgroupList);
	public int deleteGroup(MgroupListVO mgroupList);

}
