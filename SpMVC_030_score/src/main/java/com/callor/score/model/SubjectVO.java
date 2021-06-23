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

public class SubjectVO {
	
	public String	sb_code	;  //	CHAR(4)		PRIMARY KEY
	public String	sb_name	;  //	VARCHAR(20)	NOT NULL	
	public String	sb_proft;  //	VARCHAR(20)		

}
