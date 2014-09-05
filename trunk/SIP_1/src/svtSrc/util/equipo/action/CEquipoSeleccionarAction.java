package conicet.apps.svt.web.equipo.action;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import conicet.apps.svt.object.equipo.CEquipo;
import conicet.apps.svt.service.CEquipoService;
import conicet.apps.svt.web.equipo.form.CEquipoSeleccionarActionForm;
import conicet.framework.error.CException;
import conicet.framework.http.CSessionManager;
import conicet.framework.util.log4j.CLog4jMessage;

/* para la seleccion de equipos se reciben los parametros:
 input= de donde viene el llamado , para el retorno(obligatorio)
 lote= si ya existian asignados equipos los mando para su confirmación/modificación(obligatorio)
 prestador(opcional)= si viene elegido mostrará equipos relacionados en listado de equipos

 y devuelve
 lote = si es null significa que cancelo y no se deben realizar modificaciones
 sino, contendrá el nuevo set de registros

 */
public class CEquipoSeleccionarAction extends Action {
	public CEquipoSeleccionarAction() {
	}

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse httpServletResponse) {

		CEquipoSeleccionarActionForm form = (CEquipoSeleccionarActionForm) actionForm;
		HttpSession sesion = request.getSession();
		CSessionManager sessionManager = CSessionManager.getInstance(request);
		Logger logger = Logger.getLogger(CEquipoSeleccionarAction.class);
		try {
			if ("ini".equals(form.getAccion())) {
				form.limpiar();
				form.getAsignados().addAll(
						(Collection) request.getAttribute("lote"));
				form.setADonde((String) request.getAttribute("input")); // a
																		// donde
																		// debe
																		// volver
				form.inicializarNoAsignados(new LinkedList());
				form.setAccion("formulario");
				return mapping.findForward("formulario");
			}
			if ("refrescarAlta".equalsIgnoreCase(form.getAccion())) {
				// si se dío alta recibe el equipo dado de alta y lo muestra en
				// equipos no asignados para su selección
				if (request.getAttribute("equipoAlta") != null) {
					form.getNoAsignados().clear();
					form.getNoAsignados().add(
							request.getAttribute("equipoAlta"));
				}
				return mapping.findForward("formulario");
			}

			else if ("formulario".equalsIgnoreCase(form.getAccion())) {
				if ("Buscar".equalsIgnoreCase(form.getBtnSubmit())) {
						CEquipo equipo = new CEquipo(form.getEquipoDescripcion());
						form.inicializarNoAsignados((List) CEquipoService.findEquiposByDescripcionOMarca(equipo));
						return mapping.findForward("formulario");
				}
				if ("Ingresar Nuevo".equalsIgnoreCase(form.getBtnSubmit())) {
					request.setAttribute("input", "equipoSeleccionar");
					return mapping.findForward("equipoAlta");
				}
				if ("Asignar".equalsIgnoreCase(form.getBtnSubmit())) {
					form.asignar();
					return mapping.findForward("formulario");
				} else if ("Desasignar".equalsIgnoreCase(form.getBtnSubmit())) {
					form.desasignar();
					return mapping.findForward("formulario");
				} else if ("Registrar".equalsIgnoreCase(form.getBtnSubmit())) {
					request.setAttribute("lote", form.getAsignados());
					return mapping.findForward(form.getADonde());
				} else if ("Volver".equalsIgnoreCase(form.getBtnSubmit())) {
					form.limpiar();
					request.setAttribute("lote", null);
					return mapping.findForward(form.getADonde());
				} else if ("Detalles".equalsIgnoreCase(form.getBtnSubmit())) {
					if (form.getElementoSeleccionado() != null) {
						ActionForward detalleForward = mapping
								.findForward(detalleForward(form, request));
						/**
						 * El elemento seleccionado del listado se pega en la
						 * request usando el nombre de su clase como nombre de
						 * atributo.
						 */
						sessionManager.setAttribute(detalleForward.getPath()
								.substring(1,
										detalleForward.getPath().indexOf("."))
								+ ".input", getMappingName(mapping));
						request.setAttribute("selected", form
								.getElementoSeleccionado());
						request.setAttribute("input", "volverSeleccionEquipos");
						request
								.setAttribute("ocultarBotonesModificacion",
										"si");
						return detalleForward;
					}
				}
			}
			/* Se da de alta un equipo y se lo pone en los equipos asignados */
			else if ("refrescar".equalsIgnoreCase(form.getAccion())) {
				if (null != request.getAttribute("object")) {
					CEquipo equipo = CEquipoService
							.findEquipoById((CEquipo) request
									.getAttribute("object"));
					form.getAsignados().add(equipo);
				}
				form.setAccion("formulario");
				return mapping.findForward("formulario");
			} else if ("repag".equalsIgnoreCase(form.getAccion())) {
				form.setAccion("formulario");
				return mapping.findForward("formulario");
			}
			return mapping.findForward("index");
		} catch (Exception ex) {
			logger.error(CLog4jMessage.getErrorMessage(request, form), ex);
			request.setAttribute("errorFatal", new CException(1, ex));
			return mapping.findForward("error_fatal");
		}
	}

	private static String getMappingName(ActionMapping mapping) {
		return mapping.getPath().substring(1, mapping.getPath().length());
	}

	protected String detalleForward(
			CEquipoSeleccionarActionForm cBusquedaActionForm,
			HttpServletRequest request) {
		return "detalle";
	}
}
