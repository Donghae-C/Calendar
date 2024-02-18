package kr.co.controller;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.CalendarVO;
import kr.co.service.CalendarService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/calendar/*")
@Log4j
public class CalendarController {
	
	private CalendarService service;
	@GetMapping("/")
	public String main() {
		return "/calendar/calendar";
	}
	
	@GetMapping("/getdate")
	public String getdate(@RequestParam("ca_year") String ca_year
			, @RequestParam("ca_month") String ca_month, @RequestParam("ca_date") String ca_date, Model model) {
		log.info("/getdate");
		CalendarVO calendar = new CalendarVO();
		int year = Integer.parseInt(ca_year);
		int month = Integer.parseInt(ca_month);
		int date = Integer.parseInt(ca_date);
		LocalDate dates = LocalDate.of(year, month, date);
		calendar.setC_date(dates);
		model.addAttribute("getdate", service.getDate(calendar));
		return "/calendar/calendar";
	}
}
