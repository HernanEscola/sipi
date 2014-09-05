package conicet.apps.svt.web.equipo.action;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.codehaus.jettison.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.object.entidad.CPersonaSVT;
import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.object.equipoHorario.CEquipoHorario;
import conicet.apps.svt.object.equipoHorario.EDiaSemana;
import conicet.apps.svt.object.tipoEntidad.CTipoEntidad;
import conicet.apps.svt.struct.busqueda.CEntidadBusquedaStruct;
import conicet.apps.svt.util.ajax.CJsonResponseMarcaEquipo;
import conicet.apps.svt.util.ajax.CJsonResponseOtroOrganismoYUD;
import conicet.apps.svt.util.ajax.CJsonResponseOtroOrganismoYUDConicet;
import conicet.apps.svt.util.ajax.IJSONResponse;
import conicet.apps.svt.util.autoComplete.CAutoCompletePersona;
import conicet.apps.svt.util.autoComplete.CAutoCompletePrestador;
import conicet.apps.svt.web.dispatcher.action.CAMDispatchAction;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.equipo.decorator.CEquipoWrapper;
import conicet.apps.svt.web.equipo.form.CEquipoForm;
import conicet.apps.svt.web.instrumento.decorator.CInstrumentoWrapper;
import conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaWrapper;
import conicet.auth.helper.UFecha;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;

public abstract class CEquipoAMAction extends CAMDispatchAction {

	public ActionForward detalleEntidad(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CEquipoForm form = (CEquipoForm) actionForm;
		request.setAttribute("selected", form.getMappedProperty());
		request.setAttribute("soloConsulta", "S"); // accede en modo consulta

		/*
		 * Esta linea la agregué para que el Volver del Detalle de la Entidad me
		 * vuelva al mismo lugar de donde vino.
		 */
		setInput(mapping, request);
		return mapping.findForward("entidadDetalle");

	}

	public ActionForward volverDetalle(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		CEquipoForm form = (CEquipoForm) actionForm;
		form.setTab("tab2");
		return mapping.findForward("formulario");

	}

	public ActionForward repag(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("formulario");

	}

	protected boolean relacionAdministracioAprobada(CEntidad e, HttpServletRequest request) throws CException {
		return true;
	}

	@Override
	protected void cargarElemento(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm form = (CEquipoForm) actionForm;
		request.setAttribute("selected", form.getElementoSeleccionado());
	}

	@Override
	protected boolean validar(ActionForm form, HttpServletRequest request, HttpServletResponse response) throws CException {
		return true;
	}

	@Override
	protected void inicializar(ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm form = (CEquipoForm) actionForm;
		form.limpiar();
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		if (sessionManager.getAttribute("comboAños") == null) {
			sessionManager.setAttribute("comboAños", CInstrumentoWrapper.getComboAños());
		}
		if (sessionManager.getAttribute("comboNombres") == null) {
			sessionManager.setAttribute("comboNombres", COfertaTecnologicaWrapper.getComboNombres());
		}
		if (sessionManager.getAttribute("comboDiaSemana") == null) {
			sessionManager.setAttribute("comboDiaSemana", CEquipoWrapper.getComboDiasSemana());
		}
		if (sessionManager.getAttribute("comboHora") == null) {
			sessionManager.setAttribute("comboHora", CEquipoWrapper.getComboHora());
		}


	}
	@Override
	public void inicializarAutoCompletes(CABMDispatchActionForm<?> form) {


		form.agregarAutoComplete(CEquipoForm.EAC.Marca, new CJsonResponseMarcaEquipo(), CMarcaEquipo.class);
		form.agregarAutoComplete(CEquipoForm.EAC.Propietario, new CJsonResponseOtroOrganismoYUDConicet(), CEntidad.class);

		//AC de personas
		IJSONResponse jsonPersona = new CAutoCompletePersona();
		form.agregarAutoComplete(CEquipoForm.EAC.ResponsablePatrimonial, jsonPersona, CEntidad.class);
		form.agregarAutoComplete(CEquipoForm.EAC.ResponsableTecnico,  jsonPersona, CPersonaSVT.class);
		form.agregarAutoComplete(CEquipoForm.EAC.SubresponsablePatrimonial,  jsonPersona, CPersonaSVT.class);

		//AC de organismos
		CEntidadBusquedaStruct ebs = new CEntidadBusquedaStruct();
		ebs.getTiposEntidad().add(new CTipoEntidad(5));
		ebs.getTiposEntidad().add(new CTipoEntidad(4));
		IJSONResponse jsonOrganismo = new CAutoCompletePrestador(ebs);
		form.agregarAutoComplete(CEquipoForm.EAC.InstitucionFinanciadora, jsonOrganismo, COrganismo.class);
		form.agregarAutoComplete(CEquipoForm.EAC.DependenciaUbicado, new CJsonResponseOtroOrganismoYUD(), COrganismo.class);
	}

	@Override
	protected void armarBotones(ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		CABMDispatchActionForm<?> form = (CABMDispatchActionForm<?>) actionForm;
		super.armarBotones(actionForm, request, response);
	}

	public ActionForward agregarResponsableTecnico(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CEquipoForm form = (CEquipoForm) actionForm;
		ActionErrors errors = new ActionErrors();

		if(!form.agregarResponsableTecnico(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward removeResponsableTecnico(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CEquipoForm form = (CEquipoForm) actionForm;
		remove(form.getResponsablesTecnicos(), request);
		return mapping.findForward("formulario");
	}

/*	ESTOS METODOS SON DE LA VERSION ANTERIOR DE ABM EQUIPOS.
	public ActionForward agregarHorario(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CEquipoForm form = (CEquipoForm) actionForm;
		ActionErrors errors = new ActionErrors();

		if(!form.agregarHorario(errors)){
			saveErrors(request, errors);
		}
		return mapping.findForward("formulario");
	}

	public ActionForward removehorario(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CEquipoForm form = (CEquipoForm) actionForm;
		remove(form.getHorarios(), request);
		//form.cargarHorarioString("todos"); // refresca la ventana de horarios
		return mapping.findForward("formulario");
	}
*/

	/**
	 * CARGA HORARIOS EN VENTANA FULLCALENDAR
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @throws CException
	 */
	public void cargarCalendarioEquipo(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm form = (CEquipoForm) actionForm;
		String idEquipo = request.getParameter("idEquipo");
		JSONArray jsonArray = new JSONArray();

		try {
			String ret = "";
			response.setContentType("application/json;charset=UTF-8");
			JSONObject json = null;
			String diaSemana ="";
			//if (form.getEquipo() != null){
				for (CEquipoHorario horario : form.getHorarios()) {

					json = new JSONObject();
					diaSemana=buscarDateSemana(horario.getDiaSemana());
					if (horario.getId()==null){
						json.put("id", diaSemana+horario.getHoraDesde());
					}else{
						json.put("id",horario.getId());
					}
					json.put("start",diaSemana+"T"+horario.getHoraDesde()+":00.000Z");
					// le resto un minuto en la vista para que no se muestre al inicio del dia siguiente, pero se graba 00:00
					if (horario.getHoraHasta().equalsIgnoreCase("00:00") || horario.getHoraHasta().equalsIgnoreCase("24:00") ){
						json.put("end", diaSemana+"T23:59:00.000Z");
					}else{
						json.put("end", diaSemana+"T"+horario.getHoraHasta()+":00.000Z");
					}
					json.put("title",horario.getHoraDesde()+" - "+horario.getHoraHasta());
					json.put("allDay",false);
					jsonArray.add(json);

				}
			//}
			response.getWriter().print(jsonArray);
			// response.getWriter().print(ret);
		} catch (IOException ex) {
			throw new CException(1, ex);
		}
	}

	public String buscarDateSemana(EDiaSemana d){
		Date diaActual =UFecha.hoy();

		Calendar cumpleCal = Calendar.getInstance();
		cumpleCal.setTime(diaActual);
		int nroDiaActual = cumpleCal.get(Calendar.DAY_OF_WEEK);
		//System.out.println(nroDiaActual); //Día 4 = W
		nroDiaActual = nroDiaActual-1;
		int nroDiaPedido =traeNroDeDia(d);
		if (nroDiaPedido==nroDiaActual){
			return diaActual.toString();
		// si el dia pedido es anterios a la fecha del día en el calendario
		}

		Date nuevaFecha=	UFecha.addNDiasAFecha(diaActual,new Long(nroDiaPedido-nroDiaActual));
		return nuevaFecha.toString();

	}

	private int traeNroDeDia(EDiaSemana d){
		if (d.equals(EDiaSemana.L)){
			return 1;
		}else if (d.equals(EDiaSemana.Ma)){
			return 2;
		}else if (d.equals(EDiaSemana.Mi)){
			return 3;
		}else if (d.equals(EDiaSemana.J)){
			return 4;
		}else if (d.equals(EDiaSemana.V)){
			return 5;
		}else if (d.equals(EDiaSemana.S)){
			return 6;
		}
		return 7;
	}





	public EDiaSemana buscarDiaSemana(String fecha) {


		Calendar cumpleCal = Calendar.getInstance();

		cumpleCal.set( (new Integer(fecha.substring(0,4))).intValue(), (new Integer(fecha.substring(5,7))).intValue()-1, (new Integer(fecha.substring(8,10))).intValue() );
		int d = cumpleCal.get(Calendar.DAY_OF_WEEK);

		if (d==1) {
			return EDiaSemana.D;
		} else if (d==2) {
			return EDiaSemana.L;
		} else if (d==3) {
			return EDiaSemana.Ma;
		} else if (d==4) {
			return EDiaSemana.Mi;
		} else if (d==5) {
			return EDiaSemana.J;
		} else if (d==6) {
			return EDiaSemana.V;
		}

		return EDiaSemana.S;
	}



	public void actualizarHorarioEquipo(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws CException {
		CEquipoForm form = (CEquipoForm) actionForm;

		ActionErrors errors = new ActionErrors();

		String horario = request.getParameter("horarioEquipo");
		String accion = request.getParameter("accion");

		//JSONArray jsonArray = new JSONArray();
		org.codehaus.jettison.json.JSONObject jsona = null;
		try {

			String start;
	    	String end;
	    	String titulo;
			jsona = new org.codehaus.jettison.json.JSONObject(horario);
		    CEquipoHorario eq;

		    start = jsona.getString("start");
    	    end = jsona.getString("end");

		    eq =new CEquipoHorario();
		    eq.setDiaSemana(buscarDiaSemana(start.substring(0, 10)));
		    eq.setHoraDesde(start.substring(11,16));
		    eq.setHoraHasta(end.substring(11, 16));
		    if (eq.getHoraHasta().equalsIgnoreCase("23:59")){
		    	eq.setHoraHasta("00:00");
		    }
		    if (accion.equalsIgnoreCase("Alta")){
	    	    form.getHorarios().add(eq);
		    }else if (accion.equalsIgnoreCase("Eliminar")){
		    	for (CEquipoHorario eqAnterior : form.getHorarios()) {
					if (eqAnterior.getDiaSemana().getId().equalsIgnoreCase(eq.getDiaSemana().getId()) && eqAnterior.getHoraDesde().equalsIgnoreCase(eq.getHoraDesde())
						&& eqAnterior.getHoraHasta().equalsIgnoreCase(eq.getHoraHasta())){
						form.getHorarios().remove(eqAnterior);
						break;
					}
				}
			}

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}




}
