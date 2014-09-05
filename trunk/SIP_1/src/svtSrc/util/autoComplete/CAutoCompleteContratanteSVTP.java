package conicet.apps.svt.util.autoComplete;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.struct.busqueda.CContratanteBusquedaStruct;
import conicet.framework.error.CException;

public class CAutoCompleteContratanteSVTP extends CAutoCompleteContratante {
	
	private Collection<CEntidad> entidades;
	
	public CAutoCompleteContratanteSVTP(Collection<CEntidad> entidades) {
		this.entidades = entidades;
		this.contratanteBuscar = new CContratanteBusquedaStruct();
	}

	@Override
	protected Collection find(HttpServletRequest request) throws CException {
		this.contratanteBuscar.setEntidades(this.entidades);
		return super.find(request);
	}

}
