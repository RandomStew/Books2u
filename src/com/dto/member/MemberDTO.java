package com.dto.member;

public class MemberDTO {

	private String userId; // 아이디
	private String passWd; // 비밀번호
	private String userName; // 이름
	private String ssn1; // 주민등록번호 앞자리
	private String ssn2; // 주민등록번호 뒷자리
	private String phone1; // 휴대폰 010
	private String phone2; // 휴대폰 1234
	private String phone3; // 휴대폰 5678
	private String post; // 우편번호
	private String addr1; // 도로명 주소
	private String addr2; // 지번 주소
	private String addr3; // 상세 주소
	private String email1; // 이메일 계정
	private String email2; // 이메일 도메인
	private String joinDate; // 가입 날짜
	private String lastDate; // 최근접속 날짜
	private int account; // 계좌(잔고)

	public MemberDTO() {
		super();
	}

	public MemberDTO(String userId, String passWd, String userName, String ssn1, String ssn2, String phone1,
			String phone2, String phone3, String post, String addr1, String addr2, String addr3, String email1,
			String email2, String joinDate, String lastDate, int account) {
		super();
		this.userId = userId;
		this.passWd = passWd;
		this.userName = userName;
		this.ssn1 = ssn1;
		this.ssn2 = ssn2;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.email1 = email1;
		this.email2 = email2;
		this.joinDate = joinDate;
		this.lastDate = lastDate;
		this.account = account;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassWd() {
		return passWd;
	}

	public void setPassWd(String passWd) {
		this.passWd = passWd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSsn1() {
		return ssn1;
	}

	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}

	public String getSsn2() {
		return ssn2;
	}

	public void setSsn2(String ssn2) {
		this.ssn2 = ssn2;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", passWd=" + passWd + ", userName=" + userName + ", ssn1=" + ssn1
				+ ", ssn2=" + ssn2 + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", post="
				+ post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", email1=" + email1
				+ ", email2=" + email2 + ", joinDate=" + joinDate + ", lastDate=" + lastDate + ", account=" + account
				+ "]";
	}

}
