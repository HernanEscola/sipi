package conicet.apps.svt.util.web;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.taglib.TagUtils;
import org.apache.struts.taglib.html.Constants;
import org.apache.struts.taglib.html.OptionsTag;
import org.apache.struts.taglib.html.SelectTag;

 
public class CTagComboAjax extends SelectTag {
	
	
	private String tipoAction = "method";
	private String nombre;
	private String actionName;
	private String msjVacio = "";
	private String matchId;
	
	@Override
	public int doStartTag() throws JspException {
		
		this.setStyleId(getNombreCombo());
		this.setProperty(getNombre() + "Id");
		this.match = new String[]{ getNombre() + "Id" };
		
		return super.doStartTag();
	}
	
	@Override
	public int doAfterBody() throws JspException {
		generarOptionsTag();
		
		return super.doAfterBody();
	}
	
	@Override
	public int doEndTag() throws JspException {
		generarOptionsTag();
		int result = super.doEndTag();
		
		if (StringUtils.isNotEmpty(getMsjVacio())) {
			TagUtils.getInstance().write(this.pageContext, generarLabel());			
		}
		TagUtils.getInstance().write(this.pageContext, generarImagenCargando());
		TagUtils.getInstance().write(this.pageContext, generarJavascript());
		
		return result;
	}

	private String generarJavascript() {
		return "<script> " +
				" $(document).ready(function() { " +
					"setVisibilidadComboAjax('" + getNombre() + "', '" + getMatchId() + "'); " +
				" }); " + 
				" function " + getNombre() + "CargarComboAjax() { " +
					"cargarComboAjax('" + getMatchId() + "', '" + getNombre() + "', '" + 
					getActionName() + "', '" + getTipoAction() + "', '" + getMetodoNombre() + "'); " +
				" } " +
				" function " + getNombre() + "DeshabilitarYReiniciarComboAjax() { " +
					"deshabilitarYResetearAjaxCombo('" + getNombre() + "'); " +
				" } " +
				"</script>";
	}

	private String getMetodoNombre() {
		return getNombre() + "CargarComboAjax";
	}

	private String generarImagenCargando() {
		return "<img id='" + getNombreImagenCargando() + "' src='imagenes/indicator.gif' height='15px' width='15px'/>";
	}
	
	private String generarLabel() {
		return "<label class='CformNombre' id='" + getNombreLabel() + "'>" + msjVacio +"</label>";
	}

	private void generarOptionsTag() throws JspException {		
		OptionsTag options = new OptionsTag();
		options.setProperty("value");
		options.setLabelProperty("label");
		options.setParent(this);
		options.setPageContext(this.pageContext);
		options.setCollection(getNombre() + "Combo");
		options.doStartTag();
		try {
			options.doEndTag();			
		} catch (JspException e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	private String getNombreLabel() {
		return getNombre() + "NoHayDatosAjaxCombo";
	}
	
	private String getNombreImagenCargando() {
		return getNombre() + "CargandoImgAjaxCombo";
	}
	
	private String getNombreCombo() {
		return getNombre() + "ComboAjaxCombo";
	}

	public String getTipoAction() {
		return tipoAction;
	}

	public void setTipoAction(String tipoAction) {
		this.tipoAction = tipoAction;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getMsjVacio() {
		return msjVacio;
	}

	public void setMsjVacio(String msjVacio) {
		this.msjVacio = msjVacio;
	}

	public String getMatchId() {
		return matchId;
	}

	public void setMatchId(String matchId) {
		this.matchId = matchId;
	}	
}
