package util;

public class StringUtils {

	public static boolean isEmpty(String a){
		if( a == null || a.isEmpty()){
			return true;
		}
		return false;
	}
}
