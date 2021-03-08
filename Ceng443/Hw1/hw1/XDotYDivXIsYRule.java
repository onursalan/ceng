package hw1;

public class XDotYDivXIsYRule implements Rule{
	Var x;
	Var y;
	public XDotYDivXIsYRule(Var x, Var y){
		this.x = x;
		this.y = y;
	}
	public Var getX() {
		return this.x;
	}
	public Var getY() {
		return this.y;
	}
	@Override
	public void clear() {
		getX().setPreviousMatch(null);
		getY().setPreviousMatch(null);
	}
	@Override
	public boolean apply(MathExpression me) {
		clear();
		if(((Op)me).getOperand()=="/"&& (((Op)((Op)me).getFirst())).getOperand() == "*" && (((Op)((Op)me).getFirst())).getFirst().match(((Op)me).getSecond())){
			x.setPreviousMatch((((Op)((Op)me).getFirst())).getFirst());
			y.setPreviousMatch((((Op)((Op)me).getFirst())).getSecond());
			return true;
		}
		else {
			clear();
			return false;
		}
	}
	@Override
	public MathExpression getPremise() {
		return new Op("/",(new Op("*", getX(), getY())),getX());
	}
	@Override
	public MathExpression getEntails() {
		return y;
	}
	@Override
	public MathExpression entails(MathExpression me) {
		if(apply(me)) {
			apply(me);
		}
		return getEntails();
	}
	
}
