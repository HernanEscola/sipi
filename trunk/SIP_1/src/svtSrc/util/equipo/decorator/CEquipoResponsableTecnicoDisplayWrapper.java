package conicet.apps.svt.web.equipo.decorator;

import org.apache.poi.hssf.usermodel.HSSFSheet;

import conicet.apps.svt.object.equipoResponsableTecnico.CEquipoResponsableTecnico;
import conicet.apps.svt.util.CDocumento;
import conicet.apps.svt.web.util.decorator.CAgregableDisplayWrapper;

public class CEquipoResponsableTecnicoDisplayWrapper extends CAgregableDisplayWrapper{

	public CEquipoResponsableTecnicoDisplayWrapper() {
		super("ResponsableTecnico");
	}

	
	public String getNombre(){
		CEquipoResponsableTecnico r = (CEquipoResponsableTecnico) getCurrentRowObject();
		return r.getResponsable().getNombre();
	}
	
	public String getApellido(){
		CEquipoResponsableTecnico r = (CEquipoResponsableTecnico) getCurrentRowObject();
		return r.getResponsable().getApellido();
	}
	
	public String getDocumento(){
		CEquipoResponsableTecnico r = (CEquipoResponsableTecnico) getCurrentRowObject();
		return r.getResponsable().getDocumentoTipo() + " : " + CDocumento.formatearDocumento(r.getResponsable().getDocumentoNro());
	}
	
	@Override
	public void setSheet(HSSFSheet sheet) {
		// TODO Auto-generated method stub
		
	}
	

}
