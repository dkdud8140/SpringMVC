package com.callor.score.service;

import com.callor.score.model.StudentVO;

public interface StudentService {
	
	public int update(StudentVO studentVO);
	public int insert(StudentVO studentVO);
	public int delete(String st_num);
	
	
}
