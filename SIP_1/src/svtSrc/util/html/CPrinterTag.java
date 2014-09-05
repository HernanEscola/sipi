package conicet.apps.svt.util.html;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import conicet.framework.estructuras.C2Tupla;
import conicet.framework.web.COptionCombo;

public class CPrinterTag {
	private static String ROW = "tr";
	private static String COLUMN = "td";
	private static String TABLE = "table";
	private static String INPUT = "input";
	private static String SPAN = "span";
	private static String LABEL = "label";
	private static String LINK = "a";
	private static String OPTION = "option";

	public static String printTable(String[] filas,
			List<C2Tupla<String, String>> htmlOptions) {
		StringBuilder data = new StringBuilder();
		for (int i = 0; i < filas.length; i++) {
			data.append(filas[i]);
		}
		return CPrinterTag.printTag(CPrinterTag.TABLE, data.toString(), htmlOptions);
	}


	public static String printRow(String[] columnas,
			List<C2Tupla<String, String>> htmlOptions) {
		StringBuilder data = new StringBuilder();
		for (int i = 0; i < columnas.length; i++) {
			data.append(columnas[i]);
		}
		return CPrinterTag.printTag(CPrinterTag.ROW, data.toString(), htmlOptions);
	}

	public static String printColumn(String data,
			List<C2Tupla<String, String>> htmlOptions) {
		return CPrinterTag.printTag(CPrinterTag.COLUMN, data, htmlOptions);
	}

	public static String printSpan(String data,
			List<C2Tupla<String, String>> htmlOptions) {
		return CPrinterTag.printTag(CPrinterTag.SPAN, data, htmlOptions);
	}

	public static String printLink(String data, String link,
			List<C2Tupla<String, String>> htmlOptions) {
		htmlOptions.add(new C2Tupla<String,String>("href",link));
		return CPrinterTag.printTag(CPrinterTag.LINK, data, htmlOptions);
	}

	public static String printLabel(String data,
			List<C2Tupla<String, String>> htmlOptions) {
		return CPrinterTag.printTag(CPrinterTag.LABEL, data, htmlOptions);
	}

	private static String printTag(String tag, String data,
			List<C2Tupla<String, String>> htmlOptions) {
		StringBuilder options = getOptions(htmlOptions);
		StringBuilder row = new StringBuilder("");
		row.append("<").append(tag).append(options).append(" >").append(data)
				.append("</").append(tag).append(">");
		return row.toString();

	}

	private static StringBuilder getOptions(List<C2Tupla<String, String>> htmlOption) {
		StringBuilder options = new StringBuilder();
		if (htmlOption != null) {
			for (C2Tupla<String, String> option : htmlOption) {
				options.append(" ").append(option.getFirstObject()).append("=")
						.append("'").append(option.getSecondObject()).append(
								"'");
			}
		}
		return options;
	}

	public static String getInput(String data,String name,EInputType tipo,List<C2Tupla<String, String>> htmlOptions){
		if (htmlOptions == null) {
			htmlOptions = new ArrayList<C2Tupla<String,String>>();
		}
		htmlOptions.add(new C2Tupla<String,String>("type",tipo.value));
		htmlOptions.add(new C2Tupla<String,String>("name",name));
		htmlOptions.add(new C2Tupla<String,String>("value",data));
		return CPrinterTag.printTag(CPrinterTag.INPUT, "", htmlOptions);
	}

	public enum EInputType {
	    SUBMIT("submit"),
	    TEXT("text"),
	    HIDDEN("hidden");
	    private final String value;

	    EInputType(String id){
	        this.value = id;
	    }

	    public String id(){
	        return value;
	    }


	}

	public static String printOption(String label,
			List<C2Tupla<String, String>> htmlOptions) {
		return CPrinterTag.printTag(CPrinterTag.OPTION, label, htmlOptions);
	}


	public String printOptions(Collection<COptionCombo> combo) {
		StringBuilder sb = new StringBuilder();
		for (COptionCombo option : combo) {
			sb.append(this.printOption(option.getLabel(),Arrays.asList(new C2Tupla<String, String>("value", option.getValue()))));
		}
		return sb.toString();
	}
	
	public String printOptions(Collection<COptionCombo> combo,String selected) {
		StringBuilder sb = new StringBuilder();
		for (COptionCombo option : combo) {
			if (option.getValue().equalsIgnoreCase(selected)) {
				sb.append(this.printOption(option.getLabel(),Arrays.asList(new C2Tupla<String, String>("value", option.getValue()),new C2Tupla<String, String>("selected", ""))));
			}else {
				sb.append(this.printOption(option.getLabel(),Arrays.asList(new C2Tupla<String, String>("value", option.getValue()))));
			}
		}
		return sb.toString();
	}

}
