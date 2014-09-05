package conicet.apps.svt.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class CTituloConversor {
	
	public static final String DOCTOR_ABRV = "dr";
	public static final String DOCTOR = "doctor/a";	
	public static final String INGENIERO_ABRV = "ing";
	public static final String INGENIERO = "ingeniero/a";
	public static final String SENIOR_ABRV = "sr";
	public static final String SENIOR = "señor/a";
	public static final String MAGISTER_ABRV = "mgr";
	public static final String MAGISTER = "magíster";
	public static final String LICENCIADO_ABRV = "lic";
	public static final String LICENCIADO = "licenciado/a";
	public static final String PROFESOR_ABRV = "prof";
	public static final String PROFESOR = "profesor/a";
	public static final String MEDICO_ABRV = "med";
	public static final String MEDICO = "médico/a";
	public static final String CONTADOR_ABRV = "cont";
	public static final String CONTADOR = "contador/a";
	public static final String ARQUITECTO_ABRV = "arq";
	public static final String ARQUITECTO = "arquitecto/a";
	public static final String TECNICO_ABRV = "tec";
	public static final String TECNICO = "técnico/a";

	private static final String ABREVIATURAS[] = {
		DOCTOR_ABRV, INGENIERO_ABRV, SENIOR_ABRV, MAGISTER_ABRV, LICENCIADO_ABRV, 
		PROFESOR_ABRV, MEDICO_ABRV, CONTADOR_ABRV, ARQUITECTO_ABRV, TECNICO_ABRV};
	
	private static final Map<String, String> abrToTitulo;
	static {
		abrToTitulo = new HashMap<String, String>();
		abrToTitulo.put(DOCTOR_ABRV, DOCTOR);
		abrToTitulo.put(INGENIERO_ABRV, INGENIERO);
		abrToTitulo.put(SENIOR_ABRV, SENIOR);
		abrToTitulo.put(MAGISTER_ABRV, MAGISTER);
		abrToTitulo.put(LICENCIADO_ABRV, LICENCIADO);
		abrToTitulo.put(PROFESOR_ABRV, PROFESOR);
		abrToTitulo.put(CONTADOR_ABRV, CONTADOR);
		abrToTitulo.put(ARQUITECTO_ABRV, ARQUITECTO);
		abrToTitulo.put(MEDICO_ABRV, MEDICO);
		abrToTitulo.put(TECNICO_ABRV, TECNICO);
	}
	
	
	public static String abreviaturaATitulo(String input) {
		if (StringUtils.isNotEmpty(input)) {
			for (String abreviatura : ABREVIATURAS) {
				if (reemplazarAcentos(input.toLowerCase()).lastIndexOf(abreviatura) != -1) {
					return StringUtils.capitalize(abrToTitulo.get(abreviatura));
				}
			}
		}
		return null;
	}
	
	private static String reemplazarAcentos(String input) {
		return input.replace('á', 'a').replace('é', 'e').replace('í', 'i').replace('ó', 'o').replace('ú', 'u')
			.replace('Á', 'A').replace('É', 'E').replace('Í', 'I').replace('Ó', 'O').replace('Ú', 'U');
	}

}
