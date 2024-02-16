package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.domain.MgroupVO;
import kr.co.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO member) {
		log.info("register" + member);
		mapper.insert(member);
	}

	@Override
	public MemberVO searchOne(String m_id) {
		log.info("searchOne.......");
		
		return mapper.selectOne(m_id);
	}

	@Override
	public boolean delete(MemberVO member) {
		return false;
	}

	@Override
	public boolean update(MemberVO member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberVO> listAll() {
		return null;
	}

	@Override
	public List<MemberVO> listGroupMember(MgroupVO mgroup) {
		return null;
	}

	@Override
	public List<MemberVO> searchbyName(MemberVO member) {
		return null;
	}

}
