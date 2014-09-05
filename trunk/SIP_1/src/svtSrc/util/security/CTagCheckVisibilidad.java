package conicet.apps.svt.util.security;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CTagCheckVisibilidad extends TagSupport{

	private String funcionalidad;

	public CTagCheckVisibilidad() {
	}

	@Override
	public int doStartTag() throws JspException {
		// tipo de entidad del usuario
		HttpSession ses = this.pageContext.getSession();
		CUsuarioSvt u = (CUsuarioSvt) ses.getAttribute("usuarioSVT");

		// si es otro tipo de entidad de los descriptos como visibles
		if (this.getFuncionalidad().equalsIgnoreCase("convenio_busqueda")){
			return verificarVisibildadConvenioBusqueda(u);
		}
		if (this.getFuncionalidad().equalsIgnoreCase("convenio_detalle")){
			CInstrumentoForm form = (CInstrumentoForm) ses.getAttribute((String)this.pageContext.getRequest().getParameter("instrumentoForm"));
			return verificarVisibildadConvenioDetalle(u, form);
		}
		return 0;
	}

	public void setFuncionalidad(String funcionalidad) {
		this.funcionalidad = funcionalidad;
	}

	public String getFuncionalidad() {
		return funcionalidad;
	}

	private int verificarVisibildadConvenioBusqueda(CUsuarioSvt u){
		if (u.getRol().getId().equalsIgnoreCase("CCO") || u.getRol().getId().equalsIgnoreCase("DVJ")) {
			return EVAL_BODY_INCLUDE;
		} else {
			return SKIP_BODY;
		}
	}
	
	private int verificarVisibildadConvenioDetalle(CUsuarioSvt u, CInstrumentoForm form){
		if (u.getRol().getId().equalsIgnoreCase("CCO") || u.getUsrRegistrado().getKey().toString().equalsIgnoreCase(form.getResponsable())) {
			return EVAL_BODY_INCLUDE;
		} else {
			return SKIP_BODY;
		}
	}

}
