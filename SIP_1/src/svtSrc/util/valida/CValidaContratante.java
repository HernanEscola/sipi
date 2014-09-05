package conicet.apps.svt.util.valida;

import java.util.Collection;
import java.util.List;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

import conicet.apps.siuvt.object.factura.CFactura;
import conicet.apps.siuvt.service.CIngresoService;
import conicet.apps.svt.object.contratante.CContratante;
import conicet.apps.svt.object.contratante.CContratanteOtro;
import conicet.apps.svt.service.CAsesoriaService;
import conicet.apps.svt.service.CContratacionService;
import conicet.apps.svt.service.CContratanteService;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.struct.busqueda.CAsesoriaBusquedaStruct;
import conicet.apps.svt.struct.busqueda.CFacturaBusquedaStruct;
import conicet.apps.svt.struct.busqueda.CInstrumentoBusquedaStruct;
import conicet.apps.svt.struct.busqueda.CPresupuestoBusquedaStruct;
import conicet.framework.error.CException;

public class CValidaContratante {
	  public CValidaContratante() {
	  }


		public static boolean validarELiminableByDV(ActionErrors errors,CContratante contratante) {
			// como DV elimina el contratante debe:
			// validar que el contratante no se encuentre en un presupuesto o contratación o asesoria o convenio

			try {



				// ANTES VALIDABA QUE EL CONTACTO NO TENGA PRESUPUESTOS ACTIVOS Y VIGENTES RELACIONADOS, ADEMAS FACTURAS
			//AHORA CONTROLA QUE EL CONTRATANTE NO TENGA PRESUP. FACT, ASES, CONVE, EN ESTADO N (SOLO SI ESTAN ELIMINADOS PERMITIRÁ
			//ELIMINAR al contratante
			// validar que el contratante no se encuentre en un presupuesto o contratación en curso
			CPresupuestoBusquedaStruct pbs = new CPresupuestoBusquedaStruct();
			pbs.setContratanteId(contratante.getId());
			Collection presupuestos;

				presupuestos = CContratacionService.findPresupuestoByCriterio(pbs);
			if (presupuestos!=null && presupuestos.size()>0){
					errors.add("eliminarContratante",new ActionMessage("errors.dynamic",
						"El Contratante no se puede eliminar porque se encuentra seleccionado en uno o más Presupuestos"));

					return false;
			}

			CFacturaBusquedaStruct f = new CFacturaBusquedaStruct();
			f.setContratante(contratante);
			Collection<CFactura> facturas = CIngresoService.findFacturaByCriterio(f);
			if (facturas.size()>0){
					errors.add("eliminarContratante",new ActionMessage(	"errors.dynamic","El Contratante no se puede eliminar porque se encuentra seleccionado en una o más Facturas"));

					return false;
			}
			CAsesoriaBusquedaStruct a =new CAsesoriaBusquedaStruct();
			a.setContratanteId(contratante.getId());
			Collection asesorias= CAsesoriaService.findAsesoriaByCriterio(a);
			if (asesorias !=null && asesorias.size()>0){
				errors.add("eliminarContratante",new ActionMessage(	"errors.dynamic","El Contratante no se puede eliminar porque se encuentra seleccionado en una o más Asesorías"));

				return false;
			}
			CInstrumentoBusquedaStruct i =new CInstrumentoBusquedaStruct();
			i.setContratanteId(contratante.getId());
			Collection convenios= CInstrumentoService.findInstrumentoByCriterio(i);
			if (convenios !=null && convenios.size()>0){
				errors.add("eliminarContratante",new ActionMessage(	"errors.dynamic","El Contratante no se puede eliminar porque se encuentra seleccionado en uno o más Convenios"));

				return false;
			}

			// validar que el contratante no posea sucursales
			if (!contratante.esConsumidorFinal() && ((CContratanteOtro)contratante).getSucursal().equalsIgnoreCase("N")) {
				List<CContratante> sucursales = (List<CContratante>) CContratanteService.findSucursalesByCentral(contratante);
				if (sucursales.size()>0){
					errors.add("eliminarContratante",new ActionMessage("errors.dynamic",
								"El Contratante no se puede eliminar porque posee sucursales asociadas"));
						return false;
				}
			}


			} catch (CException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			return true;

}


public static boolean validarHabilitable(ActionErrors errors,CContratante contratante){
try{
	//los consumidores finales se pueden habilitar o deshabilitar
	if (contratante.esConsumidorFinal())
	{
		return true;
	}

	//si esta habilitado y quiere deshabilitarlo, sus sucursales deben estar deshabilitadas
	if (contratante.getEstado().equalsIgnoreCase("N")){
		List<CContratante> sucursales = (List<CContratante>) CContratanteService.findSucursalesByCentral(contratante);
		for (CContratante cContratante : sucursales) {
			if (cContratante.getEstado().equalsIgnoreCase("N")){
				errors.add("deshabilitarContratante",new ActionMessage("errors.dynamic",
						"El Contratante no se puede deshabilitar porque posee sucursales habilitadas"));
				return false;
			}
		}
	}else{
	//Si es sucursal, y si esta deshabilitado, solo podrá si su central está habilitada
		if (	((CContratanteOtro)contratante).getCentral()!=null && !((CContratanteOtro)contratante).getCentral().getEstado().equalsIgnoreCase("N") ) {
			errors.add("habilitarContratante",new ActionMessage("errors.dynamic",
					"El Contratante no se puede habilitar porque su central esta deshabilitada"));
			return false;
		}
	}

} catch (CException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

	return true;
}

}