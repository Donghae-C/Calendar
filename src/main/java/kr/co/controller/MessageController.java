package kr.co.controller;

import kr.co.domain.MemberVO;
import kr.co.domain.MessageVO;
import kr.co.service.MessageService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/message/*")
@Log4j
public class MessageController {
    private MessageService service;
    @GetMapping("/movemymsg")
    public String moveMyPage(@RequestParam(defaultValue = "1") int page, Model model, HttpServletRequest req){
        log.info(page);
        HttpSession session = req.getSession(false);
        MemberVO member = (MemberVO) session.getAttribute("login");
        String m_id = member.getM_id();
        int limit = 5;
        int offset = (page-1) * limit;
        member.setLimit(limit);
        member.setOffset(offset);
        List<MessageVO> msglist = service.getAllMessage(member);
        model.addAttribute("msglist", msglist);

        int number = service.countMessage(member);
        int pagenum;
        List<Integer> pagenums = new ArrayList<>();
        if(number == 0){
            pagenum = 1;
        } else if (number%5 == 0) {
            pagenum = number/5;
        } else {
            pagenum = (number/5) + 1;
        }
        for(int i=1;i<pagenum+1;i++){
            pagenums.add(i);
        }
        model.addAttribute("curpage", page);
        model.addAttribute("page", pagenums);
        return "/member/mymessage";
    }
}
