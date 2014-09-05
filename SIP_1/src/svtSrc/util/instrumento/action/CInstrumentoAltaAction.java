package conicet.apps.svt.web.instrumento.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumento.EEstadoInstrumento;
import conicet.apps.svt.object.instrumento.EEstadoTramiteInstrumento;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvtGestor;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;
import conicet.framework.error.CException;
import conicet.framework.util.UFecha;

public class CInstrumentoAltaAction extends CInstrumentoAMAction {

	@Override
	protected Object grabar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub

		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CInstrumento i = form.getData();
		HttpSession sesion = request.getSession();
		CUsuarioSvtGestor usr = (CUsuarioSvtGestor) sesion.getAttribute("usuarioSVT");

		i.setUsrAlta(usr);
		i.setFechaAlta(UFecha.hoy());
		setearResponsableCompleto(i);
		CInstrumentoService.registrarInstrumento(i, usr);

		return i;
	}



	@Override
	public EAccionesAction setearEAccionesAction() {
		return EAccionesAction.alta;

	}

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		// TODO Auto-generated method stub
		super.inicializar(actionForm, request, response);
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		form.setEstado(EEstadoInstrumento.TRA);
		form.setEstadoTramite(EEstadoTramiteInstrumento.INI);
		form.setResponsable(form.getUsuario().getUsrRegistrado().getLastName() + ", " +form.getUsuario().getUsrRegistrado().getFirstName());


		// si la factura tiene transferencias (cobrado="T") no se puede modificar el importe ni la distribucion y Fecha mayor a cobros
		// si tiene cobros (cobrado=C )hay restricciones para modificar fecha e importe gral y distribucion con respecto a cobros

	  	//form.setearDistribucionBasica();

	}

	public void generarxmlconvenio(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		/*if(true){
			CInstrumentoService.uploadConvenioToSido();
			CCrossApplicationService.getAll("convenio");
		}
		
		if(false){
			COfertaTecnologicaBusquedaStruct ot =  new COfertaTecnologicaBusquedaStruct();
			ot.setTipoOfertaId("3");
			List<COfertaTecnologica> stans = COfertaTecnologicaService.findOfertaTecnologicaByCriterio(ot);
			XStream xstream = new XStream();
			xstream.alias("prestador", CPrestadorXml.class);
			xstream.alias("stan", CStanXml.class);
			xstream.alias("disciplinaPrimaria", CDisciplinaPrimaria.class);
			xstream.alias("disciplinaDesagregada", CDisciplinaDesagregada.class);
			
			
			String xml  = "";
			for(COfertaTecnologica c : stans){
				CStanXml stanXml = new CStanXml((CStan) c);
				xml+= xstream.toXML(stanXml);
			}	
			System.out.println(xml);
		}*/
	}
	
	
}
