package movieDTO;


public class Movie {

	protected String movieName;
	protected String imageUrl;
	protected String openDate;
	
	public String getMovieName() {
		return movieName;
	}
	public Movie setMovieName(String movieName) {
		this.movieName = movieName;
		return this;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public Movie setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
		return this;
	}
	
	public String getopenDate() {
		return openDate;
	}
	public Movie setopenDate(String openDate) {
		this.openDate = openDate;
		return this;
	}

}
