package conicet.apps.svt.util.autoComplete;

import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import conicet.apps.svt.util.ajax.IJSONResponse;
import conicet.framework.error.CException;

public abstract class CAutoComplete implements IJSONResponse {

	
	public Collection autoCompletar(HttpServletRequest request, HttpServletResponse response) throws CException{

		JSONArray jsonArray = new JSONArray();
		
		try {
			Collection lc = find(request);
			
			String ret = "";
			response.setContentType("application/json;charset=UTF-8");
			JSONObject json;
			for (Object o : lc) {
				
				json = setear(o);
				if(json!=null)
					jsonArray.add(json);
			}

			response.getWriter().print(jsonArray);
			return lc;
			// response.getWriter().print(ret);
		} catch (IOException ex) {
			ex.printStackTrace();
			throw new CException(1, ex);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CException(1, e);
		}
	}

	abstract protected Collection find(HttpServletRequest request) throws Exception;
	abstract protected JSONObject setear(Object o);
	
	/**
	 * ESTE METODO TRAE LISTA DE OPCIONES QUE RESPONDEN A LA BÚSQUEDA PERO LE 
	 * AGREGA OPCION: "INGRESAR NUEVO"  Y  "---------"  AL INICIO DE LA LISTA 
	 * @param request
	 * @param response
	 * @return
	 * @throws CException
	 */
	
	public Collection autoCompletarConIngresarNuevo(HttpServletRequest request, HttpServletResponse response) throws CException{

		JSONArray jsonArray = new JSONArray();
		
		try {
			Collection lc = find(request);
			
			String ret = "";
			response.setContentType("application/json;charset=UTF-8");
						
			
			//response.setContentType("text/plain");
			JSONObject json = new JSONObject();
			// Ingresar nuevo
			json.put("nombre", "INGRESAR NUEVO");
			json.put("nombreFantasia", null);
			json.put("id", "0");
			jsonArray.add(json);
			json = new JSONObject();
			// separacion con los resultados
			json.put("nombre", "--------------");
			json.put("nombreFantasia", null);
			json.put("id", "-1");
			jsonArray.add(json);
			
			for (Object o : lc) {
				
				json = setear(o);
				if(json!=null)
					jsonArray.add(json);
			}

			response.getWriter().print(jsonArray);
			return lc;
			// response.getWriter().print(ret);
		} catch (IOException ex) {
			ex.printStackTrace();
			throw new CException(1, ex);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CException(1, e);
		}
	}
	
	@Override
	public List getJsonData(HttpServletRequest request, HttpServletResponse response) throws CException {
		return new LinkedList(autoCompletar(request, response));
	}

	@Override
	public List getJsonDataConIngresarNuevo(HttpServletRequest request, HttpServletResponse response) throws CException {
		return new LinkedList(autoCompletarConIngresarNuevo(request, response));
	}
}