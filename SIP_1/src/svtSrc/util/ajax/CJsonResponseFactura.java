package conicet.apps.svt.util.ajax;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import conicet.apps.siuvt.object.factura.CFactura;
import conicet.apps.siuvt.service.CIngresoService;
import conicet.apps.svt.struct.busqueda.CFacturaBusquedaStruct;
import conicet.framework.error.CException;
import conicet.framework.util.UFecha;

public class CJsonResponseFactura extends CJsonResponse {

	
	CFacturaBusquedaStruct fbs;
	@Override
	public List find(HttpServletRequest request) throws CException {
		
		if (this.fbs== null){
			CFacturaBusquedaStruct fbs =  new CFacturaBusquedaStruct();
			fbs.setContratanteId(new Long(request.getParameter("match")));
			fbs.setFiltrarSaldoInicio("S");
			this.fbs= fbs;
		}
		List<CFactura> lc = new ArrayList<CFactura>(CIngresoService.findFacturaByCriterio(fbs));
		return lc;
	}
	
	protected JSONObject setear(Object o) {
		CFactura f = (CFactura)o;

		JSONObject json = new JSONObject();
		String doc = "";

		if (f.getFacturaFecha()!=null){
			doc =UFecha.dateToStringConGuion(f.getFacturaFecha());
		}
		json.put("id", f.getId().toString());
		json.put("fecha", doc);
		json.put("nroFactura", f.getFacturaTipoYNumeroByDisplay());
		json.put("tipoServicio", f.getTipoServicio().getDescripcion());
		json.put("prestador", f.getPrestador().getDescripcion());
		json.put("contratante", f.getContratante().getDescripcion());
		json.put("importe", f.getImporte().setScale(2, BigDecimal.ROUND_HALF_EVEN).toString());
		return json;
	}
	
	public CJsonResponseFactura(CFacturaBusquedaStruct fbs) {
		this.fbs = fbs;
	}
	public CJsonResponseFactura() {
		
	}

	
}