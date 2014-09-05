package conicet.apps.svt.util.valida;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import conicet.framework.validator.CErrorIterator;
import conicet.framework.validator.CManejadorError;
import conicet.framework.validator.CValidator;
import conicet.framework.validator.EError;

public class CManejadorErrorSVT extends CManejadorError {

	@Override
	public void cargarMensajes(CValidator validator, ActionErrors ae,
			ActionMessages am) {
		for (CErrorIterator iter = validator.iterator(); iter.hasNext();) {
			EError error = iter.next();
			if (error.isError()) {
				ae.add("", new ActionMessage(error.getTipoMensaje(), error
						.getMensaje()));
			} else {
				am.add("", new ActionMessage(error.getTipoMensaje(), error
						.getMensaje()));
			}
		}
	}

}
