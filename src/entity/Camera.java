package entity;

public class Camera {
	private int id;
	private String name;
	private String location;
	private String description;
	private String rtmpAddress;
	private int highestHistory;
	private int highestHour;
	private int threshold;
	
	/**
	 * @param id
	 * @param name
	 * @param location
	 * @param description
	 * @param rtmpAddress
	 * @param highestHistory
	 * @param highestHour
	 * @param threshold
	 */
	public Camera(int id, String name, String location, String description, String rtmpAddress, int highestHistory,
			int highestHour, int threshold) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.description = description;
		this.rtmpAddress = rtmpAddress;
		this.highestHistory = highestHistory;
		this.highestHour = highestHour;
		this.threshold = threshold;
	}
	
	/**
	 * 
	 */
	public Camera() {
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}
	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the rtmpAddress
	 */
	public String getRtmpAddress() {
		return rtmpAddress;
	}
	/**
	 * @param rtmpAddress the rtmpAddress to set
	 */
	public void setRtmpAddress(String rtmpAddress) {
		this.rtmpAddress = rtmpAddress;
	}
	/**
	 * @return the highestHistory
	 */
	public int getHighestHistory() {
		return highestHistory;
	}
	/**
	 * @param highestHistory the highestHistory to set
	 */
	public void setHighestHistory(int highestHistory) {
		this.highestHistory = highestHistory;
	}
	/**
	 * @return the highestHour
	 */
	public int getHighestHour() {
		return highestHour;
	}
	/**
	 * @param highestHour the highestHour to set
	 */
	public void setHighestHour(int highestHour) {
		this.highestHour = highestHour;
	}
	/**
	 * @return the threshold
	 */
	public int getThreshold() {
		return threshold;
	}
	/**
	 * @param threshold the threshold to set
	 */
	public void setThreshold(int threshold) {
		this.threshold = threshold;
	}
}
