package com.webjjang.message.vo;

// import lombok.Data;

// @Data
public class MessageVO {
	// private 변수
		private Long no;
		private String content;
		private String senderId;
		private String senderName;
		private String senderPhoto;
		private String sendDate;
		private String accepterId;
		private String accepterName;
		private String accepterPhoto;
		private String acceptDate;
		private int allUser; // 0 - 개인, 1 - 전체 메시지
		
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderPhoto() {
		return senderPhoto;
	}
	public void setSenderPhoto(String senderPhoto) {
		this.senderPhoto = senderPhoto;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getAccepterId() {
		return accepterId;
	}
	public void setAccepterId(String accepterId) {
		this.accepterId = accepterId;
	}
	public String getAccepterName() {
		return accepterName;
	}
	public void setAccepterName(String accepterName) {
		this.accepterName = accepterName;
	}
	public String getAccepterPhoto() {
		return accepterPhoto;
	}
	public void setAccepterPhoto(String accepterPhoto) {
		this.accepterPhoto = accepterPhoto;
	}
	public String getAcceptDate() {
		return acceptDate;
	}
	public void setAcceptDate(String acceptDate) {
		this.acceptDate = acceptDate;
	}
	public int getAllUser() {
		return allUser;
	}
	public void setAllUser(int allUser) {
		this.allUser = allUser;
	}
	
	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", content=" + content + ", senderId=" + senderId + ", senderName=" + senderName
				+ ", senderPhoto=" + senderPhoto + ", sendDate=" + sendDate + ", accepterId=" + accepterId
				+ ", accepterName=" + accepterName + ", accepterPhoto=" + accepterPhoto + ", acceptDate=" + acceptDate
				+ ", allUser=" + allUser + "]";
	}
	
}
