package hw1;

public class CountAtomicsVisitor implements MathVisitor<Integer> {
	int x=0;
	int y=0;
	int z=0;
	@Override
	public Integer visit(Op op) {
		
		return op.getFirst().accept(new CountAtomicsVisitor()) + op.getSecond().accept(new CountAtomicsVisitor());
		
	}

	@Override
	public Integer visit(Num num) {
		x++;
		return x;
	}

	@Override
	public Integer visit(Sym sym) {
		y++;
		return y;
	}

	@Override
	public Integer visit(Var var) {
		z++;
		return z;
	}

}
