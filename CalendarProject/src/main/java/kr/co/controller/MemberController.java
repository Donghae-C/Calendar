package kr.co.controller;

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
	public void listGroupMember(@RequestParam("g_name") String g_name, Model model) {
		log.info("/listgroupmember");
		MgroupVO mgroup = new MgroupVO();
		mgroup.setG_name(g_name);
		model.addAttribute("listgroupmember", service.listGroupMember(mgroup));
	}
	
	@GetMapping("/searchbyname")
	public void searchByName(@RequestParam("m_name") String m_name, Model model) {
		log.info("/searchbyname");
		MemberVO member = new MemberVO();
		member.setM_name(m_name);
		model.addAttribute("searchbyname", service.searchbyName(member));
	}
}
