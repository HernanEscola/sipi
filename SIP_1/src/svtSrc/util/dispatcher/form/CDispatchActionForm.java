package conicet.apps.svt.web.dispatcher.form;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.web.form.CGenericActionForm;

public abstract class CDispatchActionForm<T> extends CGenericActionForm<T> {

	private List<CBoton> botones = new LinkedList<CBoton>();
	private String method;
	//private String input;

	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}

	/*Esto se hace asi para segir usando la property btnSubmit en las jsp*/
	@Override
	public void setBtnSubmit(String btnSubmit) {
		this.method = btnSubmit;
	}
	

	@Override
	public String getBtnSubmit() {
		return this.getMethod();
	}

	@Override
	public abstract void clear();

	public abstract void limpiar();

	public List<CBoton> getBotones() {
		return botones;
	}

	public void setBotones(List<CBoton> botones) {
		this.botones = botones;
	}
	
	public String getValidValueFromAttribute(String value){
		return StringUtils.isNotEmpty(value) ? value: null;
	}
	
	public String getValidValueFromCombo(String value){
		return CComboWrapper.isSeleccionado(value) ? value: null;
	}
	
}
