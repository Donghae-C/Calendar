package kr.co.service;

import java.util.List;

import kr.co.domain.CalendarVO;

public interface CalendarService {
	public List<CalendarVO> getDate(CalendarVO calendar);
}
