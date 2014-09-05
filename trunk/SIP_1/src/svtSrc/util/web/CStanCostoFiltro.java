package conicet.apps.svt.util.web;

import conicet.apps.svt.object.stanCosto.CStanCosto;

public class CStanCostoFiltro implements IFiltrable<CStanCosto> {

	@Override
	public boolean filtrar(CStanCosto t) {
		// TODO Auto-generated method stub
		if (!t.getEstado().equalsIgnoreCase("I")){
			return false;
		}
		
		return true;
	}

	
	
}
