package kr.co.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
    private String m_id;
    private String m_pw;
    private String m_name;
    private String m_email;
    private int m_grade;
    private int m_rating;
    private Date m_regdate;
    private int m_public;
    private int limit;
    private int offset;
}
