package kr.co.mapper;

import java.util.List;

import kr.co.domain.CalendarVO;

public interface CalendarMapper {
	public List<CalendarVO> getDate(CalendarVO calendar);
}
