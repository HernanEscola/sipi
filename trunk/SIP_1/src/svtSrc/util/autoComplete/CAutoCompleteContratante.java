package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

import conicet.apps.svt.object.contratante.CContratante;
import conicet.apps.svt.object.contratante.CContratanteCF;
import conicet.apps.svt.object.contratante.CContratanteOtro;
import conicet.apps.svt.service.CContratanteService;
import conicet.apps.svt.struct.busqueda.CContratanteBusquedaStruct;
import conicet.framework.error.CException;

public class CAutoCompleteContratante extends CAutoComplete {

	protected CContratanteBusquedaStruct contratanteBuscar;

	@Override
	protected Collection find(HttpServletRequest request) throws CException{
		CContratanteBusquedaStruct contratanteBuscar = this.contratanteBuscar!= null? this.contratanteBuscar: new CContratanteBusquedaStruct();
		contratanteBuscar.setDescripcionBusqueda(request.getParameter("match"));
		contratanteBuscar.setEstadoContratante("N");   // solo se pueden seleccionar los activos
		return new ArrayList<CContratante>(CContratanteService.findContratanteByCriterio(contratanteBuscar));
	}

	@Override
	protected JSONObject setear(Object o) {
		CContratante c = (CContratante)o;

		JSONObject json = new JSONObject();
		json.put("nombre", c.getDescripcion());

		if(!c.esConsumidorFinal()){
			CContratanteOtro otro = (CContratanteOtro) c;
			if(StringUtils.isNotEmpty(otro.getNombreFantasia())) {
				json.put("nombreFantasia", otro.getNombreFantasia());
			}

			if(StringUtils.isNotEmpty(otro.getCuitCentral())) {
				json.put("cuit", otro.getCuitCentral());
			}
		}else{
			CContratanteCF cf = (CContratanteCF) c;
			if(StringUtils.isNotEmpty(cf.getDocumento())) {
				json.put("documento",cf.getDocumento());
			}

		}
		json.put("id", c.getId().toString());
		return json;
	}

	public CAutoCompleteContratante(CContratanteBusquedaStruct contratanteBuscar) {
		this.contratanteBuscar = contratanteBuscar;
	}

	public CAutoCompleteContratante(){

	}

}
