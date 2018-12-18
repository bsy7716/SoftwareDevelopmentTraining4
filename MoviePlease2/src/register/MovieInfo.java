package register;

public class MovieInfo {
	
	String MovieName;
	String Poster;
	String OpenDate;
	
	public String getMovieName() {
		return MovieName;
	}
	public MovieInfo setMovieName(String movieName) {
		this.MovieName = movieName;
		return this;
	}
	public String getPoster() {
		return Poster;
	}
	public MovieInfo setPoster(String poster) {
		this.Poster = poster;
		return this;
	}
	public String getOpenDate() {
		return OpenDate;
	}
	public MovieInfo setOpenDate(String openDate) {
		this.OpenDate = openDate;
		return this;
	}
	
	
}
