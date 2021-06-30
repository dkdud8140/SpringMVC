package com.callor.book.service.impl;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.callor.book.model.BookDTO;
import com.callor.book.model.MovieDTO;
import com.callor.book.service.NaverBookService;
import com.callor.book.service.NaverMovieService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service("naverMainServiceV1")
public class NaverMainServiceImpl {
	
	@Qualifier("naverBookServiceV2")
	protected final NaverBookService nBSer;
	
	@Qualifier("naverMovieServiceV1")
	protected final NaverMovieService nMSer;
	
	
	public void naverGetData(String cat, String search, Model model) throws MalformedURLException, IOException, ParseException {
		if(search != null && !search.equals("")) {
			
			if(cat.equalsIgnoreCase("BOOK")) {
				//도서검색서비스
				String qureyURL = nBSer.queryURL(search);
				String jSonStrign = nBSer.getJsonString(qureyURL);
				List<BookDTO> books = nBSer.getNaverList(jSonStrign);
				
				model.addAttribute("BOOKS", books);
				
			} else if(cat.equalsIgnoreCase("MOVIE")) {
				//영화검색서비스
				
				String queryURL = nMSer.queryURL(search);
				String jSonString = nMSer.getJsonString(queryURL);
				List<MovieDTO> movies = nMSer.getNaverList(jSonString);
				
				model.addAttribute("MOVIES",movies);
				
			} else if(cat.equalsIgnoreCase("NEWS")) {
				//영화검색서비스
			}
		}
		
		
		
	}
	

}
