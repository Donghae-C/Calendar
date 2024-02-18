package kr.co.mapper;

import java.sql.Date;
import java.time.LocalDate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.CalendarVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CalendarMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CalendarMapper mapper;
	
	@Test
	public void testGetDate() {
		CalendarVO calendar = new CalendarVO();
		LocalDate date = LocalDate.of(2024, 2, 18);
		calendar.setC_date(date);
		log.info(mapper.getDate(calendar));
		
	}
}
