package conicet.apps.svt.web.equipo.form;


public class CEquipoModificarActionForm extends CEquipoForm{


	/*@Override
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		ActionErrors errors = new ActionErrors();
		if ("modificar".equalsIgnoreCase(this.getAccion())) {
			if ("Registrar".equalsIgnoreCase(this.getBtnSubmit())) {
				if (StringUtils.isEmpty(this.getAutoCompleteMappedId(EAC.Marca.name()))) {
					errors.add("modificarEquipo", new ActionMessage("errors.required", "La Marca"));
				}
				if (!StringUtils.isNumeric(this.getNroPatrimonio())) {
					errors.add("modificarEquipo", new ActionMessage("errors.dynamic", "El Patrimonio debe tener dígitos numéricos."));
				}
				if (StringUtils.isEmpty(this.getDescripcion())) {
					errors.add("modificarEquipo", new ActionMessage("errors.required", "La Descripción"));
				}
				if ((this.getPropietario().equalsIgnoreCase("-4")) && (StringUtils.isEmpty(this.getDescripcionPropietario()))) {
					errors.add("modificarEquipo", new ActionMessage("errors.required", "La especificación del Propietario"));
				}
				if ("-1".equalsIgnoreCase(this.getPropietario()) || ("-2".equalsIgnoreCase(this.getPropietario()))) {
					errors.add("modificarEquipo", new ActionMessage("errors.required", "El Propietario"));
				}
				if (!StringUtils.isEmpty(this.getAnio())) {
					if (!StringUtils.isNumeric(this.getAnio())) {
						errors.add("modificarEquipo", new ActionMessage("errors.dynamic", "El año debe tener dígitos numéricos."));
					}
					if ((this.getAnio().length() < 4) && (this.getAnio().length() > 0)) {
						errors.add("modificarEquipo", new ActionMessage("errors.dynamic", "El año debe tener cuatro dígitos."));
					} else if (this.getAnio().compareTo(new String("1900")) < 0) {
						errors.add("modificarEquipo", new ActionMessage("errors.dynamic", "El año debe ser mayor que 1900."));
					} else if ((UFecha.anioActual()).compareTo(this.getAnio()) < 0) {
						errors.add("modificarEquipo", new ActionMessage("errors.dynamic", "El año no puede ser mayor al actual."));
					} else {
						try {
							Integer anio = new Integer(this.getAnio());
							if (anio.compareTo(new Integer(0)) < 0) {
								errors.add("modificarEquipo", new ActionMessage("errors.dynamic", "El año debe ser un número positivo."));
							}
						} catch (NumberFormatException ex) {
							errors.add("modificarEquipo", new ActionMessage("errors.dynamic", "El año debe ser un número."));
						}
					}
				}
			}
		}
		return errors;
	}*/


}
