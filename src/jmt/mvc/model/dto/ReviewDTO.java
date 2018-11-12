
package jmt.mvc.model.dto;

public class ReviewDTO {
	private int reviewId;
	private String reviewTitle;
	private String reviewContents;
	private String reviewDate;
	private String memberId;
	private int resId;
	private String resName;
	private String reviewImg1;
	private String reviewImg2;
	private String reviewImg3;
	private String reviewIsLike;
	
	public ReviewDTO() {}

	public ReviewDTO(int resId, String resName, String reviewImg1) {
		super();
		this.resId = resId;
		this.resName = resName;
		this.reviewImg1 = reviewImg1;
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
	public ReviewDTO(int reviewId, String reviewTitle, String reviewContents, String reviewDate, String memberId,
			int resId, String resName, String reviewImg1, String reviewImg2, String reviewImg3, String reviewIsLike) {
		this.reviewId = reviewId;
		this.reviewTitle = reviewTitle;
		this.reviewContents = reviewContents;
		this.reviewDate = reviewDate;
		this.memberId = memberId;
		this.resId = resId;
		this.resName = resName;
		this.reviewImg1 = reviewImg1;
		this.reviewImg2 = reviewImg2;
		this.reviewImg3 = reviewImg3;
		this.reviewIsLike = reviewIsLike;
	}
	
	
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewImg1() {
		return reviewImg1;
	}
	public void setReviewImg1(String reviewImg1) {
		this.reviewImg1 = reviewImg1;
	}
	public String getReviewImg2() {
		return reviewImg2;
	}
	public void setReviewImg2(String reviewImg2) {
		this.reviewImg2 = reviewImg2;
	}
	public String getReviewImg3() {
		return reviewImg3;
	}
	public void setReviewImg3(String reviewImg3) {
		this.reviewImg3 = reviewImg3;
	}
	public String getReviewIsLike() {
		return reviewIsLike;
	}
	public void setReviewIsLike(String reviewIsLike) {
		this.reviewIsLike = reviewIsLike;
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

