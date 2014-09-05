package conicet.apps.svt.util;

import java.text.DateFormatSymbols;
import java.util.Calendar;
import java.util.Date;

public class CDateUtil {
	
	public static Integer getDia(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_MONTH);
	}
	
	public static Integer getMes(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.MONTH);
	}
	
	public static String getMesNombre(Date date) {
		return new DateFormatSymbols().getMonths()[getMes(date)];
	}
	
	public static String getMesNombre(int mes) {
		return new DateFormatSymbols().getMonths()[mes-1];
	}
	
	public static Integer getAnio(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.YEAR);
	}

}
