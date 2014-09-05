package conicet.apps.svt.util.mail;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import conicet.apps.svt.object.entidad.CEntidad;
import conicet.apps.svt.service.CAdministracionService;
import conicet.framework.error.CException;

public class CMailAddres {

	public static String[] getAddressCCtransferYSoporte() {
		String[] cc = new String[2];
		cc[0] = "transfer@conicet.gov.ar";
		cc[1] = "svt-soporte@conicet.gov.ar";
		return cc;
	}
	public static String[] getAddressCCSoporte() {
		String[] cc = new String[1];
		cc[0] = "svt-soporte@conicet.gov.ar";
		return cc;
	}
	
	public static String[] getAddressCCAceptacionNovedadesOferta() {
		String[] cc = new String[2];
		cc[0] = "transfer@conicet.gov.ar";
		cc[1] = "svt-soporte@conicet.gov.ar";
		return cc;
	}
	// envio mail de notificacion para aceptacion de novedades de oferta. 
	public static String [] getAddressTOAceptacionNovedadesOferta(CEntidad prestador) throws CException{
		return getAddressNotificacionByEntidad(prestador);
	}
	
	// direcciones a notificar por Entidad
	public static String [] getAddressNotificacionByEntidad(CEntidad prestador) throws CException{
		String[] to = null;
		Set<String> mailsSet = new HashSet<String>();
		List<String[]> mails = CAdministracionService.darMailsNotificacion(prestador);
		for (int i = 0; i < mails.size(); i++) {
			String[] direcciones = mails.get(i);
			for (String email : direcciones) {
				if (null != email)
					mailsSet.add(email);
			}
		}
		to = new String[mailsSet.size()];
		to = mailsSet.toArray(new String[0]);
		if (to == null) {
			to = new String[1];
			to[0] = "svt-soporte@conicet.gov.ar";
		}
		return to;
	}
	// direcciones para envio mail notificacion de bitacora
	public static String [] getAddressToBitacora(CEntidad prestador) throws CException{
		return getAddressNotificacionByEntidad(prestador);
	}
	
	public static String [] getAddressModificacionManoObra() throws CException{
		String[] to = null;
		
		String[] mails = CAdministracionService.darMailsManoObra();
		
		to = new String[mails.length];
		int j=0;
		for (int i = 0; i < mails.length; i++) {
			String direcciones = mails[i];
				if (null != direcciones){
					to[j]= direcciones;
					j++;
				}
		}
		if (to == null) {
			to = new String[1];
			to[0] = "svt-soporte@conicet.gov.ar";
		}
		return to;
	}
	
	
	
}
