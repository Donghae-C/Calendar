package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberVO;
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
	
	public String register(MemberVO member, RedirectAttributes rttr) {
		log.info("register : " + member);
		service.register(member);
		rttr.addFlashAttribute("result", member.getM_id());
		return "redirect:/member/list";
	}
}
