package movieDetailDTO;

public class MovieDetail {

	protected String MovieName;
	protected String OpenDate;
	protected String MovieType;
	protected String Director;
	protected String Actor;
	protected String RunningTime;
	protected String AgeGrade;
	protected String Plot;
	protected String MovieTrailer;
	protected String PosterOne;
	protected String PosterTwo;
	protected String PosterThree;
	public String getMovieName() {
		return MovieName;
	}
	public MovieDetail setMovieName(String movieName) {
		MovieName = movieName;
		return this;
	}
	public String getOpenDate() {
		return OpenDate;
	}
	public MovieDetail setOpenDate(String openDate) {
		OpenDate = openDate;
		return this;
	}
	public String getMovieType() {
		return MovieType;
	}
	public MovieDetail setMovieType(String movieType) {
		MovieType = movieType;
		return this;
	}
	public String getDirector() {
		return Director;
	}
	public MovieDetail setDirector(String director) {
		Director = director;
		return this;
	}
	public String getActor() {
		return Actor;
	}
	public MovieDetail setActor(String actor) {
		Actor = actor;
		return this;
	}
	public String getRunningTime() {
		return RunningTime;
	}
	public MovieDetail setRunningTime(String runningTime) {
		RunningTime = runningTime;
		return this;
	}
	public String getAgeGrade() {
		return AgeGrade;
	}
	public MovieDetail setAgeGrade(String ageGrade) {
		AgeGrade = ageGrade;
		return this;
	}
	public String getPlot() {
		return Plot;
	}
	public MovieDetail setPlot(String plot) {
		Plot = plot;
		return this;
	}
	public String getMovieTrailer() {
		return MovieTrailer;
	}
	public MovieDetail setMovieTrailer(String movieTrailer) {
		MovieTrailer = movieTrailer;
		return this;
	}
	public String getPosterOne() {
		return PosterOne;
	}
	public MovieDetail setPosterOne(String posterOne) {
		PosterOne = posterOne;
		return this;
	}
	public String getPosterTwo() {
		return PosterTwo;
	}
	public MovieDetail setPosterTwo(String posterTwo) {
		PosterTwo = posterTwo;
		return this;
	}
	public String getPosterThree() {
		return PosterThree;
	}
	public MovieDetail setPosterThree(String posterThree) {
		PosterThree = posterThree;
		return this;
	}
	
}
