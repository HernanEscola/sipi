package conicet.apps.svt.web.equipo.decorator;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;

import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.object.equipoHorario.CEquipoHorario;
import conicet.apps.svt.object.equipoHorario.EDiaSemana;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.apps.svt.web.equipo.form.CEquipoForm;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.apps.svt.web.util.decorator.CAgregableDisplayWrapper;
import conicet.framework.web.COptionCombo;

public class CEquipoWrapper {

	public static  Collection getComboDiasSemana() {
		return CGlobalWrapper.getComboByIdentityDesc(EDiaSemana.values());
	}
	
	public static Collection getComboHora(){
		Collection colCombo = CGlobalWrapper.getComboSeleccionar();
		colCombo.add(new COptionCombo("00:00","00:00"));colCombo.add(new COptionCombo("00:30","00:30"));
		colCombo.add(new COptionCombo("01:00","01:00"));colCombo.add(new COptionCombo("01:30","01:30"));
		colCombo.add(new COptionCombo("02:00","02:00"));colCombo.add(new COptionCombo("02:30","02:30"));
		colCombo.add(new COptionCombo("03:00","03:00"));colCombo.add(new COptionCombo("03:30","03:30"));
		colCombo.add(new COptionCombo("04:00","04:00"));colCombo.add(new COptionCombo("04:30","04:30"));
		colCombo.add(new COptionCombo("05:00","05:00"));colCombo.add(new COptionCombo("05:30","05:30"));
		colCombo.add(new COptionCombo("06:00","06:00"));colCombo.add(new COptionCombo("06:30","06:30"));
		colCombo.add(new COptionCombo("07:00","07:00"));colCombo.add(new COptionCombo("07:30","07:30"));
		colCombo.add(new COptionCombo("08:00","08:00"));colCombo.add(new COptionCombo("08:30","08:30"));
		colCombo.add(new COptionCombo("09:00","09:00"));colCombo.add(new COptionCombo("09:30","09:30"));
		colCombo.add(new COptionCombo("10:00","10:00"));colCombo.add(new COptionCombo("10:30","10:30"));
		colCombo.add(new COptionCombo("11:00","11:00"));colCombo.add(new COptionCombo("11:30","11:30"));
		colCombo.add(new COptionCombo("12:00","12:00"));colCombo.add(new COptionCombo("12:30","12:30"));
		colCombo.add(new COptionCombo("13:00","13:00"));colCombo.add(new COptionCombo("13:30","13:30"));
		colCombo.add(new COptionCombo("14:00","14:00"));colCombo.add(new COptionCombo("14:30","14:30"));
		colCombo.add(new COptionCombo("15:00","15:00"));colCombo.add(new COptionCombo("15:30","15:30"));
		colCombo.add(new COptionCombo("16:00","16:00"));colCombo.add(new COptionCombo("16:30","16:30"));
		colCombo.add(new COptionCombo("17:00","17:00"));colCombo.add(new COptionCombo("17:30","17:30"));
		colCombo.add(new COptionCombo("18:00","18:00"));colCombo.add(new COptionCombo("18:30","18:30"));
		colCombo.add(new COptionCombo("19:00","19:00"));colCombo.add(new COptionCombo("19:30","19:30"));
		colCombo.add(new COptionCombo("20:00","20:00"));colCombo.add(new COptionCombo("20:30","20:30"));
		colCombo.add(new COptionCombo("21:00","21:00"));colCombo.add(new COptionCombo("21:30","21:30"));
		colCombo.add(new COptionCombo("22:00","22:00"));colCombo.add(new COptionCombo("22:30","22:30"));
		colCombo.add(new COptionCombo("23:00","23:00"));colCombo.add(new COptionCombo("23:30","23:30"));

		
		return colCombo;
	}
	
	
	public static  List<CEquipoHorario> ordenarByAlfabeto(Collection<CEquipoHorario> col ){

		List<CEquipoHorario> list = new LinkedList<CEquipoHorario>();
		list.addAll(col);
		Collections.sort(list, new Comparator<CEquipoHorario>() {
			@Override
			public int compare(CEquipoHorario o1, CEquipoHorario o2) {
				String ord1 = o1.getDiaSemana().getId()+o1.getHoraDesde();
				String ord2 = o2.getDiaSemana().getId()+o2.getHoraDesde();
				int ret = ord1.compareToIgnoreCase(ord2);
				if (ret == 0) {
				}
				return ret;
			}
		});
		return list;
	}
		

	
}
