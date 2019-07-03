package entity;

public class User extends Admin {
	private String positon;
	private String selfIntroduction;
	
	/**
	 * @return the positon
	 */
	public String getPositon() {
		return positon;
	}
	/**
	 * @param positon the positon to set
	 */
	public void setPositon(String positon) {
		this.positon = positon;
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
