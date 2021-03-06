package org.yg.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid, userpw, userName, email, address, hp;
	private boolean enabled;
	
	private Date regDate, updateDate;
	
	// ?΄? ? ??΄λΈ? μΉΌλΌλ§? ?¬κΈ°μ ? ?Έ??κ²? ???€. κ΄?κ³λ ? ? κ°μ΄.
	private List<AuthVO> authList;

}
