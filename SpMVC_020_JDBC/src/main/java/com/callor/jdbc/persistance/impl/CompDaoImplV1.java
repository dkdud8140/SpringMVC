package com.callor.jdbc.persistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.persistance.CompDao;

import lombok.extern.slf4j.Slf4j;

/*
 * @Component
 * 모든 Component를 대표하는 Annotation
 * 컴파일과정에서 다소 비용이 많이 소용된다
 * 
 * Compnent Annotation
 * @Controller @Service @Repository 이러한 Annotation을 사용한다
 * Spring Container에게 ㅊ이 표식이 부착된 클래스를 bean으로 생성하여 보관하라
 * 
 * CompVO c = new CompVO()
 * Object o = new CompVO()
 * 
 * CompServiceImplV1 cs = new CompServiceImplV1()
 * CompService cs2 = new CompServiecImplV1()
 * 
 */

@Slf4j
@Repository("compDaoV1")
public class CompDaoImplV1 implements CompDao {

	protected final JdbcTemplate jdbcTemplate;

	public CompDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<CompVO> selectAll() {
		// TODO Auto-generated method stub

		String sql = " SELECT * FROM tbl_company ";

		List<CompVO> comps = jdbcTemplate.query(sql, new BeanPropertyRowMapper<CompVO>(CompVO.class));
		log.debug("SELECT {}", comps.toString());

		return comps;
	}

	@Override
	public CompVO findById(String ccode) {

		String sql = " SELECT * FROM tbl_company ";
		sql += "WHERE cp_ccode = ? ";
		Object[] params = new Object[] { ccode };

		CompVO compVO = (CompVO) jdbcTemplate.query(sql, params, new BeanPropertyRowMapper<CompVO>(CompVO.class));

		log.debug("SELECT BY ID {}", compVO.toString());
		return compVO;
	}

	@Override
	public int insert(CompVO vo) {

		String sql = " INSERT INTO tbl_company";
		sql += " (cp_code, cp_title, cp_ceo, cp_tel, cp_addr) ";
		sql += " VALUES (?,?,?,?,?) ";

		Object[] params = new Object[] { vo.getCp_code(), vo.getCp_title(), vo.getCp_ceo(), vo.getCp_tel(),
				vo.getCp_addr() };

		return jdbcTemplate.update(sql, params);
	}

	@Override
	public int update(CompVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * jdbcTemplate을 사용하여 QUERY를 실행할 때 각 메소드에 매개변수를 받아 이 쿼리에 전달할 텐데 이 때 매겨변수를
	 * primitive르 받으면 값을 변환시키는 어려움이 있다 권장사항으로 매개견수는 wrapper class type으로 설정 즉 숫자형일
	 * 경우 Integer, Long형으로 선언
	 * 
	 * vo에 담겨서 전달된 값은 Object[] 배열을 jdbcTemplate에 전달해주어야 한다
	 * 
	 * 하지만, 1~2개의 값을 전달할 때 Object[] 배열로 변환 후 전달을 하면 오블젝트 객체 저장소가 생성되고 메모리를 사용한단 이 떄
	 * 전달되는 변수가 wrapper class typedlaus Object[] 배열로 만들지 않고 바로 주입할 수 있다
	 * 
	 */

	@Override
	public int delete(String cp_code) {
		// TODO 출판사 정보 삭제

		String sql = " DELETE FROM tbl_company";
		sql += " WHERE cp_code = ? ";

		// cp_code가 String wrapper class type이므로
		// Object[] 배열로 변환하지 않고 바로 전달이 가능하
		// Object[] params = new Object[] {cp_code};
		return jdbcTemplate.update(sql, cp_code);
	}

	/*
	 * tbl_company table에서 cp_code(출판사코드) 중 가장 큰 값을 추출하기
	 */

	@Override
	public String findByMaxCode() {

		String sql = " SELECT MAX(cp_code) FROM tbl_company";

		String cpCode = (String) jdbcTemplate.queryForObject(sql, String.class);

		return cpCode;
	}

	@Override
	public List<CompVO> findByCName(String cname) {

		String sql = " SELECT * FROM tbl_company ";
		// 오라클 sql += " WHERE cp_name LIKE '%' || '%' || ";
		sql += " WHERE cp_title LIKE CONCAT('%', ? '%') ";

		// select를 수행한 후 각각의 데이터를 CompVO에
		List<CompVO> compList = jdbcTemplate.query(sql, new Object[] { cname },
				new BeanPropertyRowMapper<CompVO>(CompVO.class));

		return compList;
	}

	@Override
	public List<CompVO> findByCTel(String cname) {

		String sql = " SELECT * FROM tbl_company ";
		sql += " WHERE cp_tel LIKE CONCAT('%', ? '%') ";

		List<CompVO> compList = jdbcTemplate.query(sql, new Object[] { cname },
				new BeanPropertyRowMapper<CompVO>(CompVO.class));

		return compList;
	}

	@Override
	public List<CompVO> findByCCeo(String cname) {

		String sql = " SELECT * FROM tbl_company ";
		sql += " WHERE cp_ceo LIKE CONCAT('%', ? '%') ";

		List<CompVO> compList = jdbcTemplate.query(sql, new Object[] { cname },
				new BeanPropertyRowMapper<CompVO>(CompVO.class));

		return compList;
	}

}
