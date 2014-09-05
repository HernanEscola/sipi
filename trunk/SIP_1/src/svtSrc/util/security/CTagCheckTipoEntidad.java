package conicet.apps.svt.util.security;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import conicet.apps.svt.object.entidad.CEntidad;

public class CTagCheckTipoEntidad extends TagSupport {

	private String tipoEntidad;
	private String visible;

	public CTagCheckTipoEntidad() {
	}

	@Override
	public int doStartTag() throws JspException {
		// tipo de entidad del usuario
		HttpSession ses = this.pageContext.getSession();

		CEntidad e = (CEntidad) ses.getAttribute("entidad");
		String tipoEntidadDescripcion = e.getTipo().getId().toString();

		// tipos de entidades a chequear
		String[] tipoEntidades = this.getTipoEntidad().split(",");

		for (int i = 0; i < tipoEntidades.length; i++) {
			if (tipoEntidadDescripcion.equalsIgnoreCase(tipoEntidades[i])) {
				// si corresponde visualizar el tipo de entidad del usuario
				if (this.getVisible().equalsIgnoreCase("S")) {
					return EVAL_BODY_INCLUDE;
					// si no le corresponde
				} else {
					return SKIP_BODY;
				}
			}
		}

		// si es otro tipo de entidad de los descriptos como visibles
		if (this.getVisible().equalsIgnoreCase("S")) {
			return SKIP_BODY;
		}

		return EVAL_BODY_INCLUDE;
	}

	public String getTipoEntidad() {
		return tipoEntidad;
	}

	public void setTipoEntidad(String funcion) {
		this.tipoEntidad = funcion;
	}

	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

}
