package conicet.apps.svt.web.equipo.form;

import java.lang.reflect.Field;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.domicilio.CDomicilio;
import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.COrganismo;
import conicet.apps.svt.object.entidad.CPersonaSVT;
import conicet.apps.svt.object.equipo.CEquipo;
import conicet.apps.svt.object.equipo.CEquipoNombre;
import conicet.apps.svt.object.equipo.CMarcaEquipo;
import conicet.apps.svt.object.equipo.EEquipoAdherido;
import conicet.apps.svt.object.equipoHorario.CEquipoHorario;
import conicet.apps.svt.object.equipoHorario.EDiaSemana;
import conicet.apps.svt.object.equipoResponsableTecnico.CEquipoResponsableTecnico;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.apps.svt.web.equipo.decorator.CEquipoWrapper;
import conicet.apps.svt.web.util.action.CComboPaisAction;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.util.constantes.CConstantes;
import conicet.framework.validator.annotation.AField;

public class CEquipoForm extends CABMDispatchActionForm<CEquipo> {

	private String anioAdquisicion;
	private String descripcion;
	private String modelo;
	private String nroPatrimonio;
	private String input; // seteo el retorno al form

	private String tab = "tabEquipo";
	private String propietarioDescripcion;
	private String mappedForward;
	private Object mappedProperty;
	private CEquipo equipo;
	private String bloquearDatos;
	private String equipoId;
	// nuevos campos
	private String nombre;
	private String nombreId;
	private String tipo;
	private String subtipo;
	private String nroSerie;
	private CDomicilio cDomicilio;
	private String tipoAdhesion = EEquipoAdherido.NA.getId();
	private String codigo;
	private String laboratorio;
	private CEntidad responsablePatrimonial;
	private String domicilio;
	private String pais;
	private String provincia;
	private String partido;
	private String localidad;
	private List<CEquipoResponsableTecnico> responsablesTecnicos = new LinkedList<CEquipoResponsableTecnico>();
	private final boolean tienePropietario = true;

	private String anioFabricacion;
    private String anioPuestaEnFuncionamiento;

    private List<CEquipoHorario> horarios =new LinkedList<CEquipoHorario>();



    private String diaSemana;
    private String horaDesde;
    private String horaHasta;




	public enum EAC {
		Marca, ResponsablePatrimonial, Propietario, ResponsableTecnico, DependenciaUbicado,InstitucionFinanciadora,SubresponsablePatrimonial
	}

	@Override
	public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
		ActionErrors errors = new ActionErrors();
		if (!getMethod().equals("init") && (getEAccionesAction().equals(EAccionesAction.alta) || getEAccionesAction().equals(EAccionesAction.modificar))) {
			if (getBtnSubmit().equalsIgnoreCase("Registrar")) {
				if ( !CComboWrapper.isSeleccionado(this.nombreId)){
					errors.add("altaEquipo", new ActionMessage("errors.required", "El Nombre"));
				}
				if (StringUtils.isEmpty(this.getDescripcion())) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "La Descripción"));
				}
				if (StringUtils.isEmpty(this.getTipo())) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "El Tipo"));
				}
				if (StringUtils.isEmpty(getAutoCompleteMappedId(EAC.Marca.name()))) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "La Marca"));
				}
				if (StringUtils.isEmpty(this.getNroSerie())) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "El Nro. de Serie"));
				}
				if (getDataAutoComplete(EAC.Propietario) == null) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "El Propietario"));
				}
				if (!StringUtils.isNumeric(this.getNroPatrimonio())) {
					errors.add("altaEquipo", new ActionMessage("errors.dynamic", "El Patrimonio debe tener dígitos numéricos."));
				}
				if (!CComboWrapper.isSeleccionado(this.getAnio())) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "El Año de adqisición"));
				}
				if (EEquipoAdherido.SN.equals(EEquipoAdherido.getTipo(this.tipoAdhesion))) {

					if (StringUtils.isEmpty(this.getCodigo())) {
						errors.add("altaEquipo", new ActionMessage("errors.required", "El Código"));
					}
					if (StringUtils.isEmpty(this.getLaboratorio())) {
						errors.add("altaEquipo", new ActionMessage("errors.required", "El Laboratorio"));
					}
				}
				if (getDataAutoComplete(EAC.DependenciaUbicado) == null) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "La Dependencia donde se encuentra"));
				}
				if (StringUtils.isEmpty(domicilio)) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "El Domicilio"));
				}
				if (!CComboWrapper.isSeleccionado(this.pais)) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "El País"));
				}
				if (this.responsablesTecnicos == null || this.responsablesTecnicos.isEmpty()) {
					errors.add("altaEquipo", new ActionMessage("errors.required", "El Responsable Técnico"));
				}
				if (this.pais.equalsIgnoreCase(CConstantes.paisArgentina)) {

					if (!CComboWrapper.isSeleccionado(this.getProvincia())) {
						errors.add("altaEquipo", new ActionMessage("errors.required", "La Provincia"));
					}
					if (!CComboWrapper.isSeleccionado(getPartido())) {
						errors.add("altaEquipo", new ActionMessage("errors.required", "El Partido"));
					}
					if (!CComboWrapper.isSeleccionado(this.getLocalidad())) {
						errors.add("altaEquipo", new ActionMessage("errors.required", "La Localidad"));
					}
				}
			}

		}
		return errors;
	}

	@Override
	public void reset(ActionMapping mapping, ServletRequest request) {
		String accion = request.getParameter("accion");
		String boton = request.getParameter("btnSubmit");
		if ("alta".equalsIgnoreCase(accion) && "Siguiente".equalsIgnoreCase(boton)) {
			this.descripcion = null;
			this.anioAdquisicion = null;
			this.modelo = null;
			this.nroPatrimonio = null;
		}
	}

	public String getAnio() {
		return anioAdquisicion;
	}

	public void setAnio(String anio) {
		this.anioAdquisicion = anio;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getNroPatrimonio() {
		return nroPatrimonio;
	}

	public void setNroPatrimonio(String nroPatrimonio) {
		this.nroPatrimonio = nroPatrimonio;
	}

	@Override
	public String getInput() {
		return input;
	}

	@Override
	public void setInput(String input) {
		this.input = input;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	@Override
	public void limpiar() {
		super.limpiar();
		this.anioAdquisicion = "";
		this.descripcion = "";
		this.modelo = "";
		this.nroPatrimonio = "";

		this.propietarioDescripcion = null;
		this.equipo = null;
		this.equipoId="";
		this.nombre = null;
		this.nombreId=null;
		this.tipo = null;
		this.subtipo = null;
		this.nroSerie = null;
		this.cDomicilio = null;
		this.tipoAdhesion = EEquipoAdherido.NA.getId();
		this.codigo = null;
		this.laboratorio = null;
		this.responsablePatrimonial = null;
		this.domicilio = null;
		this.pais = null;
		this.provincia = null;
		this.partido = null;
		this.localidad = null;
		this.responsablesTecnicos.clear();
		this.anioPuestaEnFuncionamiento= null;
		this.anioFabricacion =null;
		this.tab = "tabEquipo";

		this.horarios.clear();

		this.diaSemana ="";
		this.horaDesde="";
		this.horaHasta="";

	}

	public String getMappedForward() {
		return mappedForward;
	}

	public void setMappedForward(String mappedForward) {
		this.mappedForward = mappedForward;
	}

	public Object getMappedProperty() {
		return mappedProperty;
	}

	public void setMappedProperty(Object mappedProperty) {
		this.mappedProperty = mappedProperty;
	}

	@Override
	public CEquipo getData() {
		CEquipo equipo = null;
		if (this.getEquipo() == null) {
			equipo = new CEquipo();
		} else {
			equipo = this.equipo;
		}


		equipo.setDescripcion(getValidValueFromAttribute(this.descripcion));
		equipo.setModelo(getValidValueFromAttribute(this.modelo));
		equipo.setNroPatrimonio(getValidValueFromAttribute(this.nroPatrimonio));
		if ( CComboWrapper.isSeleccionado(this.nombreId)){
			equipo.setNombreId(new CEquipoNombre(new Long(this.nombreId)));
		}else{
			equipo.setNombreId(null);
		}

		equipo.setTipo(getValidValueFromAttribute(this.tipo));
		equipo.setSubTipo(getValidValueFromAttribute(this.subtipo));
		equipo.setNroSerie(getValidValueFromAttribute(this.nroSerie));
		equipo.setDomicilio(getCDomicilio());
		equipo.setCodigo(getValidValueFromAttribute(this.codigo));
		equipo.setLaboratorio(getValidValueFromAttribute(this.laboratorio));


		equipo.setAnioAdquisicion(getValidValueFromCombo(this.anioAdquisicion));
		equipo.setAnioFabricacion(getValidValueFromCombo(this.anioFabricacion));
		equipo.setAnioPuestaEnFuncionamiento(getValidValueFromCombo(this.anioPuestaEnFuncionamiento));

		equipo.setTipoAdhesion(EEquipoAdherido.getTipo(this.tipoAdhesion));

		equipo.setPropietario((CEntidad) getDataAutoComplete(EAC.Propietario));
		equipo.setPropietarioDescripcion(null);


		equipo.setMarcaEquipo((CMarcaEquipo) getDataAutoComplete(EAC.Marca));
		equipo.setResponsablePatrimonial((CEntidad) getDataAutoComplete(EAC.ResponsablePatrimonial));

		equipo.getResponsablesTenicos().clear();
		equipo.getResponsablesTenicos().addAll(this.responsablesTecnicos);

		equipo.getEquipoHorario().clear();
		equipo.getEquipoHorario().addAll(this.getHorarios());

		equipo.setSubresponsable((CPersonaSVT) getDataAutoComplete(EAC.SubresponsablePatrimonial));
		equipo.setDependenciaUbicado((COrganismo) getDataAutoComplete(EAC.DependenciaUbicado));
		equipo.setInstitucionFinanciadora((COrganismo) getDataAutoComplete(EAC.InstitucionFinanciadora));



		return equipo;
	}

	@Override
	public void setData(CEquipo equipo) {
		this.setEquipo(equipo);
		this.setEquipoId(equipo.getId().toString());
		this.setDescripcion(equipo.getDescripcion());
		this.setModelo(equipo.getModelo());
		this.setAnio(equipo.getAnioAdquisicion());
		this.setAnioFabricacion(equipo.getAnioFabricacion());
		this.setAnioPuestaEnFuncionamiento(equipo.getAnioPuestaEnFuncionamiento());
		this.setNroPatrimonio(equipo.getNroPatrimonio());
		this.setPropietarioDescripcion(equipo.getPropietarioDescripcion());

		this.nombre = equipo.getNombre();
		if (equipo.getNombreId()!=null){
			this.nombreId =equipo.getNombreId().getId().toString();
		}
		this.tipo = equipo.getTipo();
		this.subtipo = equipo.getSubTipo();
		this.nroSerie = equipo.getNroSerie();
		setCDomicilio(equipo.getDomicilio());
		if (equipo.getTipoAdhesion() != null) {
			this.tipoAdhesion = equipo.getTipoAdhesion().getId();
		}
		this.codigo = equipo.getCodigo();
		this.laboratorio = equipo.getLaboratorio();

		if (equipo.getResponsablePatrimonial() != null) {
			setDataAutoComplete(EAC.ResponsablePatrimonial, equipo.getResponsablePatrimonial(), equipo.getResponsablePatrimonial().getDescripcion());
		}
		if (equipo.getMarcaEquipo() != null) {
			setDataAutoComplete(EAC.Marca, equipo.getMarcaEquipo(), equipo.getMarcaEquipo().getNombre());
		}
		if (equipo.getPropietario() != null) {
			setDataAutoComplete(EAC.Propietario, equipo.getPropietario(), equipo.getPropietario().getDescripcion());
		}
		if (equipo.getDependenciaUbicado() != null) {
			setDataAutoComplete(EAC.DependenciaUbicado, equipo.getDependenciaUbicado(), equipo.getDependenciaUbicado().getDescripcion());
		}
		if (equipo.getInstitucionFinanciadora() != null) {
			setDataAutoComplete(EAC.InstitucionFinanciadora, equipo.getInstitucionFinanciadora(), equipo.getInstitucionFinanciadora().getDescripcion());
		}
		if (equipo.getSubresponsable() != null) {
			setDataAutoComplete(EAC.SubresponsablePatrimonial, equipo.getSubresponsable(), equipo.getSubresponsable().getDescripcion());
		}


		this.responsablesTecnicos = new LinkedList<CEquipoResponsableTecnico>(equipo.getResponsablesTenicos());

		this.horarios = new LinkedList<CEquipoHorario>(CEquipoWrapper.ordenarByAlfabeto(equipo.getEquipoHorario()));

	}


	private void setCDomicilio(CDomicilio d) {
		this.cDomicilio = d;
		if (d != null) {
			this.domicilio = d.getDomicilio();
			if (d.getPais() != null) {
				this.pais = d.getPais().getCodigo();
				if (d.getProvincia() != null) {
					this.provincia = d.getProvincia().getCodigo();
					{
						this.partido = d.getPartido().getCodigo();
						this.localidad = d.getLocalidad().getCodigo();
					}
				}
			}
		}
	}

	public boolean getTieneDomicilio() {
		if (StringUtils.isNotEmpty(this.domicilio) || CComboWrapper.isSeleccionado(this.pais)) {
			return true;
		} else {
			return false;
		}
	}

	public CDomicilio getCDomicilio() {
		CDomicilio d = null;
		if (getTieneDomicilio()) {
			if (this.cDomicilio != null) {
				d = this.cDomicilio;
			} else {
				d = new CDomicilio();
			}

			d.setDomicilio(this.domicilio);
			CComboPaisAction.setearPaisProvinciaPartidoLocalidadByIDomicilio(d, this.pais, this.provincia, this.partido, this.localidad);
			return d;
		} else {
			return null;
		}
	}

	@Override
	public void validarField(AField annotation, Field attr, ActionErrors ae) throws Exception {
		// TODO Auto-generated method stub

	}

	/*
	 * @Override public void reset(ActionMapping mapping, ServletRequest
	 * request) { // TODO Auto-generated method stub super.reset(mapping,
	 * request); this.sistemaNacional = false; }
	 */

	public CEquipo getEquipo() {
		return equipo;
	}

	public void setEquipo(CEquipo equipo) {
		this.equipo = equipo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getSubtipo() {
		return subtipo;
	}

	public void setSubtipo(String subTipo) {
		this.subtipo = subTipo;
	}

	public String getNroSerie() {
		return nroSerie;
	}

	public void setNroSerie(String nroSerie) {
		this.nroSerie = nroSerie;
	}

	public CDomicilio getcDomicilio() {
		return cDomicilio;
	}

	public void setcDomicilio(CDomicilio cDomicilio) {
		this.cDomicilio = cDomicilio;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getLaboratorio() {
		return laboratorio;
	}

	public void setLaboratorio(String laboratorio) {
		this.laboratorio = laboratorio;
	}

	public CEntidad getResponsablePatrimonial() {
		return responsablePatrimonial;
	}

	public void setResponsablePatrimonial(CEntidad responsablePatrimonial) {
		this.responsablePatrimonial = responsablePatrimonial;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getPartido() {
		return partido;
	}

	public void setPartido(String partido) {
		this.partido = partido;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public String getPropietarioDescripcion() {
		return propietarioDescripcion;
	}

	public void setPropietarioDescripcion(String descripcionPropietario) {
		this.propietarioDescripcion = descripcionPropietario;
	}

	public String getBloquearDatos() {
		return bloquearDatos;
	}

	public void setBloquearDatos(String bloquearDatos) {
		this.bloquearDatos = bloquearDatos;
	}

	public String getTipoAdhesion() {
		return tipoAdhesion;
	}

	public void setTipoAdhesion(String procedencia) {
		this.tipoAdhesion = procedencia;
	}

	public String getSistemaNacionalId() {
		return EEquipoAdherido.SN.getId();
	}

	public String getGrandesInstrumentosId() {
		return EEquipoAdherido.SG.getId();
	}

	public String getNingunoId() {
		return EEquipoAdherido.NA.getId();
	}

	public boolean getTienePropietario() {
		return tienePropietario;
	}

	public boolean agregarResponsableTecnico(ActionErrors errors) {
		CEquipoResponsableTecnico ip = null;
		CPersonaSVT persona = (CPersonaSVT) getDataAutoComplete(EAC.ResponsableTecnico);

		if (persona == null) {
			errors.add("equipo", new ActionMessage("errors.dynamic", "Debe selecionar una persona."));
			return false;
		} else {
			for (CEquipoResponsableTecnico p : responsablesTecnicos) {
				if (p.getResponsable().getId().equals(persona.getId())) {
					errors.add("equipo", new ActionMessage("errors.dynamic", persona.getNombreCompleto() + " ya se encuentre seleccionado como responsable técnico."));
					return false;
				}
			}
			ip = new CEquipoResponsableTecnico();
			ip.setResponsable(persona);
			responsablesTecnicos.add(ip);

			getAutoCompleteMapAttribute(EAC.ResponsableTecnico.name()).limpiar();
			return true;
		}
	}

	public String controlHoraHasta(String hora_hasta){
		if (hora_hasta.equalsIgnoreCase("00:00")){
			return "24:00";
		}
		return hora_hasta;
	}
	public boolean agregarHorario(ActionErrors errors) {
		CEquipoHorario eqH = null;
		if(!CComboWrapper.isSeleccionado(this.getDiaSemana()) ){
			errors.add("equipo", new ActionMessage("errors.dynamic", "Debe seleccionar un día de la semana."));
			return false;
		}
		if(!CComboWrapper.isSeleccionado(this.getHoraDesde()) || !CComboWrapper.isSeleccionado(this.getHoraHasta()) ){
			errors.add("equipo", new ActionMessage("errors.dynamic", "Debe seleccionar hora desde y hasta."));
			return false;
		}
		if (this.getHoraDesde().compareToIgnoreCase(this.getHoraHasta())==0){
			errors.add("equipo", new ActionMessage("errors.dynamic", "La hora desde debe ser menor que la hora hasta."));
			return false;
		}


		if (this.getHoraDesde().compareToIgnoreCase(controlHoraHasta(this.getHoraHasta()))>=0  ){
			errors.add("equipo", new ActionMessage("errors.dynamic", "La hora desde debe ser menor que la hora hasta."));
			return false;
		}

		for (CEquipoHorario eh : horarios) {
			if (eh.getDiaSemana().getId().equalsIgnoreCase(this.getDiaSemana()) ){
				if (eh.getHoraDesde().equalsIgnoreCase(this.getHoraDesde())
					&& eh.getHoraHasta().equalsIgnoreCase(this.getHoraHasta())){
				errors.add("equipo", new ActionMessage("errors.dynamic", "El horario que esta informando ya se encuentra seleccionado."));
				return false;
				}else {
					if (this.getHoraDesde().compareToIgnoreCase(eh.getHoraDesde())<=0 && controlHoraHasta(this.getHoraHasta()).compareToIgnoreCase(eh.getHoraDesde())>0 ){
						errors.add("equipo", new ActionMessage("errors.dynamic", "El horario que esta informando se superpone con otro ya seleccionado."));
						return false;
					}else if (this.getHoraDesde().compareToIgnoreCase(eh.getHoraDesde())>0 && ( this.getHoraDesde().compareToIgnoreCase(controlHoraHasta(eh.getHoraHasta()))<0)){
						errors.add("equipo", new ActionMessage("errors.dynamic", "El horario que esta informando se superpone con otro seleccionado."));
						return false;
					}

				}
			}


		}
		eqH = new CEquipoHorario();
		eqH.setDiaSemana(EDiaSemana.getTipo(diaSemana));
		eqH.setHoraDesde(this.getHoraDesde());
		eqH.setHoraHasta(this.getHoraHasta());
		this.horarios.add(eqH);
		// lo agrego a la lista que debe estar ordenada
		this.horarios= CEquipoWrapper.ordenarByAlfabeto(this.horarios);

		this.diaSemana="";
		this.horaDesde="";
		this.horaHasta="";


		return true;
	}


	public List<CEquipoResponsableTecnico> getResponsablesTecnicos() {
		return responsablesTecnicos;
	}

	public void setResponsablesTecnicos(List<CEquipoResponsableTecnico> responsablesTecnicos) {
		this.responsablesTecnicos = responsablesTecnicos;
	}

	public String getAnioPuestaEnFuncionamiento() {
		return anioPuestaEnFuncionamiento;
	}

	public void setAnioPuestaEnFuncionamiento(String anioPuestaEnFuncionamiento) {
		this.anioPuestaEnFuncionamiento = getValidValueFromCombo(anioPuestaEnFuncionamiento);
	}

	public String getAnioFabricacion() {
		return anioFabricacion;
	}

	public void setAnioFabricacion(String anioFabricacion) {
		this.anioFabricacion = getValidValueFromCombo(anioFabricacion);
	}

	public String getNombreId() {
		return nombreId;
	}

	public void setNombreId(String nombreId) {
		this.nombreId = nombreId;
	}

	public List<CEquipoHorario> getHorarios() {
		return horarios;
	}

	public void setHorarios(List<CEquipoHorario> horarios) {
		this.horarios = horarios;
	}

	public String getDiaSemana() {
		return diaSemana;
	}

	public void setDiaSemana(String diaSemana) {
		this.diaSemana = diaSemana;
	}

	public String getHoraDesde() {
		return horaDesde;
	}

	public void setHoraDesde(String horaDesde) {
		this.horaDesde = horaDesde;
	}

	public String getHoraHasta() {
		return horaHasta;
	}

	public void setHoraHasta(String horaHasta) {
		this.horaHasta = horaHasta;
	}

	public String getDiaHorarioView(String dia) {
		String texto="";
		for (CEquipoHorario eh : this.horarios) {
			if (eh.getDiaSemana().getId().equalsIgnoreCase(dia)){
				texto=texto+"<div>"+eh.getHoraDesde()+" a "+eh.getHoraHasta()+"</div>";
			}
		}
		return texto;

	}



	public String getDiaHorario(String dia) {
		String texto="";
		for (CEquipoHorario eh : this.horarios) {

			Integer index= this.horarios.indexOf(eh);
			if (eh.getDiaSemana().getId().equalsIgnoreCase(dia)){
				texto=texto+armarHtmlHorario(eh,index);
			}
		}
		return texto;

	}


	private String armarHtmlHorario(CEquipoHorario eh, Integer index){
		String s= "<div>"+eh.getHoraDesde()+" a "+eh.getHoraHasta()+"<a href='#' onclick=\"removeFromDisplayWrapper('Horario',"+index.toString() +", 'method')\"><img src='./imagenes/close.png' align='top'/></a></div>";
		return s;
	}

	public String getEquipoId() {
		return equipoId;
	}

	public void setEquipoId(String equipoId) {
		this.equipoId = equipoId;
	}


}
