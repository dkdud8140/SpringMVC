package com.callor.book.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.callor.book.model.BookDTO;
import com.callor.book.service.BookService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/book")
@Controller
public class BookController {
	
	@Qualifier("bookServiceV1")
	protected final BookService bSer;
	

	@RequestMapping(value = "/insert/{isbn}", method = RequestMethod.GET)
	public String insert(@PathVariable("isbn")String isbn, Model model) throws ParseException, IOException {
		
		log.debug(isbn);
		
		int ret = bSer.insert(isbn);
		
		return "redirect:/book/list";
	}
	
	/*
	 *  통상적인 String Framwork의 method에서는 
	 *  
	 *  View 파일의 이름을 String형으로 return하고
	 *  view 에서 랜더링할 데이터는 Model 객체에 Attribute로 담아서 보내는 방식이다
	 *  
	 *  ModelAndView 객체를 별도로 생성하여
	 *  view는 set ViewName() method를 이용하여 setting 하고
	 *  랜더링 할 데이터는 addObject() method 이요하여 추가하고
	 *  ModelAndView 객체를 return하는 방식도 사용한다.
	 */
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(Model model) {
		
		List<BookDTO> bookList = bSer.selectAll();
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("home");
		mv.addObject("MY_BOOKS", bookList);
		
		return mv;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String isbn) {
		
		//isbn을 받아서 도서 정보를 findById()하고
		// 자세히 보이기 화면 구현
		
		return "home";
	}
	
	
	
}
