package conicet.apps.svt.util.comparator;

import java.util.Comparator;

import org.apache.commons.lang.StringUtils;

public class CNumeroYAnioComparator implements Comparator<String> {

	@Override
	public int compare(String o1, String o2) {
		String[] numeroAnio1 = StringUtils.split(o1, "/");
		String[] numeroAnio2 = StringUtils.split(o2, "/");

		if (numeroAnio1.length > 0 && numeroAnio2.length > 0){
			Integer numero1 = Integer.parseInt(numeroAnio1[0]);
			Integer numero2 = Integer.parseInt(numeroAnio2[0]);
			Integer anio1 = Integer.parseInt(numeroAnio1[1]);
			Integer anio2 = Integer.parseInt(numeroAnio2[1]);
			if (anio2.compareTo(anio1)==0){
				return numero2.compareTo(numero1);
			}
			return anio2.compareTo(anio1);
		} else if (numeroAnio1.length == 0) {
			if (numeroAnio2.length == 0) {
				return 0; //esta condición se agrega porque sino arroja una excepción de que se está violando el contrato
			}
			return 1;
		} else if (numeroAnio2.length == 0) {
			return -1;
		}
		return 0;
	}

}
