package conicet.apps.svt.util.valida;
import java.math.BigDecimal;

import org.apache.commons.lang.StringUtils;

public class CValidaImporte {

  public static final BigDecimal MAX_IMPORTE = new BigDecimal("999999999.99");
  public static final BigDecimal MIN_IMPORTE = new BigDecimal("0.00");
  public static final BigDecimal MAX_PORCENTAJE = new BigDecimal("1000.00");
  public static final BigDecimal MIN_PORCENTAJE = new BigDecimal("00.00");

  public CValidaImporte() {
  }

  public static boolean importeValido(String importe){
 // si se informa un importe valida que sea mayor o igual a cero
   if ((importe != null) && !StringUtils.isEmpty(importe) && !"".equalsIgnoreCase(importe)){
     try {
       new BigDecimal(importe);
       BigDecimal importeAux = new BigDecimal(importe);
       BigDecimal cero = new BigDecimal("0");
       if ( (importeAux.compareTo(cero) < 0))
         return false;
     } catch (NumberFormatException ex) {
       return false;
     }
   }
   return true;
 }


 public static int comparoImporteString(String importe1,String importe2){
   BigDecimal imp1 = new BigDecimal(importe1);
   BigDecimal imp2 = new BigDecimal(importe2);
   return (imp1.compareTo(imp2));
 }

 public static boolean isOverFlowImporte(BigDecimal importe, BigDecimal maximo){
   if (null == maximo){
     return (importe.compareTo(MAX_IMPORTE) > 0);
   } else {
     return (importe.compareTo(maximo) > 0);
   }
 }

 public static boolean isPorcentajeValido(String porcentaje) {
   if (importeValido(porcentaje)) {
     BigDecimal porcentajeB = new BigDecimal(porcentaje);
     return (porcentajeB.longValue() < MAX_PORCENTAJE.longValue() &&
             porcentajeB.longValue() > MIN_PORCENTAJE.longValue());
   }
   else
     return false;
 }



  public static String importeCDecimales(String importe){
      String error = null;

     if (!"".equalsIgnoreCase(importe)){
        try {
          BigDecimal numero = new BigDecimal(importe);
          if (numero.compareTo(new BigDecimal("0.00")) < 0) {
              error="debe ser mayor a 0.00";
              return error;
          }
          if (numero.compareTo(new BigDecimal("999999999.99"))>0){
             error="debe tener máximo 9 dígitos enteros y dos decimales";
             return error;
          }
          if (StringUtils.contains(importe,".")) {
              String numeros[] = StringUtils.split(importe,".");
              if (numeros.length > 1) {
                if ( (numeros[0].length() > 9) || (numeros[1].length() > 2)) {
                  error="debe tener máximo 9 dígitos enteros y dos decimales.";
                }
              } else {
                error=" debe tener máximo 9 dígitos enteros y dos decimales.";
              }
          }

        } catch (NumberFormatException ex){
          error="El importe es inválido";
        }
     }
     return error;
  }

  
	public static boolean validoSegunComparador(BigDecimal impo1,String comparador,BigDecimal impo2){
		boolean valido= true;
		if (comparador.equalsIgnoreCase(">")){
			if (!(impo1.compareTo(impo2)>0)){
				valido=false;
			}
		}else if (comparador.equalsIgnoreCase(">=")){
			if (impo2.compareTo(impo1)>0){
				valido=false;
			}
		}else if (comparador.equalsIgnoreCase("=")){
			if (!(impo1.compareTo(impo2)==0)){
				valido=false;
			}
		}else if (comparador.equalsIgnoreCase("<")){
			if (!(impo2.compareTo(impo1)>0)){
				valido=false;
			}
		}else if (comparador.equalsIgnoreCase("<=")){
			if (impo1.compareTo(impo2)>0){
				valido=false;
			}
		}else if (comparador.equalsIgnoreCase("!=")){
			if (impo1.compareTo(impo2)==0){
				valido=false;
			}
		}
		return valido;
	}

	  public static BigDecimal suma(BigDecimal n1,BigDecimal n2){
		  if (n1==null && n2==null) return new BigDecimal("0.00");
		  if (n1==null) return n2;
		  if (n2==null) return n1;
		  return n1.add(n2);
	  }

	  public static BigDecimal resta(BigDecimal n1,BigDecimal n2){
		  if (n1==null && n2==null) return new BigDecimal("0.00");
		  if (n1==null) n1=new BigDecimal("0.00");
		  if (n2==null) n2=new BigDecimal("0.00");
		  return n1.subtract(n2);
	  }
	  
	  public static boolean isNumeric(String val){
		  try{
			  new BigDecimal(val);
		  } catch(NumberFormatException ex){
			  return false;
		  }
		  return true;
	  }
}
