package kr.co.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.MemberVO;
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
		member.setM_id("testid2");
		member.setM_pw("1q2w3e");
		member.setM_name("손님2");
		member.setM_email("dfeg@ijlk.cud");
		member.setM_public(1);
		
		service.register(member);
		
		log.info(member.getM_id());
	}
}
