package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import conicet.apps.svt.object.contratante.CComitente;
import conicet.apps.svt.object.contratante.CContratante;
import conicet.apps.svt.object.contratante.CContratanteOtro;
import conicet.apps.svt.object.tipoPersonaJuridica.CTipoPersonaJuridica;
import conicet.apps.svt.service.CContratanteService;
import conicet.framework.error.CException;

public class CJsonResponseContratante extends CJsonResponse {
	
	private CContratanteOtro cContratanteOtro;

	@Override
	public List find(HttpServletRequest request) throws CException {
		List<CContratante> lista = new ArrayList<CContratante>();
		CContratanteOtro contratante = new CContratanteOtro();
		contratante.setRazonSocial(request.getParameter("match"));
		lista.addAll(CContratanteService.findContratantesLikeRazon(contratante));
		
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	protected JSONObject setear(Object o) {
		CContratante cContratante = (CContratante)o;
		JSONObject json =  null;
		
		if(!cContratante.esConsumidorFinal()){
			cContratanteOtro = (CContratanteOtro) cContratante;
			
			json = new JSONObject();
			json.put("id", cContratante.getId().toString());
			json.put("descripcion", cContratante.getDescripcion());
			json.put("nombre", cContratante.getDescripcion());

			if(StringUtils.isNotEmpty(cContratanteOtro.getCuitCentral())) {
				json.put("cuit", cContratanteOtro.getCuitCentral());
			} else {
				json.put("cuit", "");
			}
			
			json.put("nacionalidadPersonaJuridicaId", getNacionalidadPersonaJuridica());
			json.put("clasificacionPersonaJuridicaId", getClasificacionPersonaJuridica());
			json.put("tipoPersonaJuridicaId", getTipoPersonaJuridicaId());
			json.put("tipoPersonaJuridicaDescripcion", getTipoPersonaJuridicaDescripcion());
			json.put("organismo", getOrganismoDescripcion());
			
			if (cContratanteOtro.getComitentesMultiples() != null) {
				JSONArray jsonComitentes = new JSONArray();
				for (CComitente comitente : cContratanteOtro.getComitentesMultiples()) {
					JSONObject jsonComitente = new JSONObject();
					if (comitente.getContratante() != null) {
						jsonComitente.put("tipo", "Contratante");
						jsonComitente.put("razonSocial", comitente.getContratante().getDescripcion());				
					} else {
						jsonComitente.put("tipo", "Organismo");
						jsonComitente.put("razonSocial", comitente.getOrganismo().getDescripcion());			
					}
					jsonComitente.put("porcentaje", comitente.getPorcentaje());
					jsonComitentes.add(jsonComitente);	
				}
				json.put("comitentes", jsonComitentes);
			}
			
		}
		return json;
	}

	private String getOrganismoDescripcion() {
		if (this.cContratanteOtro.getOrganismo() != null) {
			return this.cContratanteOtro.getOrganismo().getDescripcion();
		}
		return "";
	}

	private String getTipoPersonaJuridicaDescripcion() {
		CTipoPersonaJuridica cTipoPersonaJuridica = getTipoPersonaJuridica();
		if (cTipoPersonaJuridica != null) {
			return cTipoPersonaJuridica.getDescripcion();
		}
		return "";
	}
	
	private String getTipoPersonaJuridicaId() {
		CTipoPersonaJuridica cTipoPersonaJuridica = getTipoPersonaJuridica();
		if (cTipoPersonaJuridica != null) {
			return cTipoPersonaJuridica.getId().toString();
		}
		return "";
	}
	
	private CTipoPersonaJuridica getTipoPersonaJuridica() {
		if (cContratanteOtro.getTipoPersona() != null &&
			cContratanteOtro.getTipoPersona().getPadre() != null && 
			cContratanteOtro.getTipoPersona().getPadre().getPadre() != null) {
			return cContratanteOtro.getTipoPersona();
		}
		return null;
	}

	private String getClasificacionPersonaJuridica() {
		if (cContratanteOtro.getTipoPersona() != null &&
			cContratanteOtro.getTipoPersona().getPadre() != null) {
			
			if (cContratanteOtro.getTipoPersona().getPadre().getPadre() != null) {
				return cContratanteOtro.getTipoPersona().getPadre().getId().toString();				
			} else {
				return cContratanteOtro.getTipoPersona().getId().toString();
			}
		}

		return "";
	}

	private String getNacionalidadPersonaJuridica() {
		if (cContratanteOtro.getTipoPersona() != null) {
			if (cContratanteOtro.getTipoPersona().getPadre() != null) {
				
				if (cContratanteOtro.getTipoPersona().getPadre().getPadre() != null) {
					return cContratanteOtro.getTipoPersona().getPadre().getPadre().getId().toString();				
				} else {
					return cContratanteOtro.getTipoPersona().getPadre().getId().toString();
				}
			} else {
				return cContratanteOtro.getTipoPersona().getId().toString(); 
			}
		}

		return "";
	}

}
