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
	public MemberVO searchOne(MemberVO member) {
		log.info("searchOne.......");
		return mapper.selectOne(member);
	}

	@Override
	public boolean delete(MemberVO member) {
		int result = mapper.delete(member);
		log.info(result);
		boolean result2 = false;
		if(result > 0) {
			result2 = true;
		}
		return result2;
	}

	@Override
	public boolean update(MemberVO member) {
		int result = mapper.update(member);
		boolean result2 = false;
		if(result>0) {
			result2 = true;
		}
		return result2;
	}

	@Override
	public List<MemberVO> listAll() {
		
		return mapper.getList();
	}

	@Override
	public List<MemberVO> listGroupMember(MgroupVO mgroup) {
		
		return mapper.getGroupMember(mgroup);
	}

	@Override
	public List<MemberVO> searchbyName(MemberVO member) {
		log.info("searchbyName.....");
		return mapper.searchName(member);
	}

	@Override
	public boolean login(MemberVO member) {
		MemberVO check = mapper.selectOne(member);
		boolean result = false;
		if(check == null) {
			log.info("id없음");
		}else {
			log.info("id존재");
			if(!check.getM_pw().equals(member.getM_pw())) {
				log.info("비밀번호 틀림");
			}else {
				log.info("비밀번호 맞음");
				log.info("로그인 성공");
				result = true;
			}
		}
		return result;
	}

}
