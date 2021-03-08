package hw1;

public class PrintMathMLVisitor implements MathVisitor<String> {

	@Override
	public String visit(Op op) {
		
		if(op.getOperand() == "*") {
			return "<mrow><mo>(</mo>" + op.getFirst().accept(new PrintMathMLVisitor()) + "<mo>&times;</mo>" + op.getSecond().accept(new PrintMathMLVisitor()) + "<mo>)</mo></mrow>";
		}
		else if(op.getOperand() == "+"){
			return "<mrow><mo>(</mo>" + op.getFirst().accept(new PrintMathMLVisitor()) + "<mo>+</mo>" + op.getSecond().accept(new PrintMathMLVisitor()) + "<mo>)</mo></mrow>";
		}
		else if(op.getOperand() == "|-"){
			return "<mrow><mo>(</mo>" + op.getFirst().accept(new PrintMathMLVisitor()) + "<mo>&vdash;</mo>" + op.getSecond().accept(new PrintMathMLVisitor()) + "<mo>)</mo></mrow>";
		}
		else if(op.getOperand() == "/") {
			return "<mrow><mfrac>" + op.getFirst().accept(new PrintMathMLVisitor()) + "" + op.getSecond().accept(new PrintMathMLVisitor()) + "</mfrac></mrow>";
		}
		else{
			return "<mrow><mo>(</mo>" + op.getFirst().accept(new PrintMathMLVisitor()) + "<mo>-</mo>" + op.getSecond().accept(new PrintMathMLVisitor()) + "<mo>)</mo></mrow>";
		}
		
	}

	@Override
	public String visit(Num num) {
		return "<mrow><mn>" + num.getValue() + "</mn></mrow>";
	}

	@Override
	public String visit(Sym sym) {
		return "<mrow><mi>" +  sym.getValue() + "</mi></mrow>";
	}

	@Override
	public String visit(Var var) {
		if(var.getPreviousMatch() == null) {
			
			return "<mrow><msub><mi>V</mi><mn>" + var.getId() + "</mn></msub></mrow>";
		}
		else{
			return "<mrow><msub><mi>V</mi><mn>"+ var.getId() + "</mn></msub><mo>[</mo>" + var.getPreviousMatch().accept(new PrintMathMLVisitor()) +"<mo>]</mo></mrow>";
		}
	}

}
