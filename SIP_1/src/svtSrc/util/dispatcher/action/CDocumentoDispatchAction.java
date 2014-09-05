package conicet.apps.svt.web.dispatcher.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.archivo.IDocumento;
import conicet.apps.svt.util.archivo.CArchivoUtil;
import conicet.apps.svt.web.dispatcher.form.CDocumentoDispatchActionForm;

public abstract class CDocumentoDispatchAction extends CAutoCompleteDispatchAction {

	public void descargarArchivo(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		@SuppressWarnings("rawtypes")
		CDocumentoDispatchActionForm form = (CDocumentoDispatchActionForm) actionForm;
		Integer index = new Integer(form.getDescargarArchivoIndex());
		String tipo = form.getDescargarArchivoTipo();
		form.setDescargarArchivoIndex(null);
		form.setDescargarArchivoTipo(null);

		List<IDocumento> documentos = form.getDocumentos(tipo);
		CArchivoUtil.descargarArchivo(request, response, documentos.get(index).getArchivo());
	}

}
