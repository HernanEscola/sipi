package conicet.apps.svt.util;

public class CDocumento extends
		conicet.framework.file.object.documento.CDocumento {

	public static String formatearDocumento(String documento){
		String doc = "";
		
		if (documento == null)
			return "";
		else {
			int cat = documento.length() % 3;

			if (documento.length() <= 3)
				return documento;
			else if (cat == 0) {
				cat = 3;
			}
			
			doc = documento.substring(0, cat);

			while (cat < documento.length()) {
				doc += "." + documento.substring(cat, cat + 3);
				cat += 3;
			}
			return doc;
		}
	}
}
