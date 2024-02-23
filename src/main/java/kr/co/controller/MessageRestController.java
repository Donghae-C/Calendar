package kr.co.controller;

import kr.co.domain.MemberVO;
import kr.co.domain.MessageVO;
import kr.co.service.MessageService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/msgrest/*")
@Log4j
public class MessageRestController {
    private MessageService service;

    @GetMapping("/getunreadmsg")
    @ResponseBody
    public List<MessageVO> getUnreadMsg(HttpServletRequest req){
        HttpSession session = req.getSession(false);
        MemberVO member = (MemberVO) session.getAttribute("login");
        return service.getUnreadMessage(member);
    }

    @PostMapping("/sendmsg")
    @ResponseBody
    public ResponseEntity<String> sendMessage(MessageVO message, HttpServletRequest req){
        HttpSession session = req.getSession(false);
        MemberVO member = (MemberVO) session.getAttribute("login");
        message.setMsg_sendid(member.getM_id());
        if(service.sendMessage(message)){
            return ResponseEntity.ok("added successfully");
        }else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred");
        }
    }
}
