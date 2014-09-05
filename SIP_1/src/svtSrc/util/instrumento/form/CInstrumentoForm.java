package conicet.apps.svt.web.instrumento.form;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import conicet.apps.commons.users.providers.UsuarioObjectProvider;
import conicet.apps.siuvt.object.tipoItemFacturacion.CTipoItemFacturacion;
import conicet.apps.siuvt.object.tipoServicio.CTipoServicio;
import conicet.apps.siuvt.web.ingreso.form.CFacturaAMForm;
import conicet.apps.svt.object.EAccionesAction;
import conicet.apps.svt.object.archivo.CArchivo;
import conicet.apps.svt.object.clasificacionPDT.CClasificacionPDT;
import conicet.apps.svt.object.contacto.CContactoContratante;
import conicet.apps.svt.object.contacto.CContactoOtroOrganismo;
import conicet.apps.svt.object.contratante.CContratante;
import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.entidad.CPersonaSVT;
import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumento.ECategoriaPDT;
import conicet.apps.svt.object.instrumento.EEstadoInstrumento;
import conicet.apps.svt.object.instrumento.EEstadoTramiteInstrumento;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.apps.svt.object.instrumento.ETipoProrroga;
import conicet.apps.svt.object.instrumento.hito.CHito;
import conicet.apps.svt.object.instrumento.hito.hitoActor.CHitoActor.CHitoActorDiscriminator;
import conicet.apps.svt.object.instrumento.hojaRuta.CHojaRuta;
import conicet.apps.svt.object.instrumentoItemDistribucion.CInstrumentoItemDistribucion;
import conicet.apps.svt.object.instrumentoItemDistribucion.CInstrumentoItemDistribucionOtraInstitucion;
import conicet.apps.svt.object.instrumentoItemDistribucion.CInstrumentoItemDistribucionProductividad;
import conicet.apps.svt.object.instrumentoItemTramite.CInstrumentoItemTramite;
import conicet.apps.svt.object.instrumentoMonto.CInstrumentoMonto;
import conicet.apps.svt.object.instrumentoMonto.ETipoMonto;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParte;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteContacto;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteContratante;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteEntidad;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteUvt;
import conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento;
import conicet.apps.svt.object.instrumentoParticipante.CInstrumentoParticipante;
import conicet.apps.svt.object.instrumentoParticipante.ERolParticipante;
import conicet.apps.svt.object.instrumentoResolucion.CInstrumentoResolucion;
import conicet.apps.svt.object.instrumentoResolucion.ETipoActividadPDT;
import conicet.apps.svt.object.instrumentoResolucion.ETipoResolucion;
import conicet.apps.svt.object.tipoMoneda.CTipoMoneda;
import conicet.apps.svt.object.usuarioSvt.CUsuarioSvt;
import conicet.apps.svt.struct.CInstrumentoItemDistribucionStruct;
import conicet.apps.svt.util.valida.CValidaFecha;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.framework.error.CException;
import conicet.framework.hibernate3.object.campoAplicacion.CCampoAplicacion;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.util.fecha.CFecha;
import conicet.framework.validator.CValidator;
import conicet.framework.validator.annotation.AField;
import conicet.framework.validator.decorator.IValidable;
import conicet.framework.validator.tipoField.TipoField;
import conicet.framework.web.COptionCombo;

public abstract class CInstrumentoForm extends CABMDispatchActionForm<CInstrumento> {

	private final boolean soloDistribucionExcel = true;
	private String tab = "datos";
	@AField(required = true, label = "El año", ordenValidacion = 1, extraValidation = true)
	private Integer año;

	private String sector;

	private String carpetin;
	private Integer duracion;
	private String duracionEventoDesde;
	@AField(required = true, label = "La Fecha de Fin", ordenValidacion = 13, tipo=TipoField.FECHA, extraValidation = true)
	private String fechaFin;

	@AField(required = true, label = "La Fecha de Ingreso a DVTS", ordenValidacion = 11, tipo=TipoField.FECHA,extraValidation = true)
	private String fechaIngresoDVTS;
	@AField(required = true, label = "La Fecha de Inicio", ordenValidacion = 12, tipo=TipoField.FECHA, extraValidation = true)
	private String fechaInicio;
	private BigDecimal monto;
	private BigDecimal montoOtraMoneda;
	private Integer numeroTramite;
	@AField(required = true, label = "El objeto", ordenValidacion = 2, extraValidation = true)
	private String objeto;

	private String tituloPdts;
	@AField(required = true, label = "El objeto de divulgación", ordenValidacion = 14, extraValidation = true)
	private String objetoDivulgacion;
	private String patente;
	@AField(ordenValidacion = 14, extraValidation = true, label = "")
	private String observacionesFin;
	private Integer otraMoneda; // debería ser un tipo
	private boolean publicarWeb;
	@AField(required = true, label = "El responsable", ordenValidacion = 5, extraValidation = true)
	private String responsable;
	private String responsableTecnico;
	private String otrosIngresos;
	private CUvt uvt;
	private List<CTipoServicio> comboTiposServicios;

	@AField(required = true, label = "El estado", ordenValidacion = 7, extraValidation = true)
	protected EEstadoInstrumento estado;
	protected EEstadoTramiteInstrumento estadoTramite;
	protected ETipoProrroga prorroga;
	protected ETipoInstrumento tipo;
	private ERolParticipante rolParticipante;

	private CPersonaSVT participante;

	protected ECategoriaPDT categoriaPDT;
	private boolean esPDT;
	private EFuncionParteInstrumento tipoParteAgregar;
	private EFuncionParteInstrumento tipoAdmAgregar;
	private EFuncionParteInstrumento tipoContactoAgregar;


	private List<CInstrumentoItemTramite> itemsTramite;
	@AField(required = true, label = "Las Partes", ordenValidacion = 6, extraValidation = true)
	private List<CInstrumentoParte> partesInstrumento;

	@AField(required = true, label = "Los Administradores", ordenValidacion = 14)
	private List<CInstrumentoParte> administradoresInstrumento;

	@AField(required = true, label = "Las UDs", ordenValidacion = 15)
	private List<CInstrumentoParte> udsInstrumento;

	@AField(required = true, label = "Los Contactos", ordenValidacion = 16)
	private List<CInstrumentoParte> contactosInstrumento;


	@AField(required = true, label = "La distribucion ", ordenValidacion = 8, extraValidation = true)
	private List<CInstrumentoItemDistribucion> itemsDistribucion;

	private CInstrumento instrumento;

	private String uvtFacturarSeleccionado;
	private String prestadorSeleccionado;
	private String contratanteSeleccionado;
	private String uvtSeleccionado;
	private String contraparteSeleccionado;
	private String promotorSeleccionado;
	private String contratantePromotorSeleccionado;
	private String contactoContratanteSeleccionado;
	private String conicetSeleccionado;



	private String institucionSeleccionado;

	//private String numeroExpedienteTexto;
	@AField( label = "El Numero de Expediente ", ordenValidacion = 10, extraValidation = true)
	private String numeroExpediente;
	private String añoExpediente;
	private boolean mostrarPantallaCompleta = true;




	// TEXTOS EXTRAS
	private String montoTexto;
	private String montoOtraMonedaTexto;
	private String uvtTexto;

	private String contratanteNombreTexto;
	private String responsableTexto;
	private String tipoConvTexto;
	private String contratanteSiglaTexto;
	private String numeroTramiteTexto;


	// FIN TEXTOS EXTRAS

	private String descargarArchivoEvento;
	private CInstrumentoItemTramite itemTramiteSeleccionado;
	private String itemTramiteEliminar;

	private CUsuarioSvt usuario;
	private boolean esModificable = false;

	private List<CTipoItemFacturacion> tiposItems= new ArrayList<CTipoItemFacturacion>();
	private List<CInstrumentoItemDistribucionStruct> itemsDistribucionStruct = new ArrayList<CInstrumentoItemDistribucionStruct>();
	private List<CInstrumentoItemDistribucionStruct> productividadEntidad = new ArrayList<CInstrumentoItemDistribucionStruct>();
	private List<CInstrumentoItemDistribucionStruct> comisionOtraInstitucion= new ArrayList<CInstrumentoItemDistribucionStruct>();

	private List<CInstrumentoParticipante> participantesInstrumento= new ArrayList<CInstrumentoParticipante>();
	private List<CInstrumentoResolucion> resoluciones= new ArrayList<CInstrumentoResolucion>();

	private HashMap<CInstrumentoItemDistribucionStruct,  BigDecimal> mapImportesAnteriores = new HashMap<CInstrumentoItemDistribucionStruct, BigDecimal>();


	private BigDecimal totalComisiones;
	private BigDecimal totalParcialComisiones;
	private BigDecimal saldoADistribuir;
	@AField(required=false, label = "El número de resolución", ordenValidacion = 9, extraValidation = true)
	private Integer numeroResolucion;
	private ETipoResolucion tipoResolucion;
	private Integer añoResolucion;
	private ETipoActividadPDT pdtResolucion;


	//Campos para la parte de montos
	private String observacionMonto;
	private ArrayList<CInstrumentoMonto> montosInstrumento = new ArrayList<CInstrumentoMonto>();
	private ETipoMonto tipoMonto;
	private Collection<CTipoMoneda> tiposMoneda;
	private String clasificacionPDT;
	private String campoAplicacion;


	protected CArchivo planDeTrabajo;

	private String pctiNro;




	private ActionErrors errors = new ActionErrors();
	private ActionMessages am = new ActionMessages();

	private CInstrumentoParte elementoSeleccionadoInstrumentoParte;

	//Seguimiento
	private List<CHojaRuta> listHojaRuta;
	private List<CHito> listHito;
	private List<Long> hitosPredecesores;
	private Map<String, String> mapCriterio;
	private Collection<COptionCombo> comboActores;
	private List<COptionCombo> usuariosHojaRuta;

	/*ENUM AUTOCOMPLETE*/
	public enum EAC {
		Delegado,
		DeFondos,
		ContactoOtrosOrganismos
	}


	public CInstrumentoParte getElementoSeleccionadoInstrumentoParte() {
		return elementoSeleccionadoInstrumentoParte;
	}

	public void setElementoSeleccionadoInstrumentoParte(
			CInstrumentoParte elementoSeleccionadoInstrumentoParte) {
		this.elementoSeleccionadoInstrumentoParte = elementoSeleccionadoInstrumentoParte;
	}

	public void setElementoSeleccionadoInstrumentoParteIndex(String index, String value) {
		int indexInt = Integer.parseInt(index);
		CInstrumentoParte test = this.getPartesInstrumento().get(indexInt);
		this.setElementoSeleccionadoInstrumentoParte(test);
		this.setBtnSubmit("detalleinstrumentoparte");
		this.setMethod("detalleinstrumentoparte");
	}
	public void setElementoSeleccionadoInstrumentoParteContactoIndex(String index, String value) {
		int indexInt = Integer.parseInt(index);
		CInstrumentoParte test = this.getContactosInstrumento().get(indexInt);
		this.setElementoSeleccionadoInstrumentoParte(test);
		this.setBtnSubmit("detalleinstrumentoparte");
		this.setMethod("detalleinstrumentoparte");
	}
	public void setElementoSeleccionadoInstrumentoParteAdmIndex(String index, String value) {
		int indexInt = Integer.parseInt(index);
		CInstrumentoParte test = this.getAdministradoresInstrumento().get(indexInt);
		this.setElementoSeleccionadoInstrumentoParte(test);
		this.setBtnSubmit("detalleinstrumentoparte");
		this.setMethod("detalleinstrumentoparte");
	}

	public void setElementoSeleccionadoHitoIndex(String index, String value) {
		int indexInt = Integer.parseInt(index);
		CHito hito = this.getListHito().get(indexInt);
		this.setElementoSeleccionado(hito);
		this.setBtnSubmit("detalleHito");
		this.setMethod("detalleHito");
	}

	public List<CHojaRuta> getListHojaRuta() {
		return listHojaRuta;
	}

	public void setListHojaRuta(List<CHojaRuta> listHojaRuta) {
		this.listHojaRuta = listHojaRuta;
	}

	public List<CHito> getListHito() {
		return listHito;
	}

	public void setListHito(List<CHito> listHito) {
		this.listHito = listHito;
	}

	public List<Long> getHitosPredecesores() {
		return hitosPredecesores;
	}

	public void setHitosPredecesores(List<Long> hitosPredecesores) {
		this.hitosPredecesores = hitosPredecesores;
	}

	public Map<String, String> getMapCriterio() {
		return mapCriterio;
	}

	public Collection<COptionCombo> getComboActores() {
		return comboActores;
	}

	public void setComboActores(Collection<COptionCombo> comboActores) {
		this.comboActores = comboActores;
	}

	public List<COptionCombo> getUsuariosHojaRuta() {
		return usuariosHojaRuta;
	}

	public void setUsuariosHojaRuta(List<COptionCombo> usuariosHojaRuta) {
		this.usuariosHojaRuta = usuariosHojaRuta;
	}

	public void setMappedCriterio(String key, String value) {
		if((value.equals("-1") || value.equals("-2") || value.equals("") )) {
			if (this.mapCriterio!=null && this.mapCriterio.get(key)!=null){
				this.mapCriterio.remove(key);
			}
		} else {
				this.mapCriterio.put(key, value.trim());
		}
	}

	public String getMappedCriterio(String key) {
		return this.mapCriterio.get(key);
	}

	public void limpiarCriterioHitos() {
		this.mapCriterio.remove("fechaDesde");
		this.mapCriterio.remove("fechaHasta");
		this.mapCriterio.remove("busquedaTipoObligacion");
		this.mapCriterio.remove("actor");
		this.mapCriterio.remove("tipoAccion");
		this.mapCriterio.remove("estado");
	}

	public void limpiarCriterioHojaRuta() {
		this.mapCriterio.remove("usuarioHojaRuta");
	}

	public void armarComboActores() {
		List<COptionCombo> combo = new LinkedList<COptionCombo>();
		combo.add(new COptionCombo("", "-1"));
		combo.add(new COptionCombo("DVT", CHitoActorDiscriminator.DVT.getCode().toString()));
		for (CInstrumentoParte parte : this.getInstrumento().getPartesInstrumento()) {
			combo.add(new COptionCombo(parte.getDescripcion() +" (" + parte.getFuncion().getDescripcion() +")", CHitoActorDiscriminator.PARTE.getCode()+"_"+parte.getId().toString()));
		}
		for (CInstrumentoParticipante participante : this.getInstrumento().getParticipantes()) {
			combo.add(new COptionCombo(participante.getParticipante().getDescripcion() +" (" + participante.getRolParticipante().getDescripcion()+")", CHitoActorDiscriminator.PARTICIPANTE.getCode()+"_"+participante.getId().toString()));
		}
		this.setComboActores(combo);
	}

	@Override
	public void limpiar() {
		super.limpiar();

		this.mostrarPantallaCompleta= true;
		this.año = null;
		this.sector = "";
		this.carpetin = "";
		this.categoriaPDT = null;
		this.duracion = null;
		this.esPDT = false;
		this.estado = null;
		this.estadoTramite = null;
		this.fechaFin = "";
		this.fechaIngresoDVTS = "";
		this.fechaInicio = "";
		this.instrumento = null;
		this.itemsDistribucion = new ArrayList<CInstrumentoItemDistribucion>();
		this.itemsTramite = new ArrayList<CInstrumentoItemTramite>();
		this.partesInstrumento = new ArrayList<CInstrumentoParte>();
		this.administradoresInstrumento = new ArrayList<CInstrumentoParte>();
		this.udsInstrumento = new ArrayList<CInstrumentoParte>();
		this.contactosInstrumento = new ArrayList<CInstrumentoParte>();
		this.monto = BigDecimal.ZERO;
		this.montoOtraMoneda = BigDecimal.ZERO;
		this.numeroTramite = null;
		this.objeto = "";
		this.objetoDivulgacion = "";
		this.observacionesFin = "";
		this.otraMoneda = null;
		this.prorroga = null;
		this.publicarWeb = false;
		this.responsable = "";
		this.responsableTecnico = "";
		this.uvt = null;
		this.uvtFacturarSeleccionado=null;
		this.tipo = null;
		this.tipoParteAgregar = null;
		this.tipoAdmAgregar = null;
		this.tipoContactoAgregar = null;
		this.duracionEventoDesde = "";
		this.usuario = null;
		this.otrosIngresos = "";
		this.patente = "";
		this.participante = null;
		this.rolParticipante = null;


		this.institucionSeleccionado = "";
		this.contratanteSeleccionado = "";
		this.prestadorSeleccionado = "";
		this.promotorSeleccionado = "";
		this.contactoContratanteSeleccionado = "";
		this.conicetSeleccionado="";

		// TEXTOS EXTRA
		this.montoTexto = "";
		this.montoOtraMonedaTexto = "";
		this.uvtTexto = "";
		this.contratanteNombreTexto = "";
		this.contratanteSiglaTexto = "";
		this.responsableTexto = "";
		this.tipoConvTexto = "";
		this.setNumeroTramiteTexto("");
		this.numeroExpediente = null;
		this.añoExpediente = null;
		//fin

		this.comisionOtraInstitucion.clear();
		this.productividadEntidad.clear();
		this.itemsDistribucionStruct.clear();
		this.tiposItems.clear();

		this.totalComisiones = BigDecimal.ZERO;
		this.totalParcialComisiones = BigDecimal.ZERO;
		this.saldoADistribuir = BigDecimal.ZERO;

		this.tab = "datos";
		this.esModificable=false;

		this.mapImportesAnteriores.clear();
		this.montosInstrumento.clear();
		this.observacionMonto = "";
		this.participantesInstrumento.clear();
		this.planDeTrabajo = null;
		this.clasificacionPDT = null;
		this.campoAplicacion = null;
		this.pctiNro=null;
		this.tituloPdts=null;
		resoluciones.clear();
		this.mapCriterio = new HashMap<String, String>();
		limpiarResolucionAgregar();

	}

	@Override
	public CInstrumento getData() {
		CInstrumento i = this.instrumento;
		i.setAño(año);

		if (carpetin != null) {
			i.setCarpetin(carpetin);
		}


		if (StringUtils.isNotEmpty(contratanteNombreTexto)) {
			i.setContratanteNombreTexto(contratanteNombreTexto);
		}
		if (StringUtils.isNotEmpty(contratanteSiglaTexto)) {
			i.setContratanteSiglaTexto(contratanteSiglaTexto);
		}

		i.setDuracion(duracion);

		if (duracionEventoDesde != null) {
			i.setDuracionEventoDesde(duracionEventoDesde);
		}

		i.setEsPDT(this.isEsPDT());
		if (this.isEsPDT()){
			if(CComboWrapper.isSeleccionado(clasificacionPDT) ){
				i.setClasificacionPDT(new CClasificacionPDT(new Integer(this.clasificacionPDT)));
			}else{
				i.setClasificacionPDT(null);
			}
			i.setCategoriaPDT(categoriaPDT);
			if (StringUtils.isNotEmpty(tituloPdts)) {
				i.setTituloPdts(tituloPdts);
			}else{
				i.setTituloPdts(null);
			}
			if (StringUtils.isNotEmpty(pctiNro) && new Integer(pctiNro).intValue()>0) {
				i.setPctiNro(new Integer(pctiNro));
			}else{
				i.setPctiNro(null);
			}
		}else{
			i.setClasificacionPDT(null);
			i.setCategoriaPDT(null);
			i.setTituloPdts(null);
			i.setPctiNro(null);
		}

		i.setEstado(estado);
		i.setEstadoTramite(estadoTramite);
		i.setFechaFin(getDateFromString(fechaFin));
		i.setFechaInicio(getDateFromString(fechaInicio));
		i.setFechaIngresoDVTS(getDateFromString(fechaIngresoDVTS));

		//i.getItemsDistribucion().clear();
		i.getItemsDistribucion().addAll(this.armarItemsDistribucion());
		/*
		//seteo el isntrumetno a la distribucion
		for(CInstrumentoItemDistribucion dist : this.itemsDistribucion){
			dist.setInstrumento(i);
		}*/

		i.getItemsTramite().clear();
		i.getItemsTramite().addAll(itemsTramite);

		i.getMontosInstrumento().clear();
		i.getMontosInstrumento().addAll(this.montosInstrumento);
		/*
		for(CInstrumentoMonto monto : i.getMontosInstrumento()){
			monto.setInstrumento(i);
		}*/


		i.setMontoTexto(montoTexto);
		if(this.otrosIngresos != null){
			i.setOtrosIngresos(this.otrosIngresos);
		}
		if (StringUtils.isNotEmpty(objeto)) {
			i.setObjeto(objeto);
		}


		if (objetoDivulgacion != null) {
			i.setObjetoDivulgacion(objetoDivulgacion);
		}

		if (observacionesFin != null) {
			i.setObservacionesFin(observacionesFin);
		}

		if (patente != null) {
			i.setPatente(this.patente);
		}

		//i.setNumeroExpediente(numeroExpediente);
		i.setNumeroExpedienteTexto(getNumeroExpedienteCompleto());
		//i.setNumeroExpediente(numeroExpedienteTexto);

		i.setNumeroTramite(numeroTramite);

		i.getResoluciones().clear();
		i.getResoluciones().addAll(this.resoluciones);
		if (StringUtils.isNotEmpty(numeroTramiteTexto)) {
			i.setNumeroTramiteTexto(numeroTramiteTexto);
		}

		if (CComboWrapper.isSeleccionado(otraMoneda)) {
			i.setOtraMoneda(otraMoneda);
			i.setMontoOtraMoneda(montoOtraMoneda);
		}

		if (StringUtils.isNotEmpty(montoOtraMonedaTexto)) {
			i.setMontoOtraMonedaTexto(montoOtraMonedaTexto);
		}

		i.getPartesInstrumento().clear();
		i.getPartesInstrumento().addAll(partesInstrumento);
		i.getPartesInstrumento().addAll(administradoresInstrumento);
		i.getPartesInstrumento().addAll(udsInstrumento);
		i.getPartesInstrumento().addAll(contactosInstrumento);

		i.setProrroga(prorroga);
		if(EEstadoInstrumento.EJE.equals(this.estado)){
			i.setPublicarWeb(publicarWeb);
		}else{
			i.setPublicarWeb(false);
		}

		//solo si es CCO y esta en modificacion se le permite modificar el responsable
		if(getRolUsuario().equalsIgnoreCase("CCO")){
				i.setResponsable(UsuarioObjectProvider.getUsuarioObjectInitialized(this.responsable));
		}else if(getEAccionesAction().equals(EAccionesAction.alta)){
			i.setResponsable(this.usuario.getUsrRegistrado());
		}

		if (StringUtils.isNotEmpty(responsableTecnico)) {
			i.setResponsableTecnico(responsableTecnico);
		}

		if (StringUtils.isNotEmpty(responsableTexto)) {
			i.setResponsableTexto(responsableTexto);
		}

		i.setTipo(tipo);

		if (StringUtils.isNotEmpty(tipoConvTexto)) {
			i.setTipoConvTexto(tipoConvTexto);
		}

		i.setUvt(this.uvt);

		if (StringUtils.isNotEmpty(uvtTexto)) {
			i.setUvtTexto(uvtTexto);
		}

		i.getParticipantes().clear();
		i.getParticipantes().addAll(this.participantesInstrumento);

		i.setPlanDeTrabajo(this.getPlanDeTrabajo());

		if(CComboWrapper.isSeleccionado(this.campoAplicacion)){
			i.setCampoAplicacion(new CCampoAplicacion(this.campoAplicacion));
		}


		return i;

	}



	@Override
	public void setData(CInstrumento i) {
		this.instrumento = i;
		this.año = i.getAño();
		this.sector = i.getSector().getSigla() + " - " + i.getSector().getDescripcion();
		this.carpetin = i.getCarpetin();
		this.categoriaPDT = i.getCategoriaPDT();
		this.duracion = i.getDuracion();
		this.esPDT = i.getEsPDT();
		this.estado = i.getEstado();
		this.estadoTramite = i.getEstadoTramite();

		if (i.getFechaFin()!=null) {
			this.fechaFin = CFecha.formatFechaDDMMAAAAConGuion(i.getFechaFin());
		}

		if (i.getFechaIngresoDVTS()!=null) {
			this.fechaIngresoDVTS = CFecha.formatFechaDDMMAAAAConGuion(i.getFechaIngresoDVTS());
		}

		if (i.getFechaInicio()!=null) {
			this.fechaInicio = CFecha.formatFechaDDMMAAAAConGuion(i.getFechaInicio());
		}

		this.itemsDistribucion = new ArrayList<CInstrumentoItemDistribucion>(i.getItemsDistribucion());


		this.setDistribucion(i.getItemsDistribucion()); // proceso que genera distribucion con objetos struct para trabajar
		// --corrijo los porcentajes a visualizar en pantalla de U.Div. y Productividad------
		this.setItemsDistribucionStruct(this.getDistribucionConPorcentajesDesdeSaldoADist(this.getItemsDistribucionStruct()));

		this.itemsTramite = new ArrayList<CInstrumentoItemTramite>(i.getItemsTramite());
		Collections.sort(itemsTramite, new Comparator<CInstrumentoItemTramite>() {
			@Override
			public int compare(CInstrumentoItemTramite o1, CInstrumentoItemTramite o2) {
				return o1.getId().compareTo(o2.getId()) * -1;
			}
		});

		this.montosInstrumento  = new ArrayList<CInstrumentoMonto>(i.getMontosInstrumento());

		distribuirPartesInstrumento(i.getPartesInstrumento());
		this.participantesInstrumento = new ArrayList<CInstrumentoParticipante>(i.getParticipantes());
		this.resoluciones = new ArrayList<CInstrumentoResolucion>(i.getResoluciones());

		this.monto = i.getMonto();
		this.montoOtraMoneda = i.getMontoOtraMoneda();
		setearNumeroYAñoExpediente();
		//this.numeroExpedienteTexto = i.getNumeroExpedienteTexto();
		this.numeroTramite = i.getNumeroTramite();
		if (i.getPctiNro()!=null){
			this.pctiNro= i.getPctiNro().toString();
		}

		this.objeto = i.getObjeto();
		this.tituloPdts =i.getTituloPdts();
		this.objetoDivulgacion = i.getObjetoDivulgacion();
		this.observacionesFin = i.getObservacionesFin();
		this.otraMoneda = i.getOtraMoneda();
		this.prorroga = i.getProrroga();
		this.publicarWeb = i.getPublicarWeb();
		this.duracionEventoDesde = i.getDuracionEventoDesde();
		this.otrosIngresos = i.getOtrosIngresos();
		this.patente = i.getPatente();
		this.planDeTrabajo = i.getPlanDeTrabajo();

		if (i.getResponsable() != null){
			if(this.getEAccionesAction().equals(EAccionesAction.modificar) && getRolUsuario().equalsIgnoreCase("CCO"))
			{
				this.responsable = i.getResponsable().getKey().toString();
			}else{
				this.responsable = i.getResponsable().getLastName() + ", " + i.getResponsable().getFirstName();
			}
		}
		else{
			this.responsable = i.getResponsableTexto();
		}

		this.responsableTecnico = i.getResponsableTecnico();
		this.uvt = i.getUvt();
		if(this.uvt  !=null) {
			this.uvtFacturarSeleccionado = uvt.getId().toString();
		}

		this.tipo = i.getTipo();

		// TEXTOS EXTRAS
		this.montoTexto = i.getMontoTexto();
		this.montoOtraMonedaTexto = i.getMontoOtraMonedaTexto();
		this.uvtTexto = i.getUvtTexto();

		this.contratanteNombreTexto = i.getContratanteNombreTexto();
		this.setContratanteSiglaTexto(i.getContratanteSiglaTexto());
		this.responsableTexto = i.getResponsableTexto();
		this.tipoConvTexto = i.getTipoConvTexto();
		this.numeroTramiteTexto = i.getNumeroTramiteTexto();

		if(i.getClasificacionPDT()!=null) {
			this.clasificacionPDT = i.getClasificacionPDT().getId().toString();
		}

		if(i.getCampoAplicacion()!=null) {
			this.campoAplicacion = i.getCampoAplicacion().getCodigo();
		}
		if (i.getPctiNro()!=null && i.getPctiNro()>0 ){
			this.pctiNro=pctiNro.toString();
		}
	}

	/*
	private void setDistribucionOtraInstitucion() {
		for(CInstrumentoItemDistribucion i : this.itemsDistribucion){
			if(i.getTipoDistribucion().equals(ETipoInstrumentoDistribucion.OTRA_INSTITUCION)){
				CInstrumentoItemDistribucionOtraInstitucion oi  = (CInstrumentoItemDistribucionOtraInstitucion) i;
				if(oi.getOtraInstitucion()!=null){
					this.institucionSeleccionado = oi.getOtraInstitucion().getId().toString();
					this.getObjetosBuscadosAutocomplete().add(oi.getOtraInstitucion());
				}
			}
		}
	}*/


	public String getNumeroExpedienteCompleto() {
		if(StringUtils.isNotEmpty(this.numeroExpediente) && CComboWrapper.isSeleccionado(this.añoExpediente)) {
			return this.numeroExpediente + "/"+this.añoExpediente;
		}else{
			return null;
		}
	}



	private Collection<CInstrumentoItemDistribucion> armarItemsDistribucion() {
		Set<CInstrumentoItemDistribucion> nuevaDistribucionInstrumento=new HashSet<CInstrumentoItemDistribucion>();
		Map<Long,CInstrumentoItemDistribucion> distribucionAnterior= new HashMap<Long,CInstrumentoItemDistribucion>();
		Map<String,CInstrumentoItemDistribucion> productividadAnterior= new HashMap<String,CInstrumentoItemDistribucion>();
		Map<String,CInstrumentoItemDistribucion> comisionContraparteAnterior= new HashMap<String,CInstrumentoItemDistribucion>();

		// cargo maps para control y carga
		for (CInstrumentoItemDistribucion fid : this.getItemsDistribucion() ){
			if (fid.getTipoItem().isProductividad()){
				CInstrumentoItemDistribucionProductividad fidPro =(CInstrumentoItemDistribucionProductividad)fid;
				if (fidPro.getPersona()!=null){
					productividadAnterior.put(fidPro.getPersona().getId().toString(),fid);
				}else{
					productividadAnterior.put("PENDIENTE",fid);
				}
			} else if (fid.getTipoItem().isInstitutoContraparte()){
				CInstrumentoItemDistribucionOtraInstitucion fidPro =(CInstrumentoItemDistribucionOtraInstitucion)fid;
				if (fidPro.getOtraInstitucion()!=null){
					comisionContraparteAnterior.put(fidPro.getOtraInstitucion().getId().toString(),fid);
				}else{
					comisionContraparteAnterior.put("0",fid);
				}
			}else{
				distribucionAnterior.put(fid.getId(), fid);
			}
		}

		// recorro distribucion para cargar nueva distribucion a grabar
		for (CInstrumentoItemDistribucionStruct d : this.getItemsDistribucionStruct()) {
			// productividad
			if (d.getTipoItem().isProductividad()){
					// solo hay un registro en distribucionFacturacion de productividad. el del total. El resto esta en productividadEntidad
					CInstrumentoItemDistribucion disAntPendiente= productividadAnterior.get("PENDIENTE");
					boolean hayProductividadOPendiente= false;
					BigDecimal productividadInformada = BigDecimal.ZERO;
					for (CInstrumentoItemDistribucionStruct pe : this.getProductividadEntidad()) {
						if (pe.getImporte()!=null && pe.getImporte().compareTo(BigDecimal.ZERO)>0){
							CInstrumentoItemDistribucionProductividad dis=null;
							CInstrumentoItemDistribucion disAnt= productividadAnterior.get(pe.getEntidad().getId().toString());
							if (disAnt!=null){
								//modificar el existente
								dis= (CInstrumentoItemDistribucionProductividad)disAnt;
							}else{
								// alta
								dis= new CInstrumentoItemDistribucionProductividad(instrumento,d.getTipoItem(),pe.getEntidad());
							}
							dis.setImporte(pe.getImporte());
							productividadInformada= productividadInformada.add(dis.getImporte());
							dis.setPorcentaje(calculoPorcentaje(dis.getImporte(),instrumento.getMonto()));
							nuevaDistribucionInstrumento.add(dis);
							hayProductividadOPendiente=true;
						}
					}  // si quedo importe pendiente para distribuir de productividad
					if (d.getImporte().compareTo(productividadInformada)>0){
							CInstrumentoItemDistribucionProductividad dis=null;
							if (disAntPendiente!=null){
								dis = (CInstrumentoItemDistribucionProductividad)disAntPendiente;
							}else{
								dis = new CInstrumentoItemDistribucionProductividad(this.instrumento,d.getTipoItem(),null);
							}
							dis.setImporte((d.getImporte()).subtract(productividadInformada));
							dis.setPorcentaje(calculoPorcentaje(dis.getImporte(),instrumento.getMonto()));
							nuevaDistribucionInstrumento.add(dis);
							hayProductividadOPendiente=true;
					}
					//si no hay productividad ni pendiente debe dejar un registro en 0, intentará usar el de
					// pendiente si existe.
					if (!hayProductividadOPendiente){
						CInstrumentoItemDistribucionProductividad dis=null;
						if (disAntPendiente!=null){
							dis = (CInstrumentoItemDistribucionProductividad)disAntPendiente;
						}else{
							dis = new CInstrumentoItemDistribucionProductividad(instrumento,d.getTipoItem(),null);
						}
						dis.setImporte(BigDecimal.ZERO);
						dis.setPorcentaje(BigDecimal.ZERO);
						nuevaDistribucionInstrumento.add(dis);

					}
			// instituto contraparte trabaja igual que productividad, pero sin PENDIENTE
			}else if (d.getTipoItem().isInstitutoContraparte()){

				BigDecimal comisionContraparteInformada = BigDecimal.ZERO;
				boolean hayContrapartes=false;
				for (CInstrumentoItemDistribucionStruct pe : this.getComisionOtraInstitucion()) {
					if (pe.getImporte()!=null && pe.getImporte().compareTo(BigDecimal.ZERO)>0 && pe.getOtraInstitucion()!=null){
						CInstrumentoItemDistribucionOtraInstitucion dis=null;
						hayContrapartes=true;
						CInstrumentoItemDistribucion disAnt= comisionContraparteAnterior.get(pe.getOtraInstitucion().getId().toString());
						if (disAnt!=null){
							//modificar el existente
							dis= (CInstrumentoItemDistribucionOtraInstitucion)disAnt;
						}else{
							if(this.soloDistribucionExcel){
								hayContrapartes = true;
							}
							// alta
							dis= new CInstrumentoItemDistribucionOtraInstitucion(instrumento,d.getTipoItem(),pe.getOtraInstitucion());
						}
						dis.setImporte(pe.getImporte());
						comisionContraparteInformada= comisionContraparteInformada.add(dis.getImporte());
						dis.setPorcentaje(calculoPorcentaje(dis.getImporte(),instrumento.getMonto()));
						nuevaDistribucionInstrumento.add(dis);
					}
				}

				if (!hayContrapartes){
					// si no hay registros con contrapartes, igual debe hab er un registro vacío. Si ya existía lo
					// utilizo para no perder el id, sino , genero uno nuevo en cero
					CInstrumentoItemDistribucionOtraInstitucion dis=null;
					//busco si existía un registro inicial en cero para contrapartes
					CInstrumentoItemDistribucion disAnt= comisionContraparteAnterior.get("0");
					if (disAnt!=null){
						// levanto el existente en cero
						dis= (CInstrumentoItemDistribucionOtraInstitucion)disAnt;
					}else{
						// alta de un registro en cero.
						dis= new CInstrumentoItemDistribucionOtraInstitucion(instrumento,d.getTipoItem(), null);
						dis.setImporte(BigDecimal.ZERO);
						dis.setPorcentaje(BigDecimal.ZERO);
					}
					dis.setImporte(d.getImporte());
					dis.setPorcentaje(d.getPorcentaje());
					nuevaDistribucionInstrumento.add(dis);
				}
			}else{
					// otras distribuciones
					CInstrumentoItemDistribucion disAnt= distribucionAnterior.get(d.getIdDistribucionItem());
					if (disAnt!=null){// si ya existía la actualizo y guardo en nueva colección

							nuevaDistribucionInstrumento.add(actualizoDistribucionAnterior(disAnt,d));
					}else{	// sino lo encuentro creo el objeto
							CInstrumentoItemDistribucion dis=null;
							//if (!d.getTipoItem().isInstitutoContraparte()) {
								dis=new CInstrumentoItemDistribucion();
							/*}else if (d.getTipoItem().isInstitutoContraparte()){
								dis=new CInstrumentoItemDistribucionOtraInstitucion();
								//dis.setTipoDistribucion("DU");
								if (d.getImporte()!=null && (new BigDecimal(d.getImporte())).compareTo(BigDecimal.ZERO) > 0){ //importe puede ser diferente de null
									((CInstrumentoItemDistribucionOtraInstitucion)dis).setContraparte(getUniversidadByBuscadas());
								}
							*/
							//}
							dis.setInstrumento(instrumento);
							dis.setTipoItem(d.getTipoItem());
							if (d.getImporte()!=null){
								dis.setImporte(d.getImporte());
								dis.setPorcentaje(d.getPorcentaje());
							}else{dis.setImporte(BigDecimal.ZERO);dis.setPorcentaje(BigDecimal.ZERO);}

							nuevaDistribucionInstrumento.add(dis);
					}
			}

		}
		this.itemsDistribucion.clear();
		return nuevaDistribucionInstrumento;
	}


	public CInstrumentoItemDistribucion actualizoDistribucionAnterior(CInstrumentoItemDistribucion disAnt,CInstrumentoItemDistribucionStruct d){
		if (d.getImporte()!=null){
			disAnt.setImporte(d.getImporte());

		}else{
			disAnt.setImporte(BigDecimal.ZERO);
			/*if (disAnt.getTipoItemFacturacion().isInstitutoContraparte()){
				((CFacturaItemDistribucionContraparte)disAnt).setContraparte(null);
			}*/
		}
		if (d.getPorcentaje()!=null){
			disAnt.setPorcentaje(d.getPorcentaje());
		}else{
			disAnt.setPorcentaje(BigDecimal.ZERO);
		}
		/*if (d.getTipoItem()!=null){
			disAnt.setTipoItem(d.getT);

		}*/
		return disAnt;
	}


	private Date getDateFromString(String fecha) {
		if(StringUtils.isEmpty(fecha)){
			return null;
		}else{
			try {
				return CFecha.fechaLatinoToSqlDate(fecha);
			} catch (Exception e) {
				return null;
			}
		}
	}

	private void setearNumeroYAñoExpediente() {
		if(StringUtils.isNotEmpty(this.instrumento.getNumeroExpedienteTexto())){
			String exp[] = this.instrumento.getNumeroExpedienteTexto().split("/");
			if(!Character.isDigit(exp[0].charAt(0))){
				this.numeroExpediente = exp[0].substring(1);
			}else{
				this.numeroExpediente = exp[0];
			}
			try{
				if(exp[1].length()==2){
					Integer año =  new Integer(exp[1]);
					if(año > Calendar.getInstance().get(Calendar.YEAR)/100 +1){
						this.añoExpediente = "19" + año;
					}else{
						this.añoExpediente = "20" + año;
					}
				}else if(exp[1].length()==4){
					this.añoExpediente = new Integer(exp[1]).toString();
				}else{
					this.añoExpediente = new Integer(exp[1].substring(0,4)).toString();
				}
			}catch (Exception e) {
				this.añoExpediente = "";
			}
		}
	}



	@Override
	public void validarField(AField annotation, Field attr, ActionErrors ae) throws Exception {
		// TODO Auto-generated method stub

	}

	public void setCarpetin(String carpetin) {
		this.carpetin = carpetin;
	}

	public String getCarpetin() {
		return carpetin;
	}

	public Integer getAño() {
		return año;
	}

	public void setAño(Integer año) {
		this.año = año;
	}

	public Integer getDuracion() {
		return duracion;
	}

	public void setDuracion(Integer duracion) {
		if (duracion.equals(0)) {
			duracion = null;
		}

		this.duracion = duracion;
	}

	public String getEstado() {
		return getIdFromEnumIdentity(estado);
	}

	public void setEstado(String estado) {
		this.estado = EEstadoInstrumento.getTipo(estado);
	}

	public String getEstadoTramite() {
		return getIdFromEnumIdentity(estadoTramite);
	}

	public void setEstadoTramite(String estadoTramite) {
		this.estadoTramite = EEstadoTramiteInstrumento.getTipo(estadoTramite);
	}

	public String getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getFechaIngresoDVTS() {
		return fechaIngresoDVTS;
	}

	public void setFechaIngresoDVTS(String fechaIngresoDVTS) {
		this.fechaIngresoDVTS = fechaIngresoDVTS;
	}

	public String getNumeroExpediente() {
		return numeroExpediente;
	}

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public BigDecimal getMonto() {
		return monto != null ? monto.setScale(2) : BigDecimal.ZERO.setScale(2);
	}

	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}

	public BigDecimal getMontoOtraMoneda() {
		return montoOtraMoneda != null ? montoOtraMoneda.setScale(2) : BigDecimal.ZERO.setScale(2);
	}

	public void setMontoOtraMoneda(BigDecimal montoOtraMoneda) {
		this.montoOtraMoneda = montoOtraMoneda;
	}

	public Integer getNumeroTramite() {
		return numeroTramite;
	}

	public void setNumeroTramite(Integer numeroTramite) {
		this.numeroTramite = numeroTramite;
	}

	public String getObjeto() {
		return objeto;
	}

	public void setObjeto(String objeto) {
		this.objeto = objeto;
	}

	public String getObservacionesFin() {
		return observacionesFin;
	}

	public void setObservacionesFin(String observacionesFin) {
		this.observacionesFin = observacionesFin;
	}

	public Integer getOtraMoneda() {
		return otraMoneda;
	}

	public void setOtraMoneda(Integer otraMoneda) {
		this.otraMoneda = otraMoneda;
	}

	public String getProrroga() {
		return getIdFromEnumIdentity(prorroga);
	}

	public void setProrroga(String prorroga) {
		this.prorroga = ETipoProrroga.getTipo(prorroga);
	}

	public boolean isPublicarWeb() {
		return publicarWeb;
	}

	public void setPublicarWeb(boolean publicarWeb) {
		this.publicarWeb = publicarWeb;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getResponsableTecnico() {
		return responsableTecnico;
	}

	public void setResponsableTecnico(String responsableTecnico) {
		this.responsableTecnico = responsableTecnico;
	}

	public ETipoInstrumento getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = ETipoInstrumento.getTipo(tipo);
	}

	public CUvt getUvt() {
		return uvt;
	}

	public void setUvt(CUvt uvt) {
		this.uvt = uvt;
	}

	public String getCategoriaPDT() {
		return getIdFromEnumIdentity(categoriaPDT);
	}

	public void setCategoriaPDT(String categoriaPDT) {
		this.categoriaPDT = ECategoriaPDT.getTipo(categoriaPDT);
	}

	public boolean isEsPDT() {
		return esPDT;
	}

	public void setEsPDT(boolean esPDT) {
		this.esPDT = esPDT;
	}

	public List<CInstrumentoItemTramite> getItemsTramite() {
		return itemsTramite;
	}

	public void setItemsTramite(List<CInstrumentoItemTramite> itemsTramite) {
		this.itemsTramite = itemsTramite;
	}

	public List<CInstrumentoParte> getPartesInstrumento() {
		return partesInstrumento;
	}

	public void setPartesInstrumento(List<CInstrumentoParte> partesInstrumento) {
		this.partesInstrumento = partesInstrumento;
	}

	public List<CInstrumentoItemDistribucion> getItemsDistribucion() {
		return itemsDistribucion;
	}

	public void setItemsDistribucion(List<CInstrumentoItemDistribucion> itemsDistribucion) {
		this.itemsDistribucion = itemsDistribucion;
	}

	public CInstrumento getInstrumento() {
		return instrumento;
	}

	public void setInstrumento(CInstrumento instrumento) {
		this.instrumento = instrumento;
	}

	// TEXTOS EXTRA
	public String getMontoTexto() {
		return montoTexto;
	}

	public void setMontoTexto(String montoTexto) {
		this.montoTexto = montoTexto;
	}

	public String getMontoOtraMonedaTexto() {
		return montoOtraMonedaTexto;
	}

	public void setMontoOtraMonedaTexto(String montoOtraMonedaTexto) {
		this.montoOtraMonedaTexto = montoOtraMonedaTexto;
	}

	public String getUvtTexto() {
		return uvtTexto;
	}

	public void setUvtTexto(String uvtTexto) {
		this.uvtTexto = uvtTexto;
	}

	public String getDuracionEventoDesde() {
		return duracionEventoDesde;
	}

	public void setDuracionEventoDesde(String duracionTexto) {
		this.duracionEventoDesde = duracionTexto;
	}

	public String getContratanteNombreTexto() {
		return contratanteNombreTexto;
	}

	public void setContratanteNombreTexto(String contratanteTexto) {
		this.contratanteNombreTexto = contratanteTexto;
	}

	public String getResponsableTexto() {
		return responsableTexto;
	}

	public void setResponsableTexto(String responsableTexto) {
		this.responsableTexto = responsableTexto;
	}

	public String getTipoConvTexto() {
		return tipoConvTexto;
	}

	public void setTipoConvTexto(String tipoConvTexto) {
		this.tipoConvTexto = tipoConvTexto;
	}

	public void setContratanteSiglaTexto(String contratanteSiglaTexto) {
		this.contratanteSiglaTexto = contratanteSiglaTexto;
	}

	public String getContratanteSiglaTexto() {
		return contratanteSiglaTexto;
	}

	public String getEstadoDelTramite() {
		if (!itemsTramite.isEmpty()) {
			return itemsTramite.iterator().next().getEvento().getEstadoTramite().getDescripcion();
		}
		return "";
	}

	// fin textos extra

	public void setNumeroTramiteTexto(String numeroTramiteTexto) {
		this.numeroTramiteTexto = numeroTramiteTexto;
	}

	public String getNumeroTramiteTexto() {
		return numeroTramiteTexto;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
			this.esPDT = false;
			this.publicarWeb = false;
		this.errors.clear();
		this.am.clear();
	}

	public Collection<CUvt> getColUvt() {
		Collection<CUvt> col = new LinkedList<CUvt>();
		if (this.uvt != null) {
			col.add(uvt);
		}

		return col;
	}

	public void setColUvt(Collection<CUvt> col) {
		if (col == null || col.isEmpty()) {
			this.uvt = null;
		} else {
			this.uvt = col.iterator().next();
		}
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public String getTab() {
		return tab;
	}

	public void setTipoParteAgregar(String tipoParteAgregar) {
		this.tipoParteAgregar = EFuncionParteInstrumento.getTipo(tipoParteAgregar);

	}

	public String getTipoParteAgregar() {
		return getIdFromEnumIdentity(tipoParteAgregar);
	}

	public String getPrestadorSeleccionado() {
		return prestadorSeleccionado;
	}

	public void setPrestadorSeleccionado(String prestadorSeleccionado) {
		this.prestadorSeleccionado = prestadorSeleccionado;
	}

	public String getConicetSeleccionado() {
		return conicetSeleccionado;
	}

	public void setConicetSeleccionado(String conicetSeleccionado) {
		this.conicetSeleccionado = conicetSeleccionado;
	}

	public void setContratanteSeleccionado(String contratanteSeleccionado) {
		this.contratanteSeleccionado = contratanteSeleccionado;
	}

	public String getContratanteSeleccionado() {
		return contratanteSeleccionado;
	}



	public void setPromotorSeleccionado(String promotorSeleccionado) {
		this.promotorSeleccionado = promotorSeleccionado;
	}

	public String getContratantePromotorSeleccionado() {
		return contratantePromotorSeleccionado;
	}



	public void setContratantePromotorSeleccionado(
			String contratantePromotorSeleccionado) {
		this.contratantePromotorSeleccionado = contratantePromotorSeleccionado;
	}



	public String getPromotorSeleccionado() {
		return promotorSeleccionado;
	}

	public void setUvtSeleccionado(String uvtSeleccionado) {

		this.uvtSeleccionado = uvtSeleccionado;

	}

	public String getUvtSeleccionado() {
		return uvtSeleccionado;
	}


	public void setDescargarArchivoEvento(String descargarArchivo) {
		this.descargarArchivoEvento = descargarArchivo;
	}

	public String getDescargarArchivoEvento() {
		return this.descargarArchivoEvento;
	}

	public void setElementoSeleccionadoItemTramiteIndex(String index, String value) {
		int indexInt = Integer.parseInt(index);
		CInstrumentoItemTramite test = this.getItemsTramite().get(indexInt);
		this.setItemTramiteSeleccionado(test);
		this.setBtnSubmit("modificaritemtramite");
		this.setMethod("modificaritemtramite");
	}

	public void setItemTramiteSeleccionado(CInstrumentoItemTramite itemTramite) {
		this.itemTramiteSeleccionado = itemTramite;
	}

	public CInstrumentoItemTramite getItemTramiteSeleccionado() {
		return itemTramiteSeleccionado;
	}



	public boolean agregarParte(ActionErrors errors) {
		EFuncionParteInstrumento tipo = tipoParteAgregar;
		CInstrumentoParte ip = null;
		Object parte = null;

		if (!CComboWrapper.isSeleccionado(tipo.getId())) {
			return false;
		} else if (StringUtils.isEmpty(uvtSeleccionado) && StringUtils.isEmpty(promotorSeleccionado) && StringUtils.isEmpty(contraparteSeleccionado) && StringUtils.isEmpty(conicetSeleccionado)
				&& StringUtils.isEmpty(contratanteSeleccionado) && StringUtils.isEmpty(contratantePromotorSeleccionado)) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "Debe seleccionar una parte."));
			return false;
		} else if (tipo.equals(EFuncionParteInstrumento.PRO)) {
			if (StringUtils.isNotEmpty(promotorSeleccionado) && (parte = getObjetoBuscadoById(new Long(promotorSeleccionado), CEntidad.class)) != null) {
				ip = new CInstrumentoParteEntidad(EFuncionParteInstrumento.PRO, (CEntidad) parte);
			}
		} else if (tipo.equals(EFuncionParteInstrumento.CP)) {
			if (StringUtils.isNotEmpty(contraparteSeleccionado) && (parte = getObjetoBuscadoById(new Long(contraparteSeleccionado), CEntidad.class)) != null) {
				ip = new CInstrumentoParteEntidad(EFuncionParteInstrumento.CP, (CEntidad) parte);
			}
		} else if (tipo.equals(EFuncionParteInstrumento.EMP)) {
			if (StringUtils.isNotEmpty(contratanteSeleccionado) && (parte = getObjetoBuscadoById(new Long(contratanteSeleccionado), CContratante.class)) != null) {
				ip = new CInstrumentoParteContratante(EFuncionParteInstrumento.EMP, (CContratante) parte);
			}
		} else if (tipo.equals(EFuncionParteInstrumento.CPR)) {
			if (StringUtils.isNotEmpty(contratantePromotorSeleccionado) && (parte = getObjetoBuscadoById(new Long(contratantePromotorSeleccionado), CContratante.class)) != null) {
				ip = new CInstrumentoParteContratante(EFuncionParteInstrumento.CPR, (CContratante) parte);
			}

		}else
			if (tipo.equals(EFuncionParteInstrumento.UVT)) {
				if (StringUtils.isNotEmpty(uvtSeleccionado) && (parte = getObjetoBuscadoById(new Long(uvtSeleccionado), CUvt.class)) != null) {
					ip = new CInstrumentoParteUvt(EFuncionParteInstrumento.UVT, (CUvt) parte);
			}
		} else if (tipo.equals(EFuncionParteInstrumento.CONI)) {
			if (StringUtils.isNotEmpty(conicetSeleccionado) && (parte = getObjetoBuscadoById(new Long(conicetSeleccionado), CEntidad.class)) != null) {
				ip = new CInstrumentoParteEntidad(EFuncionParteInstrumento.CONI, (CEntidad) parte);
				conicetSeleccionado =null;
			}
		}
		tipoParteAgregar = null;

		if (ip != null) {
			for(CInstrumentoParte p : partesInstrumento){
				if (p.getFuncion().equals(ip.getFuncion()) && p.getParteAsIdentity().getId().equals(ip.getParteAsIdentity().getId())) {
					errors.add("instrumento", new ActionMessage("errors.dynamic", "El \"" + p.getDescripcion() + "\" ya se encuentre seleccionado para la función " + p.getFuncion().getDescripcion()));
					return false;
				}
			}
			partesInstrumento.add(ip);


			//limpio
			contratantePromotorSeleccionado = null;
			contratanteSeleccionado = null;
			contraparteSeleccionado = null;
			promotorSeleccionado = null;
			prestadorSeleccionado = null;
			conicetSeleccionado =null;
			uvtSeleccionado = null;
			tipoParteAgregar = null;

			return true;
		}
		return false;

	}

	public void validarPartesInstrumento(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		if (partesInstrumento.isEmpty()) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("Es necesaria al menos una Parte.") };
			cargadorErrores.addError("errors.dynamic", mensaje, true);
		} else {
			for (CInstrumentoParteContacto contacto : getPartesContactosContratante()) {
				if (!estaElContratanteDelContacto(contacto)) {
					String[] mensaje = { StringEscapeUtils.escapeHtml("Se debe seleccionar el contratante correspondiente al contacto " +
							contacto.getContacto().getApellido() + ", " + contacto.getContacto().getNombre()) };
					cargadorErrores.addError("errors.dynamic", mensaje, true);
				}
			}
		}
	}

	private boolean estaElContratanteDelContacto(CInstrumentoParteContacto contacto) {
		CContactoContratante cContratante = (CContactoContratante)contacto.getContacto();
		for (CInstrumentoParte parte : getPartesInstrumento()) {
			if (EFuncionParteInstrumento.EMP.equals(parte.getFuncion()) &&
					cContratante != null && cContratante.getContratanteRelacion() != null &&
					((CInstrumentoParteContratante) parte).getContratante().getId().equals(
							cContratante.getContratanteRelacion().getContratante().getId()) ) {
				return true;
			}
		}
		return false;
	}

	private List<CInstrumentoParteContacto> getPartesContactosContratante() {
		List<CInstrumentoParteContacto> resultado = new ArrayList<CInstrumentoParteContacto>();
		for (CInstrumentoParte parte : getContactosInstrumento()) {
			if (EFuncionParteInstrumento.CON.equals(parte.getFuncion())) {
				resultado.add((CInstrumentoParteContacto) parte);
			}
		}

		return resultado;
	}

	public void validarObjeto(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		/*if (objeto.length() > 250) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("El objeto no debe superar los 250 caraceres.") };
			cargadorErrores.addError("errors.dynamic", mensaje, true);
		}*/
	}

	public void validarObjetoDivulgacion(CValidator cargadorErrores, IValidable validator) throws CException {
		//if (this.esPDT || this.publicarWeb){
		if (this.publicarWeb){
			validator.validar(cargadorErrores);
		}
	}

	public void validarEstado(CValidator cargadorErrores, IValidable validator) throws CException {
		if (this.getAccion().equalsIgnoreCase(EAccionesAction.modificar.getValue())){
			validator.validar(cargadorErrores);
		}
	}

	public void validarItemsDistribucion(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		BigDecimal total = BigDecimal.ZERO;

		for(CInstrumentoItemDistribucionStruct i : itemsDistribucionStruct){
			total = total.add(i.getPorcentaje());
			/*
			if(i.getTipoItem().equals(ETipoInstrumentoDistribucion.OTRA_INSTITUCION))
			{
				CInstrumentoItemDistribucion oi = (CInstrumentoItemDistribucion) i;
				if(oi.getPorcentaje().compareTo(BigDecimal.ZERO)!=0 && StringUtils.isEmpty(institucionSeleccionado)){
					String[] mensaje = { StringEscapeUtils.escapeHtml("La Otra Institución es necesaria si se especifica un porcentaje de distribución.") };
					cargadorErrores.addError("errors.dynamic", mensaje, true);
				}
			}*/
		}

		if (total.compareTo(new BigDecimal(100)) > 0) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("La suma de los porcentajes de la distribución no deben superar el 100%") };
			cargadorErrores.addError("errors.dynamic", mensaje, true);
		}
	}

	public void validarAño(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		if (año.equals(-1) || año.equals(-2)) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("El Año") };
			cargadorErrores.addError("errors.required", mensaje, true);
		}
	}

	public void validarNumeroExpediente(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		boolean numero = StringUtils.isNotEmpty(this.numeroExpediente),
		año = CComboWrapper.isSeleccionado(this.añoExpediente);

		if (numero != año) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("El Número del expediente esta incompleto") };
			cargadorErrores.addError("errors.dynamic", mensaje, true);
		}
		if(año && new Integer(this.añoExpediente) > this.año){
			String[] mensaje = { StringEscapeUtils.escapeHtml("El Año del expediente no puede superar el año del Convenio") };
			cargadorErrores.addError("errors.dynamic", mensaje, true);
		}
	}

	public void validarFechaInicio(CValidator cargadorErrores, IValidable validator) throws CException {
		if (StringUtils.isEmpty(this.getFechaInicio())){
				if (EEstadoInstrumento.EJE.equals(this.getEstado()) || this.esPDT){
					String[] mensaje = { StringEscapeUtils.escapeHtml("La Fecha de Inicio") };
					cargadorErrores.addError("errors.required", mensaje, true);
				}else if (!StringUtils.isEmpty(this.getFechaFin())){
				//	String[] mensaje = { StringEscapeUtils.escapeHtml("Si informa Fecha de Finalización debe informar una Fecha de  Inicio") };
				//	cargadorErrores.addError("errors.dynamic", mensaje, true);
				}
		}
		CValidaFecha.validaFormatoDDMMAAAAYComparaFechas(this.getFechaInicio(), this.getFechaFin(),cargadorErrores, "La Fecha de Inicio","La Fecha de Finalización");
	}

	public void validarFechaFin(CValidator cargadorErrores, IValidable validator) throws CException {
		if (StringUtils.isEmpty(this.getFechaFin())){
			if (EEstadoInstrumento.EJE.equals(this.getEstado()) || this.esPDT) {
				String[] mensaje = { StringEscapeUtils.escapeHtml("La Fecha de Finalización") };
				cargadorErrores.addError("errors.required", mensaje, true);
			}else if(!StringUtils.isEmpty(this.getFechaInicio())){
			//	String[] mensaje = { StringEscapeUtils.escapeHtml("Si informa Fecha de Inicio debe informar una Fecha de Finalización") };
			//	cargadorErrores.addError("errors.dynamic", mensaje, true);
			}
		}
	}

	public void validarNumeroResolucion(CValidator cargadorErrores, IValidable validator) throws CException {
		if (EEstadoInstrumento.EJE.equals(this.getEstado())) {
			validator.validar(cargadorErrores);

			if (this.resoluciones.isEmpty()) {
				String[] mensaje = { StringEscapeUtils.escapeHtml("Al menos una Resolución es necesario si el estado es EN EJECUCION") };
				cargadorErrores.addError("errors.dynamic", mensaje, true);
			}
		}
	}

	public void validarResponsable(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		if (!CComboWrapper.isSeleccionado(responsable)) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("El Responsable") };
			cargadorErrores.addError("errors.required", mensaje, true);
		}
	}

/*
	public void validarMonto(CValidator cargadorErrores, IValidable validator) throws CException {
		validator.validar(cargadorErrores);
		if (monto.compareTo(BigDecimal.ZERO) <= 0) {
			String[] mensaje = { StringEscapeUtils.escapeHtml("El Monto") };
			cargadorErrores.addError("errors.required", mensaje, true);
		}
	}*/

	public void setItemTramiteEliminar(String itemTramiteEliminar) {
		this.itemTramiteEliminar = itemTramiteEliminar;
	}

	public String getItemTramiteEliminar() {
		return itemTramiteEliminar;
	}

	public boolean getMostrarDatosExcel(){
		if (StringUtils.isNotEmpty(this.contratanteNombreTexto) || StringUtils.isNotEmpty(this.contratanteSiglaTexto) || StringUtils.isNotEmpty(this.montoOtraMonedaTexto)
				|| StringUtils.isNotEmpty(this.montoTexto) || StringUtils.isNotEmpty(this.numeroTramiteTexto)
				|| StringUtils.isNotEmpty(this.responsableTexto) || StringUtils.isNotEmpty(this.tipoConvTexto) || StringUtils.isNotEmpty(this.getUvtTexto())) {
			return true;
		}
		return false;
	}

	public void setUsuario(CUsuarioSvt usuario) {
		this.usuario = usuario;
	}

	public CUsuarioSvt getUsuario() {
		return usuario;
	}

	public String getRolUsuario(){
		if(usuario!=null) {
			return usuario.getRol().getId();
		} else {
			return "";
		}
	}


	public void setInstitucionSeleccionado(String institucionSeleccionado) {
		if(!this.institucionSeleccionado.equalsIgnoreCase(institucionSeleccionado)){
		this.institucionSeleccionado = institucionSeleccionado;
			/*for (CInstrumentoItemDistribucion dist : this.itemsDistribucion) {
				if (dist.getTipoDistribucion().equals(ETipoInstrumentoDistribucion.OTRA_INSTITUCION)) {
					CInstrumentoItemDistribucionOtraInstitucion distOtra = (CInstrumentoItemDistribucionOtraInstitucion) dist;
					if(StringUtils.isNotEmpty(institucionSeleccionado))
						distOtra.setOtraInstitucion((CEntidad) getObjetoBuscadoById(new Long(getInstitucionSeleccionado()), CEntidad.class));
					else
						distOtra.setOtraInstitucion(null);
					break;
				}
			}*/
		}
	}

	public String getInstitucionSeleccionado() {
		return institucionSeleccionado;
	}

	public String getInstitucionDescripcion(){
		for (CInstrumentoItemDistribucionStruct dist : this.comisionOtraInstitucion) {
			return dist.getOtraInstitucion().getDescripcion();
		}

		return "";
	}
/*
	public void setearDistribucionBasica() {
		CInstrumentoItemDistribucion id = new CInstrumentoItemDistribucion(ETipoInstrumentoDistribucion.FONDO_CONICET);
		this.itemsDistribucion.add(id);
		id =  new CInstrumentoItemDistribucion(ETipoInstrumentoDistribucion.UVT);
		this.itemsDistribucion.add(id);
		id= new CInstrumentoItemDistribucionOtraInstitucion(ETipoInstrumentoDistribucion.OTRA_INSTITUCION);
		this.itemsDistribucion.add(id);
	}*/

	public void setPorcentajeMapped(String index, String val) {
		try {

			BigDecimal b = new BigDecimal(val);
			if (val != null) {
				CInstrumentoItemDistribucionStruct i = this.itemsDistribucionStruct.get(new Integer(index));
				i.setPorcentaje(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String getPorcentajeMapped(String index) {
		return this.itemsDistribucionStruct.get(new Integer(index)).getPorcentaje().toString();
	}



	public void setEsModificable(boolean esModificable) {
		this.esModificable = esModificable;
	}

	public boolean getEsModificable() {
		return esModificable;
	}

	public void setTiposItems(List<CTipoItemFacturacion> tiposItems) {
		this.tiposItems = tiposItems;
	}

	public List<CTipoItemFacturacion> getTiposItems() {
		return tiposItems;
	}

	public void inicializarDistribucion(){
		List<CTipoItemFacturacion> col= CFacturaAMForm.sortTipoItemFacturacionByOrdenListado(this.getTiposItems());

		this.getItemsDistribucionStruct().clear();
		for (CTipoItemFacturacion cTE : col) {
			if (!cTE.isComisionUVTParaCentral() && !cTE.isRetencion()) {

				if(soloDistribucionExcel && (cTE.isUnidadDivisional() || cTE.isProductividad() || cTE.isCostos())){
					continue;
				}
				CInstrumentoItemDistribucionStruct sc = new CInstrumentoItemDistribucionStruct(cTE);
				this.getItemsDistribucionStruct().add(sc);
			}
		}
	}

	public void setItemsDistribucionStruct(List<CInstrumentoItemDistribucionStruct> itemsDistribucionStruc) {
		this.itemsDistribucionStruct = itemsDistribucionStruc;
	}

	public List<CInstrumentoItemDistribucionStruct> getItemsDistribucionStruct() {
		return itemsDistribucionStruct;
	}



	public void setDistribucion(Collection<CInstrumentoItemDistribucion> col) {


		//con id del tipo de servicio de key
		Map<Integer,List<CInstrumentoItemDistribucionStruct>> mapaDistribuciones = new HashMap<Integer, List<CInstrumentoItemDistribucionStruct>>();



		Map<String, CInstrumentoItemDistribucionStruct> mapDCompleta = new HashMap<String, CInstrumentoItemDistribucionStruct>();

		for (CInstrumentoItemDistribucionStruct item : this.getItemsDistribucionStruct()) {
			mapDCompleta.put(item.getTipoItem().getCodigo(), item);
		}
		this.getProductividadEntidad().clear();
		this.getItemsDistribucionStruct().clear();
		if(!this.soloDistribucionExcel)
		{
			inicializarDistribucion();
		}

		BigDecimal importeTotalFactura = BigDecimal.ZERO;
		BigDecimal totalProductividad = BigDecimal.ZERO;
		BigDecimal totalPorcentajeProductividad = BigDecimal.ZERO;
		BigDecimal totalComisionContraparte = BigDecimal.ZERO;
		BigDecimal totalPorcentajeComisionContraparte = BigDecimal.ZERO;
		BigDecimal importeParcialComisiones = BigDecimal.ZERO;
		BigDecimal importeSaldoADistribuir = BigDecimal.ZERO;

		for (CInstrumentoItemDistribucion dis : col) {
			CInstrumentoItemDistribucionStruct dc = new CInstrumentoItemDistribucionStruct(dis);

			// ------------------------- productividad
			// --------------------------------------//
			if (dis.getTipoItem().isProductividad()) {

				totalProductividad = totalProductividad.add(dis.getImporte());
				totalPorcentajeProductividad = totalPorcentajeProductividad.add(dis.getPorcentaje());
				this.productividadEntidad.add(dc);

				// ------------------------- instituto contraparte
				// --------------------------------------//
			} else if (dis.getTipoItem().isInstitutoContraparte()) {
				totalComisionContraparte = totalComisionContraparte.add(dis.getImporte());
				totalPorcentajeComisionContraparte = totalPorcentajeComisionContraparte.add(dis.getPorcentaje());
				this.getComisionOtraInstitucion().add(dc);
			} else {
				importeTotalFactura = importeTotalFactura.add(dis.getImporte());
				// solo comisiones
				if (dis.getTipoItem().isComision()) {
					importeParcialComisiones = importeParcialComisiones.add(dis.getImporte());
					// es unidad divisional (saldo a distr: unidad
					// div+productividad
				} else if (dis.getTipoItem().isUnidadDivisional()) {
					importeSaldoADistribuir = importeSaldoADistribuir.add(dis.getImporte());
				}

				mapDCompleta.put(dc.getTipoItem().getCodigo(), new CInstrumentoItemDistribucionStruct(dis));
			}

		}

		CInstrumentoItemDistribucionStruct item ;

		// setea lso totales de las distribuciones
		if((item = mapDCompleta.get("PRO")) !=null){
			item.setImporte(totalProductividad);
			item.setPorcentaje(totalPorcentajeProductividad);
		}
		if((item = mapDCompleta.get("ICO")) !=null){
			item.setImporte(totalComisionContraparte);
			item.setPorcentaje(totalPorcentajeComisionContraparte);
		}



		this.getItemsDistribucionStruct().addAll(CInstrumentoItemDistribucionStruct.sortDistribucionByOrdenListado(mapDCompleta.values()));

		// CARGA LOS TOTALIZADORES
		this.setTotalComisiones((importeTotalFactura.add(totalProductividad).add(totalComisionContraparte)));
		this.setTotalParcialComisiones(importeParcialComisiones.add(totalComisionContraparte));
		this.setSaldoADistribuir((importeSaldoADistribuir.add(totalProductividad)));
	}

	public List<CInstrumentoItemDistribucionStruct> getProductividadEntidad() {
		return productividadEntidad;
	}

	public void setProductividadEntidad(
			List<CInstrumentoItemDistribucionStruct> productividadEntidad) {
		this.productividadEntidad = productividadEntidad;
	}

	public BigDecimal calculoPorcentaje(BigDecimal importe, BigDecimal importeFactura){
		if (importe==null || importeFactura==null) {
			return BigDecimal.ZERO;
		}
		if (importe.compareTo(BigDecimal.ZERO)==0) {
			return BigDecimal.ZERO;
		}
		if (importeFactura.compareTo(BigDecimal.ZERO )==0) {
			return BigDecimal.ZERO;
		}

		BigDecimal porc = new BigDecimal("100").multiply(importe);
		porc= porc.divide(importeFactura,2, BigDecimal.ROUND_HALF_EVEN );
		return porc;
	}

	public void setComisionOtraInstitucion(List<CInstrumentoItemDistribucionStruct> comisionOtraInstitucion) {
		this.comisionOtraInstitucion = comisionOtraInstitucion;
	}

	public List<CInstrumentoItemDistribucionStruct> getComisionOtraInstitucion() {
		return comisionOtraInstitucion;
	}




	public List<CInstrumentoItemDistribucionStruct> getDistribucionConPorcentajesDesdeSaldoADist(
			List<CInstrumentoItemDistribucionStruct> distribucion) {
		// TODO Auto-generated method stub
		BigDecimal porcentajeFactura=BigDecimal.ZERO;
		BigDecimal CIEN= new BigDecimal("100");
		BigDecimal saldoAD=this.getSaldoADistribuir();
		List<CInstrumentoItemDistribucionStruct> nuevaDistribucion=new LinkedList<CInstrumentoItemDistribucionStruct>();
		for (CInstrumentoItemDistribucionStruct fid : distribucion) {
			if (fid.getTipoItem().isUnidadDivisional() || fid.getTipoItem().isProductividad()){
				/**
				 * ESTO QUE SE COMENTÓ ABAJO ESTABA HECHO PARA CUANDO SE AGREGABAN IMPORTES Y PORCENTAJES A LAS DISTR.
				 * HASTA TANTO NO SE CONTINUE NO SE VA A HACER NADA PARA QUE QUEDE EL % CORRECTO.
				 */
				/*porcentajeFactura = CIEN.multiply(fid.getImporte()).setScale(2,BigDecimal.ROUND_HALF_EVEN);
				if (saldoAD.compareTo(BigDecimal.ZERO)!=0){
					porcentajeFactura =porcentajeFactura.divide(saldoAD,2, BigDecimal.ROUND_HALF_EVEN);
				}
				fid.setPorcentaje(porcentajeFactura);*/

			}
			nuevaDistribucion.add(fid);
		}
		return nuevaDistribucion;
	}

	public void setTotalComisiones(BigDecimal totalComisiones) {
		this.totalComisiones = totalComisiones;
	}

	public BigDecimal getTotalComisiones() {
		return totalComisiones.setScale(2);
	}

	public void setTotalParcialComisiones(BigDecimal totalParcialComisiones) {
		this.totalParcialComisiones = totalParcialComisiones;
	}

	public BigDecimal getTotalParcialComisiones() {
		return totalParcialComisiones.setScale(2);
	}

	public void setSaldoADistribuir(BigDecimal saldoADistribuir) {
		this.saldoADistribuir = saldoADistribuir;
	}

	public BigDecimal getSaldoADistribuir() {
		return saldoADistribuir.setScale(2);
	}

	public HashMap<CInstrumentoItemDistribucionStruct, BigDecimal> getMapImportesAnteriores() {
		return mapImportesAnteriores;
	}

	public void setMapImportesAnteriores(HashMap<CInstrumentoItemDistribucionStruct, BigDecimal> mapImportesAnteriores) {
		this.mapImportesAnteriores = mapImportesAnteriores;
	}

	public void setUvtFacturarSeleccionado(String uvtFacturarSeleccionado) {

		if(StringUtils.isNotEmpty(uvtFacturarSeleccionado)){
			/**se pregunta un caso o el otro porque al entrar por primera vez a modificar y completar una uvt facturadora
			 * (la misma estaba vacía), ocurre la segunda rama del OR (antes rompía porque solo preguntaba porque no
			 * sea igual y el this.uvtFacturarSeleccionado era null)
			 */
			if((this.uvtFacturarSeleccionado!=null && !this.uvtFacturarSeleccionado.equalsIgnoreCase(uvtFacturarSeleccionado))||
			   (this.uvtFacturarSeleccionado==null && StringUtils.isNotEmpty(uvtFacturarSeleccionado))){
				this.uvt = (CUvt) getObjetoBuscadoById(new Long(uvtFacturarSeleccionado), CUvt.class);
			}

		}else{
			this.uvt=null;
		}
		this.uvtFacturarSeleccionado = uvtFacturarSeleccionado;
	}

	public String getUvtFacturarSeleccionado() {
		return uvtFacturarSeleccionado;
	}

	public String getUvtDescripcion() {
		if(uvt!=null){
			return this.uvt.getDescripcion();
		}
		return "";
	}


	public Integer getNumeroResolucion() {
		return numeroResolucion;
	}

	public void setNumeroResolucion(Integer numeroResolucion) {
		if (numeroResolucion.equals(0)) {
			numeroResolucion = null;
		}
		this.numeroResolucion = numeroResolucion;
	}

	public String getTipoResolucion() {
		return getIdFromEnumIdentity(tipoResolucion);
	}

	public void setTipoResolucion(String tipoResolucion) {
		this.tipoResolucion = ETipoResolucion.getTipo(tipoResolucion);
	}

	public String getNroResolucionYTipo(){
		if(numeroResolucion!=null){
			if(tipoResolucion!=null) {
				return tipoResolucion.getId()+numeroResolucion;
			} else {
				return numeroResolucion.toString();
			}
		}
		return "";
	}

	public void setOtrosIngresos(String ingresos) {
		this.otrosIngresos = ingresos;
	}

	public String getOtrosIngresos() {
		return otrosIngresos;
	}

	// mappeds
	public String getPorcentajeComisionMapped(String key) {
		BigDecimal ret = BigDecimal.ZERO;
		try{
		CInstrumentoItemDistribucionStruct struct = this.itemsDistribucionStruct.get(new Integer(key).intValue());
		if (null != struct && null != struct.getPorcentaje()) {
			ret = struct.getPorcentaje();
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return ret.setScale(2).toString();
	}

	public void setPorcentajeComisionMapped(String key, String i) {
		CInstrumentoItemDistribucionStruct struct = this.itemsDistribucionStruct.get(new Integer(key).intValue());
		try{
			struct.setPorcentaje(new BigDecimal(i));
		}catch (Exception e) {
			struct.setPorcentaje(BigDecimal.ZERO);
		}
	}

	public String getImporteComisionMapped(String key) {
		BigDecimal ret = BigDecimal.ZERO;
		try {
			CInstrumentoItemDistribucionStruct struct = this.itemsDistribucionStruct.get(new Integer(key).intValue());
			if (null != struct && null != struct.getImporte()) {
				ret = struct.getImporte();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ret.setScale(2).toString();
	}

	public void setImporteComisionMapped(String key, String value) {
		int index = Integer.valueOf(key).intValue();
		CInstrumentoItemDistribucionStruct struct = this.itemsDistribucionStruct.get(index);
		try{
			struct.setImporte(new BigDecimal(value));
		}catch (Exception e) {
			struct.setImporte(BigDecimal.ZERO);
		}

	}

	public void setPatente(String patente) {
		this.patente = patente;
	}

	public String getPatente() {
		return patente;
	}



	public boolean getSoloDistribucionExcel() {
		return soloDistribucionExcel;
	}

	public boolean agregarMonto(ActionMessages errors) {
		CInstrumentoMonto im = null;

		if(this.tipoMonto==null){
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El Tipo del monto es necesario."));
		}
		if(!CComboWrapper.isSeleccionado(this.otraMoneda)) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El tipo de la moneda es necesario."));
		}
		else if ( this.observacionMonto.length()>256){
			errors.add("instrumento", new ActionMessage("errors.required", "La observación no debe tener más de 256 caracteres. "));
		}
		/*else{
			for(CInstrumentoMonto m: montosInstrumento){
				if(m.getTipoMoneda().getId().equals(this.otraMoneda)){
					errors.add("instrumento", new ActionMessage("errors.dynamic", "El tipo de la moneda ya fue seleccionado."));
				}
			}
		}*/

		if(this.monto==null || this.monto.compareTo(BigDecimal.ZERO)<=0){
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El monto debe ser mayor a 0."));
		}


		if (errors.isEmpty()) {
			im =  new  CInstrumentoMonto();
			im.setMonto(this.monto);
			im.setObservacion(this.observacionMonto);

			for(CTipoMoneda m: this.tiposMoneda ){
				if(m.getId().equals(this.otraMoneda)){
					im.setTipoMoneda(m);
				}
			}

			im.setTipoMonto(this.tipoMonto);

			this.monto = BigDecimal.ZERO;
			this.observacionMonto = "";
			this.otraMoneda = null;
			this.tipoMonto = null;

			this.montosInstrumento.add(im);
			return true;
		}else{
			return false;
		}

	}

	public boolean agregarResolucion(ActionMessages errors) {
		CInstrumentoResolucion im = null;

		if(this.tipoResolucion==null){
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El Tipo de Resolución es necesario."));
		}
		if(this.numeroResolucion==null){
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El Número de Resolución es necesario."));
		}
		if(!CComboWrapper.isSeleccionado(this.añoResolucion)) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El año de Resolución es necesario."));
		}
		if(!CComboWrapper.isSeleccionado(this.pdtResolucion)) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "Indique si la Resolución es por Actividad o PDT."));
		}

		if (errors.isEmpty()) {
			im =  new  CInstrumentoResolucion();
			im.setAño(this.añoResolucion);
			im.setNumero(this.numeroResolucion);
			im.setTipoResolucion(this.tipoResolucion);
			im.setPdt(this.pdtResolucion);
			limpiarResolucionAgregar();
			this.resoluciones.add(im);
			return true;
		}else{
			return false;
		}

	}

	private void limpiarResolucionAgregar() {
		this.añoResolucion = null;
		this.tipoResolucion = null;
		this.numeroResolucion = null;
		this.pdtResolucion= null;
	}

	public boolean getEnEjecucion(){
		return EEstadoInstrumento.EJE.equals(this.estado);
	}



	public ArrayList<CInstrumentoMonto> getMontosInstrumento() {
		return montosInstrumento;
	}

	public void setMontosInstrumento(ArrayList<CInstrumentoMonto> montosInstrumento) {
		this.montosInstrumento = montosInstrumento;
	}

	public void setObservacionMonto(String observacionMonto) {
		this.observacionMonto = observacionMonto;
	}

	public String getObservacionMonto() {
		return observacionMonto;
	}

	public void setTipoMonto(String tipoMonto) {
		this.tipoMonto = ETipoMonto.getTipo(tipoMonto);
	}

	public String getTipoMonto() {
		return getIdFromEnumIdentity(this.tipoMonto);
	}

	public void setTiposMonedas(Collection<CTipoMoneda> tiposMoneda) {
		this.tiposMoneda = tiposMoneda;
	}

	public Collection<CTipoMoneda> getTiposMoneda() {
		return tiposMoneda;
	}

	public void setParticipantesInstrumento(List<CInstrumentoParticipante> participantesInstrumento) {
		this.participantesInstrumento = participantesInstrumento;
	}

	public List<CInstrumentoParticipante> getParticipantesInstrumento() {
		return participantesInstrumento;
	}

	public boolean agregarParticipante(ActionMessages errors) {
		CInstrumentoParticipante ip = null;

		if(this.rolParticipante ==null){
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El Rol del participante es necesario."));
		}
		if(this.participante == null) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "El Participante es necesario"));
		}

		if (errors.isEmpty()) {
			ip =  new  CInstrumentoParticipante();
			ip.setParticipante(this.participante);
			ip.setRolParticipante(this.rolParticipante);

			this.participante = null;
			this.rolParticipante = null;
			this.participantesInstrumento.add(ip);
			return true;
		}else{
			return false;
		}
	}

	public String getParticipanteSeleccionado(){
		if(participante!=null){
			return participante.getId().toString();
		}
		return "";
	}

	public void setParticipanteSeleccionado(String id){
		try{
			this.participante = (CPersonaSVT) getObjetoBuscadoById(new Long(id) , CPersonaSVT.class);
		}catch (Exception e) {
			this.participante = null;
		}
	}




	public String getRolParticipante() {
		return getIdFromEnumIdentity(this.rolParticipante);
	}

	public void setRolParticipante(String rolParticipante) {
		this.rolParticipante = ERolParticipante.getTipo(rolParticipante);
	}



	public void setFilePlanDeTrabajo(FormFile file){
		if (file != null) {
			if (file.getFileSize() <= 0) {
				errors.add("instrumento", new ActionMessage("errors.dynamic", "El archivo se encuentra vacío."));
			} else if (file.getFileSize() >= 2097152) {
				errors.add("instrumento", new ActionMessage("errors.dynamic", "El tamaño del Plan de Trabajo debe ser menor a 2MB."));
			}else if (!file.getContentType().equalsIgnoreCase("application/pdf") ||(file.getFileName().length()>4 && !file.getFileName().substring(file.getFileName().length()-4).equalsIgnoreCase(".pdf"))) {
				errors.add("instrumento", new ActionMessage("errors.dynamic", "El formato del archivo debe ser: *.pdf ."));
			}else{
				this.planDeTrabajo = new CArchivo(file);
			}
		}
	}

	public FormFile getFilePlanDeTrabajo(){
		return null;
	}

	public CArchivo getPlanDeTrabajo() {
		return planDeTrabajo;
	}

	public void setPlanDeTrabajo(CArchivo archivo) {
		this.planDeTrabajo = archivo;
	}


	public String getFileNamePlanDeTrabajo() {
		if(this.planDeTrabajo != null)
		{
			Float size = new Float(this.planDeTrabajo.getTamaño()/1024);
			return this.planDeTrabajo.getNombre() +" - "+ size.toString() + "KB";
		}
		return "";
	}

	public void setErrors(ActionErrors errors) {
		this.errors = errors;
	}

	public ActionErrors getErrors() {
		return errors;
	}

	public void setAm(ActionMessages am) {
		this.am = am;
	}

	public ActionMessages getAm() {
		return am;
	}



	public String getContraparteSeleccionado() {
		return contraparteSeleccionado;
	}

	public void setContraparteSeleccionado(String contraparteSeleccionado) {
		this.contraparteSeleccionado = contraparteSeleccionado;
	}

	public void setNumeroExpediente(String numeroExpediente) {
		this.numeroExpediente = numeroExpediente;
	}




	public void setAñoExpediente(String añoExpediente) {
		this.añoExpediente = añoExpediente;
	}



	public String getAñoExpediente() {
		return añoExpediente;
	}



	public void setObjetoDivulgacion(String objetoDivulgacion) {
		this.objetoDivulgacion = objetoDivulgacion;
	}



	public String getObjetoDivulgacion() {
		return objetoDivulgacion;
	}

	public void setComboTiposServicios(List<CTipoServicio> comboTiposServicios) {
		this.comboTiposServicios = comboTiposServicios;
	}

	public List<CTipoServicio> getComboTiposServicios() {
		return comboTiposServicios;
	}

	public List<CTipoServicio> getTiposServicios() {
		//iterar sobre todas las distribuciones y devovler lso tipos
		return new ArrayList<CTipoServicio>();
	}

	public List<CInstrumentoResolucion> getResoluciones() {
		return resoluciones;
	}

	public void setResoluciones(List<CInstrumentoResolucion> resoluciones) {
		this.resoluciones = resoluciones;
	}

	public Integer getAñoResolucion() {
		return añoResolucion;
	}

	public void setAñoResolucion(Integer añoResolucion) {
		this.añoResolucion = añoResolucion;
	}

	public String getClasificacionPDT() {
		return clasificacionPDT;
	}

	public void setClasificacionPDT(String clasificacionPDT) {
		this.clasificacionPDT = clasificacionPDT;
	}


	public void setEstado(EEstadoInstrumento estado) {
		// TODO Auto-generated method stub
		this.estado = estado;
	}

	public void setEstadoTramite(EEstadoTramiteInstrumento estadoTramite) {
		// TODO Auto-generated method stub
		this.estadoTramite = estadoTramite;
	}

	public String getCampoAplicacion() {
		return campoAplicacion;
	}

	public void setCampoAplicacion(String campoAplicacion) {
		this.campoAplicacion = campoAplicacion;
	}


	public String getContactoContratanteSeleccionado() {
		return contactoContratanteSeleccionado;
	}

	public void setContactoContratanteSeleccionado(String contactoContratanteSeleccionado) {
		this.contactoContratanteSeleccionado = contactoContratanteSeleccionado;
	}

	public void validarObservacionesFin(CValidator cargadorErrores, IValidable validator) throws CException {
		if (StringUtils.isNotEmpty(this.observacionesFin) && this.observacionesFin.length() > 256){
			String[] mensaje = { StringEscapeUtils.escapeHtml("La observación FIN no debe tener más de 256 caracteres.") };
			cargadorErrores.addError("errors.dynamic", mensaje, true);
		}
	}

	public String getPctiNro() {
		return pctiNro;
	}

	public void setPctiNro(String pctiNro) {
		this.pctiNro = pctiNro;
	}

	public String getPdtResolucion() {
		return getIdFromEnumIdentity(pdtResolucion);
	}

	public void setPdtResolucion(String pdtResolucion) {
		this.pdtResolucion = ETipoActividadPDT.getTipo(pdtResolucion);
	}

	public void validarFechaIngresoDVTS(CValidator cargadorErrores, IValidable validator) throws CException {
			CValidaFecha.validaInformeYFormatoDDMMAAAA(true, this.getFechaIngresoDVTS(),cargadorErrores,"La Fecha de Ingreso DVTS");
	}

	public String getTituloPdts() {
		return tituloPdts;
	}

	public void setTituloPdts(String tituloPdts) {
		this.tituloPdts = tituloPdts;
	}

	public String armarDetaleCriterioBusquedaHito() {
		StringBuffer r = new StringBuffer();
		r.append("Convenio: ").append(this.getInstrumento().getCodigo()).append(", ");
		if (this.getMapCriterio().containsKey("fechaDesde") && StringUtils.isNotEmpty(this.getMappedCriterio("fechaDesde"))) {
			r.append("Fecha Desde: ").append(this.getMappedCriterio("fechaDesde")).append(", ");
		}
		if (this.getMapCriterio().containsKey("fechaHasta") && StringUtils.isNotEmpty(this.getMappedCriterio("fechaHasta"))) {
			r.append("Fecha Hasta: ").append(this.getMappedCriterio("fechaHasta")).append(", ");
		}
		if (this.getMapCriterio().containsKey("busquedaTipoObligacion") && CComboWrapper.isSeleccionado(this.getMappedCriterio("busquedaTipoObligacion"))) {
			if (this.getMappedCriterio("busquedaTipoObligacion").equals("C")) {
				r.append("Obligación: ").append("Contractual").append(", ");
			}
			if (this.getMappedCriterio("busquedaTipoObligacion").equals("C")) {
			r.append("Obligación: ").append("De Seguimiento").append(", ");
		}
		}
		if (this.getMapCriterio().containsKey("actor") && StringUtils.isNotEmpty(this.getMappedCriterio("actor"))) {
			for (COptionCombo option : this.getComboActores()) {
				if (option.getValue().equals(this.getMappedCriterio("actor"))) {
					r.append("Actor: ").append(option.getLabel()).append(", ");
					break;
				}
			}
		}
		if (this.getMapCriterio().containsKey("tipoAccion") && CComboWrapper.isSeleccionado(this.getMappedCriterio("tipoAccion"))) {
			if (this.getMappedCriterio("tipoAccion").equals("E")) {
				r.append("Obligación: ").append("Económica").append(", ");
			}
			if (this.getMappedCriterio("tipoAccion").equals("O")) {
			r.append("Obligación: ").append("Operativa").append(", ");
		}
		}
		if (this.getMapCriterio().containsKey("estado") && CComboWrapper.isSeleccionado(this.getMappedCriterio("estado"))) {
			if (this.getMappedCriterio("estado").equals("N")) {
				r.append("Estado: ").append("Nuevo").append(", ");
			}
			if (this.getMappedCriterio("estado").equals("R")) {
			r.append("Estado: ").append("Realizado").append(", ");
		}
		}
		String ret = r.toString();
		if (ret.length() == 0) {
			ret = "No se seleccionaron";
		} else {
			ret = ret.substring(0, ret.length() - 2);
		}
		return ret;
	}


	public String armarDetaleCriterioBusquedaHojaRuta() {
		StringBuffer r = new StringBuffer();
		r.append("Convenio: ").append(this.getInstrumento().getCodigo()).append(", ");
		if (this.getMapCriterio().containsKey("usuarioHojaRuta")) {
			for (COptionCombo option : this.getUsuariosHojaRuta()) {
				if (option.getValue().equals(this.getMappedCriterio("usuarioHojaRuta"))) {
					r.append("Usuario alta: ").append(option.getLabel()).append(", ");
					break;
				}
			}
		}
		String ret = r.toString();
		if (ret.length() == 0) {
			ret = "No se seleccionaron";
		} else {
			ret = ret.substring(0, ret.length() - 2);
		}
		return ret;
	}

	public List<CInstrumentoParte> getAdministradoresInstrumento() {
		return administradoresInstrumento;
	}

	public void setAdministradoresInstrumento(
			List<CInstrumentoParte> administradoresInstrumento) {
		this.administradoresInstrumento = administradoresInstrumento;
	}

	public void setTipoAdmAgregar(String tipoAdmAgregar) {
		this.tipoAdmAgregar = EFuncionParteInstrumento.getTipo(tipoAdmAgregar);
	}

	public String getTipoAdmAgregar() {
		return getIdFromEnumIdentity(tipoAdmAgregar);
	}

	public void setTipoContactoAgregar(String tipoContactoAgregar) {
		this.tipoContactoAgregar = EFuncionParteInstrumento.getTipo(tipoContactoAgregar);
	}

	public String getTipoContactoAgregar() {
		return getIdFromEnumIdentity(tipoContactoAgregar);
	}

	public List<CInstrumentoParte> getUdsInstrumento() {
		return udsInstrumento;
	}

	public void setUdsInstrumento(List<CInstrumentoParte> udsInstrumento) {
		this.udsInstrumento = udsInstrumento;
	}

	public List<CInstrumentoParte> getContactosInstrumento() {
		return contactosInstrumento;
	}

	public void setContactosInstrumento(List<CInstrumentoParte> contactosInstrumento) {
		this.contactosInstrumento = contactosInstrumento;
	}


	public boolean agregarAdm(ActionMessages errors) {
		EFuncionParteInstrumento tipo = tipoAdmAgregar;
		CInstrumentoParte ip = null;
		Object parte = null;

		if (tipo == null || !CComboWrapper.isSeleccionado(tipo.getId())) {
			return false;
		} else if (StringUtils.isEmpty(getAutoCompleteMappedDescripcion(EAC.Delegado.name())) && StringUtils.isEmpty(getAutoCompleteMappedDescripcion(EAC.DeFondos.name()))) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "Debe seleccionar un adm."));
			return false;
		}else
			if (tipo.equals(EFuncionParteInstrumento.ADF)) {
				if ((parte = getDataAutoComplete(EAC.DeFondos)) != null){
					ip = new CInstrumentoParteUvt(EFuncionParteInstrumento.ADF, (CUvt) parte);
				}
		}
		else
			if(tipo.equals(EFuncionParteInstrumento.AD)){
				if ((parte = getDataAutoComplete(EAC.Delegado)) != null){
					ip = new CInstrumentoParteEntidad(EFuncionParteInstrumento.AD, (CEntidad) parte);
				}
			}

		if (ip != null) {
			for(CInstrumentoParte p : administradoresInstrumento){
				if (p.getFuncion().equals(ip.getFuncion()) && p.getParteAsIdentity().getId().equals(ip.getParteAsIdentity().getId())) {
					errors.add("instrumento", new ActionMessage("errors.dynamic", "El \"" + p.getDescripcion() + "\" ya se encuentre seleccionado para la función " + p.getFuncion().getDescripcion()));
					return false;
				}
			}
			administradoresInstrumento.add(ip);

			setAutoCompleteMappedDescripcion(EAC.DeFondos.name(), null);
			setAutoCompleteMappedDescripcion(EAC.Delegado.name(), null);
			this.tipoAdmAgregar = null;

			return true;
		}else{
			return false;
		}
	}

	public boolean agregarUD(ActionMessages errors) {
		CInstrumentoParte ip = null;
		Object parte = null;

		 if (StringUtils.isEmpty(prestadorSeleccionado)) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "Debe seleccionar un Prestador."));
			return false;
		}else
			if ((parte = getObjetoBuscadoById(new Long(prestadorSeleccionado), CEntidad.class)) != null) {
				ip = new CInstrumentoParteEntidad(EFuncionParteInstrumento.PRE, (CEntidad) parte);
			}

		if (ip != null) {
			for(CInstrumentoParte p : udsInstrumento){
				if (p.getFuncion().equals(ip.getFuncion()) && p.getParteAsIdentity().getId().equals(ip.getParteAsIdentity().getId())) {
					errors.add("instrumento", new ActionMessage("errors.dynamic", "El \"" + p.getDescripcion() + "\" ya se encuentre seleccionado "));
					return false;
				}
			}
			udsInstrumento.add(ip);

			this.prestadorSeleccionado = null;

			return true;
		}else{
			return false;
		}
	}

	public boolean agregarContacto(ActionMessages errors) {
		EFuncionParteInstrumento tipo = tipoContactoAgregar;
		CInstrumentoParte ip = null;
		Object parte = null;		
		if (tipo.equals(EFuncionParteInstrumento.CON) && StringUtils.isNotEmpty(getAutoCompleteMappedDescripcion(EAC.ContactoOtrosOrganismos.name())))
			setAutoCompleteMappedDescripcion(EAC.ContactoOtrosOrganismos.name(), null);
		if(tipo.equals(EFuncionParteInstrumento.COO) && StringUtils.isNotEmpty(contactoContratanteSeleccionado))
			this.contactoContratanteSeleccionado = null;
		if (tipo == null || !CComboWrapper.isSeleccionado(tipo.getId())) {
			return false;
		} else if (StringUtils.isEmpty(contactoContratanteSeleccionado) && StringUtils.isEmpty(getAutoCompleteMappedDescripcion(EAC.ContactoOtrosOrganismos.name()))) {
			errors.add("instrumento", new ActionMessage("errors.dynamic", "Debe seleccionar un Contacto."));
			return false;
		}else
			if (tipo.equals(EFuncionParteInstrumento.CON)) {
				if ((parte = getObjetoBuscadoById(new Long(contactoContratanteSeleccionado), CContactoContratante.class)) != null) {
					if ( ((CContactoContratante) parte).getContratante() ==null) {
						 ((CContactoContratante) parte).setContratante(  ((CContactoContratante) parte).getContratanteRelacion().getContratante() );
					}
					ip = new CInstrumentoParteContacto(EFuncionParteInstrumento.CON, (CContactoContratante) parte);
				}
		}else
			if(tipo.equals(EFuncionParteInstrumento.COO)){
				if ((parte = getDataAutoComplete(EAC.ContactoOtrosOrganismos)) != null){
					ip = new CInstrumentoParteContacto(EFuncionParteInstrumento.COO, (CContactoOtroOrganismo) parte);
				}
			}

		if (ip != null) {
			for(CInstrumentoParte p : contactosInstrumento){
				if (p.getFuncion().equals(ip.getFuncion()) && p.getParteAsIdentity().getId().equals(ip.getParteAsIdentity().getId())) {
					errors.add("instrumento", new ActionMessage("errors.dynamic", "El \"" + p.getDescripcion() + "\" ya se encuentre seleccionado "));
					return false;
				}
			}
			contactosInstrumento.add(ip);

			this.tipoContactoAgregar = null;
			this.contactoContratanteSeleccionado = null;
			setAutoCompleteMappedDescripcion(EAC.ContactoOtrosOrganismos.name(), null);

			return true;
		}else{
			return false;
		}
	}

	private void distribuirPartesInstrumento(Collection<CInstrumentoParte> partesInstrumento){
		Map<EFuncionParteInstrumento, List<CInstrumentoParte>> partes = new HashMap<EFuncionParteInstrumento, List<CInstrumentoParte>>();
		partes.put(EFuncionParteInstrumento.ADMINISTRADORES, this.administradoresInstrumento);
		partes.put(EFuncionParteInstrumento.PARTES, this.partesInstrumento);
		partes.put(EFuncionParteInstrumento.UDS, this.udsInstrumento);
		partes.put(EFuncionParteInstrumento.CONTACTOS, this.contactosInstrumento);
		for (CInstrumentoParte cInstrumentoParte : partesInstrumento) {
			partes.get(cInstrumentoParte.getFuncion().getPadre()).add(cInstrumentoParte);
		}
	}

	public boolean isMostrarPantallaCompleta() {
		return mostrarPantallaCompleta;
	}

	public void setMostrarPantallaCompleta(boolean mostrarPantallaCompleta) {
		this.mostrarPantallaCompleta = mostrarPantallaCompleta;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}



}
