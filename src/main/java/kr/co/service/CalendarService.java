package kr.co.service;

import java.util.List;

import kr.co.domain.CalendarVO;

public interface CalendarService {
	public List<CalendarVO> getDate(CalendarVO calendar);
	public CalendarVO getCalByCno(CalendarVO calendar);
	public List<CalendarVO> getMonth(String c_month, String c_year, String g_name);
	public boolean insertCal(CalendarVO calendar);
	public boolean deleteCal(CalendarVO calendar);
	public boolean updateCal(CalendarVO calendar);
	public List<CalendarVO> getMyMonth(String c_month, String c_year, String g_name, String m_id);
	public List<CalendarVO> getMyDate(CalendarVO calendar);

}
