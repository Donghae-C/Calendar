package kr.co.controller;

import kr.co.domain.MemberVO;
import kr.co.domain.MgroupListVO;
import kr.co.domain.MgroupVO;
import kr.co.service.MemberService;
import kr.co.service.MgroupService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.co.service.CalendarService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/group/*")
@Log4j
public class GroupController {
	private MgroupService service;
	private MemberService mservice;

	@GetMapping("/")
	public String main() {
		return "/group/groupmain";
	}

	@PostMapping("/makegroup")
	public String makeGroup(@RequestParam("gr_name") String gr_name,
							@RequestParam("gr_intro") String gr_intro,
							@RequestParam("gr_public") String gr_public,
							HttpServletRequest req, Model model){
		MgroupVO mgroup = new MgroupVO();
		MgroupListVO mgroupList = new MgroupListVO();
		int g_public = Integer.parseInt(gr_public);
		mgroupList.setG_public(g_public);
		HttpSession session = req.getSession(false);
		MemberVO member = (MemberVO)session.getAttribute("login");
		mgroupList.setG_name(gr_name);
		mgroupList.setG_intro(gr_intro);
		mgroup.setG_name(gr_name);
		mgroup.setM_id(member.getM_id());
		service.makeGroupList(mgroupList);
		service.makeGroup(mgroup);
		List<MgroupVO> gList = mservice.getMyGroup(member);
		session.setAttribute("gList", gList);
		return moveGroupPage(mgroupList, model);
	}

	@GetMapping("/moveGrPage")
	public String moveGroupPage(MgroupListVO mgroupList, Model model){
		log.info("/moveGrPage...");
		MgroupListVO glList = service.getGroupByName(mgroupList);
		model.addAttribute("gllist", glList);
		MgroupVO mgroup = new MgroupVO();
		mgroup.setG_name(glList.getG_name());
		List<MemberVO> mList = mservice.listGroupMember(mgroup);
		model.addAttribute("mlist", mList);
		return "/group/grouppage";
	}

	@PostMapping("/deletegr")
	public String deleteGroup(MgroupListVO mgroupList, HttpServletRequest req){
		log.info("/deleteGr");
		service.deleteGroup(mgroupList);
		HttpSession session = req.getSession(false);
		MemberVO member = (MemberVO) session.getAttribute("login");
		List<MgroupVO> gList = mservice.getMyGroup(member);
		session.setAttribute("gList", gList);
		return "redirect:/";
	}
}
