package conicet.apps.svt.web.marca.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;

import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.web.dispatcher.action.CAMDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.marca.form.CMarcaForm;
import conicet.framework.error.CException;

public abstract class CMarcaAMAction extends CAMDispatchAction {

	@Override
	protected Object grabar(ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws CException {
		CMarcaForm form = (CMarcaForm) actionForm;
		CMarcaEquipo marca = (CMarcaEquipo) form.getData();
		
		persistir(marca);
		return marca;
	}
	
	public abstract void persistir(CMarcaEquipo marca) throws CException;

	@Override 
	protected void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		// TODO Auto-generated method stub

	}

	@Override
	protected boolean validar(ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws CException {

		return true;
	}

	@Override
	public void inicializarAutoCompletes(CABMDispatchActionForm<?> form) {

	}

}
