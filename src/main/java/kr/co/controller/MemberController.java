package kr.co.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.service.MgroupService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberVO;
import kr.co.domain.MgroupVO;
import kr.co.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	private MemberService service;
	private MgroupService mgservice;
	
	@GetMapping("/list")
	public void listAll(Model model) {
		log.info("list");
		model.addAttribute("list", service.listAll());
	}
	
	@PostMapping("/register")
	public String register(MemberVO member, @RequestParam(name="publicchk", defaultValue = "false") boolean publicchk) {
		if(publicchk){
			member.setM_public(0);
		}else{
			member.setM_public(1);
		}
		service.register(member);
		MgroupVO mgroup = new MgroupVO();
		mgroup.setM_id(member.getM_id());
		mgroup.setG_name("내 캘린더");
		mgservice.insertMyCalGroup(mgroup);
		return "redirect:/member/login";
	}
	
	@GetMapping("/searchone")
	public void searchOne(@RequestParam("m_id") String m_id, Model model) {
		log.info("/searchone");
		MemberVO member = new MemberVO();
		member.setM_id(m_id);
		model.addAttribute("member", service.searchOne(member));
	}
	
	@GetMapping("/listgroupmember")
	public void listGroupMember(MgroupVO mgroup, Model model) {
		log.info("/listgroupmember");
		model.addAttribute("listgroupmember", service.listGroupMember(mgroup));
	}
	
	@GetMapping("/searchbyname")
	public void searchByName(MemberVO member, Model model) {
		log.info("/searchbyname");
		model.addAttribute("searchbyname", service.searchbyName(member));
	}
	
	@PostMapping("/update")
	public String update(MemberVO member, Model model) {
		log.info("/update");
		model.addAttribute("update", service.update(member));
		return "redirect:/member/list";
	}
	
	@PostMapping("/delete")
	public String delete(MemberVO member, Model model) {
		log.info("/delete");
		model.addAttribute("delete", service.delete(member));
		return "redirect:/member/list";
	}
	@GetMapping("/login")
	public String login(MemberVO member, Model model, HttpServletRequest req) {
		log.info("login");
		HttpSession session = req.getSession();
		if(service.login(member)) {
			member = service.searchOne(member);
			List<MgroupVO> gList = service.getMyGroup(member);
			log.info(member.getM_id()+"님 로그인함");
			session.setAttribute("login", member);
			session.setAttribute("gList", gList);
		}else {
			return("/member/login");
		}
		log.info(session.getAttribute("login"));
		return("redirect:/");
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		log.info("logout");
		HttpSession session = req.getSession(false);
		session.invalidate();
		return("redirect:/");
	}
	@GetMapping("/moveregister")
	public String moveRegister(){
		return "/member/memregister";
	}
	@GetMapping("/movememberlist")
	public String moveMemberList(Model model){
		List<MemberVO> mlist = service.listAll();
		model.addAttribute("memlist", mlist);
		return "/member/memberlist";

	}
}
