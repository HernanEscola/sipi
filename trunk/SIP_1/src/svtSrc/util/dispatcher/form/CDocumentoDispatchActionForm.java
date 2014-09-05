package conicet.apps.svt.web.dispatcher.form;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

import conicet.apps.svt.object.archivo.CArchivo;
import conicet.apps.svt.object.archivo.IDocumento;
import conicet.framework.error.CException;

@SuppressWarnings("serial")
public abstract class CDocumentoDispatchActionForm<T> extends CAutoCompleteDispatchActionForm<T> {
	
	public static final String METODO_DESCARGAR_ARCHIVO = "descargarArchivo";
	
	public enum ETipoArchivo {

		JPG("image/jpeg","jpg"), PNG("image/png","png"), PDF("application/pdf","pdf"), TEXT("text/html", "");

		ETipoArchivo(String tipo, String extension) {
			this.tipo = tipo;
			this.extension = extension;
		}		

		private String tipo;
		private String extension;

		public String getExtension() {
			return extension;
		}

		public void setExtension(String extension) {
			this.extension = extension;
		}
		
		public String getTipo() {
			return tipo;
		}

		public void setTipo(String descripcion) {
			this.tipo = descripcion;
		}
	}
	
	private String descargarArchivoIndex;
	private String descargarArchivoTipo;
	protected Map<String, List<IDocumento>> documentosMap = new HashMap<String, List<IDocumento>>();
	protected Map<String, FormFile> filesMap = new HashMap<String, FormFile>();
	
	
	public void setFileMapped(String tipo, FormFile file) {
		this.filesMap.put(tipo, file);
	}
	public FormFile getFileMapped(String tipo) {
		return this.filesMap.get(tipo);
	}
	public void setDescargarArchivoMapped(String tipo, String index) {
		if (StringUtils.isNotEmpty(index)) {
			this.descargarArchivoTipo = tipo;
			setBtnSubmit(METODO_DESCARGAR_ARCHIVO);
		}
		this.descargarArchivoIndex = index;
	}
	public String getDescargarArchivoMapped(String tipo) {
		return this.descargarArchivoIndex;
	}
	public String getDescargarArchivoIndex() {
		return descargarArchivoIndex;
	}
	public void setDescargarArchivoIndex(String descargarArchivoIndex) {
		this.descargarArchivoIndex = descargarArchivoIndex;
	}
	public String getDescargarArchivoTipo() {
		return descargarArchivoTipo;
	}
	public void setDescargarArchivoTipo(String descargarArchivoTipo) {
		this.descargarArchivoTipo = descargarArchivoTipo;
	}
	public List<IDocumento> getDocumentos(IDocumento key) {
		return documentosMap.get(key.getTipoDocumento());
	}
	public List<IDocumento> getDocumentos(String key) {
		return (documentosMap.get(key) == null ? new ArrayList<IDocumento>() : documentosMap.get(key));
	}
	public void setDocumentos(String key, List<IDocumento> documentos) {
		if (documentosMap.get(key) != null) {
			documentosMap.get(key).clear();
			documentosMap.get(key).addAll(documentos);
		} else {
			documentosMap.put(key, documentos);
		}
	}
	public void setRemoverArchivoMapped(String tipo, String index) {
		if (StringUtils.isNotEmpty(tipo) && StringUtils.isNotEmpty(index) && 
				new Integer(index) <= getDocumentos(tipo).size()) {
			
			getDocumentos(tipo).remove((getDocumentos(tipo).get(new Integer(index))));
			setBtnSubmit("refrescar");
		}
	}
	public String getRemoverArchivoMapped(String tipo) {
		return "";
	}
	
	@Override
	public void clear() {
		super.clear();
		descargarArchivoIndex = "";
		descargarArchivoTipo = "";
		if (documentosMap == null) {
			documentosMap = new HashMap<String, List<IDocumento>>();
		} else {
			for (String key : documentosMap.keySet()) {
				documentosMap.put(key, new ArrayList<IDocumento>());
			}			
		}
	}
	
	public void agregarDocumento(IDocumento doc) {		
		doc.setArchivo(new CArchivo(getFileMapped(doc.getTipoDocumento())));
		this.documentosMap.get(doc.getTipoDocumento()).add(doc);
		setFileMapped(doc.getTipoDocumento(), null);
	}
	
	public String getDescripcionDocumentoMapped(String tipo) {
		if (getFileMapped(tipo) != null) {
			return getFileMapped(tipo).toString();
		} else {
			return "";
		}
	}
	
	public void validarFileDocumentacion(ActionErrors errors, String tipo, String property, int tamMaximo) throws CException {
		validarFileDocumentacion(errors, tipo, property, tamMaximo, ETipoArchivo.values());
	}
	
	public void validarFileDocumentacion(ActionErrors errors, String tipo, String property, int tamMaximo, ETipoArchivo[] tiposArchivoValidos) throws CException {
		if (getFileMapped(tipo) != null) {
			if (getFileMapped(tipo).getFileSize() <= 0) {
				errors.add(property, new ActionMessage("errors.dynamic", "El archivo se encuentra vacío."));
				setFileMapped(tipo, null);
				return;
			} else if (getFileMapped(tipo).getFileSize() >= 1024 * 1024 * tamMaximo) {
				errors.add(property, new ActionMessage("errors.dynamic", "El tamaño del archivo de la documentación debe ser menor a " + tamMaximo + "MB."));
				setFileMapped(tipo, null);
				return;
			}
			boolean tipoInvalido = true;
			for (ETipoArchivo tipoArchivo : tiposArchivoValidos) {
				if (getFileMapped(tipo).getContentType().equalsIgnoreCase(tipoArchivo.getTipo())) {
					tipoInvalido = false;
					break;
				}
			}
			if (tipoInvalido) {
				errors.add(property, new ActionMessage("errors.dynamic", getMsjErrorTipoArchivo(tiposArchivoValidos)));
				setFileMapped(tipo, null);
			}
		} else {
			errors.add(property, new ActionMessage("errors.required", "El archivo de la documentación"));
		}
	}
	
	private String getMsjErrorTipoArchivo(ETipoArchivo[] tiposValidos) {
		String msj = "El formato del archivo de la documentación debe ser:";
		
		for (ETipoArchivo tipo : tiposValidos) {
			if (StringUtils.isNotEmpty(tipo.getExtension())) {
				msj += " *." + tipo.getExtension() + " o";				
			}
		}
		
		return msj.substring(0, msj.length() - 2);
	}
}
