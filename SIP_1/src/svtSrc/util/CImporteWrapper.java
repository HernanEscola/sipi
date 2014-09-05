package conicet.apps.svt.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;


public class CImporteWrapper {

	public static String descripcionDecimales(String decimales){
		int unidad = Integer.parseInt(decimales.substring(1,2));
		int decimal = Integer.parseInt(decimales.substring(0, 1));
		String result = "";
		boolean unidadCompleta = false;
		switch (decimal) {
		case 9: result += "noventa";break;
		case 8: result += "ochenta";break;
		case 7: result += "setenta";break;
		case 6: result += "sesenta";break;
		case 5: result += "cincuenta";break;
		case 4: result += "cuarenta";break;
		case 3: result += "treinta";break;
		case 2: result += unidad!=0?"veinti":"veinte";break;
		case 1:
			switch (unidad) {
			case 0:result += "diez";unidadCompleta = true;break;
			case 1:result += "once";unidadCompleta = true;break;
			case 2:result += "doce";unidadCompleta = true;break;
			case 3:result += "trece";unidadCompleta = true;break;
			case 4:result += "catorce";unidadCompleta = true;break;
			case 5:result += "quince";unidadCompleta = true;break;
			case 6:result += "dieci";break;
			case 7:result += "dieci";break;
			case 8:result += "dieci";break;
			case 9:result += "dieci";break;
			default:
				break;
			};break;
		default:
			break;
		}
		if(unidad != 0 && !unidadCompleta){
			if(decimal!=2 && decimal!=1 && decimal != 0){
				result += " y ";
			}
			switch (unidad) {
			case 9:result += "nueve";break;
			case 8:result += "ocho";break;
			case 7:result += "siete";break;
			case 6:result += "seis";break;
			case 5:result += "cinco";break;
			case 4:result += "cuatro";break;
			case 3:result += "tres";break;
			case 2:result += "dos";break;
			case 1:result += "un";break;
			default:break;
			}
		}
		return result;

	}

	public static String descripcionCientos(String cientos){
		int unidad = Integer.parseInt(cientos.substring(2,3));
		int decimal = Integer.parseInt(cientos.substring(1, 2));
		int ciento = Integer.parseInt(cientos.substring(0, 1));
		String result = "";
		switch (ciento) {
		case 9: result = "novecientos";break;
		case 8: result = "ochocientos";break;
		case 7: result = "setecientos";break;
		case 6: result = "seiscientos";break;
		case 5: result = "quinientos";break;
		case 4: result = "cuatrocientos";break;
		case 3: result = "trescientos";break;
		case 2: result = "doscientos";break;
		case 1: result = decimal == 0 && unidad == 0?"cien":"ciento";break;
		default:
			break;
		}
		result += " "+descripcionDecimales(cientos.substring(1, 3));
		return result;

	}

	public static String agregarCerosIzquierda(String importe,int cantidad){
		String importeEnteroString =  new String(importe);
		for(int j=0;j<cantidad;j++){
			importeEnteroString = "0"+importeEnteroString;
		}
		return importeEnteroString;
	}

	public static String simpleNumberToComprobanteNumber(String number){
		String numberFormat = "";
		numberFormat = CImporteWrapper.agregarCerosIzquierda(number, 12 - number.length());
		numberFormat = numberFormat.substring(0,4)+"-"+numberFormat.substring(4);
		return numberFormat;
	}

	public static String describirNumero(BigDecimal importe){
		String detalle= "";
		Long importeEntero = importe.longValue();
		String importeEnteroString = importeEntero.toString();
		//tengo que dividir el numero en grupos de a 3
		int size = importeEnteroString.length();
		if(size > 3){
			int resto = 3-(size % 3);
			//completo con ceros:
			importeEnteroString = agregarCerosIzquierda(importeEnteroString, resto);
			int ciclos = size/3;
			for(int i=0;i<ciclos;i++){
				String cientos = importeEnteroString.substring((i*3),i*3+3);
				String descripcionCientos = descripcionCientos(cientos);
				detalle += " "+descripcionCientos;
				if(ciclos == 2 && i == 0){
					detalle += importeEntero>999999 ? importeEntero>1999999 ?" millones":" millón" : "";
				}else if((ciclos == 1 && i == 0) || (ciclos == 2 && i == 1) && Integer.parseInt(cientos) > 0){
					detalle += " mil";
				}
			}
		}
		if(importeEntero>0){
			//vuelvo a quitarle los ceros:
			if(size>2){
				importeEnteroString = importeEntero.toString();
			}else{
				importeEnteroString = agregarCerosIzquierda(importeEnteroString, 3-size);
				size = 3;
			}
			detalle +=" "+descripcionCientos(importeEnteroString.substring(size-3,size));
			if(detalle.substring(detalle.length()-2,detalle.length()).trim().equals("un")){
				detalle += "o";
			}
		}else{
			detalle += "cero ";
		}
		int iDecimal = importe.toString().indexOf(".");
		String decimales = "0";
		if(iDecimal != -1){
			decimales = importe.toString().substring(iDecimal+1);
		}
		String descripcionDecimales = "";
		if(Integer.parseInt(decimales) > 0){
			descripcionDecimales = descripcionDecimales(decimales);
		}else{
			descripcionDecimales = "cero";
		}

		detalle += " con "+ descripcionDecimales +" centavos";
		return detalle;
	}

	/**
	 * Formatea el numero dependiendo de la configuracion regional de la JVM. Siempre con dos decimales
	 * En caso de que este configurada para Argentina se usará puntos para separación de miles
	 * y coma para separar los decimales.
	 * @param numero a formatear
	 * @return String con formato 99999,999,999.99
	 */
	public static String formateaMiles(BigDecimal n) {

		DecimalFormat formatter = (DecimalFormat) NumberFormat.getInstance(Locale.US);
		formatter.setMaximumFractionDigits(2);
		formatter.setMinimumFractionDigits(2);
		return formatter.format(n.setScale(2,BigDecimal.ROUND_HALF_EVEN));
	}

}
