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
	
	private String v_num;
	private String v_name;
	private String v_dept;
	private Integer v_grade;
	private Integer v_count;
	private Integer v_sum;
	private Float v_avg;

}
