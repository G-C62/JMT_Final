package jmt.mvc.model.dto;

public class ReviewDTO {
	private int reviewId;
	private String reviewTitle;
	private String reviewContents;
	private String memberId;
	private int resId;
	private String resName;
	private String review_img1;
	public ReviewDTO() {
		
	}
	
	public ReviewDTO(String resName, String review_img1) {
		super();
		this.resName = resName;
		this.review_img1 = review_img1;
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

	public String getReview_img1() {
		return review_img1;
	}

	public void setReview_img1(String review_img1) {
		this.review_img1 = review_img1;
	}

	
	
}
