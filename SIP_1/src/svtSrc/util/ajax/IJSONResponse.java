package conicet.apps.svt.util.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conicet.framework.error.CException;

public interface IJSONResponse {
	public List getJsonData(HttpServletRequest request, HttpServletResponse response) throws CException;
	public List getJsonDataConIngresarNuevo(HttpServletRequest request, HttpServletResponse response) throws CException;
}
