package kr.co.mapper;

import kr.co.domain.MemberVO;
import kr.co.domain.MessageVO;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface MessageMapper {
    public List<MessageVO> getUnreadMessage(MemberVO member);
    public List<MessageVO> getAllMessage(MemberVO member);
    public int sendMessage(MessageVO message);
    public int readOneMessage(MessageVO message);
    public int readAllMessage(MemberVO member);
    public int deleteMessage(MessageVO message);
    public int countMessage(MemberVO member);
}
