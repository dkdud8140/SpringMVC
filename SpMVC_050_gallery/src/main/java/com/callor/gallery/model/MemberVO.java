package com.callor.gallery.model;

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
public class MemberVO {
	
	private String m_userid;
	private String m_password;
	private String re_password;
	private String m_nick;
	private String m_tel;
	
	private int m_level = 9;
	
}
