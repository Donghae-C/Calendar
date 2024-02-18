package kr.co.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import kr.co.domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//@Test
	public void testListAll() throws Exception{
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/member/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	//@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/register")
				.param("m_id", "testid4")
				.param("m_pw", "1q2w3e")
				.param("m_name", "테스터")
				.param("m_email", "dfeik@dfgc.cop")
				.param("m_public", "1")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	//@Test
	public void testSearchOne() throws Exception{
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/member/searchone")
						.param("m_id", "testid4"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	//@Test
	public void testListGroupMember() throws Exception{
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/member/listgroupmember")
						.param("g_name", "축구"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	//@Test
	public void testSearchByName() throws Exception{
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/member/searchbyname")
						.param("m_name", "일반"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	//@Test
	public void testUpdate() throws Exception{
		
		String resultPage = 
				mockMvc.perform(MockMvcRequestBuilders.post("/member/update")
						.param("m_id", "testid4")
						.param("m_pw", "1q2w3e22")
						.param("m_name", "수정된테스터")
						.param("m_email", "mody@fi.ed")
						.param("m_public", "0"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		log.info(resultPage);
	}
	//@Test
	public void testDelete() throws Exception{
		String resultPage = 
				mockMvc.perform(MockMvcRequestBuilders.post("/member/delete")
						.param("m_id", "testid4")
						)
				.andReturn()
				.getModelAndView()
				.getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testLogin() throws Exception{
		String resultPage = 
				mockMvc.perform(MockMvcRequestBuilders.get("/member/login")
						.param("m_id", "testid")
						.param("m_pw", "1q2w3e123")
						)
				.andReturn()
				.getModelAndView()
				.getViewName();
		log.info(resultPage);
		
	}
}
