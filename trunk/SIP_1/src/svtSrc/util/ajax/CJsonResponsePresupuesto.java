package conicet.apps.svt.util.ajax;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.svt.object.tipoEstadoPresupuesto.CTipoEstadoPresupuesto;
import conicet.apps.svt.service.CContratacionService;
import conicet.apps.svt.struct.busqueda.CPresupuestoBusquedaStruct;
import conicet.framework.error.CException;


public class CJsonResponsePresupuesto extends CJsonResponse {

	
	CPresupuestoBusquedaStruct bs;
	@Override
	public List find(HttpServletRequest request) throws CException {
		if (this.bs == null) {
			this.bs = new CPresupuestoBusquedaStruct();
			this.bs.setContratanteId(new Long(request.getParameter("match")));	
		}
		List<CPresupuestoBusquedaStruct> lc = new ArrayList<CPresupuestoBusquedaStruct>(CContratacionService.findPresupuestoByCriterio(bs));
		return lc;
	}
	
	protected JSONObject setear(Object o) {
		CPresupuestoBusquedaStruct pbs = (CPresupuestoBusquedaStruct)o;
		
		String oc="";
		CTipoEstadoPresupuesto estado = pbs.getPresupuesto().getUltimoPresupuestoEstado().getTipoEstadoPresupuesto();
		if (!estado.isBorrador() && !estado.isPresentado() && !estado.isRechazado() && pbs.getCodigoOrdenFacturacion() != null) {
				oc= pbs.getCodigoOrdenFacturacion().toString();
		}
		
		String descripcionEstado = pbs.getPresupuesto().getUltimoPresupuestoEstado().getTipoEstadoPresupuesto().getDescripcion();
		if (null == descripcionEstado) {
			descripcionEstado = this.getEstadoDescripcionByEstadoId(pbs.getPresupuesto().getUltimoPresupuestoEstado().getTipoEstadoPresupuesto().getId());
		}
		JSONObject json = new JSONObject();
		json.put("id", pbs.getPresupuesto().getId().toString());
		json.put("nroPpto", pbs.getPresupuesto().getNumero().toString());
		json.put("ordenFacturacion", oc);
		json.put("prestador", pbs.getPrestadorDescripcion());
		json.put("estado", descripcionEstado);
		json.put("importe", pbs.getPrecioPresupuesto().setScale(2, BigDecimal.ROUND_HALF_EVEN).toString());
		return json;
	}
	
	public CJsonResponsePresupuesto(CPresupuestoBusquedaStruct bs) {
		this.bs=bs;
	}
	public CJsonResponsePresupuesto() {
		
	}

	private String getEstadoDescripcionByEstadoId(Integer id) {
		switch (id) {
		case 1:
			return "Aceptado";
		case 2:
			return "Contratado";
		case 3:
			return "Borrador";
		case 4:
			return "Eliminado";
		case 5:
			return "Presentado";
		case 6:
			return "Deshabilitado";
		case 7:
			return "Rechazado";
		default:
			return "---";
		}
	}

}