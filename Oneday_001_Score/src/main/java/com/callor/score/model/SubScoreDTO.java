package com.callor.score.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SubScoreDTO {
	
	private String stnum ;
	private String stname ;
	private Integer sub1;
	private Integer sub2;
	private Integer sub3;
	private Integer sub4;
	private Integer sum;
	private Float avg;
	

}
