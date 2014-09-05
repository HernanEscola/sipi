package conicet.apps.svt.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class CProperty {	
	private static Properties props;
	
	public static String getProperty(String key) {
		return getProps().getProperty(key);
	}
	
	public static String getProperty(String key, String defaultValue) {
		String returnValue = getProps().getProperty(key);
		if (returnValue == null) {
			returnValue = defaultValue;
		}
		return returnValue;
	}
	
	private static Properties getProps() {
		if (props == null) {
			init();
		}
		return props;
	}
	
	private static void init() {
		props = new Properties();
//		InputStream is = CProperty.class.getResourceAsStream(new CProperty().getClass().getClassLoader().getResource("/app.properties").getPath());
		InputStream is = CProperty.class.getResourceAsStream("/app.properties");
		try {
			props.load(is);
//			props.load(new FileInputStream(new CProperty().getClass().getClassLoader().getResource("/app.properties").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}
	

}
