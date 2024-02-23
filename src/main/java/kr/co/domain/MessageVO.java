package kr.co.domain;

import lombok.Data;

@Data
public class MessageVO {
    private int msg_no;
    private String msg_sendid;
    private String msg_recid;
    private String msg_content;
    private int msg_check;
}
