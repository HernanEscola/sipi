package conicet.apps.svt.web.equipo.decorator;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

import conicet.apps.svt.object.equipo.CEquipo;
import conicet.apps.svt.web.equipo.form.CEquipoBuscarActionForm;
import conicet.apps.svt.web.equipo.form.CEquipoSeleccionarActionForm;

public class CEquipoDisplayWrapper extends TableDecorator implements
		DecoratesHssf {
	public CEquipoDisplayWrapper() {
	}

	/* Esta clase sirve para construir el listado de resultados de la busqueda. */

	/* Este método se usa para hacer el índice de la tabla de resultados. */
	public String getIndice() {
		HttpServletRequest request = (HttpServletRequest) super
				.getPageContext().getRequest();
		HttpSession session = request.getSession(true);
		CEquipoBuscarActionForm form = (CEquipoBuscarActionForm) session
				.getAttribute("cEquipoBuscarActionForm");
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		// Esto que se hace acá es para que funcione el link de datalle cunado
		// hay
		// ordenamiento por alguna columna
		form.getResultados().set(this.getListIndex(), equipo);
		int i = this.getListIndex() + 1;
		String retorno = "<b><input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndex("
				+ this.getListIndex() + ") value=\"" + i + "\"></b>";
		return retorno;
	}

	public String getIndiceAsignados() {
		HttpServletRequest request = (HttpServletRequest) super
				.getPageContext().getRequest();
		HttpSession session = request.getSession(true);
		CEquipoSeleccionarActionForm form = (CEquipoSeleccionarActionForm) session
				.getAttribute("cEquipoSeleccionarActionForm");
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		// Esto que se hace acá es para que funcione el link de datalle cunado
		// hay
		// ordenamiento por alguna columna
		((List) form.getAsignados()).set(this.getListIndex(), equipo);
		int i = this.getListIndex() + 1;
		String retorno = "<b><input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndexAsignados("
				+ this.getListIndex() + ") value=\"" + i + "\"></b>";
		return retorno;
	}

	public String getIndiceNoAsignados() {
		HttpServletRequest request = (HttpServletRequest) super
				.getPageContext().getRequest();
		HttpSession session = request.getSession(true);
		CEquipoSeleccionarActionForm form = (CEquipoSeleccionarActionForm) session
				.getAttribute("cEquipoSeleccionarActionForm");
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		// Esto que se hace acá es para que funcione el link de datalle cunado
		// hay
		// ordenamiento por alguna columna
		((List) form.getNoAsignados()).set(this.getListIndex(), equipo);
		int i = this.getListIndex() + 1;
		String retorno = "<b><input type=\"submit\" class=\"CformBotonTransp\" name=elementoSeleccionadoIndexNoAsignados("
				+ this.getListIndex() + ") value=\"" + i + "\"></b>";
		return retorno;
	}

	public String getIndiceListado() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		int i = this.getListIndex() + 1;
		String retorno = "<b><input type=\"submit\" class=\"CformBotonTransp\" name=equipoIndiceMapped("
				+ this.getListIndex() + ") value=\"" + i + "\"></b>";
		return retorno;
	}

	public String getDescripcion() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		return equipo.getDescripcion();
	}

	public String getNroSerie() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		if (equipo.getNroSerie()!=null){
			return equipo.getNroSerie();
		}
		return "";
	}

	public String getModelo() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		if (null != equipo.getModelo())
			return equipo.getModelo();
		else
			return "---";
	}

	public String getPropietario() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		return getPropietario(equipo);
	}
	
	private static String getPropietario(CEquipo equipo) {
		if (equipo.getPropietario() != null) {
			return equipo.getPropietario().getDescripcion();
		} else {
			return equipo.getPropietarioDescripcion();			
		}
	}

	public String getMarca() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		if (equipo.getMarcaEquipo() != null) {
			return equipo.getMarcaEquipo().getNombre();
		} else {
			return equipo.getMarca();
		}
	}

	public String getAnio() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		return equipo.getAnioAdquisicion();
	}

	public String getNroPatrimonio() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		return equipo.getNroPatrimonio();
	}

	// asignar desasignar equipos a una oferta tecnologica
	public String getOptionsAsignado() {
		CEquipo e = (CEquipo) this.getCurrentRowObject();

		return "<input type=\"checkbox\" name=\"desasignarMapped(" + e.getId()
				+ ")\" value=\"" + e.getId() + "\">";
	}

	public String getOptionsSinAsignar() {
		CEquipo e = (CEquipo) this.getCurrentRowObject();

		return "<input type=\"checkbox\" name=\"asignarMapped(" + e.getId()
				+ ")\" value=\"" + e.getId() + "\">";
	}

	public String getEstado() {
		CEquipo equipo = (CEquipo) this.getCurrentRowObject();
		String estado = "";
		if (equipo.getEstado().equalsIgnoreCase("N")) {
			estado = "Habilitado";

		} else if (equipo.getEstado().equalsIgnoreCase("E")) {
			estado = "Eliminado";

		} else if (equipo.getEstado().equalsIgnoreCase("D")) {
			estado = "Deshabilitado";

		}
		return estado;
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
	@SuppressWarnings({ "rawtypes", "unchecked" })
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
		if (nombreOrder.equalsIgnoreCase("srt_descripcion")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortDescripcionDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortDescripcionAscComparator();
			}
		}

		if (nombreOrder.equalsIgnoreCase("srt_marca")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortMarcaDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortMarcaAscComparator();
			}
		}
		if (nombreOrder.equalsIgnoreCase("srt_modelo")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortModeloDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortModeloAscComparator();
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
		if (nombreOrder.equalsIgnoreCase("srt_nroPatrimonio")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortNroPatrimonioDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortNroPatrimonioAscComparator();
			}
		}
		if (nombreOrder.equalsIgnoreCase("srt_propietario")) {
			if (order.equalsIgnoreCase("1")) {
				return new sortPropietarioDescComparator();
			}
			if (order.equalsIgnoreCase("2")) {
				return new sortPropietarioAscComparator();
			}
		}
		return null;
	}

	/**
	 * De aca en adelante. son metodos para la defincion de cada uno de los
	 * campos que estan explicitos como sortable en la jsp. Por cada uno de
	 * estos se definen 2 metodos 1 asc y otro desc, que representan el sort por
	 * la flecha.
	 * 
	 */
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

		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
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

		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return this.compararNumero(elem2.getId(), elem1.getId());
		}
	}


	private static class sortDescripcionDescComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem1.getDescripcion().compareToIgnoreCase(
					elem2.getDescripcion());
		}
	}

	private static class sortDescripcionAscComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem2.getDescripcion().compareToIgnoreCase(
					elem1.getDescripcion());
		}
	}

	private static class sortMarcaDescComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem1.getMarca().compareToIgnoreCase(elem2.getMarca());
		}
	}

	private static class sortMarcaAscComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem2.getMarca().compareToIgnoreCase(elem1.getMarca());
		}
	}

	private static class sortModeloDescComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem1.getModelo().compareToIgnoreCase(elem2.getModelo());
		}
	}

	private static class sortModeloAscComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem2.getModelo().compareToIgnoreCase(elem1.getModelo());
		}
	}

	private static class sortAnioDescComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem1.getAnioAdquisicion().compareToIgnoreCase(elem2.getAnioAdquisicion());
		}
	}

	private static class sortAnioAscComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem2.getAnioAdquisicion().compareToIgnoreCase(elem1.getAnioAdquisicion());
		}
	}

	private static class sortNroPatrimonioDescComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem1.getNroPatrimonio().compareToIgnoreCase(
					elem2.getNroPatrimonio());
		}
	}

	private static class sortNroPatrimonioAscComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo elem1 = (CEquipo) o1;
			CEquipo elem2 = (CEquipo) o2;
			return elem2.getNroPatrimonio().compareToIgnoreCase(
					elem1.getNroPatrimonio());
		}
	}
	
	private static class sortPropietarioDescComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo eq1 = (CEquipo) o1;
			CEquipo eq2 = (CEquipo) o2;			
			String propietario1 = getPropietario(eq1);
			String propietario2 = getPropietario(eq2);

			return propietario1.compareToIgnoreCase(propietario2);
		}
	}
	
	private static class sortPropietarioAscComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			CEquipo eq1 = (CEquipo) o1;
			CEquipo eq2 = (CEquipo) o2;
			
			String propietario1 = getPropietario(eq1);
			String propietario2 = getPropietario(eq2);

			return propietario2.compareToIgnoreCase(propietario1);
		}
	}

	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}

}
