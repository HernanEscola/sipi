package conicet.apps.svt.util.valida;

import java.math.BigDecimal;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

public class CValidaPorcentaje {

  public CValidaPorcentaje() {
  }

  public static boolean validarPorcentaje(ActionErrors errors, String porcentaje, String contexto, int rangoInicio, int rangoFin){
    boolean bError = false;
    try {
      BigDecimal bDPorcentaje = new BigDecimal(porcentaje);
      if (!(bDPorcentaje.compareTo(new BigDecimal(rangoFin)) <= 0) && !(bDPorcentaje.compareTo(new BigDecimal(rangoInicio)) >= 0)) {
        errors.add(contexto, new ActionMessage("errors.dynamic",
        "El porcentaje debe ser un número entre "+rangoInicio+" y "+rangoFin+"."));
        bError = true;
      }
    }
    catch (NumberFormatException ex) {
      errors.add(contexto, new ActionMessage("errors.dynamic",
      "El porcentaje debe ser un número."));
      bError = true;
    }
  return bError;
  }


}
