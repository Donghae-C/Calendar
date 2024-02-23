package kr.co.mapper;


import kr.co.domain.MemberVO;
import kr.co.domain.MessageVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MessageMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MessageMapper mapper;

	@Test
	public void testGetUnreadMessage(){
		MemberVO member = new MemberVO();
		member.setM_id("admin");
		List<MessageVO> mList = mapper.getUnreadMessage(member);
		log.info(mList);
	}
}
