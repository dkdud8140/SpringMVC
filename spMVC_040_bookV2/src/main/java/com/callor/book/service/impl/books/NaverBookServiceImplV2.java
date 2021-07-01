package com.callor.book.service.impl.books;

import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.callor.book.config.NaverQualifier;
import com.callor.book.model.BookDTO;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import lombok.extern.slf4j.Slf4j;

/*
 * NaverBookServiceimplV1에서는 NaverAbstarctService를 상속받았고
 * NaverBookServiceimplV2에서는 NaverBookServiceimplV1을 상속받았다
 * 
 * NaverAbstractService nSer = new NaverBookServiceImplV2()처럼 선언 및 생성 가능
 * 
 * NaverAbastractService 추상클래스에 정의된 jsonString() method를 물려받았고
 * NaverBookServiceImplV1 클래스에 정의된
 * 		queryURL(), getNaverList() method를 물려받았다
 * 
 * 따라서
 * NacerBookServiceImplV2 클래스에는
 * 		queryURL(), jsonString(),getNaverList() method가
 * 		모두 있는 것과 같다
 */


@Slf4j
@Service(NaverQualifier.NAVER_BOOK_SERVICE_V2)
public class NaverBookServiceImplV2 extends NaverBookServiceImplV1{@Override
	
	
	// gSon을 사용하여 jsonString을 parsing하기	
	public List<BookDTO> getNaverList(String jsonString) throws ParseException {
		
		// 문자열형 JSON인 jSonString을 Json객체로 변환하기
		JsonElement jsonElement = JsonParser.parseString(jsonString);
		
		// 필요한 항목만 가져오기
		JsonElement oItems = jsonElement.getAsJsonObject().get("items");
		
		Gson gson = new Gson();
		
		/*
			List는 inerface인데 interface는 자신의 type을 가지고 있지 않는 객체인데
			Gson을 이요하여 JSON parsing을 할 때 List<DTO> 구조를 알 수 있는 방법이 없어서
			Gson 특별한 객체 생성자를 하나 제공해주고
			이 객체를 통하여 List<DTO>의 구조를 알 수 있도록 만들어준다.
		 */
		TypeToken<List<BookDTO>> typeToken = new TypeToken<List<BookDTO>>() {};
		
		List<BookDTO> bookList = gson.fromJson(oItems, typeToken.getType());
		
		return bookList;
	}
	
	

}
