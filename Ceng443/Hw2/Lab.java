package hw2;

public class Lab {
	private String name;
	private int capacity;
	private String insideLabGroupName = null;
	private int insideLabCount = 0;

	public String getInsideLabGroupName() {
		return insideLabGroupName;
	}

	public void setInsideLabGroupName(String insideLabGroupName) {
		this.insideLabGroupName = insideLabGroupName;
	}

	public int getInsideLabCount() {
		return insideLabCount;
	}

	public void setInsideLabCount(int insideLabCount) {
		this.insideLabCount = insideLabCount;
	}

	public Lab(String name, int capacity){
		this.name = name;
		this.capacity = capacity;
	}
	
	public int getCapacity() {
		return this.capacity;
	}

	public String getName() {
		return this.name;
	}
	
}
