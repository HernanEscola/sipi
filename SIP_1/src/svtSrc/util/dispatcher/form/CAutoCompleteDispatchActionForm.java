package conicet.apps.svt.web.dispatcher.form;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import conicet.apps.svt.util.ajax.IJSONResponse;
import conicet.apps.svt.util.autoComplete.struct.CAutoCompleteMapAttributes;
import conicet.framework.object.IIdentity;

public abstract class CAutoCompleteDispatchActionForm<T> extends CDispatchActionForm<T> {
	private static final long serialVersionUID = 1L;
	private Collection<IIdentity> objetosBuscadosAutocomplete = new ArrayList<IIdentity>();
	protected Map<String, CAutoCompleteMapAttributes> autoCompleteMap = new HashMap<String, CAutoCompleteMapAttributes>();

	@Override
	public void clear() {
		this.setInput(null);
		this.setMethod(null);
		/*this.setInput("");
		this.setMethod("");*/
		autoCompleteMap.clear();
	}

	@Override
	public void limpiar() {
		objetosBuscadosAutocomplete.clear();
		autoCompleteMapLimpiar();
	}

	private void autoCompleteMapLimpiar() {
		for (CAutoCompleteMapAttributes ac : autoCompleteMap.values()) {
			ac.limpiar();
		}

	}

	public void setObjetosBuscadosAutocomplete(Collection<IIdentity> objetosBuscadosAutocomplete) {
		this.objetosBuscadosAutocomplete = objetosBuscadosAutocomplete;
	}

	public Collection<IIdentity> getObjetosBuscadosAutocomplete() {
		return objetosBuscadosAutocomplete;
	}

	public IIdentity getObjetoBuscadoById(Object id, Class clase) {
		return getObjetoBuscadoById(id, clase, objetosBuscadosAutocomplete);
	}

	public IIdentity getObjetoBuscadoById(Object id, Class clase, Collection<IIdentity> coleccion) {
		for (IIdentity i : coleccion) {
			if (id.toString().equals(i.getId().toString())) {
				Class actual = i.getClass();
				if (clase.isAssignableFrom(actual))
					return i;
			}
		}
		return null;
	}

	public String getAutoCompleteMappedId(String tipo) {
		String ret = null;
		CAutoCompleteMapAttributes ac = obtenerAutoCompleteMapAttribute(tipo);
		if(ac==null)
			return null;
		ret = ac.getId();
		return ret;
	}

	public void setAutoCompleteMappedId(String tipo, String value) {
		CAutoCompleteMapAttributes ac = obtenerAutoCompleteMapAttribute(tipo);
		if (ac != null) {
			ac.setId(value);
		}
	}

	public String getAutoCompleteMappedDescripcion(String tipo) {
		String ret = null;
		CAutoCompleteMapAttributes ac = obtenerAutoCompleteMapAttribute(tipo);
		if(ac == null)
			return null;
		ret = ac.getDescripcion();
		return ret;
	}

	public void setAutoCompleteMappedDescripcion(String tipo, String value) {
		CAutoCompleteMapAttributes ac = obtenerAutoCompleteMapAttribute(tipo);
		if (ac != null) {
			ac.setDescripcion(value);
		}
	}

	public String getAutoCompleteMapped(String tipo, String attributo) {
		String ret = null;
		CAutoCompleteMapAttributes ac = obtenerAutoCompleteMapAttribute(tipo);
		ret = ac.getAtributo(attributo);
		return ret;
	}

	public void setAutoCompleteMapped(String tipo, String attributo, String value) throws Exception {
		CAutoCompleteMapAttributes ac = obtenerAutoCompleteMapAttribute(tipo);
		ac.setAtributo(attributo, value);
	}

	/**
	 * <p>Devuelve el CAutoCompleteMapAttributes en bas ea un tipo:string</p>
	 * </p>
	 */
	public CAutoCompleteMapAttributes getAutoCompleteMapAttribute(String tipo) {// throws
																				// CException
																				// {
		/* try { */
		return obtenerAutoCompleteMapAttribute(tipo);
		/*
		 * } catch (Exception e) { throw new CException(1, e); }
		 */
	}
	
	/**
	 * <p>Devuelve el CAutoCompleteMapAttributes en base a un tipo:enum</p>
	 * </p>
	 */
	public CAutoCompleteMapAttributes getAutoCompleteMapAttribute(Enum tipo) {// throws
																				// CException
																				// {
		/* try { */
		return getAutoCompleteMapAttribute(formatName(tipo.name()));
		/*
		 * } catch (Exception e) { throw new CException(1, e); }
		 */
	}
	
	public IJSONResponse getIJsonResponse(Enum tipo) {
		CAutoCompleteMapAttributes ac = autoCompleteMap.get(formatName(tipo.name()));
		return ac.getJsonResponse();
	}

	
	private CAutoCompleteMapAttributes obtenerAutoCompleteMapAttribute(String tipo) {
		CAutoCompleteMapAttributes ac = autoCompleteMap.get(formatName(tipo));
		return ac;
	}

	/**
	 * <p>Agrega al Controlador del Autocomplete  el autocomplete en cuestion. El tipo es el nombre del atributo (el mismo q se usa en el tag autoComplete)</p>
	 * <p>El otro parametro es el JSONResponse q se ocupa de hacer la busqueda y devolver jsondata.
	 * </p>
	 */
	/*
	public void agregarAutoComplete(String tipo, IJSONResponse jsonResponse, IIdentity o, String descripcion) {
		this.autoCompleteMap.put(tipo.toLowerCase(), new CAutoCompleteMapAttributes(tipo, jsonResponse, o, descripcion));
	}*/

	/**
	 * <p>Agrega al Controlador del Autocomplete  el autocomplete en cuestion. El tipo es el Enum con el nombre del atributo (el mismo q se usa en el tag autoComplete)</p>
	 * <p>El otro parametro es el JSONResponse q se ocupa de hacer la busqueda y devolver jsondata.
	 * </p>
	 */
	public void agregarAutoComplete(Enum tipo, IJSONResponse jsonResponse, Class c) {
		this.autoCompleteMap.put(formatName(tipo.name()), new CAutoCompleteMapAttributes(formatName(tipo.name()), jsonResponse, c, false));
	}


	/**
	 * <p>Agrega al Controlador del Autocomplete  el autocomplete en cuestion. El tipo es el Enum con el nombre del atributo (el mismo q se usa en el tag autoComplete)</p>
	 * <p>El otro parametro es el JSONResponse q se ocupa de hacer la busqueda y devolver jsondata.
	 * </p>
	 */
	public void agregarAutoCompleteIngresarNuevo(Enum tipo, IJSONResponse jsonResponse, Class c) {
		this.autoCompleteMap.put(formatName(tipo.name()), new CAutoCompleteMapAttributes(formatName(tipo.name()), jsonResponse, c, true));
	}
	
	
	/**
	 * <p>Este metodo se utiliza en el setData para setear desde una clase los atributos correspondientes para q funcione el autocomplete.</p>
	 * <p>Se pasa por parametro un enum (el name del enum como tipo del autoComplete), un  IIdentity (el objeto en cuestion) y una descripcion en string
	 * </p>
	 */
	public void setDataAutoComplete(Enum e, IIdentity identity, String descripcion) {
		CAutoCompleteMapAttributes ac =  this.getAutoCompleteMapAttribute(e.name());
		if(ac!=null){
			ac.setData(identity, descripcion);
			if (identity != null) {
				getObjetosBuscadosAutocomplete().add(identity);
			}
		}else{
			// si entro por el detalle
			ac = new CAutoCompleteMapAttributes(formatName(e.name()), null, identity, descripcion);
			this.autoCompleteMap.put(ac.getTipo(), ac);
		}
	}
	
	
	/**
	 * <p>Este metodo se utiliza en el getData para armar el objeto seleccionado con autoComplete</p>
	 * <p> 
	 * </p>
	 */
	public Object getDataAutoComplete(Enum e) {
		CAutoCompleteMapAttributes ac = this.getAutoCompleteMapAttribute(e.name());
		if(StringUtils.isNotEmpty(ac.getId())){
			return getObjetoBuscadoById(ac.getId(), ac.getClase());
		}
		return null;
	}
	
	private String formatName(String name){
		return name.toLowerCase();
	}

}