package entity;
public class User extends Person {
	

	private String position;
	private String selfIntroduction;
	private String added_camera;
	
	public User(String name, String email, String password, String gender, String phoneNumber, String position,
			String selfIntroduction,String added_camera) {
		super(name, email, password, gender, phoneNumber);
		this.position = position;
		this.selfIntroduction = selfIntroduction;
		this.added_camera = added_camera;
	}
	
	public User() {
		// TODO Auto-generated constructor stub
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

	public String getAdded_camera() {
		return added_camera;
	}

	public void setAdded_camera(String added_camera) {
		this.added_camera = added_camera;
	}
	

}
