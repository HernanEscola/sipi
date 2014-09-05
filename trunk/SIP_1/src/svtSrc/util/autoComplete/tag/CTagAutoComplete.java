package conicet.apps.svt.util.autoComplete.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.taglib.TagUtils;

public class CTagAutoComplete extends org.apache.struts.taglib.html.TextTag {

	private String tipoAutocomplete;
	private String actionIngresarNuevo;
	private String tipoAction = "Method";
	private String minFindSize;
	private String afterSelectCallBack = "";
	private String afterRemoveCallBack = "";

	public CTagAutoComplete() {
	}

	public int doStartTag() throws JspException {

		TagUtils.getInstance().write(this.pageContext,
				generarCuerpoAutoComplete());
		return (EVAL_BODY_TAG);
	}

	private String generarCuerpoAutoComplete() throws JspException {
		org.apache.struts.taglib.html.HiddenTag ht = new org.apache.struts.taglib.html.HiddenTag();
		ht.setProperty("autoCompleteMappedId(" + tipoAutocomplete + ")");
		ht.setStyleId("id" + tipoAutocomplete);
		ht.setName(this.name);
		ht.setPageContext(this.pageContext);
		ht.doStartTag();
		ht.doInitBody();
		ht.doEndTag();

		// se suponeq deberia agregar el hidden

		this.setProperty("autoCompleteMappedDescripcion(" + tipoAutocomplete + ")");
		this.setStyleId("autoComplete" + tipoAutocomplete);
		String ret = this.renderInputElement();

		ret += this.renderDiv();
		ret += this.renderJavaScript();
		return ret;
	}

	private String renderJavaScript() {
		String script = "<script>$(document).ready(function() { prepararBusqueda"
				+ tipoAction + "('" + tipoAutocomplete + "'";
		if (this.actionIngresarNuevo != null) {
			script += ", '" + actionIngresarNuevo + "'";
		} else {
			script += ", ''";
		}
		script += ", " + generateCallbackParam();
		script += ")});</script>";

		return script;
	}

	private String renderDiv() {
		return "<div id='descripcion" + tipoAutocomplete + "Div'><label id='label" + tipoAutocomplete + "'> </label> &nbsp; "
			 + "<img id='botonBorrar" + tipoAutocomplete + "' src='./imagenes/close.png' align='top' style='cursor: hand; cursor: pointer;' " +
			   "onclick=\"eliminarOpcionSeleccionadaAC('" + this.tipoAutocomplete + "', " + generateCallbackParam() + ");\" />" + "</div>";
	}

	private String generateCallbackParam() {
		String output = "{";
		if (StringUtils.isNotEmpty(this.afterSelectCallBack)) {
			output += "'afterSelect':" + afterSelectCallBack + ", ";
		} else {
			output += "'afterSelect':'', ";
		}
		if (StringUtils.isNotEmpty(this.afterRemoveCallBack)) {
			output += "'afterRemove':" + afterRemoveCallBack + ", ";
		} else {
			output += "'afterRemove':'', ";
		}

		if (output.length() > 1) {
			return output.substring(0, output.length() - 2) + "}";
		} else {
			return "''";
		}
	}

	public String getTipoAutocomplete() {
		return tipoAutocomplete;
	}

	public void setTipoAutocomplete(String tipoAutocomplete) {
		this.tipoAutocomplete = tipoAutocomplete.substring(0, 1).toUpperCase()
				+ tipoAutocomplete.substring(1);
	}

	public String getActionIngresarNuevo() {
		return actionIngresarNuevo;
	}

	public void setActionIngresarNuevo(String actionIngresarNuevo) {
		this.actionIngresarNuevo = actionIngresarNuevo;
	}

	public String getTipoAction() {
		return tipoAction;
	}

	public void setTipoAction(String tipoAction) {
		this.tipoAction = tipoAction;
	}

	public String getAfterSelectCallBack() {
		return afterSelectCallBack;
	}

	public void setAfterSelectCallBack(String afterSelectCallBack) {
		this.afterSelectCallBack = afterSelectCallBack;
	}

	public static String generarAutoComplete(PageContext pc,
			String tipoAutocomplete, String actionIngresarNuevo)
			throws JspException {
		CTagAutoComplete autoComplete = new CTagAutoComplete();
		autoComplete.setTipoAutocomplete(tipoAutocomplete);
		autoComplete.setActionIngresarNuevo(actionIngresarNuevo);
		autoComplete.setPageContext(pc);
		/*
		 * ht.doStartTag(); ht.doInitBody(); ht.doEndTag();
		 */
		String ret = autoComplete.generarCuerpoAutoComplete();
		return ret;
	}

	public String getAfterRemoveCallBack() {
		return afterRemoveCallBack;
	}

	public void setAfterRemoveCallBack(String afterRemoveCallBack) {
		this.afterRemoveCallBack = afterRemoveCallBack;
	}

	public String getMinFindSize() {
		return minFindSize;
	}

	public void setMinFindSize(String minFindSize) {
		this.minFindSize = minFindSize;
	}
	

    
}
