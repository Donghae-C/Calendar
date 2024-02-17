package kr.co.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.MemberVO;
import kr.co.domain.MgroupVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	//@Test
	public void testExist(){
		log.info(service);
	}
	
	//@Test
	public void testRegister() {
		MemberVO member = new MemberVO();
		member.setM_id("testid");
		member.setM_pw("1q2w3e");
		member.setM_name("손님");
		member.setM_email("dfeg@ijlk.cud");
		//member.setM_public(1);
		
		service.register(member);
		
		log.info(member.getM_id());
	}
	
	//@Test
	public void testSearchOne() {
		MemberVO mem = new MemberVO();
		mem.setM_id("admin");
		MemberVO member = service.searchOne(mem);
		log.info(member);
	}
	//@Test
	public void testSearchByName() {
		MemberVO member = new MemberVO();
		member.setM_name("관리");
		List<MemberVO> mlist = service.searchbyName(member);
		mlist.forEach(mem -> log.info(mem));
	}
	//@Test
	public void testDelete() {
		MemberVO member = new MemberVO();
		member.setM_id("testid2");
		boolean result = service.delete(member);
		log.info(result);
	}
	
	//@Test
	public void testUpdate() {
		MemberVO member = new MemberVO();
		member.setM_id("testid");
		member = service.searchOne(member);
		member.setM_name("수정된손님");
		member.setM_pw("1q2w3e123");
		member.setM_email("modify@mod.ify");
		member.setM_grade(2);
		boolean result = service.update(member);
		log.info(result);
	}
	//@Test
	public void testListAll() {
		List<MemberVO> mlist = service.listAll();
		mlist.forEach(member -> log.info(member));
	}
	//@Test
	public void testGetGroupMember() {
		MgroupVO mgroup = new MgroupVO();
		mgroup.setG_name("축구");
		List<MemberVO> mlist = service.listGroupMember(mgroup);
		mlist.forEach(member -> log.info(member));
	}
	@Test
	public void testLogin() {
		MemberVO member = new MemberVO();
		member.setM_id("admin3");
		member.setM_pw("1q2w3e");
		log.info(service.login(member));
	}
	
	
}
