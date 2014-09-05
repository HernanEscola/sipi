package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.instrumento.EEstadoInstrumento;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion;
import conicet.apps.svt.web.base.decorator.CBoton.Posicion.POSICION;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;


public class CPdtsDetalleAction extends CInstrumentoDetalleAction{


	@Override
	protected void armarBotones(CABMDispatchActionForm<?> actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	actionForm.getBotones().clear();
	// con CHECK
	/*
	actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.MODIFICAR), CBoton.CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.ELIMINAR), CBoton.CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	*/
	CInstrumentoForm form = (CInstrumentoForm) actionForm;
	form.setEsModificable(false);
	if(!form.getInstrumento().getEstado().equals(EEstadoInstrumento.DES) && form.getInstrumento().getTipo().getId().equalsIgnoreCase(ETipoInstrumento.PDT.getId())){
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.MODIFICAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.ELIMINAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	}
	if( (form.getRolUsuario().equalsIgnoreCase("SCJ") || (form.getRolUsuario().equalsIgnoreCase("SCH")))
			&& form.getInstrumento().getTipo().compareTo(ETipoInstrumento.CON)==0 && form.getInstrumento().getEsPDT() ){
		actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.MODIFICAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
	}

	actionForm.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));
}

	@Override
	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> f = (CABMDispatchActionForm<?>) actionForm;

		this.cargarElemento(f, request, response);

		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		if( (form.getRolUsuario().equalsIgnoreCase("SCJ") || (form.getRolUsuario().equalsIgnoreCase("SCH")))
				&& form.getInstrumento().getTipo().compareTo(ETipoInstrumento.CON)==0 && form.getInstrumento().getEsPDT() ){
			return mapping.findForward("modificarconveniopdt");
		}
		return mapping.findForward("modificar");
	}
}


