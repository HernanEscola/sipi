package conicet.apps.svt.web.dispatcher.action;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.util.autoComplete.struct.CAutoCompleteMapAttributes;
import conicet.apps.svt.web.dispatcher.form.CAutoCompleteDispatchActionForm;
import conicet.framework.error.CException;

public abstract class CAutoCompleteDispatchAction extends CDispatchAction {
	/**
	 * <p>Devuelve el CAutoCompleteMapAttributes en bas ea un tipo:string</p>
	 * </p>
	 */
	public ActionForward autoComplete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CAutoCompleteDispatchActionForm<?> form = (CAutoCompleteDispatchActionForm<?>) actionForm;
		String tipo = request.getParameter("tipo");
		CAutoCompleteMapAttributes ac = form.getAutoCompleteMapAttribute(tipo);
		ac.setId(null);
		Collection res = null;
		if(ac.getIngresarNuevo()){
			res = ac.getJsonResponse().getJsonDataConIngresarNuevo(request, response);
		}else{
			res = ac.getJsonResponse().getJsonData(request, response);
		}
		form.getObjetosBuscadosAutocomplete().addAll(res);
		return null;
	}
	
}
