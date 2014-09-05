package conicet.apps.svt.util.ajax;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import conicet.framework.error.CException;
import conicet.framework.object.IIdentity;

public abstract class CJsonResponse implements IJSONResponse{
	
	public List getJsonData(HttpServletRequest request, HttpServletResponse response) throws CException{
		List<Object> lc = new LinkedList<Object>();
		try {
			lc = find(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getJsonData(lc,request, response);
	}
	
	
	public List getJsonDataFiltrandoResultados(List<IIdentity> aFiltrar,HttpServletRequest request, HttpServletResponse response) throws CException{
		List<IIdentity> lc = new LinkedList<IIdentity>();
		try {
			lc = find(request);
			for(IIdentity aRemover: aFiltrar){
				Iterator<IIdentity> iterator = lc.iterator();
				while(iterator.hasNext()){
					IIdentity i = iterator.next();
					if(i.getId().equals(aRemover.getId())){
						iterator.remove();
						break;
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getJsonData(lc,request, response);
	}
	
	public List getJsonDataConIngresarNuevo(HttpServletRequest request, HttpServletResponse response) throws CException{
		List<Object> lc = new LinkedList<Object>();
		try {
			lc = find(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getJsonDataConIngresarNuevo(lc,request, response);
	}

	public List getJsonData(List lc,HttpServletRequest request, HttpServletResponse response) throws CException {		
		try {			
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().print(getJSonArray(lc));
			return lc;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CException(1, e);
		}
	}
	
	public List getJsonDataConIngresarNuevo(List lc,HttpServletRequest request, HttpServletResponse response) throws CException {
		try {
			JSONArray jsonArray = new JSONArray();

			jsonArray.add(getJsonObjectIngresarNuevo());
			jsonArray.add(getJsonObjectSeparador());			
			jsonArray.addAll(getJSonArray(lc));
			
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().print(jsonArray);
			return lc;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CException(1, e);
		}
		
	}
	
	private JSONObject getJsonObjectIngresarNuevo() {
		JSONObject json = new JSONObject();
		json.put("nombre", "INGRESAR NUEVO");
		json.put("id", "0");		
		return json;
	}
	
	private JSONObject getJsonObjectSeparador() {
		JSONObject json = new JSONObject();
		json.put("nombre", "--------------");
		json.put("id", "-1");		
		return json;
	}
	
	private JSONArray getJSonArray(List lc) {
		JSONArray jsonArray = new JSONArray();
		JSONObject json;
		for (Object o : lc) {
			
			json = setear(o);
			if(json!=null)
				jsonArray.add(json);
		}
		return jsonArray;
	}

	abstract protected List find(HttpServletRequest request)throws CException;
	abstract protected JSONObject setear(Object o);	
}