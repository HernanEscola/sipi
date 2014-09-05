package conicet.apps.svt.util.web;
import java.sql.Connection;
import java.util.Collection;
import java.util.Iterator;

import conicet.objetos.Menu;
import conicet.objetos.Modulo;

/**
 * <p>
 * Título:
 * </p>
 * <p>
 * Descripción:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003
 * </p>
 * <p>
 * Empresa:
 * </p>
 * 
 * @author sin atribuir
 * @version 1.0
 */

public class CMenuSvt {

	public CMenuSvt() {
	}

	public static String generaTab(Connection con, String idModulo, String rol, int anchoPantalla) {
		Modulo modulo = null;
		int cantidadModulos = 0;
		int cont_img = 1;
		Collection colModulos = new Modulo().findWhere(con, " rol = '" + rol
				+ "'");
		String html = "";
		if (colModulos != null)
			if (!colModulos.isEmpty()) {
				cantidadModulos = colModulos.size();
				Iterator it = colModulos.iterator();
				String href;
				while (it.hasNext()) {
					modulo = (Modulo) it.next();
					html += "<td  width='96'  height='25' align='center'  background=";
					if (modulo.getIdModulo().equals(idModulo)) {
						html += "'imagenes/si_base_solo" + cont_img + ".gif'>";
					} else {
						html += "'imagenes/no_base_solo" + cont_img + ".gif'>";
					}
					href = modulo.getHref();
					html += " <a href=" + href;
					if (href.indexOf("?") == -1)
						html += "?";
					else
						html += "&";
					html += "idModulo=" + modulo.getIdModulo();
					html += "&idGrupo=" + modulo.getIdGrupoIni();
					html += "&idMenu=" + modulo.getIdMenuIni();
					html += " class = 'conicetcomun'>";
					html += modulo.getDescripcion() + "</a>";
					html += "</td>";
					cont_img++;
				}
			}
		html += "<td height='25' width='"
				+ String.valueOf(anchoPantalla - (cantidadModulos * 96)) + "'";
		html += " align='right' background='imagenes/principiotest.gif'></td>";
		return html;
	}

	public static String generaTab(Collection colModulo, String idModulo,
			String rol,int anchoPantalla) {

		Modulo modulo = new Modulo();
		int cantidadModulos = 0;
		int cont_img = 1;
		Collection colModulos = modulo.findByRol(colModulo, rol);
		String html = "";
		if (colModulos != null)
			if (!colModulos.isEmpty()) {
				cantidadModulos = colModulos.size();
				Iterator it = colModulos.iterator();
				String href;
				while (it.hasNext()) {
					modulo = (Modulo) it.next();
					html += "<td  width='96'  height='25' align='center'  background=";
					if (modulo.getIdModulo().equals(idModulo)) {
						html += "'imagenes/si_base_solo" + cont_img + ".gif'>";
					} else {
						html += "'imagenes/no_base_solo" + cont_img + ".gif'>";
					}
					href = modulo.getHref();
					html += " <a href=" + href;
					if (href.indexOf("?") == -1)
						html += "?";
					else
						html += "&";
					html += "idModulo=" + modulo.getIdModulo();
					html += "&idGrupo=" + modulo.getIdGrupoIni();
					html += "&idMenu=" + modulo.getIdMenuIni();
					html += " class = 'conicetcomun'>";
					html += modulo.getDescripcion() + "</a>";
					html += "</td>";
					cont_img++;
				}
			}
		html += "<td height='25' width='"
				+ String.valueOf(anchoPantalla - (cantidadModulos * 96)) + "'";
		html += " align='right' background='imagenes/principiotest.gif'></td>";
		return html;
	}

	public static String generaMenu(Connection con, String rol,
			String idModulo, String idGrupo, String idMenu, int anchoPantalla) {

		Iterator it = null;
		Modulo modulo = null;
		Menu menu = new Menu();
		String html = "";

		// Si el módulo es null buscar el primer módulo
		if (idModulo == null) {
			idModulo = "1";
			Collection colModulo = new Modulo().findAll(con);
			if (colModulo != null)
				if (!colModulo.isEmpty()) {
					it = colModulo.iterator();
					if (it.hasNext()) {
						modulo = (Modulo) it.next();
						idModulo = modulo.getIdModulo();
						idGrupo = modulo.getIdGrupoIni();
					}
				}
		}
		// Si el grupo es null buscar el primer grupo del módulo
		if (idGrupo == null) {
			idGrupo = "0";
			modulo = new Modulo().findByPrimaryKey(con, idModulo);
			if (modulo != null)
				idGrupo = modulo.getIdGrupoIni();
			else
				System.out.println("Fallo el findByPrimaryKey del Módulo");
		}
		// Buscar los Items de Menu del Grupo y Modulo seleccionados
		Collection colItem = menu.findWhere(con, "idModulo=" + idModulo
				+ " and idGrupo=" + idGrupo + " and rol='" + rol
				+ "' and visible = 1 ");

		html = "<tr>";
		if (colItem != null)
			if (!colItem.isEmpty()) {
				it = colItem.iterator();
				String href;
				while (it.hasNext()) {
					menu = (Menu) it.next();

					html += "  <td align=left nowrap > ";
					html += "     <div align='left'>";
					if (menu.getIdMenu().equals(idMenu)) {
						html += "     <font size='1' font color='#FF9900' face='Verdana, Arial, Helvetica, sans-serif'><strong>";
						// html += "        &nbsp;&nbsp;" +
						// menu.getDescripcion() ;

						// a partir de aca agrego sebastian
						href = menu.getHref();
						html += " <a href='" + menu.getHref();
						if (href.indexOf("?") == -1)
							html += "?";
						else
							html += "&";
						html += "idMenu=" + menu.getIdMenu() + "&idModulo="
								+ menu.getIdModuloSig() + "&idGrupo="
								+ menu.getIdGrupoSig()
								+ "' class='conicetmenuSel'>&nbsp;&nbsp;";
						if (!menu.getIdGrupo().equals(menu.getIdGrupoSig()))
							html += menu.getDescripcion() + "»</a>";
						else
							html += menu.getDescripcion() + "</a>";
						// hasta aca

					} else {
						html += "     <font size='1' font color='#FFFFFF' face='Verdana, Arial, Helvetica, sans-serif'><strong>";
						href = menu.getHref();
						html += " <a href='" + menu.getHref();
						if (href.indexOf("?") == -1)
							html += "?";
						else
							html += "&";
						html += "idMenu=" + menu.getIdMenu() + "&idModulo="
								+ menu.getIdModuloSig() + "&idGrupo="
								+ menu.getIdGrupoSig()
								+ "' class='conicetmenu'>&nbsp;&nbsp;";
						if (!menu.getIdGrupo().equals(menu.getIdGrupoSig()))
							html += menu.getDescripcion() + "»</a>";
						else
							html += menu.getDescripcion() + "</a>";
					}
					html += "        </strong></font>  <font color='#FFFFFF' size='2'> &nbsp;&nbsp;| </font></div>";
					html += "  </td> ";

				}
			}
		html += " </tr>";

		return html;

	}

	public static String generaMenu(String rol, String idModulo,
			String idGrupo, String idMenu, Collection colModulo,
			Collection colMenu,int anchoPantalla) {

		// Inicializacion
		Iterator it = null;
		String html = "";
		Modulo modulo = new Modulo();
		Menu menu = new Menu();

		// Si el módulo es null buscar el primer módulo
		if (idModulo == null) {
			idModulo = "1";
			if (colModulo != null)
				if (!colModulo.isEmpty()) {
					it = colModulo.iterator();
					if (it.hasNext()) {
						modulo = (Modulo) it.next();
						idModulo = modulo.getIdModulo();
						idGrupo = modulo.getIdGrupoIni();
					}
				}
		}
		// Si el grupo es null buscar el primer grupo del módulo
		if (idGrupo == null) {
			idGrupo = "0";
			modulo = modulo.findByModulo(colModulo, idModulo);

			if (modulo != null)
				idGrupo = modulo.getIdGrupoIni();
			else
				System.out.println("Fallo el findByPrimaryKey del Módulo");
		}
		// Buscar los Items de Menu del Grupo y Modulo seleccionados
		Collection colItem = menu.findByItems(colMenu, idModulo, idGrupo, rol);
		html = "<tr>";
		if (colItem != null)
			if (!colItem.isEmpty()) {
				it = colItem.iterator();
				String href;
				while (it.hasNext()) {
					menu = (Menu) it.next();

					html += "  <td align='left' nowrap > ";
					html += "     <div align='left'>";
					if (menu.getIdMenu().equals(idMenu)) {
						html += "     <font size='1' font color='#FF9900' face='Verdana, Arial, Helvetica, sans-serif'><strong>";
						// html += "        &nbsp;&nbsp;" +
						// menu.getDescripcion() ;
						// a partir de aca agrego sebastian
						href = menu.getHref();
						html += " <a href='" + menu.getHref();
						if (href.indexOf("?") == -1)
							html += "?";
						else
							html += "&";
						html += "idMenu=" + menu.getIdMenu() + "&idModulo="
								+ menu.getIdModuloSig() + "&idGrupo="
								+ menu.getIdGrupoSig()
								+ "' class='conicetmenuSel'>&nbsp;&nbsp;";
						if (!menu.getIdGrupo().equals(menu.getIdGrupoSig()))
							html += menu.getDescripcion() + "»</a>";
						else
							html += menu.getDescripcion() + "</a>";
						// hasta aca

					} else {
						html += "     <font size='1' font color='#FFFFFF' face='Verdana, Arial, Helvetica, sans-serif'><strong>";
						href = menu.getHref();
						html += " <a href='" + menu.getHref();
						if (href.indexOf("?") == -1)
							html += "?";
						else
							html += "&";
						html += "idMenu=" + menu.getIdMenu() + "&idModulo="
								+ menu.getIdModuloSig() + "&idGrupo="
								+ menu.getIdGrupoSig()
								+ "' class='conicetmenu'>&nbsp;&nbsp;";
						if (!menu.getIdGrupo().equals(menu.getIdGrupoSig()))
							html += menu.getDescripcion() + "»</a>";
						else
							html += menu.getDescripcion() + "</a>";
					}
					html += "        </strong></font>  <font color='#FFFFFF' size='2'> &nbsp;&nbsp;| </font></div>";
					html += "  </td> ";

				}
			}
		html += " </tr>";

		return html;

	}

}
