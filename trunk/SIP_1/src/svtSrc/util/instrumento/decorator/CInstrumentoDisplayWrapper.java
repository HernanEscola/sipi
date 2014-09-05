package conicet.apps.svt.web.instrumento.decorator;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.convenio.CConvenio;
import conicet.apps.svt.object.instrumento.CInstrumento;
import conicet.apps.svt.object.instrumento.ETipoInstrumento;
import conicet.apps.svt.object.instrumento.hojaRuta.CHojaRuta;
import conicet.apps.svt.object.instrumentoMonto.CInstrumentoMonto;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParte;
import conicet.apps.svt.object.instrumentoParte.CInstrumentoParteContratante;
import conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento;
import conicet.apps.svt.object.instrumentoResolucion.CInstrumentoResolucion;
import conicet.apps.svt.web.instrumento.form.CInstrumentoBuscarActionForm;
import conicet.framework.util.UFecha;

public class CInstrumentoDisplayWrapper extends TableDecorator implements DecoratesHssf {
	public CInstrumentoDisplayWrapper() {
	}

	public String getIndice() {
		int i = this.getListIndex() + 1;
		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) this.getPageContext().getSession().getAttribute("cInstrumentoBuscarActionForm");
		Integer index = form.getResultados().indexOf(this.getCurrentRowObject());
		String retorno = "<input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex(" + index + ") value=\"" + i + "\">";
		return retorno;
	}
	
	public String getCodigo() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		return c.getCodigo();
	}
	
	public String getObjeto() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		return getObjeto(c);
	}

	public String getTituloPdts() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		return getTituloPdts(c);
	}

	public String getPctiNro() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		return getPctiNro(c);
	}


	public String getNroTramite() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getNumeroTramite() != null) {
			return c.getNumeroTramite().toString();
		}
		return "";
	}

	public String getAño() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getAño() != null) {
			return c.getAño().toString();
		}
		return "";
	}

	public String getEstado() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		getEstado(c);
		if (c.getEstado() != null) {
			return c.getEstado().getDescripcion();
		}
		return "";
	}

	public static String getEstado(CInstrumento c) {
		if (c.getEstado() != null) {
			return c.getEstado().getDescripcion();
		}
		return "";
	}

	public String getResponsable() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		return getResponsable(c);
	}

	public String getPrestadores() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		return getPrestadores(c);
	}

	@Override
	public String finishRow() {
		return "";
	}

	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}


	/**
	 * Los siguientes metodos son para el ordenamiento por external sort. se
	 * utilizan: List sort Comparator getComparator sortXXXXXXDescComparator
	 * sortXXXXXXAscComparator
	 *
	 * Siendo XXXXXX el nombre de la property de la tabla y Asc y Desc
	 * representan el ordenamiento en la tabla a travez de la flecha.
	 */

	/**
	 * Sort. Se llama cuando se hace el ordenamiento en las listas por external
	 * sort.
	 *
	 * @param tipoEgresoBuscar
	 *            Collection
	 * @param nombreOrder
	 *            String
	 * @param order
	 *            String
	 * @return List
	 */
	public static List sort(Collection col, String nombreOrder, String order) {
		Comparator comp = getComparator(nombreOrder, order);
		Collections.sort((List) col, comp);
		return (List) col;
	}

	/**
	 * getComparator. Se utiliza para que de el comparador adecuado segun los
	 * parametros recibidos.
	 *
	 * @param nombreOrder
	 *            String
	 * @param order
	 *            String
	 * @return Comparator
	 */
	private static Comparator getComparator(String nombreOrder, String order) {
		if (StringUtils.isEmpty(nombreOrder)) {
			// ordeno desc y por indice.
			return new sortIndiceDescComparator();
		}
		if (nombreOrder.equalsIgnoreCase("srt_indice")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortIndiceDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortIndiceAscComparator();
			}
		}

		if (nombreOrder.equalsIgnoreCase("srt_nroTramite")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortNroTramiteDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortNroTramiteAscComparator();
			}
		}
		if (nombreOrder.equalsIgnoreCase("srt_objeto")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortObjetoDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortObjetoAscComparator();
			}
		}
		if (nombreOrder.equalsIgnoreCase("srt_titulo")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortTituloDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortTituloAscComparator();
			}
		}
		if (nombreOrder.equalsIgnoreCase("srt_pctiNro")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortPctiNroDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortPctiNroAscComparator();
			}
		}


		if (nombreOrder.equalsIgnoreCase("srt_anio")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortAnioDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortAnioAscComparator();
			}
		}


		if (nombreOrder.equalsIgnoreCase("srt_responsable")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortResponsableDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortResponsableAscComparator();
			}
		}

		if (nombreOrder.equalsIgnoreCase("srt_partes")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortPartesDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortPartesAscComparator();
			}
		}

		if (nombreOrder.equalsIgnoreCase("srt_estado")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortEstadoDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortEstadoAscComparator();
			}
		}

		return null;
	}




	private static class sortIndiceDescComparator implements Comparator {
		private int compararNumero(Long numero1, Long numero2) {
			int ret = 0;
			if (numero1 == null) {
				numero1 = new Long("0");
			}
			if (numero2 == null) {
				numero2 = new Long("0");
			}
			ret = numero1.compareTo(numero2);
			return ret;
		}

		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return this.compararNumero(elem1.getId(), elem2.getId());
		}
	}

	private static class sortIndiceAscComparator implements Comparator {
		private int compararNumero(Long numero1, Long numero2) {
			int ret = 0;
			if (numero1 == null) {
				numero1 = new Long("0");
			}
			if (numero2 == null) {
				numero2 = new Long("0");
			}
			ret = numero1.compareTo(numero2);
			return ret;

		}

		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return this.compararNumero(elem2.getId(), elem1.getId());
		}
	}


	private static class sortNroTramiteDescComparator implements
		Comparator {

		private int compararInteger(Integer numero1, Integer numero2) {
			int ret = 0;
			if (numero1 == null) {
				numero1 = new Integer("0");
			}
			if (numero2 == null) {
				numero2 = new Integer("0");
			}
			ret = numero1.compareTo(numero2);
			return ret;
		}

		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return this.compararInteger(elem1.getNumeroTramite(), elem2.getNumeroTramite());
		}
	}




	private static class sortNroTramiteAscComparator implements
		Comparator {
		private int compararInteger(Integer numero1, Integer numero2) {
			int ret = 0;
			if (numero1 == null) {
				numero1 = new Integer("0");
			}
			if (numero2 == null) {
				numero2 = new Integer("0");
			}
			ret = numero1.compareTo(numero2);
			return ret;
		}


		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return this.compararInteger(elem2.getNumeroTramite(), elem1.getNumeroTramite());
		}
	}

	private static class sortAnioDescComparator implements
		Comparator {

		private int compararInteger(Integer numero1, Integer numero2) {
			int ret = 0;
			if (numero1 == null) {
				numero1 = new Integer("0");
			}
			if (numero2 == null) {
				numero2 = new Integer("0");
			}
			ret = numero1.compareTo(numero2);
			return ret;
		}
		@Override
		public int compare(Object o1, Object o2) {
				CInstrumento elem1 = (CInstrumento) o1;
				CInstrumento elem2 = (CInstrumento) o2;
				return this.compararInteger(elem1.getAño(), elem2.getAño());
		}
	}

	private static class sortAnioAscComparator implements
		Comparator {

		private int compararInteger(Integer numero1, Integer numero2) {
			int ret = 0;
			if (numero1 == null) {
				numero1 = new Integer("0");
			}
			if (numero2 == null) {
				numero2 = new Integer("0");
			}
			ret = numero1.compareTo(numero2);
			return ret;
		}


		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return this.compararInteger(elem2.getAño(), elem1.getAño());
		}
	}


private static class sortPctiNroDescComparator implements Comparator {
	private int compararInteger(Integer numero1, Integer numero2) {
		int ret = 0;
		if (numero1 == null) {
			numero1 = new Integer("0");
		}
		if (numero2 == null) {
			numero2 = new Integer("0");
		}
		ret = numero1.compareTo(numero2);
		return ret;
	}
	@Override
	public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return this.compararInteger(elem1.getPctiNro(), elem2.getPctiNro());
	}
}

private static class sortPctiNroAscComparator implements Comparator {
	private int compararInteger(Integer numero1, Integer numero2) {
		int ret = 0;
		if (numero1 == null) {
			numero1 = new Integer("0");
		}
		if (numero2 == null) {
			numero2 = new Integer("0");
		}
		ret = numero1.compareTo(numero2);
		return ret;
	}
	@Override
	public int compare(Object o1, Object o2) {
		CInstrumento elem1 = (CInstrumento) o1;
		CInstrumento elem2 = (CInstrumento) o2;
		return this.compararInteger(elem2.getPctiNro(), elem1.getPctiNro());
	}
}





	private static class sortResponsableDescComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getResponsable(elem1).compareToIgnoreCase(
					getResponsable(elem2));
		}
	}

	private static class sortResponsableAscComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getResponsable(elem2).compareToIgnoreCase(
					getResponsable(elem1));
		}
	}

	private static class sortPartesDescComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getPrestadores(elem1).compareToIgnoreCase(
					getPrestadores(elem2));
		}
	}

	private static class sortPartesAscComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getPrestadores(elem2).compareToIgnoreCase(
					getPrestadores(elem1));
		}
	}


	private static class sortObjetoDescComparator implements
	Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getObjeto(elem1).compareToIgnoreCase(
					getObjeto(elem2));
		}
	}

	private static class sortObjetoAscComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getObjeto(elem2).compareToIgnoreCase(
					getObjeto(elem1));
		}
	}

	private static class sortTituloDescComparator implements
	Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getTituloPdts(elem1).compareToIgnoreCase(
					getTituloPdts(elem2));
		}
	}

	private static class sortTituloAscComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getTituloPdts(elem2).compareToIgnoreCase(
					getTituloPdts(elem1));
		}
	}



	private static class sortEstadoDescComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getEstado(elem1).compareToIgnoreCase(
					getEstado(elem2));
		}
	}

	private static class sortEstadoAscComparator implements
		Comparator {
		@Override
		public int compare(Object o1, Object o2) {
			CInstrumento elem1 = (CInstrumento) o1;
			CInstrumento elem2 = (CInstrumento) o2;
			return getEstado(elem2).compareToIgnoreCase(
					getEstado(elem1));
		}
	}

	public static String getResponsable(CInstrumento c) {
		if (c.getResponsable() != null) {
			return c.getResponsable().getLastName()+ ", "+ c.getResponsable().getFirstName();
		}else{
			return c.getResponsableTexto();
		}
	}

	public static String getObjeto(CInstrumento c) {
		if (c.getObjeto() != null) {
			return c.getObjeto();
		}else{
			return "";
		}
	}
	public static String getTituloPdts(CInstrumento c) {
		if (c.getTituloPdts() != null) {
			return c.getTituloPdts();
		}else{
			return "";
		}
	}
	public static String getPctiNro(CInstrumento c) {
		if (c.getPctiNro() != null) {
			return c.getPctiNro().toString();
		}else{
			return "";
		}
	}

	public static String getPrestadores(CInstrumento c) {
		String ret = "";

		for(CInstrumentoParte p : c.getPartesInstrumento()){
			ret += p.getDescripcion() + " // ";
		}
		if(ret.length()>1){
			ret = ret.substring(0, ret.length() - 3);
		}
		return ret;
	}


	public String getObjetoDivulgacion() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getObjetoDivulgacion()!=null){
			return c.getObjetoDivulgacion();
		}
		return "";
	}
	public String getAlcance(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getTipo().equals(ETipoInstrumento.CON)){
			if (((CConvenio)c).getAlcance()!=null){
				return ((CConvenio)c).getAlcance().getDescripcion();
			}
		}
		return "";
	}

	public String getNroExpediente() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (!StringUtils.isEmpty(c.getNumeroExpedienteTexto()) ) {
			return c.getNumeroExpedienteTexto();
		}
		return "";
	}

	public String getTipoConvenio(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		CConvenio co =(CConvenio)c;

		if (co.getTipoConvenio()!=null){
			return co.getTipoConvenio().getDescripcion();
		}
		return "";
	}

	public String getActividad(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();

		//----que es actividad
		return "";
	}

	public String getOtrosIngresos(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (!StringUtils.isEmpty(c.getOtrosIngresos())){
			return c.getOtrosIngresos();
		}
		//----que es actividad
		return "";
	}

	public String getMonedaDolar(){
		return getMoneda("1");
	}
	public String getMonedaPeso(){
		return getMoneda("2");
	}

	public String getMonedaEuro(){
		return getMoneda("3");
	}
	public String getMonedaReal(){
		return getMoneda("4");
	}

	public String getMonedaLibra(){
		return getMoneda("5");
	}
	public String getMonedaFranco(){
		return getMoneda("6");
	}

	public String getMoneda(String tipo){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		BigDecimal totImpo= BigDecimal.ZERO;
		if (c.getMontosInstrumento()!=null && c.getMontosInstrumento().size()>0){
			for (CInstrumentoMonto im : c.getMontosInstrumento()) {
				if (im.getTipoMoneda().getId().toString().equalsIgnoreCase(tipo)){
					totImpo = totImpo.add(im.getMonto());
				}
			}
		}
		return totImpo.toString();
	}

	public String getPublicarEnWeb(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getPublicarWeb()) {
			return "Si";
		}

		return "No";
	}

	public String getFechaInicio(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getFechaInicio()!=null) {
			return  UFecha.dateToStringConGuion(c.getFechaInicio());
		}
		return "";
	}

	public String getFechaFin(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getFechaFin()!=null) {
			return  UFecha.dateToStringConGuion(c.getFechaFin());
		}
		return "";
	}

	public String getNroResolucion(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		String ret="";

		for (CInstrumentoResolucion im : c.getResoluciones()) {
			if (!StringUtils.isEmpty(ret)){
				ret= ret+" - ";
			}
			if (im.getTipoResolucion()!=null){
				ret =ret+im.getTipoResolucion().getId();
			}
			if (im.getNumero()!=null){
				ret= ret+ im.getNumero().toString();
				if (im.getAño()!=null){
					ret=ret+"/"+im.getAño();
				}
			}

		}

		return ret;
	}


	public String getUvt(){
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		if (c.getUvt()!=null){
			return c.getUvt().getSigla();
		}else if (!StringUtils.isEmpty(c.getUvtTexto())){
			return c.getUvtTexto();
		}

		return "";
	}

	public String getParteContraparte() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();
		String ret = "";

		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.CP)){
			ret += p.getDescripcion() + " // ";
			}
		}
		if(ret.length()>1){
			ret = ret.substring(0, ret.length() - 3);
		}
		return ret;




/*		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.CONTRAPARTE))
				return p.getDescripcion() ;
		}*/

	}

	public String getPartePrestador() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();

		String ret = "";

		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.PRE)){
			ret += p.getDescripcion() + " // ";
			}
		}
		if(ret.length()>1){
			ret = ret.substring(0, ret.length() - 3);
		}
		return ret;



	/*	for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.PRESTADOR))
				return p.getDescripcion() ;
		}
		return "";*/
	}
	public String getPartePromotor() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();


		String ret = "";

		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.PRO)){
			ret += p.getDescripcion() + " // ";
			}
		}
		if(ret.length()>1){
			ret = ret.substring(0, ret.length() - 3);
		}
		return ret;


/*		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.PROMOTOR))
				return p.getDescripcion() ;
		}
		return "";*/
	}

	public String getParteUvt() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();

		String ret = "";

		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.UVT)){
			ret += p.getDescripcion() + " // ";
			}
		}
		if(ret.length()>1){
			ret = ret.substring(0, ret.length() - 3);
		}
		return ret;


		/*
			for(CInstrumentoParte p : c.getPartesInstrumento()){
				if (p.getFuncion().equals(EFuncionParteInstrumento.UVT))
					return p.getDescripcion() ;
			}
		return "";*/
	}
	public String getParteContratanteNF() {

		CInstrumento c = (CInstrumento) this.getCurrentRowObject();

		String ret = "";

		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.EMP)){
				if (!StringUtils.isEmpty(((CInstrumentoParteContratante)p).getContratante().getDescripcionNombreFantasia()) ){
					ret +=  ((CInstrumentoParteContratante)p).getContratante().getDescripcionNombreFantasia()+ " // ";
				}
			}
		}
		if(ret.length()>1){
			ret = ret.substring(0, ret.length() - 3);
		}
		return ret;


	/*	for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.CONTRATANTE))
				return  ((CInstrumentoParteContratante)p).getContratante().getDescripcionNombreFantasia();
		}
		return "";*/
	}

	public String getParteContratanteRS() {
		CInstrumento c = (CInstrumento) this.getCurrentRowObject();

		String ret = "";

		for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.EMP)){
				ret +=  ((CInstrumentoParteContratante)p).getContratante().getDescripcion()+ " // ";
			}
		}
		if(ret.length()>1){
			ret = ret.substring(0, ret.length() - 3);
		}
		return ret;

	/*	for(CInstrumentoParte p : c.getPartesInstrumento()){
			if (p.getFuncion().equals(EFuncionParteInstrumento.CONTRATANTE))
				return  ((CInstrumentoParteContratante)p).getContratante().getDescripcion();
		}
		return "";*/
	}


	public String getAcciones() {
		CInstrumentoBuscarActionForm form = (CInstrumentoBuscarActionForm) this.getPageContext().getSession().getAttribute("cInstrumentoBuscarActionForm");
		CInstrumento instrumento = (CInstrumento) this.getCurrentRowObject();
		String retorno = "<a id=\""+instrumento.getId()+"\" class=\"hojaRutaMappedButton CformBotonTransp \" >Hoja de Ruta</a>" ;//+ "&nbsp|&nbsp;";
		//retorno += "<a id=\""+instrumento.getId()+"\"  class=\"hitoButton CformBotonTransp \">Hito</a>" ;
		return retorno;
	}
	
	public String getResoluciones(){	
		CInstrumento instrumento = (CInstrumento) this.getCurrentRowObject();		
		if(!instrumento.getResoluciones().isEmpty()){
			String resoluciones = "";
			for (CInstrumentoResolucion resolucion : instrumento.getResoluciones() ) {
				resoluciones+= resolucion.getNumeroYTipo();
				if (resolucion.getAño() != null){
					resoluciones += "/"+resolucion.getAño();
				}
				resoluciones += "//";
			}
			return resoluciones.substring(0, resoluciones.length()-2);		
		}
		return "-";
	}	
}
