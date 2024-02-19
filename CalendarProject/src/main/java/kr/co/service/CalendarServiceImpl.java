package kr.co.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.domain.CalendarVO;
import kr.co.mapper.CalendarMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CalendarServiceImpl implements CalendarService {

	private CalendarMapper mapper;
	@Override
	public List<CalendarVO> getDate(CalendarVO calendar) {
		return mapper.getDate(calendar);
	}
	@Override
	public List<CalendarVO> getMonth(String c_month, String c_year, String g_name) {
		return mapper.getMonth(c_month, c_year, g_name);
	}
	@Override
	public boolean insertCal(CalendarVO calendar) {
		int result = mapper.insertCal(calendar);
		boolean result2 = false;
		if(result > 0) {
			result2 = true;
		}
		return result2;
	}

}
