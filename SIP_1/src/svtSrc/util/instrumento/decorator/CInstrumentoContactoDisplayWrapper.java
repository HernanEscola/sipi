package conicet.apps.svt.web.instrumento.decorator;

import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.object.contacto.CContactoContratante;
import conicet.apps.svt.object.contacto.CContactoOtroOrganismo;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParte;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteContacto;
import conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;

public class CInstrumentoContactoDisplayWrapper extends CInstrumentoParteDisplayWrapper {

	@Override
	public String getIndice() {
		int i = this.getListIndex() + 1;
		String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoInstrumentoParteContactoIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
		return retorno;
	}


	@Override
	public String getRemove() {
		CInstrumentoParte c = (CInstrumentoParte) this.getCurrentRowObject();
		CInstrumentoForm form = (CInstrumentoForm) this.getPageContext().getSession().getAttribute(this.getPageContext().getRequest().getParameter("instrumentoForm"));
		Integer index = form.getContactosInstrumento().indexOf(c);
		return "<a href='#' onclick='quitar(\"Contacto\","+ index + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}


	public String getContactoOrganismoOContratante() {
		CInstrumentoParteContacto c = (CInstrumentoParteContacto) this.getCurrentRowObject();
		if (c.getFuncion().equals(EFuncionParteInstrumento.COO)){
			return  ((CContactoOtroOrganismo)c.getContacto()).getOrganismo().getNombre();
		} else if (c.getFuncion().equals(EFuncionParteInstrumento.CON)){
			if ( ((CContactoContratante)c.getContacto()).getContratante()==null) {
			 	return ((CContactoContratante)c.getContacto()).getContratanteRelacion().getContratante().getDescripcionCompleta();
			}else{
				return  ((CContactoContratante)c.getContacto()).getContratante().getDescripcionCompleta();
			}
		}
		return "";
	}
	public String getContactoTelefono(){
		CInstrumentoParteContacto c = (CInstrumentoParteContacto) this.getCurrentRowObject();
		if (StringUtils.isNotEmpty(c.getContacto().getTelefono())){
			return c.getContacto().getTelefono();
		}
		return "";
	}

}
