package hw1;

public class Op implements MathExpression{
	private MathExpression first;
	private MathExpression second;
	private String operand;
	public Op(String operand,MathExpression first,MathExpression second) {
		this.operand = operand;
		this.first = first;
		this.second = second;
	}
	public String getOperand() {
		return this.operand;
	}
	public MathExpression getFirst() {
		return this.first;
	}
	public MathExpression getSecond() {
		return this.second;
	}
	@Override
	public <T> T accept(MathVisitor<T> visitor) {
		return visitor.visit(this);
	}
	@Override
	public boolean match(MathExpression me) {
		
		return (me instanceof Op) && (this.operand == ((Op)me).getOperand()) && this.first.match(((Op)me).getFirst()) && this.second.match(((Op)me).getSecond()) ;
	}
}