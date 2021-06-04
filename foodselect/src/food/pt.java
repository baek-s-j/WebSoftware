package food;

public class pt {
	private int foodID;
	private String userID;
	private String date;
	private String content;
	private int Available;
	
	public String getuserID() {
		return userID;
	}
	public void setuserID(String userID) {
		this.userID = userID;
	}
	public String getdate() {
		return date;
	}
	public void setdate(String date) {
		this.date = date;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public int getfoodID() {
		return foodID;
	}
	public void setfoodID(int foodID) {
		this.foodID = foodID;
	}
	public int getAvailable() {
		return Available;
	}
	public void setAvailable(int Available) {
		this.Available =  Available;
	}
	
	
	
}
