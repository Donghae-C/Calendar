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

}
