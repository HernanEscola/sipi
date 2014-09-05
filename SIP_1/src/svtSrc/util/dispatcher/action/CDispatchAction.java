package conicet.apps.svt.web.dispatcher.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import conicet.apps.svt.object.archivo.CArchivo;
import conicet.apps.svt.object.archivo.IDocumento;
import conicet.apps.svt.util.archivo.CArchivoUtil;
import conicet.apps.svt.web.contratante.form.CContratanteForm;
import conicet.apps.svt.web.dispatcher.form.CDispatchActionForm;
import conicet.framework.error.CException;
import conicet.framework.util.log4j.CLog4jMessage;

public abstract class CDispatchAction extends DispatchAction {

	protected Logger logger = null;

	protected String formatMethod(String method) {
		method = method.replaceAll("á|Á", "a").replaceAll("é|É", "e")
				.replaceAll("í|Í", "i").replaceAll("ó|Ó", "o")
				.replaceAll("ú|Ú", "u").replaceAll("ñ|Ñ", "ni");
		String[] palabras = method.split(" ");
		StringBuilder resultado = new StringBuilder();
		for (String palabra : palabras) {
			if (resultado.length() == 0) {
				resultado.append(palabra.toLowerCase());
			} else {
				resultado.append(String.valueOf(palabra.charAt(0))
						.toUpperCase() + palabra.substring(1));
			}
		}
		return resultado.toString();
	}

	@Override
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("index");
	}

	protected final void setLogger(){
		this.logger = Logger.getLogger(this.getClass());
	}

	@SuppressWarnings("rawtypes")
	@Override
	protected ActionForward dispatchMethod(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response, String method) throws Exception {
		CDispatchActionForm form = (CDispatchActionForm) actionForm;
		try {
			if (null == logger) {
				setLogger();
			}
			ActionForward af;
			try{
				af = super.dispatchMethod(mapping, form, request, response, formatMethod(form.getMethod()));
			}catch (NoSuchMethodException e) {
				af = super.dispatchMethod(mapping, form, request, response, formatMethodSecundario(form.getMethod()));
			}
			return af;
		} catch (CException ex) {
			//hago .toString() par apoder obtener el stacktrace de la excepcion original, la cual sino estoy perciendo informacion.
			ex.toString();
			ex.printStackTrace();
			logger.error(CLog4jMessage.getErrorMessage(request, form), ex.getException());
			request.setAttribute("errorFatal", ex);
			return mapping.findForward("error_fatal");
		} catch (Exception ex) {
			ex.printStackTrace();
			logger.error(CLog4jMessage.getErrorMessage(request, form), ex);
			request.setAttribute("errorFatal", new CException(1, ex));
			return mapping.findForward("error_fatal");
		}
	}

	protected String formatMethodSecundario(String method) {
		//así es como debería ser el método siempre, Si es una sola palabra ( del estido ejecutarEsteMetodo) no deberia pasarse a lowercase.
		method = method.replaceAll("á|Á", "a").replaceAll("é|É", "e")
				.replaceAll("í|Í", "i").replaceAll("ó|Ó", "o")
				.replaceAll("ú|Ú", "u").replaceAll("ñ|Ñ", "ni");
		String[] palabras = method.split(" ");
		StringBuilder resultado = new StringBuilder();
		if(palabras.length == 1){
			return palabras[0];
		}else{
			for (String palabra : palabras) {
				if (resultado.length() == 0) {
					resultado.append(palabra.toLowerCase());
				} else {
					resultado.append(String.valueOf(palabra.charAt(0)).toUpperCase() + palabra.substring(1));
				}
			}
		}
		return resultado.toString();
	}

	protected void setInput(ActionMapping mapping, HttpServletRequest request) {
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
	}
	
}
