package conicet.apps.svt.util.comparator;

import java.sql.Date;
import java.util.Comparator;

public class CFechaComparator implements Comparator<Date> {

	private final int orden;

	public CFechaComparator(int orden){
		this.orden = orden;
	}

	@Override
	public int compare(Date o1, Date o2) {
		int ordenReal = 0;
		if (this.orden == 1) {
			ordenReal = 1;
		} else {
			ordenReal = -1;
		}
		return o1.compareTo(o2) * ordenReal;
	}

}
