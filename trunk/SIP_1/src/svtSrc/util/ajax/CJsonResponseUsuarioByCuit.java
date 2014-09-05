package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import ar.gov.conicet.commons.users.exceptions.UsersException;
import ar.gov.conicet.commons.users.models.impl.UsuarioCriterio;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioCriterio;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.commons.users.providers.UserDataAccessorProvider;
import conicet.framework.error.CException;

public class CJsonResponseUsuarioByCuit extends CJsonResponse {

	@Override
	protected JSONObject setear(Object u) {
		IUsuarioObject usr = (IUsuarioObject) u;
		JSONObject json = new JSONObject();
		json.put("id", usr.getKey());
		json.put("nombre", usr.getLastName() + ", " + usr.getFirstName() + " // " + usr.getCuit());
		return json;
	}

	@Override
	protected List find(HttpServletRequest request) throws CException {

		List<IUsuarioObject> personas = new ArrayList<IUsuarioObject>();
		IUsuarioCriterio uc = new UsuarioCriterio();
		if (request.getParameter("match").length() == 11) {
			uc.setCuit(request.getParameter("match"));
			try {
				personas.add(UserDataAccessorProvider.getUserDataAccesor().darUsuarioByCuit(uc));
			} catch (UsersException e) {
				e.printStackTrace();
				throw new RuntimeException("Error inesperado UserDataAccesor",	e);
			}
		}
		return personas;
	}

}
