package com.callor.jdbc.persistance.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.jdbc.model.AuthorVO;
import com.callor.jdbc.persistance.AuthorDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("authorDaoV1")
public class AuthorDaoImplV1 implements AuthorDao {

	/*
	 * 일반적인 Spring Framework에서 다른 bean을 연결하기
	 * @Autowired는 이미 Bean으로 생성되어 Spring Container에 보관중인
	 * 객체를 여기에 주입해 달라
	 * 
	 * @Inject
	 * Java에서 기본적으로 제공하는 DI(Dependency Inject)를 수행하는 Annotation
	 * 일부에서는 @Inject를 사용하자라는 말이 있지만 
	 * SpringFramework를 사용할 때는 굳이 그러지 말자
	 * 
	 */
	@Autowired
	protected JdbcTemplate jdbcTemplate ;
	
	@Override
	public List<AuthorVO> selectAll() {
		
		String sql = " SELECT * FROM tbl_author " ;
		
		List<AuthorVO> authors = jdbcTemplate.query(sql, new BeanPropertyRowMapper<AuthorVO>(AuthorVO.class));
		log.debug("SELECT {}", authors.toString());
		
		return authors;
	}

	@Override
	public AuthorVO findById(String au_code) {

		String sql = " SELECT * FROM tbl_author " ;
		sql += " WHRER au_code = ? ";
		
		AuthorVO author =(AuthorVO)jdbcTemplate.query(sql, new Object[] { au_code }, 
				new BeanPropertyRowMapper<AuthorVO>(AuthorVO.class));
		log.debug("SELECT {}", author.toString());
		
		return author;
	
	}

	@Override
	public int insert(AuthorVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(AuthorVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AuthorVO> findByName(String aname) {
		String sql = " SELECT * FROM tbl_author " ;
		sql += " WHRER au_title LIKE CONCAT('%', ? , '%' ) ";
		
		List<AuthorVO> authors = jdbcTemplate.query(sql, new Object[] { aname }, 
				new BeanPropertyRowMapper<AuthorVO>(AuthorVO.class));
		log.debug("SELECT {}", authors.toString());
		
		return authors;
	}
	
	@Override
	public List<AuthorVO> findByATel(String atel) {
		String sql = " SELECT * FROM tbl_author " ;
		sql += " WHRER au_tel = ? ";
		
		/*
		 * 전화번호로 조회를 하면 1개의 데이터만 추출될 것이다
		 * 하지만 DB 조회에서 PK를 기준으로 조회하는 경우를 제외하고는
		 * 모두 LIST Type으로 데이터가 추출된다고 생각해야한다
		 */
		
		
		List<AuthorVO> authors = jdbcTemplate.query(sql, new Object[] { atel }, 
				new BeanPropertyRowMapper<AuthorVO>(AuthorVO.class));
		log.debug("SELECT {}", authors.toString());
		
		return authors;
	}
	
	

}
