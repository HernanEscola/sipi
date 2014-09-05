package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;
import conicet.apps.svt.util.autoComplete.CAutoComplete;
import conicet.apps.svt.util.autoComplete.CAutoCompletePrestador;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CPdtsAltaAction extends CInstrumentoAltaAction {


	@Override
	public ActionForward autoCompletePrestador(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CEntidadBusquedaStruct bs = new CEntidadBusquedaStruct();

			bs.getTiposEntidad().add(new CTipoEntidad(4));
			bs.getTiposEntidad().add(new CTipoEntidad(1));
			bs.getTiposEntidad().add(new CTipoEntidad(2));
			bs.getTiposEntidad().add(new CTipoEntidad(3));
			bs.getTiposEntidad().add(new CTipoEntidad(5));
		CAutoComplete auto= new CAutoCompletePrestador(bs);
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}


}
