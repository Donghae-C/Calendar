package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.domain.MemberVO;
import kr.co.domain.MgroupVO;

public interface MemberMapper {
	//@Select("select * from member")
	public List<MemberVO> getList();
	public List<MemberVO> getGroupMember(MgroupVO mgroup);
	public int insert(MemberVO member);
	public List<MemberVO> searchName(MemberVO member);
	public MemberVO selectOne(String m_id);
	public int delete(MemberVO member);
	public int update(MemberVO member);
}
