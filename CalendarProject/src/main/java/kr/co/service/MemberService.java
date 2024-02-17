package kr.co.service;

import java.util.List;

import kr.co.domain.MemberVO;
import kr.co.domain.MgroupVO;

public interface MemberService {
	public void register(MemberVO member);
	public MemberVO searchOne(MemberVO member);
	public boolean delete(MemberVO member);
	public boolean update(MemberVO member);
	public List<MemberVO> listAll();
	public List<MemberVO> listGroupMember(MgroupVO mgroup);
	public List<MemberVO> searchbyName(MemberVO member);
	public boolean login(MemberVO member);
}
