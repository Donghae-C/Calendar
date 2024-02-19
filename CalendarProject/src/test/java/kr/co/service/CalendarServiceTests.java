package kr.co.service;

import java.time.LocalDate;
import java.time.LocalTime;

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
public class CalendarServiceTests {
	@Setter(onMethod_ = @Autowired)
	private CalendarService service;
	
	//@Test
	public void testExist(){
		log.info(service);
	}
	//@Test
	public void testGetDate() {
		CalendarVO calendar = new CalendarVO();
		LocalDate date = LocalDate.of(2024, 2, 18);
		calendar.setC_date(date);
		log.info(service.getDate(calendar));
	}
	
	//@Test
	public void testGetMonth() {
		log.info(service.getMonth("2", "2024", "축구"));
	}
	@Test
	public void testInsertCal() {
		CalendarVO calendar = new CalendarVO();
		LocalDate date = LocalDate.of(2024, 2, 15);
		LocalTime time = LocalTime.of(16, 2);
		calendar.setC_date(date);
		calendar.setC_time(time);
		calendar.setG_name("축구");
		calendar.setC_title("축구테스트");
		calendar.setC_content("테스트중임");
		log.info(calendar);
		log.info(service.insertCal(calendar));
	}
}
