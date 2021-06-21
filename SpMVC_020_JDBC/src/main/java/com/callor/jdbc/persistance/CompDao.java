package com.callor.jdbc.persistance;

import java.util.List;

import com.callor.jdbc.model.CompVO;

public interface CompDao extends GenericDao<CompVO, String>{

	
	public String findByMaxCode();
	
	public List<CompVO> findByCName(String cname);
}
