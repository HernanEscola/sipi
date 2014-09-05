package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.contacto.CContactoContratante;
import conicet.apps.svt.rol.interfaces.IRolBase;
import conicet.apps.svt.struct.CContratanteContactoStruct;
import conicet.apps.svt.struct.busqueda.CContratanteBusquedaStruct;
import conicet.framework.error.CException;

public class CJsonResponseContactoByContratanteId extends CJsonResponse {
	
	private IRolBase rol;
	
	public CJsonResponseContactoByContratanteId(IRolBase rol) {
		this.rol = rol;
	}

	@Override
	public List find(HttpServletRequest request) throws CException {
		CContratanteBusquedaStruct cbs = new CContratanteBusquedaStruct();
		cbs.setCodigoBusqueda(request.getParameter("match"));
		List<CContratanteContactoStruct> resultadosStruct = rol.findContratanteContactoByCriterio(cbs);
		List<CContactoContratante> resultado = new ArrayList<CContactoContratante>();
		for (CContratanteContactoStruct ccs : resultadosStruct) {
			if (ccs.getContacto() != null) {
				resultado.add(ccs.getContacto());
			}
		}
		return resultado;
	}

	@Override
	protected JSONObject setear(Object o) {
		CContactoContratante contacto = (CContactoContratante) o;
		JSONObject json = new JSONObject();
		json.put("id", contacto.getId());
		json.put("descripcion", contacto.getApellido() + " " + contacto.getNombre());
		return json;
	}

}
