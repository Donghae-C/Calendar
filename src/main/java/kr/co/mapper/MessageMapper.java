package kr.co.mapper;

import kr.co.domain.MemberVO;
import kr.co.domain.MessageVO;

import java.util.List;

public interface MessageMapper {
    public List<MessageVO> getUnreadMessage(MemberVO member);
    public int sendMessage(MessageVO message);
}
