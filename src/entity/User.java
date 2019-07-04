package entity;

public class User extends Admin {
	private String position;
	private String selfIntroduction;
	
	/**
	 * @return the positon
	 */
	public String getPosition() {
		return position;
	}
	/**
	 * @param positon the positon to set
	 */
	public void setPositon(String positon) {
		this.position = positon;
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
