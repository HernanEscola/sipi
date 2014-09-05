package conicet.apps.svt.web.instrumento.action;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.siuvt.service.CIngresoService;
import conicet.apps.svt.object.archivo.CArchivo;
import conicet.apps.svt.object.bitacora.ETipoBitacora;
import conicet.apps.svt.object.bitacoraVisibilidad.ETipoVisibilidad;
import conicet.apps.svt.object.contacto.CContactoContratante;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.apps.svt.object.instrumento.hito.CHito;
import conicet.apps.svt.object.instrumento.hojaRuta.CHojaRuta;
import conicet.apps.svt.object.instrumentoItemTramite.CInstrumentoItemTramite;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteContacto;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteContratante;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteEntidad;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteUvt;
import conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento;
import conicet.apps.svt.object.instrumentoParticipante.CInstrumentoParticipante;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvtGestor;
import conicet.apps.svt.rol.interfaces.IRol;
import conicet.apps.svt.service.CBitacoraService;
import conicet.apps.svt.service.CGlobalService;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.service.COfertaTecnologicaService;
import conicet.apps.svt.struct.CContratanteContactoStruct;
import conicet.apps.svt.util.CBitacoraManager;
import conicet.apps.svt.util.archivo.CArchivoUtil;
import conicet.apps.svt.web.base.decorator.CBoton;
import conicet.apps.svt.web.base.decorator.CBoton.Label;
import conicet.apps.svt.web.base.decorator.CBoton.Label.LABEL_VALUE;
import conicet.apps.svt.web.dispatcher.action.CDetalleDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoWrapper;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;
import conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaWrapper;
import conicet.apps.svt.web.usuario.decorator.CUsuarioWrapper;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;
import conicet.framework.web.COptionCombo;



public class CInstrumentoDetalleAction extends CDetalleDispatchAction{



	@Override
	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionForward ret = super.init(mapping, actionForm, request, response);
		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		return ret;
	}

	@Override
	protected void inicializar(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	throws CException {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		HttpSession sesion = request.getSession();
		CSessionManager sessionManager = CSessionManager.getInstance(request);

		form.limpiar();
		if (request.getAttribute("input") != null) {
			form.setInput((String) request.getAttribute("input"));
		}
		inicializarCombos(request);

		form.setUsuario((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));

		form.setComboActores(CGlobalWrapper.getComboSeleccionar());

		form.getTiposItems().addAll(CIngresoService.findTipoItemFacturacionParaDistribucion());
		form.inicializarDistribucion();

		form.setElementoSeleccionado(request.getAttribute("selected"));
		form.setData(CInstrumentoService.findInstrumentoById(((CInstrumento)form.getElementoSeleccionado()).getId()));
		CUsuarioSvt usrSVT = (CUsuarioSvt) sesion.getAttribute("usuarioSVT");
//		if (usrSVT.getRol().getId().equals("SCJ") || usrSVT.getRol().getId().equals("SCH")) {
			form.setListHojaRuta(CInstrumentoService.findHojasRutaByConvenioId(((CInstrumento)form.getElementoSeleccionado()).getId()));
			form.setListHito(CInstrumentoService.findHitosByInstrumentoIdOrdered(((CInstrumento)form.getElementoSeleccionado()).getId(), "fecha"));
			form.setHitosPredecesores(CInstrumentoService.findHitosPredecesoresByInstrumento(form.getInstrumento()));
			setCriterioBusqueda("criterioBusquedaHito", request, form.armarDetaleCriterioBusquedaHito());
			setCriterioBusqueda("criterioBusquedaHojaRuta", request, form.armarDetaleCriterioBusquedaHojaRuta());
			form.armarComboActores();
			List<CUsuarioSvt> usuarios = CInstrumentoService.findUsuariosHojaRutaByInstrumento(form.getInstrumento());
			List<COptionCombo> combo = new LinkedList<COptionCombo>();
			combo.add(0, new COptionCombo("-1", ""));
			combo.addAll(CUsuarioWrapper.armarComboUsuarios(usuarios));
			form.setUsuariosHojaRuta(combo);
//		}
		/**
		 * LOS USUARIOS DEL MISMO SECTOR QUE EL CONVENIO PUEDEN VER PANTALLA COMPLETA
		 */
		form.setMostrarPantallaCompleta(false);
		if (form.getInstrumento().getSector()!=null &&  ((CUsuarioSvtGestor)form.getUsuario()).getGestor().getId().toString().equalsIgnoreCase(form.getInstrumento().getSector().getId().toString())){
			form.setMostrarPantallaCompleta(true);
		}

		//busca bitacora y trae info según el rol y tipo de bitacora
		CBitacoraManager bm = CBitacoraManager.getInstance(request,CBitacoraService.darBitacora(form.getInstrumento()),ETipoBitacora.Instrumento,ETipoVisibilidad.modulo.getId());

	}

	public ActionForward imprimir(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("formulario");
	}

	public ActionForward participacionSeleccionada(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		int index =  Integer.parseInt(request.getParameter("index"));
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		CInstrumentoParticipante p = CInstrumentoService.findInstrumentoParticipanteById(form.getParticipantesInstrumento().get(index).getId());
		form.getParticipantesInstrumento().set(index, p);
		request.setAttribute("selected", form.getParticipantesInstrumento().get(index));
		return mapping.findForward("detalleParticipacion");
	}

	private void inicializarCombos(HttpServletRequest request) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		if (sessionManager.getAttribute("comboResponsablesConvenio") == null) {
			sessionManager.setAttribute("comboResponsablesConvenio", CInstrumentoWrapper.getComboResponsablesBusqueda());
		}
		if (sessionManager.getAttribute("comboResponsables") == null) {
			sessionManager.setAttribute("comboResponsables", CInstrumentoWrapper.getComboResponsables());
		}
		if (sessionManager.getAttribute("comboEstados") == null) {
			sessionManager.setAttribute("comboEstados", CInstrumentoWrapper.getComboEstados());
		}
		if (sessionManager.getAttribute("comboAlcanceConvenio") == null) {
			sessionManager.setAttribute("comboAlcanceConvenio", CInstrumentoWrapper.getComboAlcanceConvenio());
		}
		if (sessionManager.getAttribute("comboTipoConvenios") == null) {
			sessionManager.setAttribute("comboTipoConvenios", CInstrumentoWrapper.getComboTipoConvenios());
		}
		if (sessionManager.getAttribute("comboAños") == null) {
			sessionManager.setAttribute("comboAños", CInstrumentoWrapper.getComboAños());
		}
		if (sessionManager.getAttribute("comboCategoriaPDT") == null) {
			sessionManager.setAttribute("comboCategoriaPDT", CInstrumentoWrapper.getComboCategoriaPDT());
		}
		if (sessionManager.getAttribute("comboTipoMoneda") == null) {
			sessionManager.setAttribute("comboTipoMoneda", COfertaTecnologicaWrapper.getComboTipoMonedaSinPesos(COfertaTecnologicaService.findTipoMoneda()));
		}
		//if (sessionManager.getAttribute("comboTiposParte") == null)
			sessionManager.setAttribute("comboTiposParte", CInstrumentoWrapper.getComboTipoPartes());
			if (sessionManager.getAttribute("comboClasificacionPDT") == null) {
				sessionManager.setAttribute("comboClasificacionPDT", CInstrumentoWrapper.getComboClasificacionPDT(CInstrumentoService.findClasificacionPDT()));
			}
			if (sessionManager.getAttribute("comboCampoAplicacion") == null){
				sessionManager.setAttribute("comboCampoAplicacion", CInstrumentoWrapper.getComboCampoAplicacion(CGlobalService.findCampoAplicacion()));
			}
	}

	@Override
	protected void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		// TODO Auto-generated method stub
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		request.setAttribute("selected", form.getElementoSeleccionado());

	}

	@Override
	protected void armarBotones(CABMDispatchActionForm<?> actionForm, HttpServletRequest request, HttpServletResponse response) {
		actionForm.getBotones().clear();

		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		form.setEsModificable(false);

		HttpSession sesion = request.getSession(true);
		IRol iRol = (IRol)sesion.getAttribute("iRol");
		try {
 			List<CBoton> botones = iRol.findBotonesInstrumento(form.getInstrumento(),form.getUsuario());
			if (botones!=null){
				for (CBoton cBoton : botones) {
					actionForm.getBotones().add(cBoton);
				}
			}
			form.setEsModificable(iRol.esModificableInstrumento(form.getInstrumento(),form.getUsuario()));
		} catch (CException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
	  	if(!form.getInstrumento().getEstado().equals(EEstadoInstrumento.DES)){
			//if(form.getRolUsuario().equalsIgnoreCase("CCO") || form.getInstrumento().getResponsable()== null || form.getUsuario().getUsrRegistrado().getKey().equals(form.getInstrumento().getResponsable().getUsrNum())){

			// solo puede modificar cco todo,  o el mismo aco que es el responsable
			if(form.getRolUsuario().equalsIgnoreCase("CCO") || (form.getRolUsuario().equalsIgnoreCase("ACO") &&  form.getInstrumento().getResponsable()!= null && form.getUsuario().getUsrRegistrado().getKey().equals(form.getInstrumento().getResponsable().getUsrNum())) ){
				actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.MODIFICAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
				form.setEsModificable(true);
			}
			if( (form.getRolUsuario().equalsIgnoreCase("SCJ") || (form.getRolUsuario().equalsIgnoreCase("SCH")))
					&& form.getInstrumento().getTipo().compareTo(ETipoInstrumento.CON)==0 ){
				actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.MODIFICAR), CBoton.NO_CHECK_FUNCTION,new Posicion(POSICION.SUPERIOR)));
				form.setEsModificable(true);
			}

			if(form.getRolUsuario().equalsIgnoreCase("CCO")){
				actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.DESHABILITAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
			}
		}else{
			actionForm.getBotones().add(new CBoton(new Label(Label.LABEL_VALUE.HABILITAR), CBoton.NO_CHECK_FUNCTION, new Posicion(POSICION.SUPERIOR)));
		}*/
		actionForm.getBotones().add(new CBoton(new Label(LABEL_VALUE.VOLVER), CBoton.NO_CHECK_FUNCTION));

	}

	@Override
	protected boolean validarEliminable(ActionErrors errors, CABMDispatchActionForm<?> actionForm, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return true;
	}

	public ActionForward agregarEvento(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		/*String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);*/
		request.setAttribute("selected", form.getElementoSeleccionado());
		return mapping.findForward("agregarItemTramite");
	}

	public void descargar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		 	CInstrumentoForm f = (CInstrumentoForm)actionForm;
		 	Integer index =  new Integer(f.getDescargarArchivoEvento());
		 	f.setDescargarArchivoEvento(null);

		 	CArchivo archivo = f.getItemsTramite().get(index).getArchivo();
		 	CArchivoUtil.descargarArchivo(request, response, archivo);

	}
	public ActionForward detalleinstrumentoparte(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		request.setAttribute("soloConsulta","S" );

		if (form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.PRE) ||
				form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.CONI) ||
				form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.PRO) ||
				form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.AD)
				){
			request.setAttribute("selected",  ((CInstrumentoParteEntidad)form.getElementoSeleccionadoInstrumentoParte()).getEntidad());
			return mapping.findForward("detalleentidad");
		}else if (form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.UVT) ||
				form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.ADF)){
			request.setAttribute("selected",  ((CInstrumentoParteUvt)form.getElementoSeleccionadoInstrumentoParte()).getUvt());
			return mapping.findForward("detalleUvt");
		}else if (form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.EMP)
			||	form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.CPR) ){
			request.setAttribute("selected", new CContratanteContactoStruct( ((CInstrumentoParteContratante)form.getElementoSeleccionadoInstrumentoParte()).getContratante()));
			return mapping.findForward("detallecontratante");
		}
		else if (form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.COO)
				){

			request.setAttribute("selected",((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto());
			/*request.setAttribute("selected", new CContratanteContactoStruct( ((CContactoContratante)((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto()).getContratanteRelacion().getContratante(),
					((CContactoContratante)((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto()),((CContactoContratante)((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto()).getContratanteRelacion()));*/
			return mapping.findForward("detallecontacto");

		}else if (form.getElementoSeleccionadoInstrumentoParte().getFuncion().equals(EFuncionParteInstrumento.CON)
				){
			CContactoContratante contacto= (CContactoContratante)((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto();
			request.setAttribute("selected", new CContratanteContactoStruct(contacto.getContratante(),contacto,contacto.getContratanteRelacion()) );

			/*request.setAttribute("selected", new CContratanteContactoStruct( ((CContactoContratante)((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto()).getContratanteRelacion().getContratante(),
					((CContactoContratante)((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto()),((CContactoContratante)((CInstrumentoParteContacto)form.getElementoSeleccionadoInstrumentoParte()).getContacto()).getContratanteRelacion()));*/
			return mapping.findForward("detallecontratante");
		}
		return mapping.findForward("formulario");
	}

	public ActionForward modificaritemtramite(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		request.setAttribute("selected", form.getElementoSeleccionado());
		request.setAttribute("itemTramiteSelected", form.getItemTramiteSeleccionado());
		return mapping.findForward("modificarItemTramite");
	}

	public ActionForward eliminaritemtramite(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		Integer index =  new Integer(form.getItemTramiteEliminar());
	 	form.setItemTramiteEliminar(null);

	 	CInstrumentoItemTramite iit = form.getItemsTramite().get(index);
	 	CInstrumentoService.eliminarConvenioItemTramite(iit);
	 	request.setAttribute("selected", form.getElementoSeleccionado());
		return mapping.findForward("inicializar");
	}

	public void descargarplandetrabajo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm f = (CInstrumentoForm)actionForm;
	 	CArchivoUtil.descargarArchivo(request, response, f.getPlanDeTrabajo());
	}


	public ActionForward detalleUvt(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm f = (CInstrumentoForm)actionForm;
		int index =  Integer.parseInt(request.getParameter("index"));
		//no tengo lista de UVTs, sino podria buscar por el indice q le mando
		request.setAttribute("selected", f.getUvt());
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		return mapping.findForward("detalleUvt");
	}

	public ActionForward ingresarNuevo(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		request.setAttribute("instrumentoId", form.getInstrumento().getId());
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		return mapping.findForward("altaHito");
	}

	public ActionForward detalleHito(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		request.setAttribute("selected",form.getElementoSeleccionado());
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		return mapping.findForward("detalleHito");
	}

	@Override
	public ActionForward refrescar(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		form.setListHito(findHitos(form, request));
		form.setHitosPredecesores(CInstrumentoService.findHitosPredecesoresByInstrumento(form.getInstrumento()));
		return super.refrescar(mapping, actionForm, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		if (form.getTab().equals("tabHitos")) {
			List<CHito> hitos = findHitos(form, request);
			form.setListHito(hitos);
			form.setHitosPredecesores(CInstrumentoService.findHitosPredecesoresByInstrumento(form.getInstrumento()));
		} else if (form.getTab().equals("tabHojaRuta")) {
			List<CHojaRuta> hojasRuta = findHojasRuta(form, request);
			form.setListHojaRuta(hojasRuta);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		if (form.getTab().equals("tabHitos")) {
			form.limpiarCriterioHitos();
			form.setListHito(CInstrumentoService.findHitosByInstrumentoIdOrdered(form.getInstrumento().getId(), "fecha"));
			form.setHitosPredecesores(CInstrumentoService.findHitosPredecesoresByInstrumento(form.getInstrumento()));
			setCriterioBusqueda("criterioBusquedaHito",request, form.armarDetaleCriterioBusquedaHito());
		} else if (form.getTab().equals("tabHojaRuta")) {
			form.limpiarCriterioHojaRuta();
			form.setListHojaRuta(findHojasRuta(form, request));
		}
		return mapping.findForward("formulario");
	}

	private List<CHito> findHitos(CInstrumentoForm form, HttpServletRequest request) throws CException {
		Map<String, String> mapCriterio = form.getMapCriterio();
		if (StringUtils.isNotEmpty(mapCriterio.get("actor")))  {
			if(mapCriterio.get("actor").equals("DVT")) {
				mapCriterio.put("tipoActor", mapCriterio.get("actor"));
			} else{
				String tipoActor = mapCriterio.get("actor").substring(0,mapCriterio.get("actor").indexOf("_"));
				mapCriterio.put("tipoActor", tipoActor);
				String actorId = mapCriterio.get("actor").substring(mapCriterio.get("actor").indexOf("_")+1);
				mapCriterio.put("actorId", actorId);
			}
		}
		setCriterioBusqueda("criterioBusquedaHito", request, form.armarDetaleCriterioBusquedaHito());
		return CInstrumentoService.findHitosByCriterio(form.getInstrumento().getId(), mapCriterio);
	}

	private List<CHojaRuta> findHojasRuta(CInstrumentoForm form, HttpServletRequest request) throws CException {
		Map<String, String> mapCriterio = new HashMap<String, String>();
		if (StringUtils.isNotEmpty(form.getMappedCriterio("usuarioHojaRuta"))) {
			mapCriterio.put("usuarioAlta", form.getMappedCriterio("usuarioHojaRuta"));
		}
		setCriterioBusqueda("criterioBusquedaHojaRuta", request, form.armarDetaleCriterioBusquedaHojaRuta());
		return CInstrumentoService.findHojaRutaByCriterio(form.getInstrumento().getId(), mapCriterio);
	}

	@Override
	public ActionForward modificar(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CABMDispatchActionForm<?> f = (CABMDispatchActionForm<?>) actionForm;

		this.cargarElemento(f, request, response);

		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		if( (form.getRolUsuario().equalsIgnoreCase("SCJ") || (form.getRolUsuario().equalsIgnoreCase("SCH")))
				&& form.getInstrumento().getTipo().compareTo(ETipoInstrumento.CON)==0  ){
			String input = mapping.getPath().substring(1, mapping.getPath().length());
			request.setAttribute("input", input);
			return mapping.findForward("modificarconveniopdt");
		}
		return mapping.findForward("modificar");
	}

	public void setCriterioBusqueda(String criterioNombre, HttpServletRequest request, String criterio) {
		request.getSession().setAttribute(criterioNombre, criterio);
	}
}
