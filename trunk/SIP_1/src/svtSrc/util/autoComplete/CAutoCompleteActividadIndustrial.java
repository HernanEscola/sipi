package conicet.apps.svt.util.autoComplete;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

import conicet.apps.svt.object.clasificacionOnu.CClasificacionOnu;
import conicet.apps.svt.service.COfertaTecnologicaService;

public class CAutoCompleteActividadIndustrial extends CAutoComplete {

	@Override
	protected Collection<CClasificacionOnu> find(HttpServletRequest request) throws Exception {

		String cod = request.getParameter("match");
		List<CClasificacionOnu> lista;
		if(StringUtils.isNumeric(cod))
		{
			lista = (List<CClasificacionOnu>) COfertaTecnologicaService.findClasificacionOnuByCodigo(cod);
			Iterator<CClasificacionOnu> i = lista.iterator();
			
			while(i.hasNext()){
				CClasificacionOnu c =  i.next();
				if(c.getPadre()==null || c.getPadre().getPadre() ==  null){
					i.remove();
				}
			}
			return lista;
		}else{
				// busco por doc y le sumo la busqueda de cuit
			return new ArrayList<CClasificacionOnu>();
		}

	}

	@Override
	protected JSONObject setear(Object o) {
		CClasificacionOnu c = (CClasificacionOnu)o;
		JSONObject json = new JSONObject();
		String cd= c.getCodigoDescripcion();
		//esto es para achicar el combo de act. industriales (las descripciones son muy grandes)

		if (cd.length()>100){
			cd = cd.substring(0,96)+" ...";
		}
		json.put("nombre", cd);
		json.put("codigo", c.getCodigo());
		if(c.getPadre()!=null)
			json.put("padre", setear(c.getPadre()));
		
		json.put("id", c.getId().toString());
		return json;
	}

}
