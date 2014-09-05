package conicet.apps.svt.util.valida;

public class CValidaEmail {

  public CValidaEmail() {
  }

  public static boolean tieneEspaciosEnBlanco(String email){
    boolean ret = false;
    if (email.startsWith(" ") || email.endsWith(" "))
      ret = true;
    return ret;
  }

}
