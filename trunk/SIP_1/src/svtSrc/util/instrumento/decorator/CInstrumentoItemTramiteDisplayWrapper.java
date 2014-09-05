package conicet.apps.svt.web.instrumento.decorator;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.instrumentoItemTramite.CInstrumentoItemTramite;
import conicet.framework.util.fecha.CFecha;

public class CInstrumentoItemTramiteDisplayWrapper extends TableDecorator implements DecoratesHssf {
	public CInstrumentoItemTramiteDisplayWrapper() {
	}

	public String getIndice() {
		int i = this.getListIndex() + 1;
		//String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex(" + this.getListIndex() + ") value=\"" + i + "\">";
		return ""+i;
	}

	public String getFechaTramite() {
		CInstrumentoItemTramite c = (CInstrumentoItemTramite) this.getCurrentRowObject();
		if(c.getFechaTramite()!=null) {
			return CFecha.formatFechaDDMMAAAAConGuion(c.getFechaTramite());
		}
		return "";
	}

	public String getObservacion() {
		CInstrumentoItemTramite c = (CInstrumentoItemTramite) this.getCurrentRowObject();
		if(c.getObservacion()!=null) {
			return c.getObservacion();
		}
		return "";
	}

	public String getEvento() {
		CInstrumentoItemTramite c = (CInstrumentoItemTramite) this.getCurrentRowObject();
		return c.getEvento().getDescripcion();
	}

	public String getArchivo() {
		CInstrumentoItemTramite c = (CInstrumentoItemTramite) this.getCurrentRowObject();
		if (c.getArchivo() != null){
			String nombre = c.getArchivo().getNombre() + " - " + ((float) c.getArchivo().getTamaño())/1024 +"KB";
	    	return "<a href='#' type='checkbox' name='documentoDescargar"+ getListIndex() + "' onclick='descargarFile("+ getListIndex() + ")'>"+nombre+"</a>";
		}
		return "---";
	}

	public String getAccion() {
		int i = this.getListIndex() + 1;
		String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoItemTramiteIndex(" + this.getListIndex() + ") value=Modificar>";
		retorno += "&nbsp;<input type=\"button\" class=\"CformBotonTransp\" name=itemTramiteEliminar"+ getListIndex() + " onclick='confirmarEliminarItemTramite("+ this.getListIndex() + ")' value=Eliminar>";
		return retorno;
	}

	@Override
	public String finishRow(){
		return "";
	}

	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}

}
