package com.callor.jdbc.persistance;

import java.util.List;

import com.callor.jdbc.model.BookVO;

/*
 * Dao(Data Access Object)
 * Service -> Da0 -> DBMS 과정에서
 * 실질적인 한 개 tavble에 대한 CRUD를 담당할 interface, class
 * 
 * Servlet project에서 Service가 실행했던 역할을 Dao가 실행하게 된다
 */
public interface BookDao extends GenericDao<BookVO, String>{
	
	/*
	 * Generic에 선언된 메소드에 추가하여 도서정보 테이블에서 조회할 여러가지 메소드를 작성
	 */
	
	//도서명 검색하기
	public List<BookVO> findByName(String name);


	//출판일 검색하기
	public List<BookVO> findByDate(String date);
	
	public List<BookVO> findByComp(String comp);
	public List<BookVO> findByAutor(String autor);
}

