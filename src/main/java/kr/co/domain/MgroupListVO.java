package kr.co.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class MgroupListVO {
    private int g_no;
    private String g_name;
    private String g_intro;
    private LocalDateTime g_regdate;
    private int g_public;
}
