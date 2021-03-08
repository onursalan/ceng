package hw2;

public class StudyGroup {
	private String name;
	private Lab lab;
	
	StudyGroup(String name, Lab lab){
		this.name = name;
		this.lab = lab;
		
	}
	public String getName() {
		return name;
	}
	public Lab getLab() {
		return lab;
	}
	public synchronized void startStudyingWith() {
		while(getLab().getInsideLabCount() >= this.getLab().getCapacity() || (getLab().getInsideLabGroupName() != null && !(getLab().getInsideLabGroupName().equals(getName())) )) {
			
			try {
				wait();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(this.getLab().getInsideLabGroupName() == null) {
			getLab().setInsideLabGroupName(getName());
		}

		if(getLab().getInsideLabGroupName().equals(getName())) {
			getLab().setInsideLabCount(getLab().getInsideLabCount()+1);
		}
	}
	
	public synchronized void stopStudyingWith() {
		if(getLab().getInsideLabCount() == 1) {
			getLab().setInsideLabCount(getLab().getInsideLabCount()-1);
			getLab().setInsideLabGroupName(null);
			notifyAll();
		}
		else {
			if(getLab().getInsideLabCount() == getLab().getCapacity()) {
				getLab().setInsideLabCount(getLab().getInsideLabCount()-1);
				notify();
			}
			else {
				getLab().setInsideLabCount(getLab().getInsideLabCount()-1);
				notify();
			}
	
		}

	}
}
