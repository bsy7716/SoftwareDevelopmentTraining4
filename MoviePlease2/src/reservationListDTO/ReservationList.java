package reservationListDTO;


public class ReservationList {

	protected String userId;
	protected String userName;
	protected String movieName;
	protected String showDay;
	protected String showTime;
	protected String movieTheatersName;
	protected String showRoom;
	protected String seat;
	protected String price;
	protected String ticketNumber;
	
	public String getUserId() {
		return userId;
	}
	public ReservationList setUserId(String userId) {
		this.userId = userId;
		return this;
	}
	public String getUserName() {
		return userName;
	}
	public ReservationList setUserName(String userName) {
		this.userName = userName;
		return this;
	}
	public String getMovieName() {
		return movieName;
	}
	public ReservationList setMovieName(String movieName) {
		this.movieName = movieName;
		return this;
	}
	public String getShowDay() {
		return showDay;
	}
	public ReservationList setShowDay(String showDay) {
		this.showDay = showDay;
		return this;
	}
	public String getShowTime() {
		return showTime;
	}
	public ReservationList setShowTime(String showTime) {
		this.showTime = showTime;
		return this;
	}
	public String getMovieTheatersName() {
		return movieTheatersName;
	}
	public ReservationList setMovieTheatersName(String movieTheatersName) {
		this.movieTheatersName = movieTheatersName;
		return this;
	}
	public String getShowRoom() {
		return showRoom;
	}
	public ReservationList setShowRoom(String showRoom) {
		this.showRoom = showRoom;
		return this;
	}
	public String getSeat() {
		return seat;
	}
	public ReservationList setSeat(String seat) {
		this.seat = seat;
		return this;
	}
	public String getPrice() {
		return price;
	}
	public ReservationList setPrice(String price) {
		this.price = price;
		return this;
	}
	
	public String getTicketNumber() {
		return ticketNumber;
	}
	public ReservationList setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
		return this;
	}
}
