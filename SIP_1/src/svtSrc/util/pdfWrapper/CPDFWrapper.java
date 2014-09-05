package conicet.apps.svt.util.pdfWrapper;

import java.math.BigDecimal;
import java.sql.Date;

import org.apache.commons.lang.StringEscapeUtils;

import conicet.framework.util.fecha.CFecha;

public class CPDFWrapper {

	//crea el tag de apertura y cierre segun "tag", con el contenido de "value", y lo concatena en "b".
	protected static StringBuffer tag(String tag, String value, StringBuffer b) {
		if (value == null)
			value = "";

		b.append("<" + tag + ">" + StringEscapeUtils.escapeXml(value) + "</" + tag + ">");

		return b;
	}
	
	//sobrecarga para BigDecimal
	protected static StringBuffer tag(String tag, BigDecimal num, StringBuffer b) {
		String numero = getStringImporte(num);
		return tag(tag,numero, b);
	}
	
	protected static StringBuffer tag(String tag, StringBuffer b) {
		return tag(tag,"", b);
	}
	
	//sobrecarga para Fechas
	protected static StringBuffer tag(String tag, Date date, StringBuffer b) {
		String fecha = getStringFecha(date);
		return tag(tag,fecha, b);
	}
	
	//sobrecarga para Enteros
	protected static StringBuffer tag(String tag, Integer entero, StringBuffer b) {
		return tag(tag,entero.toString(), b);
	}
	
	protected static String getStringFecha(Date s) {
		if (s == null) {
			return "";
		}
		return CFecha.formatFechaDDMMAAConGuion(s);
	}

	protected static String getStringImporte(BigDecimal imp) {
		String s = "";
		if (imp != null) {
			s = imp.setScale(2, BigDecimal.ROUND_HALF_EVEN).toString();
		} else {
			s = "0,00";
		}
		return StringEscapeUtils.escapeXml(s);
	}
}
