package hw1;

public class Num implements MathExpression{
	private int value;
	public Num(int value) {
		this.value = value;
	}
	public int getValue() {
		return this.value;
	}
	@Override
	public <T> T accept(MathVisitor<T> visitor) {
		return visitor.visit(this);
	}
	@Override
	public boolean match(MathExpression me) {
		// TODO Auto-generated method stub
		return (me instanceof Num) && this.value == ((Num)me).getValue();
	}
}
