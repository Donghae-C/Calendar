package kr.co.service;

import kr.co.domain.MemberVO;
import kr.co.domain.MessageVO;

import java.util.List;

public interface MessageService {
    public List<MessageVO> getUnreadMessage(MemberVO member);
    public boolean sendMessage(MessageVO message);
}
