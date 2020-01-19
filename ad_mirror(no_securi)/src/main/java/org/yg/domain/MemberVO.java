package org.yg.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid, userpw, userName, email, address, hp;
	private boolean enabled;
	
	private Date regDate, updateDate;
	
	// ?´? œ?Š” ?…Œ?´ë¸? ì¹¼ëŸ¼ë§? ?—¬ê¸°ì— ?„ ?–¸?•˜?Š”ê²? ?•„?‹ˆ?‹¤. ê´?ê³„ëœ ?• ?„ ê°™ì´.
	private List<AuthVO> authList;

}
