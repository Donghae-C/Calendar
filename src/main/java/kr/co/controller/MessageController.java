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

        // 세션에서 회원 정보를 가져옴
        HttpSession session = req.getSession(false);
        MemberVO member = (MemberVO) session.getAttribute("login");
        String m_id = member.getM_id();

        // 페이징 처리를 위한 변수 설정
        int limit = 5;  // 한 페이지당 표시할 아이템 수
        int offset = (page - 1) * limit;  // 조회 시작 위치
        member.setLimit(limit);
        member.setOffset(offset);

        // 회원의 메시지 목록을 조회
        List<MessageVO> msglist = service.getAllMessage(member);
        model.addAttribute("msglist", msglist);

        // 전체 메시지 수 조회
        int number = service.countMessage(member);
        int pagenum;

        // 전체 페이지 수 계산
        if (number == 0) {
            pagenum = 1;
        } else if (number % 5 == 0) {
            pagenum = number / 5;
        } else {
            pagenum = (number / 5) + 1;
        }

        // 첫 페이지와 마지막 페이지 정보 계산
        int pageSize = 5; // 페이지당 표시할 아이템 수
        int startPage = (page - 1) / pageSize * pageSize + 1;  // 현재 페이지 기준 첫 페이지
        int lastPage = startPage + pageSize - 1;  // 현재 페이지 기준 마지막 페이지

        // 마지막 페이지가 전체 페이지 수를 초과하지 않도록 조정
        if (lastPage > pagenum) {
            lastPage = pagenum;
        }

        // 모델에 첫 페이지, 현재 페이지, 마지막 페이지 정보를 추가
        model.addAttribute("startPage", startPage);
        model.addAttribute("curpage", page);
        model.addAttribute("lastPage", lastPage);

        return "/member/mymessage";
    }
}
