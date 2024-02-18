package kr.co.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@GetMapping("/list")
	public void listAll(Model model) {
		log.info("list");
		model.addAttribute("list", service.listAll());
	}
	
	@PostMapping("/register")
	public String register(MemberVO member, RedirectAttributes rttr) {
		log.info("register : " + member);
		service.register(member);
		rttr.addFlashAttribute("result", member.getM_id());
		return "redirect:/member/list";
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
			log.info(member.getM_id()+"님 로그인함");
			session.setAttribute("login", member);
		}else {
			return("/member/login");
		}
		log.info(session.getAttribute("login"));
		return("redirect:/");
	}
}
