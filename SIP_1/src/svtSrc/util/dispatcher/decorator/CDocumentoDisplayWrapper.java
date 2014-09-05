package conicet.apps.svt.web.dispatcher.decorator;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.displaytag.decorator.TableDecorator;

import conicet.apps.svt.object.archivo.IDocumento;

public class CDocumentoDisplayWrapper extends TableDecorator {

	public String getArchivoDescargar() {
		IDocumento doc = (IDocumento) this.getCurrentRowObject();
		String nombre = doc.getArchivo().getNombre() + " - "
				+ (new BigDecimal((float) doc.getArchivo().getTamaño() / 1024)).setScale(2, RoundingMode.HALF_EVEN) + "KB";
		return "<a href='#' type='checkbox' name='documentoDescargar" + getListIndex() + "' onclick='descargarArchivo(\""
				+ doc.getTipoDocumento() + "\", " + getListIndex() + ")'>" + nombre + "</a>";
	}

	public String getEliminar() {
		IDocumento doc = (IDocumento) this.getCurrentRowObject();
		return "<a href='#' type='checkbox' name='documento" + getListIndex() + "' onclick='quitarArchivo(\"" + doc.getTipoDocumento() + "\", "
				+ getListIndex() + ")'><img src='./imagenes/close.png' align='top'/></a>";
	}

}
