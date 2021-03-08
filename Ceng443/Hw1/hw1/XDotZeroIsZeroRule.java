package hw1;

public class XDotZeroIsZeroRule implements Rule{
	Var x;
	public XDotZeroIsZeroRule(Var x){
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
		if(((Op)me).getOperand()=="*"&&((Op)me).getSecond().match(new Num(0))){
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
		return new Op("*", getX(), new Num(0));
	}
	@Override
	public MathExpression getEntails() {
		return new Num(0);
	}
	@Override
	public MathExpression entails(MathExpression me) {
		if(apply(me)) {
			apply(me);
		}
		return getEntails();
	}
}
