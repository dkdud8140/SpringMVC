package com.callor.score.service.impl;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.callor.score.model.StudentVO;
import com.callor.score.persistance.StudentDao;
import com.callor.score.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("studentServiceV1")
public class StudentServiceImplV1 implements StudentService {

	protected StudentDao stuDao ;
	protected JdbcTemplate jdbcTemplate;
	public StudentServiceImplV1(StudentDao stuDao, JdbcTemplate jdbcTemplate ) {
		this.stuDao = stuDao;
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	public StudentVO selectCheck(StudentVO sVO) {
		
		String sql = " SELECT * FROM tbl_student ";
		sql += " WHERE ";
		sql += " st_name = ? && ";
		sql += " st_dept= ? && ";
		sql += " st_grade = ? && ";
		sql += " st_tel = ? && ";
		sql += " st_addr = ? ";
		
		Object[] params = new Object[] {
			sVO.getSt_name(),
			sVO.getSt_dept(),
			sVO.getSt_grade(),
			sVO.getSt_tel(),
			sVO.getSt_addr()
		};		
		
		log.debug(" ** SQL : {} "+sql);
		
		sVO = (StudentVO)jdbcTemplate.query(sql, params, new BeanPropertyRowMapper<StudentVO>(StudentVO.class));
		
		return sVO;
	}
	
	@Override
	public int update(StudentVO sVO) {
		// TODO 업데이트 하기
		
		stuDao.update(sVO);
		
		log.debug("** studentVO : {}" + sVO.toString());
		
//		StudentVO sVO2 = this.selectCheck(sVO);
//		
//		if(sVO2 == null) {
//			stuDao.update(sVO);
//		} else if (sVO2 == sVO) {
//			stuDao.update(sVO); 
//		} else {
//			
//		}
		
		return 0;
	}


	
	
	
}
