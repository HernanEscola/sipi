package conicet.apps.svt.web.instrumento.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import conicet.apps.siuvt.object.tipoServicio.CTipoServicio;
import conicet.apps.siuvt.service.CIngresoService;
import conicet.apps.siuvt.web.ingreso.decorator.CFacturaWrapper;
import conicet.apps.svt.object.contacto.CContactoOtroOrganismo;
import conicet.apps.svt.object.contratanteRelacion.ETipoRelacion;
import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.object.gestor.ETipoUvt;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumentoMonto.ETipoMonto;
import conicet.apps.svt.object.instrumentoParticipante.CInstrumentoParticipante;
import conicet.apps.svt.object.instrumentoParticipante.ERolParticipante;
import conicet.apps.svt.object.instrumentoResolucion.ETipoResolucion;
import conicet.apps.svt.object.rol.CRol;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvtGestor;
import conicet.apps.svt.service.CEntidadService;
import conicet.apps.svt.service.CGlobalService;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.service.COfertaTecnologicaService;
import conicet.apps.svt.service.CUsuarioService;
import conicet.apps.svt.struct.CInstrumentoItemDistribucionStruct;
import conicet.apps.svt.struct.busqueda.CContactoBusquedaStruct;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;
import conicet.apps.svt.struct.busqueda.CGestorBusquedaStruct;
import conicet.apps.svt.util.ajax.CJsonResponseContactoOtroOrganismo;
import conicet.apps.svt.util.ajax.CJsonResponseInstrumentoAdmDeFondos;
import conicet.apps.svt.util.ajax.CJsonResponseInstrumentoAdmDelegado;
import conicet.apps.svt.util.archivo.CArchivoUtil;
import conicet.apps.svt.util.autoComplete.CAutoComplete;
import conicet.apps.svt.util.autoComplete.CAutoCompleteContactoContratante;
import conicet.apps.svt.util.autoComplete.CAutoCompleteContratante;
import conicet.apps.svt.util.autoComplete.CAutoCompletePersona;
import conicet.apps.svt.util.autoComplete.CAutoCompletePrestador;
import conicet.apps.svt.util.autoComplete.CAutoCompletePromotor;
import conicet.apps.svt.util.autoComplete.CAutoCompleteUvt;
import conicet.apps.svt.util.valida.CManejadorErrorSVT;
import conicet.apps.svt.web.dispatcher.action.CAMDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoWrapper;
import conicet.apps.svt.web.instrumento.form.CInstrumentoForm;
import conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaWrapper;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;


public abstract class CInstrumentoAMAction extends CAMDispatchAction{



	@Override
	public ActionForward init(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionForward ret = super.init(mapping, actionForm, request, response);
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		return ret;
	}

	public ActionForward seleccionarUvt(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		request.setAttribute("loteAsignados", form.getColUvt());
		request.setAttribute("input", mapping.getPath().substring(1));
		return mapping.findForward("seleccionarUvt");
	}

	public ActionForward volverSeleccionarUvt(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();

		form.setAccion(setearEAccionesAction().getValue());
		Collection<CUvt> col = (Collection<CUvt>) request.getAttribute("loteAsignados");
		if(col!=null){
			if (col.size() > 1) {
				// obtengo a donde tengo que volver cuando salgo de la seleccion
				// de entidad
				errors.add("usuarioAlta", new ActionMessage("errors.dynamic", "Debe seleccionar solo una UVT."));
				saveErrors(request, errors);
				request.setAttribute("loteAsignados", new LinkedList(col));
				request.setAttribute("input", mapping.getPath().substring(1));
				return mapping.findForward("seleccionarUvt");
			} else {
				form.setColUvt(col);
			}
		}

		return mapping.findForward("formulario");
	}

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		form.limpiar();
		inicializarCombos(form,request);
		form.setUsuario((CUsuarioSvt)request.getSession().getAttribute("usuarioSVT"));
		form.getTiposItems().addAll(CIngresoService.findTipoItemFacturacionParaDistribucion());
	  	form.inicializarDistribucion();
	  	form.agregarAutoComplete(CInstrumentoForm.EAC.Delegado, new CJsonResponseInstrumentoAdmDelegado(), CEntidad.class);
	  	form.agregarAutoComplete(CInstrumentoForm.EAC.DeFondos, new CJsonResponseInstrumentoAdmDeFondos(), CUvt.class);
	  	form.agregarAutoComplete(CInstrumentoForm.EAC.ContactoOtrosOrganismos, new CJsonResponseContactoOtroOrganismo(), CContactoOtroOrganismo.class);
	}


	protected void setearResponsableCompleto(CInstrumento i) {
		if (i.getResponsable() != null) {
			try {
				Collection<CRol> roles = new LinkedList<CRol>();
				roles.add(new CRol("CCO"));
				roles.add(new CRol("ACO"));

				Collection<CUsuarioSvt> responsables;
				responsables = CUsuarioService.findUsuariosByRoles(roles);
				for (CUsuarioSvt u : responsables) {
					if (u.getUsrRegistrado().getKey().equals(i.getResponsable().getKey())) {
						i.setResponsable(u.getUsrRegistrado());
						break;
					}
				}
			} catch (CException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	private void inicializarCombos(CInstrumentoForm form, HttpServletRequest request) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = (CUsuarioSvt) sesion.getAttribute("usuarioSVT");

		if (sessionManager.getAttribute("comboResponsablesConvenio") == null) {
			sessionManager.setAttribute("comboResponsablesConvenio", CInstrumentoWrapper.getComboResponsablesBusqueda());
		}
		sessionManager.setAttribute("comboResponsables", CInstrumentoWrapper.getComboResponsablesBySector(((CUsuarioSvtGestor)usr).getGestor()));
		if (sessionManager.getAttribute("comboEstados") == null) {
			sessionManager.setAttribute("comboEstados", CInstrumentoWrapper.getComboEstados());
		}
		if (sessionManager.getAttribute("comboEstadosSinDeshabilitado") == null) {
			sessionManager.setAttribute("comboEstadosSinDeshabilitado", CInstrumentoWrapper.getComboEstadosSinDeshabilitado());
		}

		if (sessionManager.getAttribute("comboEstadosTramite") == null) {
			sessionManager.setAttribute("comboEstadosTramite", CInstrumentoWrapper.getComboEstadosTramite());
		}
		if (sessionManager.getAttribute("comboAlcanceConvenio") == null) {
			sessionManager.setAttribute("comboAlcanceConvenio", CInstrumentoWrapper.getComboAlcanceConvenio());
		}
		if (sessionManager.getAttribute("comboTipoConvenios") == null) {
			sessionManager.setAttribute("comboTipoConvenios", CInstrumentoWrapper.getComboTipoConvenios());
		}
		if (sessionManager.getAttribute("comboActividadPdt") == null) {
			sessionManager.setAttribute("comboActividadPdt", CInstrumentoWrapper.getComboActividadPDT());
		}

		if (sessionManager.getAttribute("comboAños") == null) {
			sessionManager.setAttribute("comboAños", CInstrumentoWrapper.getComboAños());
		}
		if (sessionManager.getAttribute("comboCategoriaPDT") == null) {
			sessionManager.setAttribute("comboCategoriaPDT", CInstrumentoWrapper.getComboCategoriaPDT());
		}
		if (sessionManager.getAttribute("comboTipoMoneda") == null || form.getTiposMoneda()== null || form.getTiposMoneda().isEmpty()) {
			form.setTiposMonedas(COfertaTecnologicaService.findTipoMoneda());
			sessionManager.setAttribute("comboTipoMoneda", COfertaTecnologicaWrapper.getComboTipoMoneda(form.getTiposMoneda()));
		}
	//	if (sessionManager.getAttribute("comboTiposParte") == null) {
			// TRAEO LOS TIPO PARTES QUE PUEDEN ELEGIRSE PARA ALTA O MODIFICAR (el contratante promotor no se puede usar)
			sessionManager.setAttribute("comboTiposParte", CInstrumentoWrapper.getComboTipoPartesElegibles());
	//	}
		if (sessionManager.getAttribute("comboProrrogas") == null) {
			sessionManager.setAttribute("comboProrrogas", CInstrumentoWrapper.getComboProrrogas());
		}

		if (sessionManager.getAttribute("comboTiposResolucion") == null) {
			sessionManager.setAttribute("comboTiposResolucion", CGlobalWrapper.getComboByIdentityDesc(ETipoResolucion.values()));
		}

		if (sessionManager.getAttribute("comboTipoMontos") == null) {
			sessionManager.setAttribute("comboTipoMontos", CGlobalWrapper.getComboByIdentityDesc(ETipoMonto.values()));
		}

		if (sessionManager.getAttribute("comboClasificacionPDT") == null) {
			sessionManager.setAttribute("comboClasificacionPDT", CInstrumentoWrapper.getComboClasificacionPDT(CInstrumentoService.findClasificacionPDTPadre()));
		}
		if (sessionManager.getAttribute("comboCampoAplicacion") == null){
			sessionManager.setAttribute("comboCampoAplicacion", CInstrumentoWrapper.getComboCampoAplicacion(CGlobalService.findCampoAplicacion()));
		}

		if (sessionManager.getAttribute("comboTipoServicio") == null) {
			List<CTipoServicio> tiposServicios = CIngresoService.findTipoServicio();
			Iterator<CTipoServicio> iterator = tiposServicios.iterator();
			while(iterator.hasNext()){
				CTipoServicio s = iterator.next();
				if(s.isRegalia() || s.isOtrosIngresos()){
					iterator.remove();
				}
			}
			form.setComboTiposServicios(tiposServicios);
			sessionManager.setAttribute("comboTipoServicio", CFacturaWrapper.getComboTipoServicio(tiposServicios));
		}

		if (sessionManager.getAttribute("comboRolesParticiantes") == null) {
			sessionManager.setAttribute("comboRolesParticipantes", CGlobalWrapper.getComboByIdentityDesc(ERolParticipante.values()));
		}

		if (sessionManager.getAttribute("comboTiposAdm") == null){
			sessionManager.setAttribute("comboTiposAdm", CInstrumentoWrapper.getComboTipoAdministradoresDescCorta());
		}

		if (sessionManager.getAttribute("comboTipoContactos") == null){
			sessionManager.setAttribute("comboTipoContactos", CInstrumentoWrapper.getComboTipoContactos());
		}
	}

	@Override
	protected void cargarElemento(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws CException {
		// TODO Auto-generated method stub

	}


	@Override
	protected boolean validar(ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) throws CException {
		CInstrumentoForm form = (CInstrumentoForm)actionForm;
		ActionErrors errors = new ActionErrors();
		ActionMessages am = new ActionMessages();

		form.validarFields(errors, am, new CManejadorErrorSVT());
		validarUvt(form,am);
		saveErrors(request, errors);
		saveMessages(request, am);

		if(!errors.isEmpty()){
			return false;
		}

		return true;
	}

	private void validarUvt(CInstrumentoForm form, ActionMessages am) {

		if (form.getUvt()!=null && !form.getUvt().getTipoUvt().equals(ETipoUvt.C)) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("Se ha seleccionado una UVT delegación y no una UVT Central") };
			am.add("instrumento", new ActionMessage("message.dynamic" ,"Se ha seleccionado una UVT delegación y no una UVT Central"));
		}
	}

	public ActionForward setearNroTramite(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();

		String año = request.getParameter("match");

		JSONArray jsonArray = new JSONArray();
		JSONObject json = new JSONObject();
		try {
			Integer nro = CInstrumentoService.findProximoNumeroTramiteByAño(new Integer(año));
			form.setNumeroTramite(nro);
			response.setContentType("application/json;charset=UTF-8");
			json.put("value", nro);
			response.getWriter().print(json);
		} catch (IOException ex) {
			ex.printStackTrace();
			throw new CException(1, ex);
		}
		return null;
	}

	public ActionForward autoCompletePromotor(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CAutoComplete auto= new CAutoCompletePromotor();
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}

	public ActionForward autoCompletePrestador(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CEntidadBusquedaStruct bs = new CEntidadBusquedaStruct();

			bs.getTiposEntidad().add(new CTipoEntidad(4));
			bs.getTiposEntidad().add(new CTipoEntidad(1));
			bs.getTiposEntidad().add(new CTipoEntidad(2));
			bs.getTiposEntidad().add(new CTipoEntidad(3));
		CAutoComplete auto= new CAutoCompletePrestador(bs);
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}

	/**
	 * COMPLETA DATOS DE CONICET SIMULANDO UN AUTOCOMPLETE
	 * @param actionForm
	 * @throws Exception
	 */
	public void completarConicet(ActionForm actionForm) throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CEntidadBusquedaStruct bs = new CEntidadBusquedaStruct();
		bs.getTiposEntidad().add(new CTipoEntidad(4));
		bs.setDescripcion("CONICET");
		Collection col =CEntidadService.findEntidadesByCriterio(bs);
		CEntidad entidadConicet =(CEntidad)col.iterator().next();
		form.getObjetosBuscadosAutocomplete().add(entidadConicet);
		form.setConicetSeleccionado(entidadConicet.getId().toString());
	}

	public ActionForward autoCompleteContraparte(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return autoCompleteInstitucion(mapping, actionForm, request, response);
	}


	public ActionForward autoCompleteContratante(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		CAutoComplete auto= new CAutoCompleteContratante();
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}

	public ActionForward autoCompleteContactoContratante(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CContactoBusquedaStruct cbs = new CContactoBusquedaStruct();
		cbs.setNombreFantasia(request.getParameter("match"));
		cbs.setTipoRelacion(ETipoRelacion.DV);
		CAutoComplete auto= new CAutoCompleteContactoContratante(cbs);
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}

	public ActionForward autoCompleteContratantePromotor(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		CAutoComplete auto= new CAutoCompleteContratante();
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}


	//no eliminar, dejar por las dudas
	public ActionForward autoCompleteInstitucion(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CEntidadBusquedaStruct bs = new CEntidadBusquedaStruct();
			bs.getTiposEntidad().add(new CTipoEntidad(5));
		CAutoComplete auto= new CAutoCompletePrestador(bs);
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}

	public ActionForward autoCompleteUvt(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CGestorBusquedaStruct gs = new CGestorBusquedaStruct();
		gs.setTipoUvt(ETipoUvt.C);
		CAutoComplete auto= new CAutoCompleteUvt(gs);
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}

	public ActionForward autoCompleteParticipante(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		CAutoComplete auto= new CAutoCompletePersona();
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}



	public ActionForward autoCompleteUvtFacturar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		CGestorBusquedaStruct struct = new CGestorBusquedaStruct();
		struct.getTiposUvt().add(ETipoUvt.C);
		struct.getTiposUvt().add(ETipoUvt.D);
		CAutoComplete auto= new CAutoCompleteUvt(struct);
		form.getObjetosBuscadosAutocomplete().addAll(auto.autoCompletar(request, response));
		return null;
	}

	public ActionForward agregarParte(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionErrors errors = new ActionErrors();
		/** completa Conicet**/
		if (StringUtils.isNotEmpty(form.getConicetSeleccionado())){
			completarConicet(actionForm);
		}
		if(!form.agregarParte(errors)){
			saveErrors(request, errors);
		}


		return mapping.findForward("formulario");
	}

	public ActionForward removeParte(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		remove(form.getPartesInstrumento(), request);
		return mapping.findForward("formulario");
	}

	public ActionForward informarproductividad(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		BigDecimal importeAsignado= importeAsignado(form, "PRO");
		// VERIFICA SE HAYA INFORMADO UN IMPORTE PARA PRODUCTIVIDAD
		if (importeAsignado.compareTo(BigDecimal.ZERO)<=0){
			ActionMessages errors = new ActionMessages();
			errors
					.add(
							"instrumento",
							new ActionMessage("errors.dynamic",
									"El Item productividad de la distribución debe ser mayor a $0"));
			saveErrors(request, errors);
			// si volvió null o realizó modificaciones
			form.setAccion(form.getEAccionesAction().getValue());
			return mapping.findForward("formulario");
		}else{
			String input = mapping.getPath().substring(1, mapping.getPath().length());
			request.setAttribute("input",input+"Productividad");
			//guardo los importes porque si me modifican los importes aunque no se graben igualmente van a ser modificados ya q hacen referencia a esos
			form.getMapImportesAnteriores().clear();
			for(CInstrumentoItemDistribucionStruct i :form.getProductividadEntidad())
			{
				form.getMapImportesAnteriores().put(i, i.getImporte());
			}
			request.setAttribute("lote", new LinkedList<CInstrumentoItemDistribucionStruct>(form.getProductividadEntidad()));
			request.setAttribute("importeProductividadString", (importeAsignado(form, "PRO")).toString());
			return mapping.findForward("seleccionarProductividad");
		}
	}


	// TRAE EL IMPORTE ASIGNADO DE segun el codigo
	public BigDecimal importeAsignado(CInstrumentoForm form, String codigo){
		List<CInstrumentoItemDistribucionStruct> col=form.getItemsDistribucionStruct();
		BigDecimal importeAsignado=BigDecimal.ZERO;
		for (CInstrumentoItemDistribucionStruct d : col) {
			if (d.getTipoItem().getCodigo().equalsIgnoreCase(codigo)){
				if (d.getImporte()!=null){
					importeAsignado=d.getImporte();
					break;
				}
			}
		}
		return importeAsignado;
	}



	public ActionForward seleccionarcontraparte(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		BigDecimal importeAsignado=importeAsignado(form, "INS");
		// VERIFICA SE HAYA INFORMADO UN IMPORTE PARA INST.CONTRAPARTE
		if (importeAsignado.compareTo(BigDecimal.ZERO)<=0){
			ActionMessages errors = new ActionMessages();
			errors
					.add(
							"instrumento",
							new ActionMessage("errors.dynamic",
									"El Item comisión Instituto Contraparte de la distribución debe ser mayor a $0"));
			saveErrors(request, errors);
			// si volvió null o realizó modificaciones
			form.setAccion(form.getEAccionesAction().getValue());
			return mapping.findForward("formulario");
		}else{
			String input = mapping.getPath().substring(1, mapping.getPath().length());
			request.setAttribute("input",input);
			//guardo los importes porque si me modifican los importes aunque no se graben igualmente van a ser modificados ya q hacen referencia a esos
			form.getMapImportesAnteriores().clear();
			for(CInstrumentoItemDistribucionStruct i :form.getComisionOtraInstitucion())
			{
				form.getMapImportesAnteriores().put(i, i.getImporte());
			}
			request.setAttribute("lote", new LinkedList<CInstrumentoItemDistribucionStruct>(form.getComisionOtraInstitucion()));
			request.setAttribute("importeContraparteString", (importeAsignado(form,"INS")).toString());
			return mapping.findForward("seleccionarContraparte");
		}
	}



	public ActionForward volverseleccionarcontraparte(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		BigDecimal importeAsignado=importeAsignado(form,"INS");

		if (request.getAttribute("lote") != null) {
			List<CInstrumentoItemDistribucionStruct> lsc =new LinkedList<CInstrumentoItemDistribucionStruct>((Collection<CInstrumentoItemDistribucionStruct>) request
					.getAttribute("lote"));
			if (lsc.size()>0){ //SI SELECCIONO contrapartes

				//---------------------------------------------------------------------------------------------------------------//
				//---------------------------------------------------------------------------------------------------------------//


				BigDecimal totalImporte=BigDecimal.ZERO;
				for (CInstrumentoItemDistribucionStruct pe : lsc) {
					if (pe.getImporte()!=null){
						totalImporte=totalImporte.add(pe.getImporte());
					}
				}
				// si el importe asignado total de productividad es diferente a la suma de los importes por persona
				if (importeAsignado.compareTo(BigDecimal.ZERO)>0 && totalImporte.compareTo(importeAsignado)!=0){
							ActionMessages errors = new ActionMessages();
							errors
									.add(
											"instrumento",
											new ActionMessage("errors.dynamic",
													"El importe total de las contrapartes debe ser igual al informado en el item comisión Contraparte de la distribución"));
							saveErrors(request, errors);
							String input = mapping.getPath().substring(1, mapping.getPath().length());

							request.setAttribute("input", input+"Contraparte");
							request.setAttribute("lote", lsc);
							request.setAttribute("importeContraparteString", importeAsignado.toString());

							return mapping.findForward("seleccionarContraparte");
				}

				// CONTROLAR IMPORTES Y BAJAS CONTRA LO COBRADO
				Map <Long,CInstrumentoItemDistribucionStruct> mapPE =new HashMap<Long,CInstrumentoItemDistribucionStruct>();
				ActionMessages errors = new ActionMessages();

				for (CInstrumentoItemDistribucionStruct pe : lsc) {
					mapPE.put(pe.getOtraInstitucion().getId(),pe);
					if (pe.getImporte()==null || pe.getImporte().compareTo(BigDecimal.ZERO)<=0){
						errors
						.add(
								"instrumento",
								new ActionMessage("errors.dynamic",
										" Informe un importe para la contraparte "+pe.getOtraInstitucion().getDescripcion() ));
						saveErrors(request, errors);
					}
				}

				if (!errors.isEmpty()){
					String input = mapping.getPath().substring(1, mapping.getPath().length());

					request.setAttribute("input", input+"Contraparte");
					request.setAttribute("lote", lsc);
					request.setAttribute("importeContraparteString", importeAsignado.toString());
					return mapping.findForward("seleccionarContraparte");
				}



				// ACTUALIZO LAS MODIFICACIONES REALIZADAS
				Collection<CInstrumentoItemDistribucionStruct> borrar = new LinkedList<CInstrumentoItemDistribucionStruct>();
				for (CInstrumentoItemDistribucionStruct peAnt : form.getComisionOtraInstitucion()){
					CInstrumentoItemDistribucionStruct pe= mapPE.get(peAnt.getOtraInstitucion().getId());
					if (pe==null){
						borrar.add(peAnt);
					}else {
						peAnt.setImporte(pe.getImporte());
						mapPE.remove(peAnt.getOtraInstitucion().getId()); // saco del map todos los que actualizé
					}
				}// BORRA BAJAS
				for (CInstrumentoItemDistribucionStruct pe : borrar) {
					form.getComisionOtraInstitucion().remove(pe);
				}// AGREGA NUEVAS ALTAS
				for (CInstrumentoItemDistribucionStruct pe : mapPE.values()) {
					form.getComisionOtraInstitucion().add(pe);
				}

			}
		}else{// si los importes fueron modificados, lso restablezco
			for(CInstrumentoItemDistribucionStruct i : form.getComisionOtraInstitucion())
			{
				i.setImporte(form.getMapImportesAnteriores().get(i));
			}
		}
		// si volvió null canceló asique no hago nada
		form.setAccion(form.getEAccionesAction().getValue());
		return mapping.findForward("formulario");
	}



	public ActionForward volverseleccionarproductividad(ActionMapping mapping,  ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		BigDecimal importeAsignado=importeAsignado(form,"PRO");

		if (request.getAttribute("lote") != null) {
			List<CInstrumentoItemDistribucionStruct> lsc =new LinkedList<CInstrumentoItemDistribucionStruct>((Collection<CInstrumentoItemDistribucionStruct>) request
					.getAttribute("lote"));
			if (lsc.size()>0){

				BigDecimal totalImporte=BigDecimal.ZERO;
				for (CInstrumentoItemDistribucionStruct pe : lsc) {
					if (pe.getImporte()!=null){
						totalImporte=totalImporte.add(pe.getImporte());
					}
				}
				// si el importe asignado total de productividad es diferente a la suma de los importes por persona
				if (importeAsignado.compareTo(BigDecimal.ZERO)>0){
						if (totalImporte.compareTo(importeAsignado)!=0 ){
							ActionMessages errors = new ActionMessages();
							errors
									.add(
											"instrumento",
											new ActionMessage("errors.dynamic",
													"El importe total de productividad debe ser igual al informado en el item productividad de la distribución"));
							saveErrors(request, errors);
							String input = mapping.getPath().substring(1, mapping.getPath().length());

							request.setAttribute("input", input+"Productividad");
							request.setAttribute("lote", lsc);
							request.setAttribute("importeProductividadString", importeAsignado.toString());

							return mapping.findForward("seleccionarProductividad");
						}
				}

				// CONTROLAR IMPORTES Y BAJAS CONTRA LO COBRADO
				Map <Long,CInstrumentoItemDistribucionStruct> mapPE =new HashMap<Long,CInstrumentoItemDistribucionStruct>();
				ActionMessages errors = new ActionMessages();

				for (CInstrumentoItemDistribucionStruct pe : lsc) {
					mapPE.put(pe.getEntidad().getId(),pe);
					if (pe.getImporte()!=null || pe.getImporte().compareTo(BigDecimal.ZERO)<=0){
						errors
						.add(
								"instrumento",
								new ActionMessage("errors.dynamic",
										" Informe un importe para "+pe.getEntidad().getDescripcion() ));
						saveErrors(request, errors);

					}
				}
				if (!errors.isEmpty()){
					String input = mapping.getPath().substring(1, mapping.getPath().length());

					request.setAttribute("input", input+"Productividad");
					request.setAttribute("lote", lsc);
					request.setAttribute("importeProductividadString", importeAsignado.toString());
					return mapping.findForward("seleccionarProductividad");
				}



				// ACTUALIZO LAS MODIFICACIONES REALIZADAS
				Collection<CInstrumentoItemDistribucionStruct> borrar = new LinkedList<CInstrumentoItemDistribucionStruct>();
				for (CInstrumentoItemDistribucionStruct peAnt : form.getProductividadEntidad()){
					CInstrumentoItemDistribucionStruct pe= mapPE.get(peAnt.getEntidad().getId());
					if (pe==null){
						borrar.add(peAnt);
					}else {
						peAnt.setImporte(pe.getImporte());
						mapPE.remove(peAnt.getEntidad().getId()); // saco del map todos los que actualizé
					}
				}// BORRA BAJAS
				for (CInstrumentoItemDistribucionStruct pe : borrar) {
					form.getProductividadEntidad().remove(pe);
				}// AGREGA NUEVAS ALTAS
				for (CInstrumentoItemDistribucionStruct pe : mapPE.values()) {
					form.getProductividadEntidad().add(pe);
				}

			}else{
				form.getProductividadEntidad().clear();
			}
		}else{// si los importes fueron modificados, lso restablezco
			for(CInstrumentoItemDistribucionStruct i : form.getProductividadEntidad())
			{
				i.setImporte(form.getMapImportesAnteriores().get(i));
			}
		}
		// si volvió null canceló asique no hago nada
		form.setAccion(form.getEAccionesAction().getValue());
		return mapping.findForward("formulario");
	}

	public ActionForward agregarMonto(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();

		if(!form.agregarMonto(errors)){

			saveErrors(request, errors);
		}


		return mapping.findForward("formulario");
	}

	public ActionForward removeMonto(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		remove(form.getMontosInstrumento(), request);
		return mapping.findForward("formulario");
	}

	public ActionForward participacionSeleccionada(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		int index =  Integer.parseInt(request.getParameter("index"));
		String input = mapping.getPath().substring(1, mapping.getPath().length());
		request.setAttribute("input", input);
		if(form.getParticipantesInstrumento().get(index).getId()!=null){
			// si es diferente de null significa q estoy en uan modificacion, y por las dudas hago un find para traer los objetos de la colection que estan en lazy
			CInstrumentoParticipante p = CInstrumentoService.findInstrumentoParticipanteById(form.getParticipantesInstrumento().get(index).getId());
			form.getParticipantesInstrumento().set(index, p);
		}
		request.setAttribute("selected", form.getParticipantesInstrumento().get(index));
		return mapping.findForward("altaParticipacion");
	}


	public ActionForward agregarParticipante(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();
		if(!form.agregarParticipante(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	/**
	 * Agregar: AGREGA RESOLUCIONES O DISPOSICIONES.
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward agregar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();
		if(!form.agregarResolucion(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward removeResolucion(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		remove(form.getResoluciones(), request);
		return mapping.findForward("formulario");
	}

	public ActionForward removeParticipante(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		remove(form.getParticipantesInstrumento(), request);
		return mapping.findForward("formulario");
	}


	public ActionForward removearchivo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		form.setPlanDeTrabajo(null);

		return mapping.findForward("formulario");
	}

	public ActionForward uploadarchivo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		CInstrumentoForm form = (CInstrumentoForm) actionForm;

		ActionErrors er = form.getErrors();

		if(!er.isEmpty())
		{
			saveErrors(request, er);
			form.setFilePlanDeTrabajo(null);
		}

		return mapping.findForward("formulario");
	}

	public void descargarplandetrabajo(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm f = (CInstrumentoForm)actionForm;
	 	CArchivoUtil.descargarArchivo(request, response, f.getPlanDeTrabajo());
	}

	@Override
	public void inicializarAutoCompletes(CABMDispatchActionForm<?> form) {
		// TODO Auto-generated method stub
	}

	public ActionForward agregarAdm(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();
		if(!form.agregarAdm(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward agregarUD(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();
		if(!form.agregarUD(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward agregarContacto(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		ActionMessages errors = new ActionMessages();
		if(!form.agregarContacto(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward removeAdm(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		remove(form.getAdministradoresInstrumento(), request);
		return mapping.findForward("formulario");
	}

	public ActionForward removeUD(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		remove(form.getUdsInstrumento(), request);
		return mapping.findForward("formulario");
	}

	public ActionForward removeContacto(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoForm form = (CInstrumentoForm) actionForm;
		remove(form.getContactosInstrumento(), request);
		return mapping.findForward("formulario");
	}
}
