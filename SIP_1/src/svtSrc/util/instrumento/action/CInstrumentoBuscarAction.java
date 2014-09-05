package conicet.apps.svt.web.instrumento.action;

import java.net.URLDecoder;
import java.sql.Date;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import ar.gov.conicet.commons.users.exceptions.UsersException;
import ar.gov.conicet.commons.users.models.impl.UsuarioCriterio;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.commons.users.providers.UserDataAccessorProvider;
import conicet.apps.svt.object.convenio.ETipoConvenio;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumento.EEstadoInstrumento;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParte;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.rol.interfaces.IRolBase;
import conicet.apps.svt.service.CGlobalService;
import conicet.apps.svt.service.CInstrumentoService;
import conicet.apps.svt.service.COfertaTecnologicaService;
import conicet.apps.svt.struct.busqueda.CInstrumentoBusquedaStruct;
import conicet.apps.svt.web.dispatcher.action.CBusquedaAction;
import conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoDisplayWrapper;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoWrapper;
import conicet.apps.svt.web.instrumento.form.CInstrumentoBuscarActionForm;
import conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaWrapper;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;
import conicet.framework.util.UFecha;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.util.fecha.CFecha;
import conicet.framework.web.COptionCombo;


public class CInstrumentoBuscarAction extends CBusquedaAction {

	@Override
	public void inicializar(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {

		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) actionForm;
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = ((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));
		inicializarCombos(request,usr);
		form.setTipoBusqueda(" ");
		form.limpiar();
		if(usr.getRol().getId().equals("ACO")){
			form.setExisteBusqueda(true);
			form.setResponsableDescripcion(usr.getUsrRegistrado().getKey().toString());
			form.setEstado(EEstadoInstrumento.TRA.getId());
			form.setResultados(CInstrumentoService.findConvenioByCriterio(armarCriterioBusqueda(form, request)));
		}
	}

	@SuppressWarnings("unchecked")
	public ActionForward initSeguimiento(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) actionForm;
		ActionForward forward = super.init(mapping, actionForm, request, response);
		form.setTipoBusqueda("seguimiento");
		form.setEstadoMultiple(new String[]{ "EJE", "TNV", "TV" });
		form.setResultados(buscar(form, request));
		return forward;
	}


	protected void inicializarCombos(HttpServletRequest request, CUsuarioSvt usr) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		if (sessionManager.getAttribute("comboResponsablesConvenio") == null) {
			if(usr.getRol().getId().equals("ACO")){
				Collection<COptionCombo> combo = CGlobalWrapper.getComboSeleccionar();
				combo.add(new COptionCombo(usr.getUsrRegistrado().getLastName() + ", " + usr.getUsrRegistrado().getFirstName(), usr.getUsrRegistrado().getKey().toString()));
				sessionManager.setAttribute("comboResponsablesConvenio", combo);
			}else{
				sessionManager.setAttribute("comboResponsablesConvenio", CInstrumentoWrapper.getComboResponsablesBusqueda());
			}
		}
		if (sessionManager.getAttribute("comboEstados") == null) {
			sessionManager.setAttribute("comboEstados", CInstrumentoWrapper.getComboEstados());
		}
		if (sessionManager.getAttribute("comboAños") == null) {
			sessionManager.setAttribute("comboAños", CInstrumentoWrapper.getComboAños());
		}
		if (sessionManager.getAttribute("comboCampoAplicacion") == null){
			sessionManager.setAttribute("comboCampoAplicacion", CInstrumentoWrapper.getComboCampoAplicacion(CGlobalService.findCampoAplicacion()));
		}
		if (sessionManager.getAttribute("comboTipoConvenio") == null) {
			sessionManager.setAttribute("comboTipoConvenio", CGlobalWrapper.getComboByIdentityDesc(ETipoConvenio.values()));
		}

		if (sessionManager.getAttribute("comboClasificacionPDT") == null) {
			sessionManager.setAttribute("comboClasificacionPDT", CInstrumentoWrapper.getComboClasificacionPDT(CInstrumentoService.findClasificacionPDT()));
		}
		sessionManager.setAttribute("comboTipoMoneda", COfertaTecnologicaWrapper.getComboTipoMoneda(COfertaTecnologicaService.findTipoMoneda()));
	}

	@Override
	public ActionForward detalle(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) actionForm;
		request.setAttribute("selected", form.getElementoSeleccionado());
		if (form.getTipoBusqueda() != null && form.getTipoBusqueda().equals("seguimiento")) {
			request.setAttribute("seguimiento", true);
		}
		CInstrumento c = (CInstrumento)form.getElementoSeleccionado();
		return mapping.findForward("detalle");
	}

	@Override
	public void inicializarRefrescar(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws Exception
			{

			CInstrumentoBuscarActionForm form =(CInstrumentoBuscarActionForm)actionForm;
			HttpSession sesion = request.getSession();
			IRolBase iRol = (IRolBase)sesion.getAttribute("iRol");
			CUsuarioSvt usr = ((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));
			inicializarCombos(request,usr);

			if(form.getExisteBusqueda()){
				form.setResultados(buscar(form, request));
				criterioBusqueda(form,request);
				ordenarLista(request, form);
			}
			else{
				form.limpiar();
				armarBotones(form, request, response);
				inicializar(mapping,form, request, response);
				form.getResultados().clear();
				form.setResultados(buscarAltasDelDia(form, request));
				criterioBusqueda(form,request);
			}
	}

	protected boolean validar(CInstrumentoBuscarActionForm form,
			HttpServletRequest httpServletRequest) throws CException {
		return true;
	}


	private Date getDateFromString(String fecha) throws CException{
		if(StringUtils.isNotEmpty(fecha)) {
			return CFecha.fechaLatinoToSqlDate(fecha);
		}
		return null;
	}


	@Override
	public void criterioBusqueda(CBusquedaActionForm<?> actionForm, HttpServletRequest request) {
		CSessionManager sessionManager = CSessionManager.getInstance(request);

		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) actionForm;
		Collection col;
		String aGuardar = new String();

		if (!StringUtils.isEmpty(form.getEstado())) {
			if (!"-1".equalsIgnoreCase(form.getEstado()) && (!"-2".equalsIgnoreCase(form.getEstado()))) {
				col = (Collection) sessionManager.getAttribute("comboEstados");
				for (Iterator iter = col.iterator(); iter.hasNext();) {
					COptionCombo item = (COptionCombo) iter.next();
					if (item.getValue().equalsIgnoreCase(form.getEstado())) {
						aGuardar = aGuardar + " Estado : " + item.getLabel() + ",";
						break;
					}
				}
			}
		}

		try {
			if(getDateFromString(form.getFechaDesdeIngreso())!= null)
			{
				aGuardar = aGuardar + " Fecha Desde Ingreso : " + form.getFechaDesdeIngreso()+ ",";
			}
		} catch (CException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			if(getDateFromString(form.getFechaHastaIngreso())!= null)
			{
				aGuardar = aGuardar + " Fecha Hasta Ingreso : " + form.getFechaHastaIngreso()+ ",";
			}
		} catch (CException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



		if(StringUtils.isNotEmpty(form.getPrestadorDescripcion()))
		{
			aGuardar = aGuardar + " Prestador : " + form.getPrestadorDescripcion()+ ",";


		}

		if(CComboWrapper.isSeleccionado(form.getAñoTramite()))
		{
			aGuardar = aGuardar + " Año : " + form.getAñoTramite()+ ",";

		}


		if(StringUtils.isNotEmpty(form.getNroTramite()))
		{
			aGuardar = aGuardar + " Nro. Trámite : " + form.getNroTramite()+ ",";

		}

		if(StringUtils.isNotEmpty(form.getResponsableDescripcion()) && !form.getResponsableDescripcion().equalsIgnoreCase("-1") && !form.getResponsableDescripcion().equalsIgnoreCase("-2")) {
				col = (Collection) sessionManager.getAttribute("comboResponsablesConvenio");
				for (Iterator iter = col.iterator(); iter.hasNext();) {
					COptionCombo item = (COptionCombo) iter.next();
					if (item.getValue().equalsIgnoreCase(form.getResponsableDescripcion())) {
						aGuardar = aGuardar + " Responsable: " + item.getLabel() + ",";
						break;
					}
				}
		}
		if (form.getEsPdt()){
			aGuardar = aGuardar + " Pdt: Sí,";
		}
		if (StringUtils.isNotEmpty(form.getCodigo())) {
			aGuardar += "Código: "+form.getCodigo()+",";
		}
		if (StringUtils.isNotEmpty(form.getPalabrasClave())) {
			aGuardar += "Palabras: "+form.getPalabrasClave()+",";
		}
		if (aGuardar.length() == 0) {
			aGuardar = "No se seleccionaron";
		} else {
			aGuardar = aGuardar.substring(0, aGuardar.length() - 1);
		}
		sessionManager.setAttribute("criterioBusqueda", aGuardar);

	}

	public CInstrumentoBusquedaStruct armarCriterioBusqueda(CInstrumentoBuscarActionForm form,
			HttpServletRequest request) throws CException {

		CInstrumentoBusquedaStruct bs = new CInstrumentoBusquedaStruct();

		if(CComboWrapper.isSeleccionado(form.getTipo()))
		{
			bs.setTipo(ETipoInstrumento.getTipo(form.getTipo()));
		}

		if(CComboWrapper.isSeleccionado(form.getEstado()))
		{
			bs.setEstado(EEstadoInstrumento.getTipo(form.getEstado()));
		}

		if(getDateFromString(form.getFechaDesdeIngreso())!= null)
		{
			bs.setFechaDesde(getDateFromString(form.getFechaDesdeIngreso()));
		}

		if(getDateFromString(form.getFechaHastaIngreso())!= null)
		{
			bs.setFechaHasta(getDateFromString(form.getFechaHastaIngreso()));
		}

		if(StringUtils.isNotEmpty(form.getResponsable()) && CComboWrapper.isSeleccionado(form.getResponsable()) )
		{
			try {
				bs.setResponsable(UserDataAccessorProvider.getUserDataAccesor().darUsuarioByUsrNum(new UsuarioCriterio(new Long(form.getResponsable()))));
			} catch (UsersException e) {
				e.printStackTrace();
			}
		}

		if(StringUtils.isNotEmpty(form.getPrestadorDescripcion()))
		{
			bs.setPrestadorDescripcion(form.getPrestadorDescripcion());
		}

		if(CComboWrapper.isSeleccionado(form.getAñoTramite()))
		{
			bs.setAñoTramite(form.getAñoTramite());
		}


		if(StringUtils.isNotEmpty(form.getNroTramite()))
		{
			bs.setNroTramite(form.getNroTramite());
		}
		if(StringUtils.isNotEmpty(form.getPctiNro()))
		{
			bs.setPctiNro(new Integer(form.getPctiNro()));
		}
		if(StringUtils.isNotEmpty(form.getResponsableDescripcion()) && CComboWrapper.isSeleccionado(form.getResponsableDescripcion()))
		{
			try{
				bs.setResponsable(UserDataAccessorProvider.getUserDataAccesor().darUsuarioByUsrNum(new UsuarioCriterio(Long.parseLong(form.getResponsableDescripcion()))));
			}catch (Exception e) {
				bs.setResponsableDescripcion(form.getResponsableDescripcion());
			}
		}
		// si es pdt filtra, sino trae todo
		if (form.getEsPdt()){
			bs.setEsPdt(form.getEsPdt());
		}

		if(form.getTipoConvenioEnum()!=null){
			bs.setTipoConvenio(form.getTipoConvenioEnum());
		}

		if(StringUtils.isNotEmpty(form.getParticipanteDescripcion())){
			bs.setParticipanteDescripcion(form.getParticipanteDescripcion());
		}


		if(form.getAñoResolucion()!=null){
			bs.setAñoResolucion(form.getAñoResolucion());
		}

		if(StringUtils.isNotEmpty(form.getNumeroResolucion())){
			bs.setNumeroResolucion(form.getNumeroResolucion());
		}


		if(form.getMontoDesdeValue() != null){
			bs.setMontoDesde(form.getMontoDesdeValue());
		}


		if(form.getMontoHastaValue()!=null){
			bs.setMontoHasta(form.getMontoHastaValue());
		}

		if(form.getTipoMonedaValue()!=null){
			bs.setTipoMoneda(form.getTipoMonedaValue());
		}


		if(StringUtils.isNotEmpty(form.getObjeto())){
			bs.setObjeto(form.getObjeto());
		}
		if(StringUtils.isNotEmpty(form.getTituloPdts())){
			bs.setTituloPdts(form.getTituloPdts());
		}

		if(StringUtils.isNotEmpty(form.getParteDescripcion())){
			bs.setParteDescripcion(form.getParteDescripcion());
		}

		if(StringUtils.isNotEmpty(form.getNumeroExpediente())){
			bs.setNumeroExpediente(form.getNumeroExpediente());
		}

		if(form.getAñoExpediente()!=null){
			bs.setAñoExpediente(form.getAñoExpediente());
		}

		if(CComboWrapper.isSeleccionado(form.getClasificacionPDT())){
			bs.setClasificacionPDT(form.getClasificacionPDT());
			bs.setClasificacionPDTIncluirHijos(true);
		}

		if(CComboWrapper.isSeleccionado(form.getCampoAplicacion())){
			bs.setCampoAplicacion(form.getCampoAplicacion());
		}

		if (StringUtils.isNotEmpty(form.getPalabrasClave())) {
			bs.setPalabrasClave(form.getPalabrasClave());
		}
		if (StringUtils.isNotEmpty(form.getCodigo())) {
			bs.setCodigo(form.getCodigo());
		}
		if (null != form.getEstadoMultiple() && form.getEstadoMultiple().length > 0) {
			List<EEstadoInstrumento> estados = new LinkedList<EEstadoInstrumento>();
			for (int i = 0; i < form.getEstadoMultiple().length; i++) {
				if (!form.getEstadoMultiple()[i].equals("-1") && !form.getEstadoMultiple()[i].equals("-2")) {
					estados.add(EEstadoInstrumento.getTipo(form.getEstadoMultiple()[i]));
				}
			}
			bs.setEstados(estados);
		}

		return bs;

	}



	/**
	 * para poder utilizar los sort en displayWrapper hay que cargar este metodo
	 */
	@Override
	protected void ordenarLista(HttpServletRequest request,CBusquedaActionForm<?> bForm) throws CException {
		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) bForm;
		String nombreListado = "instrumento";
		StringBuffer tipo = new StringBuffer();
		StringBuffer order = new StringBuffer();
		getSortParameters(request, nombreListado, order, tipo);
		form.setResultados(CInstrumentoDisplayWrapper.sort(form.getResultados(), tipo.toString(), order.toString()));
	}




	@Override
	protected List<? extends Object> buscar(CBusquedaActionForm<?> form, HttpServletRequest request) throws CException {
		form.setExisteBusqueda(true);
		return CInstrumentoService.findConvenioByCriterio(armarCriterioBusqueda((CInstrumentoBuscarActionForm) form, request));
	}

	@Override
	protected List<? extends Object> buscarAltasDelDia(CBusquedaActionForm<?> cBusquedaActionForm, HttpServletRequest request) throws CException {
		HttpSession sesion = request.getSession();
		CUsuarioSvt usr = ((CUsuarioSvt)sesion.getAttribute("usuarioSVT"));
		inicializarCombos(request,usr);
		CInstrumentoBusquedaStruct bs = new CInstrumentoBusquedaStruct();
		bs.setFechaAlta(UFecha.hoy());
		return CInstrumentoService.findConvenioByCriterio(bs);
	}

	@SuppressWarnings("unchecked")
	public ActionForward getIntervinientes(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		String key = URLDecoder.decode(new String(request.getParameter("key").getBytes("iso-8859-1")), "UTF-8");

		List<CInstrumentoParte> partes = CInstrumentoService.findInstrumentoPartesLikeDescripcion(key);
		JSONArray intervinientes = new JSONArray();
		JSONObject objectArea;
		for (CInstrumentoParte parte : partes) {
			objectArea = new JSONObject();
			objectArea.put("id", (parte.getId().toString()));
			objectArea.put("name", parte.getDescripcion());
			intervinientes.add(objectArea);
		}
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(intervinientes.toJSONString());
		return null;
	}

}
