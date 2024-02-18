package kr.co.domain;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class CalendarVO {
	private LocalDate c_date;
	private LocalTime c_time;
	private String g_name;
	private String c_title;
	private String c_content;
	private String c_link;
}
