package util;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class FechaUtil {

	public static Date getSqlDateFromString(String s) {
		s = s.replace("-", "/");
		DateFormat formater = new SimpleDateFormat("dd/MM/yyyy");
		try {
			java.util.Date parsedUtilDate = formater.parse(s);
			java.sql.Date sqltDate = new java.sql.Date(parsedUtilDate.getTime());
			return sqltDate;
		} catch (Exception e) {
			return null;
		}
	}
	
	public static String getStringFromSqlDate(Date d) {
		DateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
		try {
			return formater.format(d);
		} catch (Exception e) {
			return null;
		}
	}
	public static String getStringFromDate(java.util.Date d) {
		DateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
		try {
			return formater.format(d);
		} catch (Exception e) {
			return null;
		}
	}

	public static Date getHoy() {
		return new Date(Calendar.getInstance().getTimeInMillis());
	}

	public static Date agregarDias(Date fecha, int i) {
		Calendar c = Calendar.getInstance();
		c.setTime(fecha);
		c.add(Calendar.DAY_OF_MONTH, i);
		return new Date(c.getTimeInMillis());
	}
}
