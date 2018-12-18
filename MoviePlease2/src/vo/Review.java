package vo;

import java.util.Date;

public class Review {
	protected int ReviewNo;
	protected String ID;
	protected String ReviewType;
	protected String MovieName;
	protected String ReviewTitle;
	protected String ReviewContent;
	protected String MovieScore;
	protected Date ReviewDate;
	public int getReviewNo() {
		return ReviewNo;
	}
	public Review setReviewNo(int reviewNo) {
		this.ReviewNo = reviewNo;
		return this;
	}
	public String getID() {
		return ID;
	}
	public Review setID(String iD) {
		this.ID = iD;
		return this;
	}
	public String getReviewType() {
		return ReviewType;
	}
	public Review setReviewType(String reviewType) {
		this.ReviewType = reviewType;
		return this;
	}
	public String getMovieName() {
		return MovieName;
	}
	public Review setMovieName(String movieName) {
		this.MovieName = movieName;
		return this;
	}
	public String getReviewTitle() {
		return ReviewTitle;
	}
	public Review setReviewTitle(String reviewTitle) {
		this.ReviewTitle = reviewTitle;
		return this;
	}
	public String getReviewContent() {
		return ReviewContent;
	}
	public Review setReviewContent(String reviewContent) {
		this.ReviewContent = reviewContent;
		return this;
	}
	public String getMovieScore() {
		return MovieScore;
	}
	public Review setMovieScore(String movieScore) {
		this.MovieScore = movieScore;
		return this;
	}
	public Date getReviewDate() {
		return ReviewDate;
	}
	public Review setReviewDate(Date reviewDate) {
		this.ReviewDate = reviewDate;
		return this;
	}
	
	
	
}
