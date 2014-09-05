package conicet.apps.svt.util.ajax;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

import ar.gov.conicet.commons.users.exceptions.UsersException;
import ar.gov.conicet.commons.users.models.impl.UsuarioCriterio;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioCriterio;
import ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject;
import conicet.apps.commons.users.providers.UserDataAccessorProvider;
import conicet.framework.error.CException;

public class CJsonResponseUsuarioByApellidoAndCuit extends CJsonResponse {

	@Override
	protected JSONObject setear(Object u) {
		IUsuarioObject usr = (IUsuarioObject) u;
		JSONObject json = new JSONObject();
		json.put("id", usr.getKey());
		json.put("nombre", usr.getLastName() + ", " + usr.getFirstName() + " - " + usr.getCuit());
		return json;
	}

	@Override
	protected List find(HttpServletRequest request) throws CException {

		List<IUsuarioObject> personas = new ArrayList<IUsuarioObject>();
		IUsuarioCriterio uc = new UsuarioCriterio();
		String find = request.getParameter("match").replace("-", "");
		try {
			if (StringUtils.isNumeric(find) && find.length() >= 9) {
				uc.setCuit(find);
				IUsuarioObject usuario = UserDataAccessorProvider.getUserDataAccesor().darUsuarioByCuit(uc);
				if(usuario!=null)
					personas.add(usuario);
			} else {
				uc.setApellido(find);

				personas.addAll((Collection<? extends IUsuarioObject>) UserDataAccessorProvider.getUserDataAccesor().darUsuariosByApellido(uc));
			}
		} catch (UsersException e) {
			e.printStackTrace();
			throw new CException(1, e);
		}
		return personas;
	}

}
