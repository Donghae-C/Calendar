package kr.co.controller;

import java.time.LocalDate;
import java.util.List;

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
}
