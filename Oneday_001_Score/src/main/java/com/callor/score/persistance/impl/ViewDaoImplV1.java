package com.callor.score.persistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.ViewDTO;
import com.callor.score.persistance.ViewDao;




@Repository("ViewDaoV1")
public class ViewDaoImplV1 implements ViewDao {

	private final JdbcTemplate jdbcTemplate;
	public ViewDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	@Override
	public List<ViewDTO> selectAll() {
		// TODO 모든 학생의 정보 및 점수 리스트 출력
		
		String sql = " select * from view_list ";
		
		List<ViewDTO> vList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<ViewDTO>(ViewDTO.class));
		
		return vList;
	}

	
	
	
	
	
	
	@Override
	public ViewDTO selectById(String pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(ViewDTO vo) {
		return 0;
	}

	@Override
	public int update(ViewDTO vo) {
		return 0;
	}

	@Override
	public int delete(String pk) {
		return 0;
	}

}
