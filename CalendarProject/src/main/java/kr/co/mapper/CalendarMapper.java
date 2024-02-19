package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.CalendarVO;

public interface CalendarMapper {
	public List<CalendarVO> getDate(CalendarVO calendar);
	public List<CalendarVO> getMonth(@Param("c_month") String c_month, @Param("c_year") String c_year, @Param("g_name") String g_name);
	public int insertCal(CalendarVO calendar);
}
