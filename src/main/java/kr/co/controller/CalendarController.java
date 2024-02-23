package kr.co.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CalendarVO;
import kr.co.domain.MemberVO;
import kr.co.domain.MgroupVO;
import kr.co.service.CalendarService;
import kr.co.service.MgroupService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/calendar/*")
@Log4j
public class CalendarController {
	
	private CalendarService service;
	private MgroupService mservice;
	@GetMapping("/")
	public String main() {
		return "/calendar/calendar";
	}
	
	@GetMapping("/getgroup")
	public String getGroupCal(@RequestParam("ca_year") String ca_year,
								@RequestParam("ca_month") String ca_month,
								@RequestParam("gr_name") String gr_name,
								Model model, HttpServletRequest req) {
		log.info("/getgroup");
		List<CalendarVO> cList = service.getMonth(ca_month, ca_year, gr_name);
		HttpSession session = req.getSession(false);
		MemberVO member = (MemberVO)session.getAttribute("login");
		String m_id = member.getM_id();
		MgroupVO mgroup = new MgroupVO();
		mgroup.setM_id(m_id);
		mgroup.setG_name(gr_name);
		mgroup = mservice.getOneGroup(mgroup);
		log.info(mgroup);
		if(mgroup.getG_grade() == 3) {
			log.info("3이 맞음");
			model.addAttribute("auth","y");
		}else {
			model.addAttribute("auth","n");
		}
		model.addAttribute("cList", cList);
		log.info(cList);
		return "/calendar/calendar";
	}
}
