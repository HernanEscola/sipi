package conicet.apps.svt.web.instrumento.form;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Field;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import conicet.apps.svt.object.archivo.CArchivo;
import conicet.apps.svt.object.instrumentoItemTramite.CInstrumentoItemTramite;
import conicet.apps.svt.object.instrumentoItemTramite.EEventoTramite;
import conicet.apps.svt.util.valida.CManejadorErrorSVT;
import conicet.apps.svt.web.dispatcher.form.CABMDispatchActionForm;
import conicet.framework.error.CException;
import conicet.framework.util.UFecha;
import conicet.framework.util.fecha.CFecha;
import conicet.framework.validator.CValidator;
import conicet.framework.validator.annotation.AField;
import conicet.framework.validator.decorator.IValidable;
import conicet.framework.validator.tipoField.TipoField;

public class CConvenioItemTramiteForm extends CABMDispatchActionForm<CInstrumentoItemTramite>{

	@AField(ordenValidacion = 1, label = "El evento", required=true, extraValidation = true, tipo = TipoField.COMBO)
	private String evento;
	private String observacion;
	@AField(ordenValidacion = 2, label = "La Fecha", required=true, tipo = TipoField.FECHA)
	private String fecha;

	protected String fileTextDocumentacion;
	protected FormFile file;
	protected CArchivo archivo;

	//private CInstrumento instrumento;

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		if(file == null)
		{
			this.file = null;
		}
		if(file.getFileSize() > 0) {
			this.file = file;
		}
	}

	public CArchivo getArchivo() {
		return archivo;
	}

	public void setArchivo(CArchivo archivo) {
		this.archivo = archivo;
	}

	private CInstrumentoItemTramite itemTramite;

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public void setEvento(String evento) {
		this.evento = evento;
	}

	public String getEvento() {
		return evento;
	}

	@Override
	public void limpiar() {
		super.limpiar();
		this.file = null;
		this.archivo = null;
		this.evento = null;
		this.observacion = null;
		this.fecha = null;
	}

	@Override
	public CInstrumentoItemTramite getData() {
		CInstrumentoItemTramite itemTramite = null;
		//poner aca tods las condiciones que
		itemTramite = new CInstrumentoItemTramite();
		//itemTramite.setTipoItemTramite(ETipoInstrumentoItemTramite.TRAMITE);

		setearArchivo(itemTramite);

		itemTramite.setEvento(EEventoTramite.getTipo(this.getEvento()));
		itemTramite.setObservacion(this.getObservacion());
		try {
			itemTramite.setFechaTramite(CFecha.fechaLatinoToSqlDate(this.getFecha()));
		} catch (CException e) {
			e.printStackTrace();
		}
		return itemTramite;
	}

	@Override
	public void setData(CInstrumentoItemTramite item) {
		this.setEvento(item.getEvento().getValue());
		this.setObservacion(item.getObservacion());
		if (item.getFechaTramite() != null) {
			this.setFecha(CFecha.formatFechaDDMMAAAAConGuion(item.getFechaTramite()));
		}
		if (item.getArchivo() != null){
			this.setArchivo(item.getArchivo());
		}

	}

	@Override
	public void validarField(AField arg0, Field arg1, ActionErrors arg2)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		ActionMessages am = new ActionMessages();

		if (this.getBtnSubmit().equalsIgnoreCase("Registrar")) {
			try {
				this.validarFields(errors, am, new CManejadorErrorSVT());
			} catch (CException ex) {
				errors.add("convenioItemTramite", new ActionMessage(ex.getMessage()));
				ex.printStackTrace();
			}


		}
		return errors;
	}

	private void setearArchivo(CInstrumentoItemTramite itemTramite) {

		try {
			if(this.file != null && this.file.getFileSize() > 0) {
				if(this.archivo == null) {
					this.archivo = new CArchivo(file);
				}else{
					this.archivo.setFile(this.file.getInputStream());
					this.archivo.setTamaño(this.file.getFileSize());
					this.archivo.setTipo(this.file.getContentType());
					this.archivo.setNombre(this.file.getFileName());
					this.archivo.setFechaCreacion(UFecha.hoy());
				}
			}
			itemTramite.setArchivo(archivo);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void borrarArchivo() {
		this.archivo = null;
		this.file = null;
	}

	public ActionErrors validarArchivo() {

		ActionErrors errors = new ActionErrors();
		ActionMessages am = new ActionMessages();
		if(file!= null)
		{
			if( file.getFileSize()<= 0)
			{
				errors.add("convenioItemTramite", new ActionMessage("errors.dynamic","El archivo se encuentra vacío."));
			}else if(file.getFileSize()>= 2621440) {
				errors.add("convenioItemTramite", new ActionMessage("errors.dynamic","El tamaño del comprobante del evento debe ser menor a 2.5MB."));
			}
			if(!file.getContentType().equalsIgnoreCase("image/jpeg") && !file.getContentType().equalsIgnoreCase("image/png") && !file.getContentType().equalsIgnoreCase("application/pdf"))
			{
				errors.add("convenioItemTramite", new ActionMessage("errors.dynamic","El formato del archivo debe ser: *.pdf o *.jpg o *.png."));
			}
		}
		return errors;
	}

	public String getFileName() {
		if(this.file != null && file.getFileSize() > 0)
		{
			Float size = new Float(this.file.getFileSize()/1024);
			return this.file.getFileName() +" - "+ size.toString() + "KB";
		}
		else if(this.archivo != null)
		{
			Float size = new Float(this.archivo.getTamaño()/1024);
			return this.archivo.getNombre() +" - "+ size.toString() + "KB";
		}
		return "";
	}

	public void setRemoverArchivo(String remover)
	{
		if(remover.equalsIgnoreCase("SI"))
		{
			borrarArchivo();
			setBtnSubmit("refrescar");
		}else if(remover.equalsIgnoreCase("NO"))
		{
			setBtnSubmit("validararchivo");
		}
	}

	public String getRemoverArchivo()
	{
		return "";
	}

	public void validarEvento(CValidator cargadorErrores,
			IValidable validator) throws CException {
		
			if (StringUtils.isEmpty(this.getEvento()) || this.getEvento().equalsIgnoreCase("-1") || this.getEvento().equalsIgnoreCase("-2") ){
				validator.validar(cargadorErrores);
			}		
		/*if (this.getEAccionesAction().compareTo(EAccionesAction.ALTA) == 0){
			validator.validar(cargadorErrores);
			for (CInstrumentoItemTramite itemsTramiteExistentes : ((CConvenio)this.getElementoSeleccionado()).getItemsTramite()) {
				if (itemsTramiteExistentes.getEvento().equals(this.evento)){
					String[] mensaje = { StringEscapeUtils
							.escapeHtml(("El evento que se quiere registrar ya existe para este Convenio.")) };
					cargadorErrores.addError("errors.dynamic", mensaje, true);
					break;
				}
			}
		}*/
	}

	public void setItemTramite(CInstrumentoItemTramite itemTramite) {
		this.itemTramite = itemTramite;
	}

	public CInstrumentoItemTramite getItemTramite() {
		return itemTramite;
	}

	/*private boolean permiteAdjuntarArchivo(String evento){
		if (evento.equals(EEventoTramite.PEDIDO_INFORMACION.getValue())||evento.equals(EEventoTramite.CARPETIN.getValue())||
			evento.equals(EEventoTramite.CON_ROMANI.getValue())||evento.equals(EEventoTramite.ENVIO_A_JURIDICO.getValue())||
			evento.equals(EEventoTramite.ENVIO_CONTROL_LEGAL_Y_TECNICO.getValue())||evento.equals(EEventoTramite.ENVIO_DIRECTORIO_A_TRATAR.getValue())||
			evento.equals(EEventoTramite.FALTA_DE_INFORMACION.getValue())||evento.equals(EEventoTramite.FIRMA.getValue())||
			evento.equals(EEventoTramite.NRO_EXPEDIENTE.getValue())||evento.equals(EEventoTramite.RECEPCION_DE_INFORMACION.getValue())){
			return true;
		}
		return false;
	}*/
}
