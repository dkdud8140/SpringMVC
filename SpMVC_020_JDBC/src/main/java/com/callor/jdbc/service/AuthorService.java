package com.callor.jdbc.service;

import java.util.List;

import com.callor.jdbc.model.AuthorVO;

public interface AuthorService {

	public List<AuthorVO> selectAll();
	public AuthorVO findByCode(String au_code);
	public List<AuthorVO> findByName(String au_name);
	public  List<AuthorVO> findByTel(String au_tel);
}
