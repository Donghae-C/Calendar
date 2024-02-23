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
	public CalendarVO getCalByCno(CalendarVO calendar) {
		return mapper.getCalByC_no(calendar);
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

	@Override
	public boolean deleteCal(CalendarVO calendar) {
		int result = mapper.deleteCal(calendar);
		boolean result2 = false;
		if(result > 0){
			result2 = true;
		}
		return result2;
	}

	@Override
	public boolean updateCal(CalendarVO calendar) {
		CalendarVO updatecal = mapper.getCalByC_no(calendar);
		updatecal.setC_time(calendar.getC_time());
		updatecal.setC_title(calendar.getC_title());
		updatecal.setC_content(calendar.getC_content());
		int result = mapper.updateCal(updatecal);
		boolean result2 = false;
		if(result > 0){
			result2 = true;
		}
		return result2;
	}

	@Override
	public List<CalendarVO> getMyMonth(String c_month, String c_year, String g_name, String m_id) {
		return mapper.getMyMonth(c_month, c_year, g_name, m_id);
	}

	@Override
	public List<CalendarVO> getMyDate(CalendarVO calendar) {
		return mapper.getMyDate(calendar);
	}

}
