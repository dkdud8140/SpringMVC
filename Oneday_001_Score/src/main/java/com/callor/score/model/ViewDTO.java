package com.callor.score.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class ViewDTO {
	
	public String v_num ;
	public String v_name ;
	public String v_dept ;
	public Integer v_grade ;
	public Integer v_count ;
	public Integer v_sum ;
	public Float v_avg ;

}
