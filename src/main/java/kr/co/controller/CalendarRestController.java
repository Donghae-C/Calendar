package kr.co.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.co.domain.CalendarVO;
import kr.co.domain.MemberVO;
import kr.co.domain.MgroupVO;
import kr.co.service.CalendarService;
import kr.co.service.MgroupService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@AllArgsConstructor
@RequestMapping("/calrest/*")
@Log4j
public class CalendarRestController {
	private CalendarService service;
	private MgroupService mservice;
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
        return cList;
    }
    
    @GetMapping("/getmonth")
    @ResponseBody
	public List<CalendarVO> getGroupCal(@RequestParam("ca_year") String ca_year,
								@RequestParam("ca_month") String ca_month,
								@RequestParam("gr_name") String gr_name,
								Model model, HttpServletRequest req) {
		log.info("/getmonth");
		List<CalendarVO> cList = service.getMonth(ca_month, ca_year, gr_name);
		HttpSession session = req.getSession(false);
		MemberVO member = (MemberVO)session.getAttribute("login");
		if(member == null){
			return null;
		}
		String m_id = member.getM_id();
		MgroupVO mgroup = new MgroupVO();
		mgroup.setM_id(m_id);
		mgroup.setG_name(gr_name);
		mgroup = mservice.getOneGroup(mgroup);
		if(mgroup.getG_grade() == 3) {
			model.addAttribute("auth","y");
		}else {
			model.addAttribute("auth","n");
		}
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
    						@RequestParam("ca_content") String ca_content,
							HttpServletRequest req) {
    	try {
			log.info("/insertcal");
			HttpSession session = req.getSession(false);
			MemberVO member = (MemberVO)session.getAttribute("login");
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
			calendar.setM_id(member.getM_id());
			service.insertCal(calendar);
			
			return ResponseEntity.ok("added successfully");
		} catch (Exception e) {
			log.error("Error in /insertcal", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred");
		}
    }
	
    @GetMapping("/adminchk")
    @ResponseBody
    public String adminChk(@RequestParam("gr_name") String gr_name, HttpServletRequest req) {
		if(gr_name.equals("")){
			return "n";
		}
		if(gr_name==null){
			return "n";
		}
		HttpSession session = req.getSession(false);
		MemberVO member = (MemberVO)session.getAttribute("login");
		String m_id = member.getM_id();
		MgroupVO mgroup = new MgroupVO();
		mgroup.setM_id(m_id);
		mgroup.setG_name(gr_name);
		mgroup = mservice.getOneGroup(mgroup);
		String result;
		if(mgroup.getG_grade() == 3) {
			log.info("3이 맞음");
			result = "y";
		}else {
			result = "n";
		}
		return result;
    }

	@PostMapping("/delcal")
	@ResponseBody
	public ResponseEntity<String> deletecal(@RequestBody Map<String, List<String>> requestBody){
		List<String> delchk = requestBody.get("delchk");
		CalendarVO calendar = new CalendarVO();
		boolean result = true;
		for(String str:delchk){
			int i = Integer.parseInt(str);
			calendar.setC_no(i);
			service.deleteCal(calendar);
		}
		return ResponseEntity.ok("added successfully");
	}

	@PostMapping("/updatecal")
	@ResponseBody
	public ResponseEntity<String> updateCal(@RequestParam("ca_no") String ca_no,
											@RequestParam("ca_time") String ca_time,
											@RequestParam("ca_title") String ca_title,
											@RequestParam("ca_content") String ca_content
											) {
		try {
			log.info("/updatecal");
			CalendarVO calendar = new CalendarVO();
			int cno = Integer.parseInt(ca_no);
			DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
			LocalTime ctime = LocalTime.parse(ca_time, timeFormatter);
			calendar.setC_no(cno);
			calendar.setC_time(ctime);
			calendar.setC_title(ca_title);
			calendar.setC_content(ca_content);
			service.updateCal(calendar);
			return ResponseEntity.ok("added successfully");
		} catch (Exception e) {
			log.error("Error in /insertcal", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred");
		}
	}
	@GetMapping("/getmydate")
	@ResponseBody
	public List<CalendarVO> getMyDate(@RequestParam("ca_year") String ca_year,
									@RequestParam("ca_month") String ca_month,
									@RequestParam("ca_date") String ca_date,
									@RequestParam("gr_name") String gr_name,
									  HttpServletRequest req
									  ) {
		log.info("/getMydate");
		CalendarVO calendar = new CalendarVO();
		int year = Integer.parseInt(ca_year);
		int month = Integer.parseInt(ca_month);
		int date = Integer.parseInt(ca_date);
		LocalDate dates = LocalDate.of(year, month, date);
		calendar.setC_date(dates);
		calendar.setG_name(gr_name);
		HttpSession session = req.getSession(false);
		MemberVO member = (MemberVO)session.getAttribute("login");
		calendar.setM_id(member.getM_id());
		List<CalendarVO> cList = service.getMyDate(calendar);
		return cList;
	}

	@GetMapping("/getmymonth")
	@ResponseBody
	public List<CalendarVO> getMyCal(@RequestParam("ca_year") String c_year,
										@RequestParam("ca_month") String c_month,
										@RequestParam("gr_name") String g_name,
										Model model, HttpServletRequest req) {
		log.info("/getmymonth");
		HttpSession session = req.getSession(false);
		MemberVO member = (MemberVO)session.getAttribute("login");
		String m_id = member.getM_id();
		List<CalendarVO> cList = service.getMyMonth(c_month, c_year, g_name, m_id);
		MgroupVO mgroup = new MgroupVO();
		mgroup.setM_id(m_id);
		mgroup.setG_name(g_name);
		mgroup = mservice.getOneGroup(mgroup);
		if(mgroup.getG_grade() == 3) {
			log.info("3이 맞음");
			model.addAttribute("auth","y");
		}else {
			model.addAttribute("auth","n");
		}
		log.info(cList);
		return cList;
	}
}
