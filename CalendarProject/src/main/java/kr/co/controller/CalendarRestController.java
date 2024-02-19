package kr.co.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.CalendarVO;
import kr.co.service.CalendarService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@AllArgsConstructor
@RequestMapping("/calrest/*")
@Log4j
public class CalendarRestController {
	private CalendarService service;

    @GetMapping("/getdate")
    @ResponseBody
    public List<CalendarVO> getdate(@RequestParam("ca_year") String ca_year,
                                    @RequestParam("ca_month") String ca_month,
                                    @RequestParam("ca_date") String ca_date,
                                    @RequestParam("gr_name") String gr_name) {
        log.info("/getdate");
        CalendarVO calendar = new CalendarVO();
        int year = Integer.parseInt(ca_year);
        int month = Integer.parseInt(ca_month);
        int date = Integer.parseInt(ca_date);
        LocalDate dates = LocalDate.of(year, month, date);
        calendar.setC_date(dates);
        calendar.setG_name(gr_name);
        List<CalendarVO> cList = service.getDate(calendar);
        log.info(cList);
        return cList;
    }
    
    @GetMapping("/getmonth")
    @ResponseBody
	public List<CalendarVO> getGroupCal(@RequestParam("ca_year") String ca_year,
								@RequestParam("ca_month") String ca_month,
								@RequestParam("gr_name") String gr_name) {
		log.info("/getmonth");
		List<CalendarVO> cList = service.getMonth(ca_month, ca_year, gr_name);
		log.info(cList);
		return cList;
	}
    
    @PostMapping("/insertcal")
    @ResponseBody
    public ResponseEntity<String> insertCal(@RequestParam("ca_year") String ca_year,
    						@RequestParam("ca_month") String ca_month,
    						@RequestParam("ca_date") String ca_date,
    						@RequestParam("ca_time") String ca_time,
    						@RequestParam("gr_name") String gr_name,
    						@RequestParam("ca_title") String ca_title,
    						@RequestParam("ca_content") String ca_content) {
    	try {
			log.info("/insertcal");
			CalendarVO calendar = new CalendarVO();
			int c_year = Integer.parseInt(ca_year);
			int c_month = Integer.parseInt(ca_month);
			int c_date = Integer.parseInt(ca_date);
			LocalDate cdate = LocalDate.of(c_year, c_month, c_date);
			DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
			LocalTime ctime = LocalTime.parse(ca_time, timeFormatter);
			calendar.setC_date(cdate);
			calendar.setC_time(ctime);
			calendar.setG_name(gr_name);
			calendar.setC_title(ca_title);
			calendar.setC_content(ca_content);
			log.info(calendar);
			service.insertCal(calendar);
			
			return ResponseEntity.ok("added successfully");
		} catch (Exception e) {
			log.error("Error in /insertcal", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred");
		}
    }
    
    
}
