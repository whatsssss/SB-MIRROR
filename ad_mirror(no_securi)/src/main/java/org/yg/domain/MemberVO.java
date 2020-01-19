package org.yg.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid, userpw, userName, email, address, hp;
	private boolean enabled;
	
	private Date regDate, updateDate;
	
	// ?��?��?�� ?��?���? 칼럼�? ?��기에 ?��?��?��?���? ?��?��?��. �?계된 ?��?�� 같이.
	private List<AuthVO> authList;

}
