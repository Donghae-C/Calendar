package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.service.CalendarService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/group/*")
@Log4j
public class GroupController {
	
	@GetMapping("/")
	public String main() {
		return "/group/groupmain";
	}
}
