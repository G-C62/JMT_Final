package jmt.mvc.model.dto;

public class ReviewDTO {
	private int reviewId;
	private String reviewTitle;
	private String reviewContents;
	private String memberId;
	private int resId;
	private String resName;
	public ReviewDTO() {
		
	}
	public ReviewDTO(int reviewId, String reviewTitle, String reviewContents, String memberId, int resId,
			String resName) {
		
		this.reviewId = reviewId;
		this.reviewTitle = reviewTitle;
		this.reviewContents = reviewContents;
		this.memberId = memberId;
		this.resId = resId;
		this.resName = resName;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	
	
	
}
