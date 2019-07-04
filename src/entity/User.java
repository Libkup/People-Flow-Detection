package entity;
public class User extends Person {
	

	private String position;
	private String selfIntroduction;
	
	public User(String name, String email, String password, String gender, String phoneNumber, String position,
			String selfIntroduction) {
		super(name, email, password, gender, phoneNumber);
		this.position = position;
		this.selfIntroduction = selfIntroduction;
	}
	
	/**
	 * @return the position
	 */
	public String getPosition() {
		return position;
	}
	/**
	 * @param position the position to set
	 */

	public void setPosition(String position) {
		this.position = position;
	}
	/**
	 * @return the selfIntroduction
	 */
	public String getSelfIntroduction() {
		return selfIntroduction;
	}
	/**
	 * @param selfIntroduction the selfIntroduction to set
	 */
	public void setSelfIntroduction(String selfIntroduction) {
		this.selfIntroduction = selfIntroduction;
	}
	

}
