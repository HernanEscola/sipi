package conicet.apps.svt.web.dispatcher.form;

import java.lang.reflect.Field;

import org.apache.struts.action.ActionErrors;

import conicet.framework.validator.annotation.AField;

public class CAltaActionForm<T> extends CDispatchActionForm<T> {
	
	@Override
	public void clear() {
		this.setMethod("");
		this.setInput("");
	}

	@Override
	public void limpiar() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public T getData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setData(T arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void validarField(AField arg0, Field arg1, ActionErrors arg2)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
