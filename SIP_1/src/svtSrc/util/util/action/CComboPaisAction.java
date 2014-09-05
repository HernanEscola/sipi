package conicet.apps.svt.web.util.action;


import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.service.CGlobalService;
import conicet.apps.svt.util.ajax.CJsonResponseLocalidad;
import conicet.apps.svt.util.ajax.CJsonResponsePartido;
import conicet.apps.svt.util.ajax.CJsonResponseProvincia;
import conicet.apps.svt.util.interfaces.IDomicilio;
import conicet.apps.svt.web.dispatcher.action.CDispatchAction;
import conicet.apps.svt.web.global.decorator.CGlobalWrapper;
import conicet.framework.error.CException;
import conicet.framework.hibernate3.object.localidad.CLocalidad;
import conicet.framework.hibernate3.object.pais.CPais;
import conicet.framework.hibernate3.object.partido.CPartido;
import conicet.framework.hibernate3.object.provincia.CProvincia;
import conicet.framework.http.CSessionManager;
import conicet.framework.util.combo.CComboWrapper;
import conicet.framework.util.constantes.CConstantes;
import conicet.framework.web.COptionCombo;

public class CComboPaisAction extends CDispatchAction {

	public ActionForward prepararComboProvincias(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException {
			CJsonResponseProvincia js = new CJsonResponseProvincia(request);
			js.getJsonData(request, response);
			return null;
	}

	public ActionForward prepararComboLocalidades(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException {
			CJsonResponseLocalidad js = new CJsonResponseLocalidad(request);
			js.getJsonData(request, response);
			return null;
	}

	public ActionForward prepararComboPartidos(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) throws CException {
			CJsonResponsePartido js = new CJsonResponsePartido (request);
			js.getJsonData(request, response);
			return null;
	}

	public static void setearCombosEnSesion(HttpServletRequest request, String tipo) throws CException{
		CSessionManager sessionManager = CSessionManager.getInstance(request);

		generarComboProvincias(request, tipo, null);
		generarComboPartidos(request, tipo, null);
		generarComboLocalidades(request, tipo, null);
		generarComboPaises(request, tipo);
	}
/**
 * SE UTILIZA PARA TRABAJAR CON COMBOS CUANDO EL PAIS ES UNICAMENTE ARGENTINA. ADEMAS LEVANTA LOS COMBOS SEGUN LOS VALORESW
 * PREEXISTENTES, PARA UTILIZAR EN MODIFICACIONES
 * @param request
 * @param tipo o null (para cuando existen mas de un juego de combos)El contenido de tipo se agregará al nombre del combo
 * @param localidad (idem partido pero partiendo desde la localidad)
 * @param partido (para mostrar solo las localidades relacionadas con ese partido, y la provincia seleccionada)
 * @param provincia (para mostrar solo los partidos relacionados con esa provincia)
 * @throws CException
 */

	public static void setearCombosEnSesionLocalidadPartidoProvinciaByArgentina(HttpServletRequest request, String tipo,CLocalidad localidad,CPartido partido,CProvincia provincia) throws CException{
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		generarComboPaises(request, tipo);
		generarComboProvincias(request, tipo, CConstantes.paisArgentina);
		if (CComboWrapper.isSeleccionado(localidad)){
			generarComboLocalidades(request, tipo, localidad.getPartido().getCodigo());
			generarComboPartidos(request, tipo, localidad.getPartido().getProvincia().getCodigo());
		}else if (CComboWrapper.isSeleccionado(partido)){
			generarComboLocalidades(request, tipo, partido.getCodigo());
			generarComboPartidos(request, tipo, partido.getProvincia().getCodigo());
		}else if (CComboWrapper.isSeleccionado(provincia)){
			generarComboLocalidades(request, tipo,null);
			generarComboPartidos(request, tipo,provincia.getCodigo());
		}else{
			generarComboLocalidades(request, tipo,null);
			generarComboPartidos(request, tipo,null);

		}

	}

	public static void setearCombosEnSesionByLocalidad(HttpServletRequest request, String tipo, CLocalidad localidad) throws CException{
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		if(localidad == null){
			setearCombosEnSesion(request, tipo);
		}else{
			CPartido partido = localidad.getPartido();
			CProvincia provincia = partido.getProvincia();
			CPais pais =  provincia.getPais();

			generarComboPaises(request, tipo);
			generarComboProvincias(request, tipo, pais.getCodigo());
			generarComboPartidos(request, tipo, provincia.getCodigo());
			generarComboLocalidades(request, tipo, partido.getCodigo());

		}
	}

	private static Collection<CProvincia> generarComboProvincias(HttpServletRequest request, String tipo, String codigoPais) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		Collection<CProvincia> provincias = new LinkedList<CProvincia>();
		if (StringUtils.isNotEmpty(codigoPais)) {
			provincias = CGlobalService.findProvinciasByPais(new CPais(codigoPais));
		}
		//provincias = CGlobalWrapper.ordenarProvinciaByAlfabeto(provincias); se ordena en el wrapper
		sessionManager.setAttribute("comboProvincia" + tipo, CGlobalWrapper.getComboProvincia(provincias));

		return provincias;
	}

	private static Collection<CPais> generarComboPaises(HttpServletRequest request, String tipo) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		List<CPais> paises = (List<CPais>) CGlobalService.findPaisesHabilitados();
		if(!sessionManager.contains("comboPais")){
			Collection colPaises = CGlobalWrapper.getComboPais(paises);
			sessionManager.setAttribute("comboPais"+ tipo, colPaises);
		}
		return paises;
	}

	private static Collection<CPartido> generarComboPartidos(HttpServletRequest request, String tipo, String codProvincia) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		Collection<CPartido> col = new LinkedList<CPartido>();
		if (StringUtils.isNotEmpty(codProvincia)) {
			col = CGlobalService.findPartidos();
		}
		Collection<CPartido> partidos = new LinkedList<CPartido>();
		for (CPartido partido : col) {
			if (partido.getProvincia().getCodigo().equalsIgnoreCase(codProvincia)) {
				partidos.add(partido);
			}
		}
		//partidos = CGlobalWrapper.ordenarPartidoByAlfabeto(partidos); se ordena en el wrapper
		sessionManager.setAttribute("comboPartido" + tipo, CGlobalWrapper.getComboPartido(partidos));
		return partidos;
	}

	private static Collection<CLocalidad> generarComboLocalidades(HttpServletRequest request, String tipo, String codigoPartido) throws CException {
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		Collection<CLocalidad> localidades = new LinkedList<CLocalidad>();
		Collection<CLocalidad> col = new LinkedList<CLocalidad>();
		if (StringUtils.isNotEmpty(codigoPartido)) {
			col = CGlobalService.findLocalidades();
		}
		for (CLocalidad localidad : col) {
			if (localidad.getPartido().getCodigo().equalsIgnoreCase(codigoPartido)) {
				localidades.add(localidad);
			}
		}
		//localidades = CGlobalWrapper.ordenarLocalidadByAlfabeto(localidades); se ordena en el wrapper
		sessionManager.setAttribute("comboLocalidad" + tipo, CGlobalWrapper.getComboLocalidad(localidades));
		return localidades;
	}

	public static void setearCombosEnSesion(HttpServletRequest request) throws CException{
		setearCombosEnSesion(request, "");
	}

	public static void setearPaisProvinciaPartidoLocalidadByIDomicilio(IDomicilio domicilio, String pais, String provincia, String partido, String localidad){
		if(CComboWrapper.isSeleccionado(pais)){
			domicilio.setPais(new CPais(pais));
		}else{
			domicilio.setPais(null);
		}
		if (CConstantes.paisArgentina.equalsIgnoreCase(pais)) {
			if (CComboWrapper.isSeleccionado(provincia)) {
				domicilio.setProvincia(new CProvincia(provincia));
				domicilio.getProvincia().setPais(domicilio.getPais());
			} else {
				domicilio.setProvincia(null);
			}
			if (CComboWrapper.isSeleccionado(partido)) {
				domicilio.setPartido(new CPartido(partido));
				domicilio.getPartido().setProvincia(domicilio.getProvincia());
			} else {
				domicilio.setPartido(null);
			}
			if (CComboWrapper.isSeleccionado(localidad)) {
				domicilio.setLocalidad(new CLocalidad(localidad));
				domicilio.getLocalidad().setPartido(domicilio.getPartido());
			} else {
				domicilio.setLocalidad(null);
			}
		} else {
			domicilio.setProvincia(null);
			domicilio.setPartido(null);
			domicilio.setLocalidad(null);
		}
	}


	public static void setearDescripcionPaisProvinciaPartidoLocalidad(IDomicilio domicilio, Collection<COptionCombo> colPais, Collection<COptionCombo> colProvincia,
			Collection<COptionCombo> colPartido, Collection<COptionCombo> colLocalidad) {
			if(domicilio.getPais()!=null){
				domicilio.getPais().setDescripcion(findCOptionComboByValue(domicilio.getPais().getCodigo(), colPais).getLabel());
			}
			if(domicilio.getProvincia()!=null){
				domicilio.getProvincia().setDescripcion(findCOptionComboByValue(domicilio.getProvincia().getCodigo(), colProvincia).getLabel());
			}
			if(domicilio.getPartido()!=null){
				domicilio.getPartido().setDescripcion(findCOptionComboByValue(domicilio.getPartido().getCodigo(), colPartido).getLabel());
			}
			if(domicilio.getLocalidad()!=null){
				domicilio.getLocalidad().setLocDescrip(findCOptionComboByValue(domicilio.getLocalidad().getCodigo(), colLocalidad).getLabel());
			}
	}

	private static COptionCombo findCOptionComboByValue(String value,Collection<COptionCombo> col){
		for(COptionCombo o : col){
			if(o.getValue().equals(value)) {
				return o;
			}
		}

		return null;
	}
}