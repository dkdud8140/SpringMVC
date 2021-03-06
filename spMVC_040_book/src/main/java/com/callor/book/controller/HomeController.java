package com.callor.book.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.book.model.BookDTO;
import com.callor.book.model.MovieDTO;
import com.callor.book.service.NaverBookService;
import com.callor.book.service.NaverMovieService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {
	
	@Qualifier("naverBookServiceV1")
	protected final NaverBookService nBSer;
	
	@Qualifier("naverMovieServiceV1")
	protected final NaverMovieService nMSer;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "redirect:/naver/BOOK";
	}
	
	
	@RequestMapping(value = "/not", method=RequestMethod.GET)
	public String home(@RequestParam(name="category", required = false, defaultValue = "") String category, Model model) {
		
		//model.addAttribute("CAT",category);
		
		if(category.equalsIgnoreCase("BOOK")) {
			return "redirect:/book";
		} else if(category.equalsIgnoreCase("MOVIE")) {
			return "redirect:/movie";
		} else if(category.equalsIgnoreCase("NEWS")) {
			return "redirect:/news";
		}
		return "redirect:/book";
	}
	
	
//	
//	@RequestMapping(value = "/home", method = RequestMethod.GET)
//	public String home1(@RequestParam(name="search",required=false, defaultValue = "") String search, Model model) 
//			throws MalformedURLException, IOException, ParseException {
//		if(search != null && !search.equals("")) {
//			
//			String queryURL = nBSer.queryURL(search.trim());
//			String jsonString = nBSer.getJsonString(queryURL);
//			List<BookDTO> bookList = nBSer.getNaverList(jsonString);
//			
//			String queryURL2 = nMSer.queryURL(search.trim());
//			String jsonString2 = nMSer.getJsonString(queryURL2);
//			List<MovieDTO> movieList = nMSer.getNaverList(jsonString2);
//			
//			model.addAttribute("BOOKS",bookList);
//			model.addAttribute("MOVIES",movieList);
//		}
//		return "home";
//	}
	
	
	
	
	
}
