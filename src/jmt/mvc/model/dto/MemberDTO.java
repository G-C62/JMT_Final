package jmt.mvc.model.dto;

public class MemberDTO {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberGender;
	private String memberEmail;
	public MemberDTO() {
		
	}
	
	public MemberDTO(String memberId, String memberPwd, String memberName, String memberPhone, String memberGender,
			String memberEmail) {
		
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberGender = memberGender;
		this.memberEmail = memberEmail;
	}


	public MemberDTO(String memberId, String memberPwd) {
		
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	
}
