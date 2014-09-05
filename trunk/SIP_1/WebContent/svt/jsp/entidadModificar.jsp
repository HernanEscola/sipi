<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
  media="screen, print" />
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>
<script language="JavaScript1.2" src="./js/comboPaisAjax.js?nombre='<%=CConstantes.paisArgentina%>' "></script>

<script>

$(document).ready(function() {

	generarCombos("cEntidadModificarAction.do","","<%=CConstantes.paisArgentina%>");
  generarCombos("cEntidadModificarAction.do","Particular","<%=CConstantes.paisArgentina%>");
  
  habilitarModificacion();
  habilitarProvinciaPartidoLocalidad();

  prepararBusqueda("LugarDeTrabajo");

});


function prepararBusqueda(tipo){

	  var conicetGeneral = new ConicetGeneral();

	  //llama al action del ALTA q tiene el methodo del autocomplete.
		conicetGeneral.autocomplete({
			idInput : "autoComplete"+ tipo,
			url : 'cEntidadModificarAction.do?btnSubmit=autoComplete'+ tipo ,
					onSelectFunction : function(item) {
						$("#"+ tipo + "Seleccionado").attr("value", item.data.id);
						$("#autoComplete"+ tipo + "Texto").text(item.data.nombre);
						intercambiar(tipo);
					},
					valueDefault : "",
					formatItem : function(item) {
						return item.nombre;
					}

				});

				$('#autoComplete' + tipo).show().css("width", "200px")
						.autocomplete("option", "position", {
							my : "right top",
							at : "right bottom"
						});
				$('#autoComplete' + tipo + 'Descripcion').hide();
				intercambiar(tipo);

		}

function mostrar(i, tipo) {
	if (true) {
		$("[id^=autoComplete" + tipo + "]").hide();
	} else {
		intercambiar(tipo);
	}
}


function removeBy(tipo) {
	$('#' + tipo + 'Seleccionado').attr("value", "");
	$('#autoComplete' + tipo).attr("value", "");
	intercambiar(tipo);
}

function intercambiar(tipo) {
	var select = $('#' + tipo + 'Seleccionado').val();
	if (select != "" && select != null) {
		$('#autoComplete' + tipo).hide();
		$('#autoComplete' + tipo + 'Descripcion').show();
	} else {
		$('#autoComplete' + tipo + 'Descripcion').hide();
		$('#autoComplete' + tipo).show();
	}
}


	function habilitarModificacion() {
		if (document.cEntidadModificarActionForm.bloquearDatos.value == "si") {
			$('*[id^="org"]').attr('disabled', true);
			$('*[id^="org"]').addClass('CformTextDisabled');

			$('#autoCompleteLugarDeTrabajo').attr('disabled', true);
			$('#removeLugarDeTrabajo').hide();

			$('*[id^="per"]').attr('disabled', true);
			$('*[id^="per"]').addClass('CformTextDisabled');
			$('select[id^="cbo"]').attr('disabled', 'disabled');
			$('select[id^="cbo"]').addClass('CformTextDisabled');

		} else {
			$('*[id^="org"]').removeAttr('disabled');
			$('*[id^="org"]').removeClass('CformTextDisabled');

			$('*[id^="per"]').removeAttr('disabled');
			$('*[id^="per"]').removeClass('CformTextDisabled');

			$('select[id^="cbo"]').removeAttr('disabled');
			$('select[id^="cbo"]').removeClass('CformTextDisabled');
			
			 $('#autoCompleteLugarDeTrabajo').removeAttr('disabled');
			 
		}

	}

	function habilitarProvinciaPartidoLocalidad() {
		if ($('#cboPais').val() == '<%=CConstantes.paisArgentina%>') {
			if (document.cEntidadModificarActionForm.bloquearDatos.value == "no") {
				$('#cboProvincia').attr('disabled', false);
				$('#cboPartido').attr('disabled', false);
				$('#cboLocalidad').attr('disabled', false);
			}
		} else {

			$('#cboProvincia').attr('disabled', true);
			document.cEntidadModificarActionForm.provincia.value = "-1";
			$('#cboPartido').attr('disabled', true);
			document.cEntidadModificarActionForm.partido.value = "-1";
			$('#cboLocalidad').attr('disabled', true);
			document.cEntidadModificarActionForm.localidad.value = "-1";

		}

		if ($('#cboPaisParticular').val() == '<%=CConstantes.paisArgentina%>') {
			if (document.cEntidadModificarActionForm.bloquearDatos.value == "no") {
				$('#cboProvinciaParticular').attr('disabled', false);
				$('#cboPartidoParticular').attr('disabled', false);
				$('#cboLocalidadParticular').attr('disabled', false);
			}
		} else {
			$('#cboProvinciaParticular').attr('disabled', true);
			$('#cboPartidoParticular').attr('disabled', true);
			$('#cboLocalidadParticular').attr('disabled', true);

		}

		$('#cboPais').change(function() {
			//si no es Argentina deshabilito los combos
			if ($('#cboPais').val() != '<%=CConstantes.paisArgentina%>') {
				$('#cboProvincia').attr('disabled', true);
				document.cEntidadModificarActionForm.provincia.value = "-1";
				$('#cboPartido').attr('disabled', true);
				document.cEntidadModificarActionForm.partido.value = "-1";
				$('#cboLocalidad').attr('disabled', true);
				document.cEntidadModificarActionForm.localidad.value = "-1";
			} else {
				$('#cboProvincia').removeAttr('disabled');
				$('#cboPartido').removeAttr('disabled');
				$('#cboLocalidad').removeAttr('disabled');
			}
		});

		$('#cboPaisParticular').change(function() {
			//si no es Argentina deshabilito los combos
			if ($('#cboPaisParticular').val() != '<%=CConstantes.paisArgentina%>') {
				$('#cboProvinciaParticular').attr('disabled', true);
				$('#cboPartidoParticular').attr('disabled', true);
				$('#cboLocalidadParticular').attr('disabled', true);
			} else {
				$('#cboProvinciaParticular').removeAttr('disabled');
				$('#cboPartidoParticular').removeAttr('disabled');
				$('#cboLocalidadParticular').removeAttr('disabled');
			}
		});
	}

	window.onload = function() {
		setupPanes("container",
				document.cEntidadModificarActionForm.cambiaPanel.value);
	}

	function irA(obj) {
		document.cEntidadModificarActionForm.cambiaPanel.value = obj;
		setupPanes("container",
				document.cEntidadModificarActionForm.cambiaPanel.value);
	}

	function mostrarPanel(obj1, obj2) {
		document.cEntidadModificarActionForm.cambiaPanel.value = obj2.id;
		return showPane(obj1, obj2);
	}

	function prepararComboProvincias() {
		document.cEntidadModificarActionForm.action = 'cEntidadModificarAction.do?btnSubmit=prepararComboProvincias';
		document.cEntidadModificarActionForm.submit();
	}

	function prepararComboPartidos() {

		document.cEntidadModificarActionForm.action = 'cEntidadModificarAction.do?btnSubmit=prepararComboPartidos';
		document.cEntidadModificarActionForm.submit();
	}
	function prepararComboLocalidades() {

		document.cEntidadModificarActionForm.action = 'cEntidadModificarAction.do?btnSubmit=prepararComboLocalidades';
		document.cEntidadModificarActionForm.submit();
	}
	function prepararComboProvinciasParticular() {

		document.cEntidadModificarActionForm.action = 'cEntidadModificarAction.do?btnSubmit=prepararComboProvinciasParticular';
		document.cEntidadModificarActionForm.submit();
	}

	function prepararComboPartidosParticular() {

		document.cEntidadModificarActionForm.action = 'cEntidadModificarAction.do?btnSubmit=prepararComboPartidosParticular';
		document.cEntidadModificarActionForm.submit();
	}
	function prepararComboLocalidadesParticular() {

		document.cEntidadModificarActionForm.action = 'cEntidadModificarAction.do?btnSubmit=prepararComboLocalidadesParticular';
		document.cEntidadModificarActionForm.submit();
	}
</script>

<br>
<h1 align="center" class="titulo">
  Modificaci&oacute;n de Entidad
</h1>

<html:form action="cEntidadModificarAction.do" method="POST">
  <html:hidden property="tipoEntidad" />
  <html:hidden property="accion" />
  <html:hidden property="cambiaPanel" />
  <html:hidden property="bloquearDatos" />

  <logic:equal property="accion" value="modificarPersona" name="cEntidadModificarActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="#" onClick="return mostrarPanel('datos', this)" id="tab1">Datos</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('convenioMarco', this)" id="tabConvenioMarco">Convenio Marco</a>
              </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <div id="datos">
          <table class="tablaMin" align="center" >
            <tr>
              <td class="CformAreaBotones" >
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" onclick=" irA('tab1')"/>
                  <input type="button" class="CformBotonTranspBorde" value="<" onclick=" irA('tab1')"/>
                  <input type="button" class="CformBotonTranspBorde" value=">" onclick="irA('tabConvenioMarco')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irA('tabConvenioMarco')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                  <tr height="25">
                    <td class="CformRowHeader" colspan="10">
                      &nbsp; Entidad
                    </td>
                  </tr>
                  <tr>
                    <td height="10" colspan="10"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="100%" cellpadding="2" cellspacing="2">
                        <tr>
                          <td class="CformNombre" width="120">
                            Tipo:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:select disabled="true" property="tipo">
                              <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>

                          <tr>
                            <td class="CformNombre" width="120">
                              Apellido:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_apellido" property="apellido" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Nombre:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_nombre" property="nombre" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Documento tipo:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="per_tipo_doc" disabled="true" property="tipoDocumento">
                                <html:options collection="comboTipoDoc" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" onkeypress="validarNumero()">
                              Documento Nro.:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_doc_nro" property="nroDocumento" onchange="validarNumero()" maxlength="8" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Cuit:<span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato" colspan="3">
                              <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                              <html:text styleId="per_cuit_prefijo" property="cuitPrefijo" size="2" styleClass="CformTextDisabled" disabled="true" />
                              -
                              <html:text styleId="per_cuit_nro" property="cuitNumero" size="9" styleClass="CformTextDisabled" disabled="true" />
                              -
                              <html:text styleId="per_cuit_sufijo" property="cuitSufijo" size="1" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Domicilio:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea styleId="per_domicilio" rows="3" property="domicilio" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              País:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPaisParticular" disabled="true" property="paisParticular">
                                <html:options collection="comboPaisParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Provincia:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvinciaParticular" disabled="true" property="provinciaParticular">
                                <html:options collection="comboProvinciaParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPartidoParticular" disabled="true" property="partidoParticular">
                                <html:options collection="comboPartidoParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboLocalidadParticular" disabled="true" property="localidadParticular">
                                <html:options collection="comboLocalidadParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Código Postal:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_cp" property="codigoPostal" maxlength="8" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              E-Mail:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_email" property="mail" maxlength="50" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Teléfono:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_telefono" property="telefono" maxlength="50" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                           <tr>
                            <td class="CformNombre">
                              Lugar de Trabajo:
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                            <html:hidden property="lugarDeTrabajoSeleccionado" styleId="LugarDeTrabajoSeleccionado" />
									<div id="autoCompleteLugarDeTrabajoDescripcion" style='display: inline-block;'>
										<label id="autoCompleteLugarDeTrabajoTexto"><bean:write name="cEntidadModificarActionForm" property="lugarDeTrabajoDescripcion" /> </label> <a id="removeLugarDeTrabajo" href="#" onclick="removeBy('LugarDeTrabajo')"><img src="./imagenes/close.png"
											align="top" /> </a>
									</div>
									<input type="text" name="autoCompleteLugarDeTrabajo" id="autoCompleteLugarDeTrabajo" width="200" />
									</td>
								</tr>  
                          <tr>
                            <td class="CformNombre">
                              País:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPais" disabled="true" property="pais">
                                <html:options collection="comboPais" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>

                          <tr>
                            <td class="CformNombre">
                              Provincia:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvincia" disabled="true" property="provincia">
                                <html:options collection="comboProvincia" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPartido" disabled="true" property="partido">
                                <html:options collection="comboPartido" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboLocalidad" disabled="true" property="localidad">
                                <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Escalafón:&nbsp;
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="per_escalafon" disabled="true" property="escalafon">
                                <html:options collection="comboEscalafon" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Categoría:&nbsp;
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="per_categoria" disabled="true" property="categoria">
                                <html:options collection="comboCategoria" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                        
                        <!-- /logic:equal-->
                        <!-- 
                        <logic:notEqual name="cEntidadModificarActionForm" property="bloquearDatos" value="si">
                          <tr>
                            <td class="CformNombre" width="120">
                              Apellido:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="apellido" maxlength="60" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Nombre:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="nombre" maxlength="60" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Documento tipo:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select disabled="false" property="tipoDocumento">
                                <html:options collection="comboTipoDoc" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" onkeypress="validarNumero()">
                              Documento Nro.:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="nroDocumento" onchange="validarNumero()" maxlength="8"
                                size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Cuit:&nbsp;
                            </td>
                            <td class="CformDato" colspan="3">
                              
                              <html:text property="cuitPrefijo" maxlength="2" size="2" onkeypress="validarNumero()" />
                              -
                              <html:text property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()" />
                              -
                              <html:text property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Domicilio:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea rows="3" property="domicilio" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              País:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPaisParticular" disabled="false" property="paisParticular">
                                <html:options collection="comboPaisParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Provincia:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvinciaParticular" disabled="false" property="provinciaParticular">
                                <html:options collection="comboProvinciaParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPartidoParticular" disabled="false" property="partidoParticular" >
                                <html:options collection="comboPartidoParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboLocalidadParticular" disabled="false" property="localidadParticular">
                                <html:options collection="comboLocalidadParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Código Postal:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="codigoPostal" maxlength="8" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              E-Mail:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="mail" maxlength="60" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Teléfono:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="telefono" maxlength="50" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Lugar de Trabajo:&nbsp;
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                              <html:textarea rows="3" disabled="true" property="lugarTrabajoDescrip" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              País:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPais" disabled="false" property="pais">
                                <html:options collection="comboPais" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Provincia:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvincia" disabled="false" property="provincia">
                                <html:options collection="comboProvincia" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPartido" disabled="false" property="partido">
                                <html:options collection="comboPartido" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboLocalidad" disabled="false" property="localidad">
                                <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Escalafón:&nbsp;
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                              <html:select disabled="true" property="escalafon">
                                <html:options collection="comboEscalafon" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Categoría:&nbsp;
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                              <html:select disabled="true" property="categoria">
                                <html:options collection="comboCategoria" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                        </logic:notEqual>
                        -->
                        <tr>
                          <td class="CformNombre">
                            Observaciones:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:textarea property="observaciones" />
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformAreaBotones" height="35">
                      <span class="dato_obligatorio">* Datos obligatorios</span>
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cEntidadModificarActionForm" onclick="irA('tabConvenioMarco')" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                      </div>
                    </td>
                  </tr>
                </table>
          </table>
          <table align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                Los datos que vienen de TRAMIX no pueden ser modificados desde SVT.
              </td>
            </tr>
            <tr>
              <td>
                <span class="dato_obligatorio">(1)</span> No corresponde informar los campos si no es personal de CONICET.
              </td>
            </tr>
            <tr>
              <td>
                <span class="dato_obligatorio">(2)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.
              </td>
            </tr>
          </table>
        </div>

        <div id="convenioMarco">
          <table class="tablaMin" align="center">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cEntidadModificarActionForm"  onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cEntidadModificarActionForm"  onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cEntidadModificarActionForm" onclick="irA('tabConvenioMarco')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cEntidadModificarActionForm" onclick="irA('tabConvenioMarco')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Convenio Marco:&nbsp;
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadModificarActionForm.colConvenioMarco" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="universidad" title="Inst. Contraparte" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="uvts" title="UVT" headerClass="tableCellHeader" style="width: 200px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionó Convenio Marco.&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%">
                  <tr>
                    <td class="CformAreaBotones">
                      <div align="right">
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </logic:equal>

  <logic:equal property="accion" value="modificarGrupo" name="cEntidadModificarActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="#" onClick="return mostrarPanel('datos', this)" id="tab1">Datos</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('integrantes', this)" id="tab2">Integrantes</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('convenioMarco', this)" id="tabConvenioMarco">Convenio Marco</a>
              </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <div id="datos">
          <table class="tablaMin" align="center"  >
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cEntidadModificarActionForm"   onclick="irA('tab2')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cEntidadModificarActionForm"   onclick="irA('tabConvenioMarco')" />
                </div>
              </td>
            </tr>
          </table>

          <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
            <tr height="25">
              <td class="CformRowHeader" colspan="10">
                &nbsp; Entidad
              </td>
            </tr>
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                    <td height="10" colspan="10"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="100%" cellpadding="2" cellspacing="2">
                        <tr>
                          <td class="CformNombre">
                            Tipo:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:select disabled="true" property="tipo">
                              <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Descripción:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="descripcionSigla" size="50" maxlength="80" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Domicilio:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:textarea rows="3" property="domicilio" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            País:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:select styleId="cboPais" disabled="false" property="pais">
                              <html:options collection="comboPais" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Provincia:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:select styleId="cboProvincia" disabled="false" property="provincia">
                              <html:options collection="comboProvincia" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Partido:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:select styleId="cboPartido" disabled="false" property="partido">
                              <html:options collection="comboPartido" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Localidad:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:select styleId="cboLocalidad" disabled="false" property="localidad">
                              <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            E-Mail:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="mail" size="50" maxlength="60" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Teléfono:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:text property="telefono" size="50" maxlength="50" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Observaciones:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:textarea property="observaciones" />
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td class="CformAreaBotones" height="35">
                <span class="dato_obligatorio"> * Datos obligatorios</span>
                <div align="right">
                  <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tab2')" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                </div>
              </td>
            </tr>
          </table>
        </div>
        <div id="integrantes">
          <table class="tablaMin" align="center" >
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cEntidadModificarActionForm"  onclick="irA('tabConvenioMarco')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cEntidadModificarActionForm"  onclick="irA('tabConvenioMarco')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table align="center" width="100%">
                 
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Integrantes:<span class="dato_obligatorio">*</span>
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="integrantes" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadModificarActionForm.integrantes" style="width:100%"  decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                          <display:column property="indice" title="#" headerClass="tableCellHeader" />
                          <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="150" style="width: 230px;" />
                          <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                          <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="esJefeModificar" title="Responsable" headerClass="tableCellHeader" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="integrantes" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionaron Integrantes.&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
                <table width="100%">
                  <tr>
                    <td class="CformAreaBotones">
                      <span class="dato_obligatorio"> * Datos obligatorios</span>
                      <div align="right">
                        <html:submit property="btnSubmit" value="Modificar Integrantes" styleClass="CformBoton" />
                        <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabConvenioMarco')" />
                      </div>
                    </td>
                  </tr>
               </table>
              </td>
            </tr>
          </table>
        </div>
        <div id="convenioMarco">
          <table class="tablaMin" align="center"  >
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cEntidadModificarActionForm"   onclick="irA('tab2')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cEntidadModificarActionForm"  onclick="irA('tabConvenioMarco')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cEntidadModificarActionForm"  onclick="irA('tabConvenioMarco')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Convenio Marco:&nbsp;
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadModificarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="universidad" title="Inst. Contraparte" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="uvts" title="UVT" headerClass="tableCellHeader" style="width: 200px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionó Convenio Marco.&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%">
                  <tr>
                    <td class="CformAreaBotones">
                      <div align="right">
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </logic:equal>

  <logic:equal property="accion" value="modificarOrganismo" name="cEntidadModificarActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="#" onClick="return mostrarPanel('datos', this)" id="tab1">Datos</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('convenioMarco', this)" id="tabConvenioMarco">Convenio Marco</a>
              </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <div id="datos">
          <table class="tablaMin" align="center" >
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cEntidadModificarActionForm"   onclick="irA('tabConvenioMarco')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cEntidadModificarActionForm"  onclick="irA('tabConvenioMarco')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
            <tr height="25">
              <td class="CformRowHeader" colspan="10">
                &nbsp; Entidad
              </td>
            </tr>
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                    <td height="10" colspan="10"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="100%" cellpadding="2" cellspacing="2">
                      
                          <tr>
                            <td class="CformNombre" width="100">
                              Tipo:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select disabled="true" property="tipo">
                                <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="100">
                              Sigla:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="org_descripcionSigla" name="cEntidadModificarActionForm" maxlength="50" size="50" property="descripcionSigla" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="100">
                              Denominación:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="org_denominacion" maxlength="150" size="50" property="denominacion" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Cuit:&nbsp;
                            </td>
                            <td class="CformDato" colspan="3">
                              <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                              <html:text styleId="org_cuitPrefijo" property="cuitPrefijo" maxlength="2" size="2" styleClass="CformTextDisabled" disabled="true" />
                              -
                              <html:text styleId="org_cuitNumero" property="cuitNumero" maxlength="8" size="9" styleClass="CformTextDisabled" disabled="true" />
                              -
                              <html:text styleId="org_cuitSufijo" property="cuitSufijo" maxlength="1" size="1" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Domicilio:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea styleId="org_domicilio" rows="3" property="domicilio" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              País:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPais" disabled="true" property="pais">
                                <html:options collection="comboPais" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Provincia:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvincia" disabled="true" property="provincia">
                                <html:options collection="comboProvincia" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPartido" disabled="true" property="partido">
                                <html:options collection="comboPartido" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboLocalidad" disabled="true" property="localidad">
                                <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <logic:notEqual property="tipo" value="5" name="cEntidadModificarActionForm">
                              <td class="CformNombre">
                                E-Mail:
                                <span class="dato_obligatorio">*</span>
                              </td>
                            </logic:notEqual>
                            <logic:equal property="tipo" value="5" name="cEntidadModificarActionForm">
                              <td class="CformNombre">
                                E-Mail:&nbsp;
                              </td>
                            </logic:equal>
                            <td class="CformDato">
                              <html:text styleId="org_mail" name="cEntidadModificarActionForm" size="50" property="mail" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Teléfono:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text styleId="org_telefono" property="telefono" maxlength="50" size="50" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                        <!-- 
                        
                        <logic:notEqual name="cEntidadModificarActionForm" property="bloquearDatos" value="si">
                          <tr>
                            <td class="CformNombre" width="100">
                              Tipo:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select disabled="true" property="tipo">
                                <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Sigla:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text name="cEntidadModificarActionForm" size="50" maxlength="30" property="descripcionSigla" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Denominación:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text name="cEntidadModificarActionForm" size="50" maxlength="150" property="denominacion" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Cuit:&nbsp;
                            </td>
                            <td class="CformDato" colspan="3">
                              
                              <html:text property="cuitPrefijo" maxlength="2" size="2" onkeypress="validarNumero()" />
                              -
                              <html:text property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()" />
                              -
                              <html:text property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Domicilio:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea rows="3" property="domicilio" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              País:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPais" disabled="false" property="pais">
                                <html:options collection="comboPais" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Provincia:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvincia" disabled="false" property="provincia">
                                <html:options collection="comboProvincia" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPartido" disabled="false" property="partido">
                                <html:options collection="comboPartido" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboLocalidad" disabled="false" property="localidad">
                                <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <logic:notEqual property="tipo" value="5" name="cEntidadModificarActionForm">
                              <td class="CformNombre">
                                E-Mail:
                                <span class="dato_obligatorio">*</span>
                              </td>
                            </logic:notEqual>
                            <logic:equal property="tipo" value="5" name="cEntidadModificarActionForm">
                              <td class="CformNombre">
                                E-Mail:&nbsp;
                              </td>
                            </logic:equal>
                            <td class="CformDato">
                              <html:text name="cEntidadModificarActionForm" size="50" maxlength="50" property="mail" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Teléfono:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="telefono" size="50" maxlength="50" />
                            </td>
                          </tr>
                        </logic:notEqual>
                        -->
                        
                        <tr>
                          <td class="CformNombre">
                            Observaciones:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:textarea property="observaciones" />
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td class="CformAreaBotones" height="35">
                <span class="dato_obligatorio"> * Datos obligatorios</span>
                <div align="right">
                  <input type="button" class="CformBoton" value="Siguiente" onclick="irA('tabConvenioMarco')" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                </div>
              </td>
            </tr>
          </table>
        </div>
        <div id="convenioMarco">
          <table class="tablaMin" align="center" >
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cEntidadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cEntidadModificarActionForm"  onclick="irA('tabConvenioMarco')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cEntidadModificarActionForm" onclick="irA('tabConvenioMarco')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Convenio Marco:&nbsp;
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadModificarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="universidad" title="Inst. Contraparte" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="uvts" title="UVT" headerClass="tableCellHeader" style="width: 200px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionó Convenio Marco.&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%">
                  <tr>
                    <td class="CformAreaBotones">
                      <div align="right">
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </logic:equal>
</html:form>
