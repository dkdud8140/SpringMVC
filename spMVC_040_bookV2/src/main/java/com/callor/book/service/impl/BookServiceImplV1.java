package com.callor.book.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.callor.book.config.NaverQualifier;
import com.callor.book.dao.ext.BookDao;
import com.callor.book.model.BookDTO;
import com.callor.book.service.BookService;
import com.callor.book.service.NaverAbstractService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BookServiceImplV1 implements BookService {

	@Qualifier(NaverQualifier.NAVER_BOOK_SERVICE_V2)
	protected final NaverAbstractService<BookDTO> nBSer;
	
	protected final BookDao bDao;
	
	
	@Override
	public int insert(String isbnUTF) throws ParseException, IOException {
		
		String isbn = URLDecoder.decode(isbnUTF,"UTF-8");
		String[] isbns = isbn.split(" ");
		
		isbn = isbns[0];
		String queryURL = nBSer.queryURL(isbn);
		String jsonString = nBSer.getJsonString(queryURL);
		List<BookDTO> books= nBSer.getNaverList(jsonString);
		
		BookDTO book = books.get(0);
		book.setIsbn(isbn);
		
		bDao.insert(book);
		
		return 0;
	}

}
