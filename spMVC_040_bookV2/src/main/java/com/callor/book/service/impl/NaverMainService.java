package com.callor.book.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.book.config.NaverQualifier;
import com.callor.book.model.BookDTO;
import com.callor.book.model.MovieDTO;
import com.callor.book.model.NewsDTO;
import com.callor.book.service.NaverAbstractService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service(NaverQualifier.NAVER_MAIN_SERVICE_V1)
public class NaverMainService {
	
	@Qualifier(NaverQualifier.NAVER_BOOK_SERVICE_V2)
	protected final NaverAbstractService<BookDTO> nBSer;
	
	@Qualifier(NaverQualifier.NAVER_MOVIE_SERVICE_V1)
	protected final NaverAbstractService<MovieDTO> nMSer;
	
	@Qualifier(NaverQualifier.NAVER_NEWS_SERVICE_V1)
	protected final NaverAbstractService<NewsDTO> nNSer;

	@Qualifier(NaverQualifier.NAVER_NEWS_SERVICE_V2)
	protected final NaverAbstractService<NewsDTO> nNSer2;
	
	
	public void naverGetData(String cat, String search, Model model) throws Exception {
		if(search != null && !search.equals("")) {
			
			if(cat.equalsIgnoreCase("BOOK")) {
				//도서검색서비스
				String qureyURL = nBSer.queryURL(search);
				String jSonString = nBSer.getJsonString(qureyURL);
				List<BookDTO> books = nBSer.getNaverList(jSonString);
				
				model.addAttribute("BOOKS", books);
				
			} else if(cat.equalsIgnoreCase("MOVIE")) {
				//영화검색서비스
				
				String queryURL = nMSer.queryURL(search);
				String jSonString = nMSer.getJsonString(queryURL);
				List<MovieDTO> movies = nMSer.getNaverList(jSonString);
				
				model.addAttribute("MOVIES",movies);
				
			} else if(cat.equalsIgnoreCase("NEWS")) {
				//뉴스검색서비스
				
				/*
				 * queryURL을 생성하고
				 * naver에 JSON String을 요청하고
				 * Gson을 사용하여 parsing 하여 List<NewsDTO>를 얻었다
				 * 
				 * V2
				 * queryURL을 생성하고
				 * naver에 JSON String을 요청하는 대신
				 * 		getJsonString() method를 사용하지 않겠다
				 * getNaverList() method에 queryURL을 직접
				 * 주입하여 데이터를 가져오기
				 */
				
				String queryURL = nNSer.queryURL(search);
//				String jSonString = nNSer.getJsonString(queryURL);
//				List<NewsDTO> news_list = nNSer.getNaverList(jSonString);
				List<NewsDTO> news_list = nNSer2.getNaverList(queryURL);
				
				model.addAttribute("NEWS_LIST",news_list);
				
			}
		}
		
		
	}


	public String naverGetJsonString(String cat, String search) throws Exception {

		String queryURL = nNSer.queryURL(search);
		String jsonString =nNSer.getJsonString(queryURL);
		
		return jsonString;
	}
	
	
	public List<NewsDTO> naverGetList(String search) throws Exception {
		
		String queryURL = nNSer.queryURL(search);
		return nNSer.getNaverList(queryURL);
	}
	
	@ResponseBody
	@RequestMapping(value="/get/list")
	public List<NewsDTO> getNews(String search) throws Exception {
		return nNSer.getNaverList(search);
	}
	

}
