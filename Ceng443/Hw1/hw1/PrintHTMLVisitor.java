package hw1;

public class PrintHTMLVisitor implements TextVisitor<String> {

	@Override
	public String visit(Document document) {
		String str1 = "<html><head><title>";
		String str2 = "</title></head><body>";
		String str3 = "</body></html>";
		String str4 = "";
		for(int i = 0;i < document.getElements().size();i++) {
			str4 = str4 + document.getElements().get(i).accept(new PrintHTMLVisitor());
		}
		return str1 + document.getTitle() + str2 + str4 + str3;
	}

	@Override
	public String visit(EquationText equationText) {
		return "<math>" + equationText.getInnerMath().accept(new PrintMathMLVisitor()) + "</math>";
	}

	@Override
	public String visit(Paragraph paragraph) {
		return "<p>" + paragraph.getText() + "</p>";
	}

}
