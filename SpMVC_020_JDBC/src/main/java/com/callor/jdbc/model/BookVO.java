package com.callor.jdbc.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor		// super 생성자
@NoArgsConstructor		// field 생성자

public class BookVO {
	
	private String bk_isbn ;
	private String bk_title ;
	private String bk_ccode ;
	private String bk_acode ;
	private String bk_date ;
	
	/*
	 * VO(dto)를 설계할 때 
	 * 숫자형 변수는 pk나 특별히 조회할 때 사용하는 칼럼은 
	 * 		class(Integer, Long, Float)로 선언하는 것이 좋다
	 * 이 칼럼이 null인경우에 조건을 부여하여 연산하는데 유리하다
	 * 
	 * 단, class 형으로 선언을 했을 때는
	 * VO(DTO)에 해당 변수를 0으로 선언해주는 것이 편리하다
	 * 
	 * 일반적인 숫자형 변수는 primitive형으로 선언하는 것이 좋다
	 * 
	 * VO(DTO) 클랫의 변수를 primitive 형으로 선언하면
	 * 자동으로 0으로 초기화가 된다.
	 * 
	 * DB에 insert를 수행할 때 해장 칼럼이 not null로 되어 있을 때
	 * 별다른 처리를 하지 않아도 SQL exception이 발생되지 않는다
	 * 
	 */
	
	private int bk_price = 0 ;
	private int bk_pages ;
	
	
	
}
