package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CPersonaSVT;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.util.CDocumento;
import conicet.framework.util.cuit.CCuit;

public class CAutoCompletePersona extends CAutoComplete {

	@Override
	protected Collection find(HttpServletRequest request) throws Exception {

		String busqueda = request.getParameter("match");
		if(!StringUtils.isNumeric(busqueda))
		{
			CPersonaSVT persona = new CPersonaSVT();
			persona.setApellido(busqueda);
			return new ArrayList<CPersonaSVT>(CEntidadService.findPersonasLikeApellido(persona));
		}else{
				// busco por doc y le sumo la busqueda de cuit
			return new ArrayList<CPersonaSVT>(CEntidadService.findPersonaSVTLikeDocumento(busqueda));
		}

	}

	@Override
	protected JSONObject setear(Object o) {
		CPersonaSVT c = (CPersonaSVT)o;

		JSONObject json = new JSONObject();
		String doc = ""
			;
		if(StringUtils.isNotEmpty(c.getCuit())) {
			doc+= " // Cuit/Cuil:"+CCuit.stringSinGuionesToStringConGuiones(c.getCuit());
		} else {
			doc+= " // Nro. Doc: "+c.getDocumentoNro();
		}

		json.put("nombre", c.getApellido()+", "+c.getNombre());
		json.put("doc", CDocumento.formatearDocumento(c.getDocumentoNro()));
		json.put("tipoDoc", c.getDocumentoTipo());
		json.put("cuit", c.getCuit()!=null? CCuit.stringSinGuionesToStringConGuiones(c.getCuit()):"");

		json.put("categoria", c.getCategoria()!=null? c.getCategoria().getDescripcion():"");
		json.put("escalafon", c.getEscalafon()!=null? c.getEscalafon().getDescripcion():"");
		json.put("id", c.getId().toString());
		return json;
	}

}
