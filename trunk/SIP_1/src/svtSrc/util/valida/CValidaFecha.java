package conicet.apps.svt.util.valida;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionMessage;

import conicet.framework.error.CException;
import conicet.framework.util.UFecha;
import conicet.framework.util.fecha.CFecha;
import conicet.framework.validator.CValidator;


public class CValidaFecha {
  public CValidaFecha() {
  }


  // VALIDAR SI INFORMO FECHAs
   public static boolean fechaInformada(String dia,String mes,String anio){
     //si fecha esta completamente en blanco retorna false
     if ((null == dia  && null == mes && null == anio) || (StringUtils.isEmpty(dia)&& StringUtils.isEmpty(mes) &&
         StringUtils.isEmpty(anio))) { return false;}
     //si informa algo, aunque sea erroneo, retorna true
     else{ return true; }
   }

// FECHAS EN FORMATO AÑO-MES-DIA
   public static boolean entreFechas(String fecha,String desde,String hasta){
   if ((UFecha.Comparar(fecha, desde) == -1) || (UFecha.Comparar(fecha,hasta) == 1)){return false;}
     return true;
   }

   // FECHAS EN FORMATO AÑO-MES-DIA
   public static boolean entreFechasDDMMAAAA(String fecha,String desde,String hasta){
   fecha= fecha.substring(6,10)+"-"+fecha.substring(3,5)+"-"+fecha.substring(0,2);
   desde= desde.substring(6,10)+"-"+desde.substring(3,5)+"-"+desde.substring(0,2);
   hasta= hasta.substring(6,10)+"-"+hasta.substring(3,5)+"-"+hasta.substring(0,2);
   if ((UFecha.Comparar(fecha, desde) == -1) || (UFecha.Comparar(fecha,hasta) == 1)){return false;}
     return true;
   }


   /**
    * @param fecha : fecha tomada como parametro para el rango
    * @param anterior : Cantidad de años hacia atras
    * @param posterior : Cantidad de años hacia delante
    * @return
    */
   public static boolean validarFechaEntreRangoDeAños(Date fecha, int anterior, int posterior) {
	   Date hoy = UFecha.hoy();
	   Date superior = agregarAnios(hoy, posterior);
	   Date inferior = quitarAnios(hoy, anterior);
	   if (inferior == null) {
		return false;
	}
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   return entreFechas(dateFormat.format(fecha), dateFormat.format(inferior), dateFormat.format(superior));
   }


   public static Date agregarAnios(Date fecha, int anios) {
	   String fechaString = new SimpleDateFormat("yyyy-MM-dd").format(fecha);
	   int anio = Integer.valueOf(UFecha.anio(fechaString)).intValue();
	   String anioString = new Integer(anio+anios).toString();
	   return UFecha.stringToDate(anioString+"-"+UFecha.mes(fechaString)+"-"+UFecha.dia(fechaString));
   }

   /**
    * Devuelve el nuevo año quitandole la cantidad de años indicada en la
    * variable anios. En caso de que la resta de negativo devuelve null
    * @param fecha
    * @param anios
    * @return
    */
   private static Date quitarAnios(Date fecha, int anios) {
	   String fechaString = new SimpleDateFormat("yyyy-MM-dd").format(fecha);
	   int anio = Integer.valueOf(UFecha.anio(fechaString)).intValue();
	   if (new Integer(anio-anios).intValue() < 0) {
		return null;
	}
	   String anioString = new Integer(anio-anios).toString();
	   return UFecha.stringToDate(anioString+"-"+UFecha.mes(fechaString)+"-"+UFecha.dia(fechaString));
   }

   // invierte la fecha si es formato dd-mm-yyyy a yyyy-mm-dd y visceversa




   public static boolean isFormatoFechaValida(String fecha)throws CException {

	   		  /**
			   * valida string de fecha con formato DD-MM-YYYY o YYYY-MM-DD
			   * OJO: Si informa vacio o null devuelve true.
			   */



	   		  if (StringUtils.isEmpty(fecha)){
	   			  return true;
	   		  }

	   		  if (fecha.length()!=10){
				  return false;
			  }
			  // si responde a formato dd-mm-yyyy
			  if (fecha.matches("[0-9]{2}-[0-9]{2}-[0-9]{4}")){
				  if (!CFecha.isFechaValida(fecha.substring(6,10),fecha.substring(3,5),fecha.substring(0,2))) {
					  return false;
				  }

			  // si responde a formate yyyy-mm-dd
			  }else if (fecha.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")){
				  if (!CFecha.isFechaValida(fecha.substring(0,4),fecha.substring(5,7),fecha.substring(8,10))){
					  return false;
				  }
			  }else{
				  return  false;
			  }

			  return true;
   }

   /**
    *  Valida que la fecha informada tenga formato DD-MM-AAAA.
    *  Devuelve false si el formato no es correcto.
    *  Si no informa fecha es formato válido
    *
    */
   public static boolean isFormatoDDMMYYYYValido(String fecha) {
	   if (StringUtils.isEmpty(fecha)){   // si no se informa fecha es un formato valido
		   return true;
	   }
	   // si responde a formato dd-mm-yyyy
		if (fecha.matches("[0-9]{2}-[0-9]{2}-[0-9]{4}") && CFecha.isFechaValida(fecha.substring(6,10),fecha.substring(3,5),fecha.substring(0,2))) {
				  return true;
	  }
	   return false;
   }

   /**
    *  Valida que la/s fecha/s informada/s tengan formato DD-MM-AAAA. Además, si informa dos fechas correctas las
    *  compara.
    *  Recibe 1 o 2 fechas, y un texto para armar los mensajes de error (por ej: "La Fecha de Cobro")
    *  Devuelve una lista con los actionMessage generados.
    */
   public static List<ActionMessage> validaFormatoDDMMAAAAYComparaFechas(String fecha1,String fecha2,String textoDelError) {

	String fechaDesde="";
	String fechaHasta="";
	List<ActionMessage> ret = new LinkedList<ActionMessage>();
	if(!StringUtils.isEmpty(fecha1)){
		if (!isFormatoDDMMYYYYValido(fecha1)){
			ret.add(new ActionMessage("errors.invalid", textoDelError+" Desde"));
		}else{
			try {
				fechaDesde = CFecha.fechaLatinoToSqlDate(fecha1).toString();
			} catch (CException e) {
				ret.add(new ActionMessage("errors.invalid", textoDelError+" Desde"));

			}
		}

	}
	if (!StringUtils.isEmpty(fecha2)){
		if (!isFormatoDDMMYYYYValido(fecha2)){
			ret.add(new ActionMessage("errors.invalid", textoDelError+" Hasta"));
		}else{
			try {
					fechaHasta = CFecha.fechaLatinoToSqlDate(fecha2).toString();
			} catch (CException e) {
				ret.add(new ActionMessage("errors.invalid", textoDelError+" Hasta"));
			}
		}
	}
	if (!StringUtils.isEmpty(fechaDesde) &&!StringUtils.isEmpty(fechaHasta)){
       	if (UFecha.Comparar(fechaDesde,fechaHasta)==1){
       		ret.add(new ActionMessage("errors.dynamic",textoDelError+" Hasta no puede ser menor que la Fecha Desde"));
       	}
   }
	return ret;
   }


   /**
    *  Parametros: fechaDesde, fechaHasta, Validator , textoMensajeFechaDesde o null(Default "Fecha Desde"), textoMensajeFechaHasta o null (Defalut"Fecha Hasta")
    *  Valida con Validator que la/s fecha/s informada/s tengan formato valido DD-MM-AAAA. Además, si informa dos fechas correctas las
    *  compara, es error si la 1ra fecha es mayor que la segunda
    *  Devuelve dentro del validator enviado los errors.
    */
   public static void validaFormatoDDMMAAAAYComparaFechas(String fecha1,String fecha2,CValidator validator, String nombreCampoDesde,String nombreCampoHasta) {

	   	if (StringUtils.isEmpty(nombreCampoDesde)){
	   		nombreCampoDesde="La Fecha Desde";
	   	}
	   	if (StringUtils.isEmpty(nombreCampoHasta)){
	   		nombreCampoDesde="La Fecha Hasta";
	   	}

		String fechaDesde="";
		String fechaHasta="";
		if(!StringUtils.isEmpty(fecha1)){
			if (!isFormatoDDMMYYYYValido(fecha1)){
				String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampoDesde) };
				validator.addError("errors.invalid", mensaje,true);
			}else{
				try {
					fechaDesde = CFecha.fechaLatinoToSqlDate(fecha1).toString();
				} catch (CException e) {
					String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampoDesde) };
					validator.addError("errors.invalid", mensaje,true);

				}
			}

		}
		if (!StringUtils.isEmpty(fecha2)){
			if (!isFormatoDDMMYYYYValido(fecha2)){
				String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampoHasta) };
				validator.addError("errors.invalid", mensaje,true);

			}else{
				try {
						fechaHasta = CFecha.fechaLatinoToSqlDate(fecha2).toString();
				} catch (CException e) {
					String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampoHasta) };
					validator.addError("errors.invalid", mensaje,true);

				}
			}
		}
		if (!StringUtils.isEmpty(fechaDesde) &&!StringUtils.isEmpty(fechaHasta)){
	       	if (UFecha.Comparar(fechaDesde,fechaHasta)==1){
				String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampoHasta+" no puede ser menor que "+nombreCampoDesde) };
				validator.addError("errors.dynamic", mensaje,true);
	       	}
	   }
   }


   public static void validaInformeYFormatoDDMMAAAA(boolean validaInforme, String fecha1,CValidator validator, String nombreCampo) {
	   if (validaInforme 	&& StringUtils.isEmpty(fecha1)){
			String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampo) };
			validator.addError("errors.required", mensaje,true);
	   }

	   	if (StringUtils.isEmpty(nombreCampo)){
	   		nombreCampo="La Fecha ";
	   	}

		if(!StringUtils.isEmpty(fecha1)){
			if (!isFormatoDDMMYYYYValido(fecha1)){
				String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampo) };
				validator.addError("errors.invalid", mensaje,true);
			}else{
				try {
					fecha1 = CFecha.fechaLatinoToSqlDate(fecha1).toString();
				} catch (CException e) {
					String[] mensaje = { StringEscapeUtils.escapeHtml(nombreCampo) };
					validator.addError("errors.invalid", mensaje,true);

				}
			}

		}
  }
   
   /**
    * Recibe una fecha en formato dd-MM-yyyy y devuelve un java.util.Date. En
	* caso de que la fecha no tenga el formato dd-MM-yyyy, retorna null.
    * @param fecha
    * @return java.util.Date 
    */
	public static java.util.Date fechaLatinoToUtilDate(String fecha) {
		try {
			return new SimpleDateFormat("dd-MM-yyyy").parse(fecha);
		} catch (ParseException e) {
			return null;
		}
	}
	
}
