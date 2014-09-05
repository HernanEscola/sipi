package conicet.apps.svt.util.comparator;

import java.util.Comparator;

public class CIntegerComparator implements Comparator<String> {

	@Override
	public int compare(String o1, String o2) {
		Integer int1 = new Integer(o1);
		Integer int2 = new Integer(o2);
		return int1.compareTo(int2);
	}

}
