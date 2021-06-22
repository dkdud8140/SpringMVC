package com.callor.score.persistance.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.StudentVO;
import com.callor.score.persistance.StudentDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("StudentDaoV1")
public class StudentDaoImplV1 implements StudentDao{

	protected JdbcTemplate jdbcTemplate;
	public StudentDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	@Override
	public List<StudentVO> selectAll() {
		// TODO 모든 학생 리스트 출력
		
		String sql = " SELECT * FROM tbl_student";
		
		List<StudentVO> stuList = new ArrayList<StudentVO>();
		stuList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<StudentVO>(StudentVO.class));
		
		return stuList;
	}

	@Override
	public StudentVO selectById(String st_num) {
		// TODO 학생번호로 검색하기
		
		String sql = " SELECT * FROM tbl_student ";
		sql += " WHERE st_num = ? ";
		
		Object[] params = new Object[] { st_num };

		log.debug("sql {}", sql);
		
		StudentVO stuVO = (StudentVO)jdbcTemplate.queryForObject(sql, params, new BeanPropertyRowMapper<StudentVO>(StudentVO.class));

		log.debug("StudentVO : {}", stuVO);
		
		return stuVO;
	}

	@Override
	public int insert(StudentVO vo) {
		// TODO 학생정보 입력하기
		
		String sql = " INSERT INTO tbl_student ";
		sql += " (st_name, st_dept, st_grade,st_tel,st_addr) ";
		sql+= " values( ?, ?, ?, ?, ? ) ";
		
		log.debug(vo.toString());
		
		Object[] params = new Object[] { 
				vo.getSt_name(),
				vo.getSt_dept(),
				vo.getSt_grade(),
				vo.getSt_tel(),
				vo.getSt_addr()
		};
		
		log.debug(params.toString());
		return jdbcTemplate.update(sql, params);
	}

	@Override
	public int update(StudentVO vo) {
		// TODO 학생 정보 수정하기
		
		String sql = " UPDATE tbl_student SET ";
		sql += " st_name = ?, ";
		sql += " st_dept = ?, ";
		sql += " st_grade = ?, ";
		sql += " st_tel = ?, ";
		sql += " st_addr = ? ";
		sql += " WHERE st_num = ? ";
		
		Object[] params = new Object[] 
			{ vo.getSt_name(),
			  vo.getSt_dept(),		
			  vo.getSt_grade(),
			  vo.getSt_tel(),
			  vo.getSt_addr(),
			  vo.getSt_num()
			};
		
		log.debug(params.toString());
		return jdbcTemplate.update(sql, params);
	}

	@Override
	public int delete(String pk) {
		// TODO 삭제하기

		String sql = " DELETE FROM tbl_student ";
		sql += " WHERE st_num = ? ";
		
		Object[] params = new Object[] { pk };
		
		log.debug("## SQL : {}",sql);
		
		
		return jdbcTemplate.update(sql, params);
	}

}
