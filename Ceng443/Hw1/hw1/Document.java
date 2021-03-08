package hw1;
import java.util.*;
public class Document implements DocElement{
	String title;
	ArrayList<DocElement> list = new ArrayList<DocElement>();
	public Document(String title) {
		this.title = title;
	}
	void setTitle(String title) {
		this.title = title;
	}
	String getTitle() {
		return this.title;
	}
	public ArrayList<DocElement> getElements(){
		return this.list;
	}
	public void setElements(ArrayList<DocElement> arr) {
		list = arr;
	}
	public void add(DocElement de) {
		list.add(de);
	}
	@Override
	public <T> T accept(TextVisitor<T> visitor) {
		return visitor.visit(this);
	}
	
}
