package kr.co.mapper;

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
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(member -> log.info(member));
		
		/*List<MemberVO> mList = mapper.getList();
		for(int i = 0;i<mList.size();i++) {
			log.info(mList.get(i));
		}*/
	}
	
	//@Test
	public void testGetGroupMember() {
		MgroupVO mgroup = new MgroupVO();
		mgroup.setG_name("야구");
		mapper.getGroupMember(mgroup).forEach(member -> log.info(member));
	}
	
	//@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setM_id("testid");
		member.setM_pw("1q2w3e");
		member.setM_name("손님1");
		member.setM_email("accv@geg.fef");
		member.setM_public(1);
		
		mapper.insert(member);
	}
}
