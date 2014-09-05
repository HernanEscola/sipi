package conicet.apps.svt.util.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.asesoria.CAsesoria;
import conicet.apps.svt.service.CAsesoriaService;
import conicet.apps.svt.struct.busqueda.CAsesoriaBusquedaStruct;
import conicet.apps.svt.web.asesoria.decorator.CAsesoriaDisplayWrapper;
import conicet.framework.error.CException;

public class CJsonResponseAsesoria extends CJsonResponse {
	
	private Long contratanteId;
	
	public CJsonResponseAsesoria(Long contratanteId) {
		this.contratanteId = contratanteId;
	}

	@Override
	public List find(HttpServletRequest request) throws CException {		
		CAsesoriaBusquedaStruct asesoriaStruct = new CAsesoriaBusquedaStruct();
		asesoriaStruct.setContratanteId(this.contratanteId);
		return CAsesoriaService.findAsesoriaByCriterio(asesoriaStruct);
	}

	@Override
	protected JSONObject setear(Object o) {
		CAsesoria asesoria = (CAsesoria) o;

		JSONObject json = new JSONObject();

		json.put("id", asesoria.getId());
		
		json.put("numeroYAnioExpediente", CAsesoriaDisplayWrapper.getNumeroYAnioExpediente(asesoria));
		json.put("nroAsesoriayAnioPresentacion", CAsesoriaDisplayWrapper.getNroAsesoriayAnioPresentacion(asesoria));
		json.put("descripcionAsesores", CAsesoriaDisplayWrapper.getDescripcionAsesores(asesoria));
		json.put("resolucionNroTipoAnio", CAsesoriaDisplayWrapper.getResolucionNroTipoAnio(asesoria));
		json.put("descripcionUvt", CAsesoriaDisplayWrapper.getDescripcionUvt(asesoria));
		json.put("montoTotal", CAsesoriaDisplayWrapper.getMontoTotal(asesoria));
		return json;
	}

}
