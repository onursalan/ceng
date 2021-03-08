package hw1;

public class XPlusXIs2XRule implements Rule{
	Var x;
	public XPlusXIs2XRule(Var x){
		this.x = x;
	}
	public Var getX() {
		return this.x;
	}
	@Override
	public void clear() {
		getX().setPreviousMatch(null);
	}
	@Override
	public boolean apply(MathExpression me) {
		clear();
		if(((Op) me).getOperand()=="+"&&((Op) me).getFirst().match(((Op)me).getSecond())) {
			x.setPreviousMatch(((Op) me).getFirst());
			
			return true;
		}
		else {
			clear();
			return false;
		}
	}
	@Override
	public MathExpression getPremise() {
		return new Op("+", getX(), getX());
	} 
	
	@Override
	public MathExpression getEntails() {
		return new Op("*", new Num(2), getX());
	}
	@Override
	public MathExpression entails(MathExpression me) {
		if(apply(me)) {
			apply(me);
		}
		return getEntails();
	}
}
