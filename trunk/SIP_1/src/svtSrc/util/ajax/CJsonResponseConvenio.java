package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.struct.busqueda.CInstrumentoBusquedaStruct;
import conicet.framework.error.CException;

public class CJsonResponseConvenio extends CJsonResponse {

	
	CInstrumentoBusquedaStruct bs;
	@Override
	public List find(HttpServletRequest request) throws CException {
		
		if (this.bs == null){
			CInstrumentoBusquedaStruct bs =  new CInstrumentoBusquedaStruct();
			bs.setContratanteId(new Long(request.getParameter("match")));
			
			this.bs = bs;
		}
		List<CInstrumento> lc = new ArrayList<CInstrumento>(CInstrumentoService.findInstrumentoByCriterio(bs));
		return lc;
	}
	
	protected JSONObject setear(Object o) {
		JSONObject json = new JSONObject();
		
		CInstrumento i = (CInstrumento)o;
		String ob="";
		String re="";
		if (i.getObjeto()!=null){
			ob=i.getObjeto();
		}
		if (ob.length()>20){
			ob= ob.substring(0,20);
		}
			
		if (i.getResponsable()!=null ){
			re = i.getResponsable().getLastName()+ ","+i.getResponsable().getFirstName();
		}		

		json.put("id", i.getId().toString());
		if (i.getNumeroTramite() != null) {
			json.put("nroTramite", i.getNumeroTramite().toString());
		} else {
			json.put("nroTramite", "");
		}
		
		json.put("anio", i.getAño());
		json.put("objeto", ob);
		json.put("responsable", re );
		
		if (i.getEstado() != null) {
			json.put("estado", i.getEstado().getDescripcion());
		} else {
			json.put("estado", "");
		}
		
		return json;
	}
	
	public CJsonResponseConvenio(CInstrumentoBusquedaStruct bs) {
		this.bs = bs;
	}
	public CJsonResponseConvenio() {
		
	}

	
}