package conicet.apps.svt.web.instrumento.form;

import java.lang.reflect.Field;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import conicet.apps.svt.object.convenio.ETipoConvenio;
import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.object.gestor.CUvt;
import conicet.apps.svt.object.tipoMoneda.CTipoMoneda;
import conicet.apps.svt.util.valida.CValidaFecha;
import conicet.apps.svt.web.dispatcher.form.CBusquedaActionForm;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.validator.annotation.AField;

public class CInstrumentoBuscarActionForm extends CBusquedaActionForm  {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String tipoServicio;

	// alta desde /hasta
	private String fechaDesdeIngreso;
	private String fechaHastaIngreso;
	private String estado;
	private String tipo;
	private CEntidad parte;
	private String responsable;
	private String responsableDescripcion;
	private String prestadorDescripcion;
	private String contratanteDescripcion;
	private String investigadorDescripcion;
	private String nroTramite;
	private String añoTramite;
	private CUvt uvt;
	private boolean esPdt= false;
	private String clasificacionPDT;


	private ETipoConvenio tipoConvenio;
	//2. Tipo de Actividad (Adjunto la tabla)
	private String participanteDescripcion;
	private Integer  añoResolucion;
	private String numeroResolucion;
	private BigDecimal montoDesde;
	private BigDecimal montoHasta;
	private CTipoMoneda tipoMoneda;
	private String objeto;
	private String tituloPdts;
	private Integer añoExpediente;
	private String numeroExpediente;
	private String parteDescripcion;
	private String campoAplicacion;
	private String palabrasClave;
	private String codigo;
	private String[] estadoMultiple;
	//En este atributo seteo el valor seguimiento cuando se desea ver el listado para tal efecto.
	private String tipoBusqueda;
	private String pctiNro;

	public String getTipoServicio() {
		return tipoServicio;
	}

	public void setTipoServicio(String tipoServicio) {
		this.tipoServicio = tipoServicio;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public CUvt getUvt() {
		return uvt;
	}

	public void setUvt(CUvt uvt) {
		this.uvt = uvt;
	}

	@Override
	public void limpiar() {
		this.tipo="-1";
		this.setExisteBusqueda(false);
		this.añoTramite = "";
		this.contratanteDescripcion ="";
		this.estado = "";
		this.setFechaDesdeIngreso("");
		this.setFechaHastaIngreso("");
		this.investigadorDescripcion = "";
		this.nroTramite = "";
		this.parte = null;
		this.prestadorDescripcion = "";
		this.responsableDescripcion = "-1";
		this.responsable = "";
		this.esPdt = false;
		this.tipoConvenio = null;
		this.participanteDescripcion = null;
		this.añoResolucion = null;
		this.numeroResolucion = "";
		this.montoDesde = null;
		this.montoHasta = null;
		this.tipoMoneda = null;
		this.objeto = "";
		this.tituloPdts="";
		this.numeroExpediente = null;
		this.añoExpediente = null;
		this.parteDescripcion = null;
		this.clasificacionPDT = null;
		this.palabrasClave = null;
		this.codigo = null;
		this.pctiNro=null;
		this.setCampoAplicacion(null);
		this.clear();
		this.setEstadoMultiple(null);
	}

	public void limpiarTodo() {
		this.uvt = null;
		this.setTipoBusqueda(null);
		this.limpiar();
	}

	//es necesario usar el REset, porque cuando no hay UVTS seleccioandas no popula nada, entonces es necesario RESETEAR.
	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
		super.reset(mapping, request);
		if (this.getMethod()!= null && !this.getMethod().equalsIgnoreCase("detalle") ) {
			this.esPdt = false;
		}

	}
	@Override
	public void setData(Object objectModel) {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void validarField(AField annotation, Field attr, ActionErrors ae)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public CEntidad getParte() {
		return parte;
	}

	public void setParte(CEntidad parte) {
		this.parte = parte;
	}


	public String getResponsableDescripcion() {
		return responsableDescripcion;
	}

	public void setResponsableDescripcion(String responsableDescripcion) {
		this.responsableDescripcion = responsableDescripcion;
	}

	public String getPrestadorDescripcion() {
		return prestadorDescripcion;
	}

	public void setPrestadorDescripcion(String prestadorDescripcion) {
		this.prestadorDescripcion = prestadorDescripcion;
	}

	public String getContratanteDescripcion() {
		return contratanteDescripcion;
	}

	public void setContratanteDescripcion(String contratanteDescripcion) {
		this.contratanteDescripcion = contratanteDescripcion;
	}

	public String getInvestigadorDescripcion() {
		return investigadorDescripcion;
	}

	public void setInvestigadorDescripcion(String investigadorDescripcion) {
		this.investigadorDescripcion = investigadorDescripcion;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setAñoTramite(String añoTramite) {
		this.añoTramite = añoTramite;

	}

	public String getAñoTramite() {
		return añoTramite;
	}

	public void setNroTramite(String nroTramite) {
		this.nroTramite = nroTramite;
	}

	public String getNroTramite() {
		return nroTramite;
	}

	public void setFechaHastaIngreso(String fechaHastaIngreso) {
		this.fechaHastaIngreso = fechaHastaIngreso;
	}

	public String getFechaHastaIngreso() {
		return fechaHastaIngreso;
	}

	public void setFechaDesdeIngreso(String fechaDesdeIngreso) {
		this.fechaDesdeIngreso = fechaDesdeIngreso;
	}

	public String getFechaDesdeIngreso() {
		return fechaDesdeIngreso;
	}

	public void setEsPdt(boolean esPdt) {
		this.esPdt = esPdt;
	}

	public boolean getEsPdt() {
		return esPdt;
	}


	public String getParticipanteDescripcion() {
		return participanteDescripcion;
	}

	public void setParticipanteDescripcion(String participanteDescripcion) {
		this.participanteDescripcion = participanteDescripcion;
	}

	public String getMontoDesde() {
		try{
			return montoDesde.toString();
		}catch (Exception e) {
			return "";
		}

	}

	public void setMontoDesde(String monto) {
		try{
			this.montoDesde = new BigDecimal(monto);
		}catch (Exception e) {
			this.montoDesde = null;
		}
	}

	public String getMontoHasta() {
		try{
			return montoHasta.toString();
		}catch (Exception e) {
			return "";
		}
	}

	public void setMontoHasta(String monto) {
		try{
			this.montoHasta = new BigDecimal(monto);
		}catch (Exception e) {
			this.montoHasta = null;
		}
	}


	public String getObjeto() {
		return objeto;
	}

	public void setObjeto(String objeto) {
		this.objeto = objeto;
	}

	public void setTipoMoneda(String tipoMoneda) {
		if(CComboWrapper.isSeleccionado(tipoMoneda)) {
			this.tipoMoneda = new CTipoMoneda(new Integer(tipoMoneda));
		} else{
			this.tipoMoneda = null;
		}
	}
	public String getTipoMoneda(){
		if(tipoMoneda!=null) {
			return tipoMoneda.getId().toString();
		} else {
			return null;
		}
	}

	public void setAñoResolucion(Integer añoResolucion) {
		if(CComboWrapper.isSeleccionado(añoResolucion)) {
			this.añoResolucion = añoResolucion;
		} else{
			this.añoResolucion = null;
		}
	}

	public Integer getAñoResolucion() {
		return añoResolucion;
	}


	public void setTipoConvenio(String tipoConvenio) {
		this.tipoConvenio = ETipoConvenio.getTipo(tipoConvenio);
	}

	public String getTipoConvenio() {
		if(tipoConvenio!=null) {
			return tipoConvenio.getId();
		}
		return null;
	}

	public ETipoConvenio getTipoConvenioEnum() {
		return tipoConvenio;
	}

	public void setNumeroResolucion(String numeroResolucion) {
		this.numeroResolucion = numeroResolucion;
	}

	public String getNumeroResolucion() {
		return numeroResolucion;
	}

	public CTipoMoneda getTipoMonedaValue() {
		return this.tipoMoneda;
	}

	public BigDecimal getMontoDesdeValue() {
		return montoDesde;
	}

	public BigDecimal getMontoHastaValue() {
		return montoHasta;
	}

	public Integer getAñoExpediente() {
		return añoExpediente;
	}

	public void setAñoExpediente(Integer añoExpediente) {
		if(CComboWrapper.isSeleccionado(añoExpediente)) {
			this.añoExpediente = añoExpediente;
		} else{
			this.añoExpediente = null;
		}
	}

	public String getNumeroExpediente() {
		return numeroExpediente;
	}

	public void setNumeroExpediente(String numeroExpediente) {
		this.numeroExpediente = numeroExpediente;
	}

	public String getParteDescripcion() {
		return parteDescripcion;
	}

	public void setParteDescripcion(String parteDescripcion) {
		this.parteDescripcion = parteDescripcion;
	}

	public void setClasificacionPDT(String clasificacionPDT) {
		this.clasificacionPDT = clasificacionPDT;
	}

	public String getClasificacionPDT() {
		return clasificacionPDT;
	}

	public void setCampoAplicacion(String campoAplicacion) {
		this.campoAplicacion = campoAplicacion;
	}

	public String getCampoAplicacion() {
		return campoAplicacion;
	}

	public String getPalabrasClave() {
		return palabrasClave;
	}

	public void setPalabrasClave(String palabrasClave) {
		this.palabrasClave = palabrasClave;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String[] getEstadoMultiple() {
		return estadoMultiple;
	}

	public void setEstadoMultiple(String[] estadoMultiple) {
		this.estadoMultiple = estadoMultiple;
	}

	public String getTipoBusqueda() {
		return tipoBusqueda;
	}

	public void setTipoBusqueda(String tipoBusqueda) {
		this.tipoBusqueda = tipoBusqueda;
	}

	// VALIDACIONES DE PANTALLA
	@Override
	public final ActionErrors validate(ActionMapping mapping,
	                                   HttpServletRequest request) {
	  ActionErrors ea = new ActionErrors();


	  if ("Buscar".equalsIgnoreCase(this.getBtnSubmit())) {




		    // VALIDAR Y COMPARAR FECHAS DESDE Y HASTA DE CONVENIO
		    for (ActionMessage am :  CValidaFecha.validaFormatoDDMMAAAAYComparaFechas(this.getFechaDesdeIngreso(), this.getFechaHastaIngreso(), "La Fecha ")) {
					ea.add("buscarConvenio",am);
			}

		    if (!StringUtils.isEmpty(this.getMontoDesde()) &&
		            !StringUtils.isEmpty(this.getMontoHasta())) {
		          if (! (new BigDecimal(this.getMontoDesde()).compareTo(new
		              BigDecimal(this.getMontoHasta())) < 0)) {
					ea.add("buscarConvenio",
		                   new ActionMessage("errors.dynamic", "El monto desde debe ser menor a monto hasta"));
		          }
		     }




	  }
	  return ea;
	}

	public String getPctiNro() {
		return pctiNro;
	}

	public void setPctiNro(String pctiNro) {
		this.pctiNro = pctiNro;
	}

	public String getTituloPdts() {
		return tituloPdts;
	}

	public void setTituloPdts(String tituloPdts) {
		this.tituloPdts = tituloPdts;
	}



}
