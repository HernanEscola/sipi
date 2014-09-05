
<%@include file="layout/include.jsp"%>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
  media="screen, print" />

<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script>

$(document).ready(function() {
	generarCombos("cEntidadAltaAction.do","","<%=CConstantes.paisArgentina%>");
	generarCombos("cEntidadAltaAction.do","Particular","<%=CConstantes.paisArgentina%>");
	
	habilitarModificacion();
	
	habilitarProvinciaPartidoLocalidad();

	prepararBusqueda("LugarDeTrabajo");
});


function prepararBusqueda(tipo){

	  var conicetGeneral = new ConicetGeneral();

		conicetGeneral.autocomplete({
			idInput : "autoComplete"+ tipo,
			url : 'cEntidadAltaAction.do?btnSubmit=autoComplete'+ tipo ,
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

				$('#autoComplete' + tipo).show().css("width", "386px")
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
		if (document.cEntidadActionForm.bloquearDatos.value == "si") {
			$('*[id^="per"]').attr('disabled', true);
			$('*[id^="per"]').addClass('CformTextDisabled');
			$('select[id^="cbo"]').attr('disabled', 'disabled');
			$('select[id^="cbo"]').addClass('CformTextDisabled');
			$('#autoCompleteLugarDeTrabajo').attr('disabled', true);
			$('#removeLugarDeTrabajo').hide();
			if (document.cEntidadActionForm.bloquearObservaciones.value == "si") {
				$('*[id^="obs"]').attr('disabled', true);
				$('*[id^="obs"]').addClass('CformTextDisabled');
			} else {
				$('*[id^="obs"]').removeAttr('disabled');
				$('*[id^="obs"]').removeClass('CformTextDisabled');
			}

		} else {
			$('*[id^="obs"]').removeAttr('disabled');
			$('*[id^="obs"]').removeClass('CformTextDisabled');

			$('*[id^="per"]').removeAttr('disabled');
			$('*[id^="per"]').removeClass('CformTextDisabled');

			$('select[id^="cbo"]').removeAttr('disabled');
			$('select[id^="cbo"]').removeClass('CformTextDisabled');
			
			$('#autoCompleteLugarDeTrabajo').removeAttr('disabled');

		}

	}

	function habilitarProvinciaPartidoLocalidad() {

		if ($('#cboPais').val() == '<%=CConstantes.paisArgentina%>') {

			if (document.cEntidadActionForm.bloquearDatos.value == "no") {
				$('#cboProvincia').attr('disabled', false);
				$('#cboPartido').attr('disabled', false);
				$('#cboLocalidad').attr('disabled', false);
			}
		} else {

			$('#cboProvincia').attr('disabled', true).val("-1");
			$('#cboPartido').attr('disabled', true).val("-1");
			$('#cboLocalidad').attr('disabled', true).val("-1");
		}

		if ($('#cboPaisParticular').val() == '<%=CConstantes.paisArgentina%>') {
			if (document.cEntidadActionForm.bloquearDatos.value == "no") {
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
				$('#cboProvincia').attr('disabled', true).val("-1");
				$('#cboPartido').attr('disabled', true).val("-1");
				$('#cboLocalidad').attr('disabled', true).val("-1");
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

	<capplication:isApplication application="SVT">
	<logic:notEqual name="cEntidadActionForm" property="tipoEntidadDescripcion" value="Grupo">
	solapas = new Array('tab1');
	</logic:notEqual>
	<logic:equal name="cEntidadActionForm" property="tipoEntidadDescripcion" value="Grupo">
	solapas = new Array('tab1', 'tab2');
	</logic:equal>
	</capplication:isApplication>

	<capplication:isApplication application="SVTP">
	solapas = new Array('tab1', 'tab2');
	</capplication:isApplication>

	<capplication:isApplication application="SIUVT">
	<logic:notEqual name="cEntidadActionForm" property="tipoEntidadDescripcion" value="Grupo">
	solapas = new Array('tab1');
	</logic:notEqual>
	<logic:equal name="cEntidadActionForm" property="tipoEntidadDescripcion" value="Grupo">
	solapas = new Array('tab1', 'tab2');
	</logic:equal>
	</capplication:isApplication>

	window.onload = function() {
		setupPanes("container", document.cEntidadActionForm.cambiaPanel.value);
		<capplication:isApplication application="SVTP">
		marcarObligatorios();
		</capplication:isApplication>
	}

	function setFoco() {
		x = event.keyCode
		if ((x == 13)) { // enter
			window.event.returnValue = false
		}
	}

	function irTabFinal() {
		document.cEntidadActionForm.cambiaPanel.value = solapas[solapas.length - 1];
		setupPanes("container", document.cEntidadActionForm.cambiaPanel.value);
	}

	function irTabInicial() {
		document.cEntidadActionForm.cambiaPanel.value = solapas[0];
		setupPanes("container", document.cEntidadActionForm.cambiaPanel.value);
	}

	function irTabAnterior() {
		var obj = document.cEntidadActionForm.cambiaPanel.value;
		for (i = 1; i < solapas.length; i++) {
			if ((solapas[i] == obj)) {
				document.cEntidadActionForm.cambiaPanel.value = solapas[i - 1];
				break;
			}
		}
		setupPanes("container", document.cEntidadActionForm.cambiaPanel.value);
	}

	function irTabSiguiente() {
		var obj = document.cEntidadActionForm.cambiaPanel.value;
		for (i = 0; i < (solapas.length - 1); i++) {
			if ((solapas[i] == obj)) {
				document.cEntidadActionForm.cambiaPanel.value = solapas[i + 1];
				break;
			}
		}
		setupPanes("container", document.cEntidadActionForm.cambiaPanel.value);
	}

	function mostrarPanel(obj1, obj2) {
		document.cEntidadActionForm.cambiaPanel.value = obj2.id;
		return showPane(obj1, obj2);
	}

	function irA(obj) {
		document.cEntidadActionForm.cambiaPanel.value = obj;
		setupPanes("container", document.cEntidadActionForm.cambiaPanel.value);
	}

	function confirmaPerdidaEntidad(url) {
		url.href = 'cEntidadAltaAction.do?accion=entidad';
		msg = 'Se perderán los datos no grabados, ¿desea continuar?';
		if (window.confirm(msg)) {
			url.href = url.href;
		} else {
			url.href = '#';
		}
	}

	function limpiarGestor() {
		document.cEntidadActionForm.colGestor.clear();
	}
	function setFocus() {
		document.getElementById('Busqueda').focus()
	}

	function irAPerdida(obj) {
		document.cEntidadActionForm.cambiaPanel.value = obj;
		setupPanes("container", document.cEntidadActionForm.cambiaPanel.value);
	}
</script>

<br>
<h1 align="center" class="titulo">
  Registro de Entidad
</h1>
<html:form action="cEntidadAltaAction.do" method="POST">

  <html:hidden property="accion" />
  <html:hidden property="bloquearDatos" />
  <html:hidden property="bloquearObservaciones" />

  <html:hidden property="cambiaPanel" />

  <logic:equal property="accion" value="alta" name="cEntidadActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="#" onClick="return mostrarPanel('entidad', this)" id="tab1">Entidad</a>
              </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <div id="entidad">
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2">
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                    <td height="10" colspan="10"></td>
                  </tr>
                  <tr>
                    <td>
                      <table width="100%" cellpadding="2" cellspacing="2">
                        <tr>
                          <td class="CformNombre" width="120">
                            Tipo:
                            <span class="dato_obligatorio">* </span>
                          </td>
                          <td class="CformDato">
                            <html:select disabled="false" property="tipo">
                              <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <td width="40" rowspan="100"></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td class="CformAreaBotones" height="35">
                <span class="dato_obligatorio">* Datos obligatorios</span>
              </td>
              <td class="CformAreaBotones" height="35">
                <div align="right">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Siguiente" />
                  <logic:notEmpty property="input" name="cEntidadActionForm">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                  </logic:notEmpty>
                </div>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </logic:equal>


  <logic:equal property="accion" value="seleccionarUE" name="cEntidadActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="cEntidadAltaAction.do?accion=entidad" onClick="return confirmaPerdidaEntidad(this)">Entidad</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('datos', this)" id="tab1">Datos</a>
              </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <div id="datos">
          <table class="tablaMin" align="center" >
            <tr>
              <td class="CformAreaBotones" width="100%">
                <div align="center">
                  <a href="cEntidadAltaAction.do?accion=entidad"></a>
                  <!--Esto se cambio a button para que pueda desabilitar el ir para atras-->
                  <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irTabInicial()"/>
                  <input type="button" class="CformBotonTranspBorde" value="<" onclick=" irTabAnterior()"/>
                  <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                  <logic:equal name="cEntidadActionForm" property="tipoBusqueda" value="descripcion">
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
                            <td class="CformNombre" height="20" width="100">
                              Sigla:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="entidadBuscar" />
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformAreaBotones" height="21" id="Busqueda">
                        <div align="right">
                          <html:submit property="btnSubmit" styleClass="CformBoton" onclick="limpiarDatosE()" value="Buscar" />
                        </div>
                      </td>
                    </tr>
                  </logic:equal>

                  <logic:equal name="cEntidadActionForm" property="tipoBusqueda" value="collection">
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
                            <td class="CformNombre" height="20" width="100">
                              Sigla:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select disabled="false" property="entidadSeleccionada">
                                <html:options collection="comboEntidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformAreaBotones" height="21" id="Busqueda">
                        <div align="right">
                          <html:submit property="btnSubmit" styleClass="CformBoton" value="Elegir" />
                        </div>
                      </td>
                    </tr>
                  </logic:equal>
                  <tr>
                    <td>
                      <!-- Esto se muestra solo cuando se carga la página -->
                      <table width="100%">
                        <tr>
                          <td class="CformNombre">
                            Denominación:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="denominacion" styleClass="CformTextDisabled" maxlength="60" size="60" disabled="true" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Cuit/Cuil:&nbsp;
                          </td>
                          <td class="CformDato" colspan="3">
                            <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                            <html:text property="cuitPrefijo" maxlength="2" size="2" disabled="true" onkeypress="validarNumero()" />
                            -
                            <html:text property="cuitNumero" maxlength="8" size="9" disabled="true" onkeypress="validarNumero()" />
                            -
                            <html:text property="cuitSufijo" maxlength="1" size="1" disabled="true" onkeypress="validarNumero()" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            Domicilio:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:textarea rows="3" disabled="true" property="domicilio" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            País:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="paisDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Provincia:
                            <span class="dato_obligatorio">(2)</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="provinciaDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Partido:
                            <span class="dato_obligatorio">(2)</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="partidoDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Localidad:
                            <span class="dato_obligatorio">(2)</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="localidadDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">
                            E-Mail:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="mail" styleClass="CformTextDisabled" disabled="true" maxlength="60" size="60" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Teléfono:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:text property="telefono" styleClass="CformTextDisabled" disabled="true" maxlength="50" size="60" />
                          </td>
                        </tr>
                          <tr>
                            <td class="CformNombre">
                              Observaciones:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea styleId="observaciones" property="observaciones" disabled="true" styleClass="CformTextDisabled" />
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
                <span class="dato_obligatorio">* Datos obligatorios</span>
                <div align="right">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </div>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                Los datos que vienen de TRAMIX no pueden ser modificados desde SVT.
              </td>
            </tr>
            <tr>
              <td>
                <span class="dato_obligatorio">(2)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </logic:equal>

  <logic:equal property="accion" value="seleccionarOrg" name="cEntidadActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="cEntidadAltaAction.do?accion=entidad" onClick="return confirmaPerdidaEntidad(this)">Entidad</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('datos', this)" id="tab1">Datos</a>
              </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <div id="datos">
          <table class="tablaMin" align="center" >
            <tr>
              <td class="CformAreaBotones" width="100%">
                <div align="center">
                  <a href="cEntidadAltaAction.do?accion=entidad"></a>
                  <!--Esto se cambio a button para que pueda desabilitar el ir para atras-->
                  <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irTabInicial()"/>
                  <input type="button" class="CformBotonTranspBorde" value="<" onclick="irTabAnterior()"/>
                  <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">

                  <!-- ----------------------------------------------------------------------------------- -->

                  <logic:equal name="cEntidadActionForm" property="tipoBusqueda" value="descripcion">
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
                            <td class="CformNombre" height="20" width="100">
                              Sigla/Denominación:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="entidadBuscar" />
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformAreaBotones" height="21" id="Busqueda">
                        <div align="right">
                          <html:submit property="btnSubmit" styleClass="CformBoton" onclick="limpiarDatosE()" value="Buscar" />
                        </div>
                      </td>
                    </tr>
                  </logic:equal>

                  <logic:equal name="cEntidadActionForm" property="tipoBusqueda" value="collection">
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
                            <td class="CformNombre" height="20" width="100">
                              Sigla/Denominación:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select disabled="false" property="entidadSeleccionada">
                                <html:options collection="comboEntidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformAreaBotones" height="21" id="Busqueda">
                        <div align="right">
                          <html:submit property="btnSubmit" styleClass="CformBoton" value="Elegir" />
                        </div>
                      </td>
                    </tr>
                  </logic:equal>

                  <tr>
                    <td>
                      <table width="100%">
                        <tr bgcolor="#DDEEFF">
                          <td>
                            <strong>ORGANISMO</strong>
                          </td>
                        </tr>
                      </table>
                      <!-- Esto se muestra solo cuando se carga la página -->

                      
                        <table width="100%" cellpadding="2" cellspacing="2">
                          <tr>
                            <td class="CformNombre">
                              Sigla:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_descripcionSigla" disabled="true" property="descripcionSigla" maxlength="30" size="60" styleClass="CformTextDisabled" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Denominación:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_denominacion"  disabled="true" property="denominacion" maxlength="150" size="60" styleClass="CformTextDisabled" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
                              Cuit/Cuil:&nbsp;
                            </td>
                            <td class="CformDato" colspan="3">
                              <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                              <html:text styleId="per_cuitPrefijo" disabled="true" property="cuitPrefijo" maxlength="2" size="2" onkeypress="validarNumero()" styleClass="CformTextDisabled" />
                              -
                              <html:text styleId="per_cuitNumero" disabled="true" property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()" styleClass="CformTextDisabled" />
                              -
                              <html:text styleId="per_cuitNumero" disabled="true" property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()" styleClass="CformTextDisabled" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Domicilio:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea styleId="per_domicilio" rows="3" disabled="true" property="domicilio" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
                              País:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPais" disabled="true" property="pais" >
                                <html:options collection="comboPais" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                        
                        
                          <tr>
                            <td class="CformNombre" width="120">
                              Provincia:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvincia" disabled="true" property="provincia" >
                                <html:options collection="comboProvincia" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
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
                            <td class="CformNombre" width="120">
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
                            <logic:equal name="cEntidadActionForm" property="tipo" value="3">
                              <td class="CformNombre">
                                E-Mail:
                                <span class="dato_obligatorio">*</span>
                              </td>
                            </logic:equal>
                            <logic:notEqual name="cEntidadActionForm" property="tipo" value="3">
                              <td class="CformNombre">
                                E-Mail:&nbsp;
                              </td>
                            </logic:notEqual>
                            <td class="CformDato">
                              <html:text styleId="per_mail"  disabled="true" property="mail" maxlength="50" size="60" styleClass="CformTextDisabled" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
                              Teléfono:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_telefono" disabled="true" property="telefono" maxlength="50" size="60" styleClass="CformTextDisabled" />
                            </td>
                          </tr>
                             <logic:notEqual name="cEntidadActionForm" property="bloquearObservaciones" value="si">
                          <tr>
                            <td class="CformNombre">
                              Observaciones:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea property="observaciones" />
                            </td>
                          </tr>
                        </logic:notEqual>
                        <logic:equal name="cEntidadActionForm" property="bloquearObservaciones" value="si">
                          <tr>
                            <td class="CformNombre">
                              Observaciones:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea styleId="observaciones" property="observaciones" disabled="true" styleClass="CformTextDisabled" />
                            </td>
                          </tr>
                        </logic:equal>
                          
                        </table>
                     


                      <!-- Esta parte se muestra una vez que el usuario realizo un búsqueda -->
                      <!-- Bloquear datos es NO y es para organismos nuevas-->
                      
                      
                      <!-- 
                      <logic:notEqual name="cEntidadActionForm" property="bloquearDatos" value="si">
                        <table width="100%" cellpadding="2" cellspacing="2">
                          <tr>
                            <td class="CformNombre">
                              Sigla:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="descripcionSigla" maxlength="30" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Denominación:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="denominacion" maxlength="150" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
                              Cuit/Cuil:&nbsp;
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
                            <td class="CformNombre" width="120">
                              País:
                              <span class="dato_obligatorio">*</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPais" disabled="false" property="pais" >
                                <html:options collection="comboPais" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
                              Provincia:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboProvincia" disabled="false" property="provincia" >
                                <html:options collection="comboProvincia" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
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
                            <td class="CformNombre" width="120">
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
                            <logic:equal value="3" name="cEntidadActionForm" property="tipo">
                              <td class="CformNombre">
                                E-Mail:
                                <span class="dato_obligatorio">*</span>
                              </td>
                            </logic:equal>
                            <logic:notEqual value="3" name="cEntidadActionForm" property="tipo">
                              <td class="CformNombre">
                                E-Mail:&nbsp;
                              </td>
                            </logic:notEqual>
                            <td class="CformDato">
                              <html:text property="mail" maxlength="50" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="120">
                              Teléfono:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="telefono" maxlength="50" size="60" />
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
                      </logic:notEqual>
						-->
                      <!-- ----------------------------------------------------------------------------------- -->
                </table>
              </td>
            </tr>
            <tr>
              <td class="CformAreaBotones" height="35">
                <span class="dato_obligatorio"> * Datos obligatorios</span>
                <div align="right">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </div>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <span class="dato_obligatorio">(2)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </logic:equal>

  <logic:equal property="accion" value="seleccionarPersona" name="cEntidadActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" cellpadding="0" cellspacing="0"  >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="cEntidadAltaAction.do?accion=entidad" onClick="return confirmaPerdidaEntidad(this)">Entidad</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('datos', this)" id="tab1">Datos</a>
              </li>
              
            </ul>
          </td>
        </tr>
      </table>
      <div>
        <div id="datos">
          <table class="tablaMin"  align="center" >
            <tr>
              <td class="CformAreaBotones" width="100%">
                <div align="center">
                  <a href="cEntidadAltaAction.do?accion=entidad"></a>
                  <!--Esto se cambio a button para que pueda desabilitar el ir para atras-->
                  <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irTabInicial()"/>
                  <input type="button" class="CformBotonTranspBorde" value="<" onclick="irTabAnterior()"/>
                  <capplication:isApplication application="SVT">
                    <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()"/>
                    <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()"/>
                  </capplication:isApplication>
                  <capplication:isApplication application="SVTP">
                    <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabAnterior()"/>
                    <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabAnterior()"/>
                  </capplication:isApplication>
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                  <logic:equal name="cEntidadActionForm" property="tipoBusqueda" value="descripcion">
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
                            <td class="CformNombre" height="20" width="100">
                              Apellido:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="entidadBuscar" />
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformAreaBotones" height="21" id="Busqueda">
                        <div align="right">
                          <html:submit property="btnSubmit" styleClass="CformBoton" onclick="limpiarDatosE()" value="Buscar" />
                        </div>
                      </td>
                    </tr>
                  </logic:equal>

                  <logic:equal name="cEntidadActionForm" property="tipoBusqueda" value="collection">
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
                            <td class="CformNombre" height="20" width="100">
                              Apellido:&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select disabled="false" property="entidadSeleccionada">
                                <html:options collection="comboEntidad" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformAreaBotones" height="21" id="Busqueda">
                        <div align="right">
                          <html:submit property="btnSubmit" styleClass="CformBoton" value="Elegir" />
                        </div>
                      </td>
                    </tr>
                  </logic:equal>
                  <tr>
                    <td>
                      <table width="100%">
                        <tr bgcolor="#DDEEFF">
                          <td>
                            <strong>PERSONA</strong>
                          </td>
                        </tr>
                      </table>
                      <!-- Esto se muestra solo cuando se carga la página -->
<!-- 
                      <logic:equal name="cEntidadActionForm" property="bloquearDatos" value="si">
                        <table width="100%">
                          <tr>
                            <td class="CformNombre">
                              Apellido:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="apellido" styleClass="CformTextDisabled" maxlength="60" size="60" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Nombre:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="nombre" styleClass="CformTextDisabled" maxlength="60" size="60" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Documento tipo:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select disabled="true" property="tipoDocumento">
                                <html:options collection="comboTipoDoc" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Documento Nro.:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="nroDocumento" styleClass="CformTextDisabled" size="60" disabled="true" maxlength="8" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Cuit/Cuil:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato" colspan="3">
                              
                              <html:text property="cuitPrefijo" maxlength="2" size="2" disabled="true" onkeypress="validarNumero()" />
                              -
                              <html:text property="cuitNumero"  maxlength="8" size="9" disabled="true" onkeypress="validarNumero()" />
                              -
                              <html:text property="cuitSufijo"  maxlength="1" size="1" disabled="true" onkeypress="validarNumero()" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Domicilio:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea rows="3" property="domicilio" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              País:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="paisParticularDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Provincia:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="provinciaParticularDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="partidoParticularDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="localidadParticularDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Código Postal:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="codigoPostal" styleClass="CformTextDisabled" maxlength="8" size="60" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              E-Mail:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="mail" styleClass="CformTextDisabled" disabled="true" maxlength="60" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Teléfono:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="telefono" styleClass="CformTextDisabled" disabled="true" maxlength="50" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Lugar de Trabajo:
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              País:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text property="paisDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Provincia:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="provinciaDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Partido:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="partidoDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Localidad:
                              <span class="dato_obligatorio">(2)</span>
                            </td>
                            <td class="CformDato">
                              <html:text property="localidadDescripcion" maxlength="100" size="60" styleClass="CformTextDisabled" disabled="true" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Escalafón:
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
                              Categoría:
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                              <html:select disabled="true" property="categoria">
                                <html:options collection="comboCategoria" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <logic:notEqual name="cEntidadActionForm"
                            property="bloquearObservaciones" value="si">
                            <tr>
                              <td class="CformNombre">
                                Observaciones:&nbsp;&nbsp;&nbsp;
                              </td>
                              <td class="CformDato">
                                <html:textarea property="observaciones" />
                              </td>
                            </tr>
                          </logic:notEqual>
                          <logic:equal name="cEntidadActionForm" property="bloquearObservaciones" value="si">
                            <tr>
                              <td class="CformNombre">
                                Observaciones:&nbsp;&nbsp;&nbsp;
                              </td>
                              <td class="CformDato">
                                <html:textarea property="observaciones" disabled="true" styleClass="CformTextDisabled" />
                              </td>
                            </tr>
                          </logic:equal>
                        </table>
                      </logic:equal>
                      
-->                      
                      
                      <!-- Esta parte se muestra una vez que el usuario realizo un búsqueda -->
                      <!-- Bloquear datos es NO y es para personas nuevas-->
                      
                        <table width="100%">
                          <tr>
                            <td class="CformNombre">
                              Apellido:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text  styleId="per_apellido" property="apellido" maxlength="60" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Nombre:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text  styleId="per_nombre" property="nombre" maxlength="60" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Documento tipo:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="per_tipo_doc" disabled="false" property="tipoDocumento">
                                <html:options collection="comboTipoDoc" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" onkeypress="validarNumero()">
                              Documento Nro.:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text  styleId="per_nroDocumento" property="nroDocumento" onchange="validarNumero()" maxlength="8" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Cuit/Cuil:<span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato" colspan="3">
                              <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                              <html:text styleId="per_cuitPrefijo"  property="cuitPrefijo" maxlength="2" size="2" onkeypress="validarNumero()" />
                              -
                              <html:text styleId="per_cuitNumero"  property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()" />
                              -
                              <html:text styleId="per_cuitsufijo"  property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Domicilio:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea rows="3" styleId="per_documento"  property="domicilio" />
                            </td>
                          </tr>
                          
                          
                         
                          
                          
                          
	                          <tr>
                            <td class="CformNombre">
                              País:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPaisParticular" disabled="false" property="paisParticular">
                                <html:options collection="comboPaisParticular" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
	                          <tr>
	                            <td class="CformNombre">
	                              Provincia:&nbsp;&nbsp;&nbsp;
	                            </td>
	                            <td class="CformDato">
	                              <html:select styleId="cboProvinciaParticular" disabled="false" property="provinciaParticular">
	                                <html:options collection="comboProvinciaParticular" property="value" labelProperty="label" />
	                              </html:select>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td class="CformNombre">
	                              Partido:&nbsp;&nbsp;&nbsp;
	                            </td>
	                            <td class="CformDato">
	                              <html:select styleId="cboPartidoParticular" disabled="false" property="partidoParticular">
	                                <html:options collection="comboPartidoParticular" property="value" labelProperty="label" />
	                              </html:select>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td class="CformNombre">
	                              Localidad:&nbsp;&nbsp;&nbsp;
	                            </td>
	                            <td class="CformDato">
	                              <html:select styleId="cboLocalidadParticular" disabled="false" property="localidadParticular">
	                                <html:options collection="comboLocalidadParticular" property="value" labelProperty="label" />
	                              </html:select>
	                            </td>
	                          </tr>
						
                          <tr>
                            <td class="CformNombre">
                              Código Postal:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_codigoPostal"  property="codigoPostal" maxlength="8" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              E-Mail:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_mail"  property="mail" maxlength="50" size="60" />
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Teléfono:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:text styleId="per_telefono" property="telefono" maxlength="50" size="60" />
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
									<label id="autoCompleteLugarDeTrabajoTexto"> 
										<bean:write name="cEntidadActionForm" property="lugarDeTrabajoDescripcion"/> 
									</label> 
									<a id="removeLugarDeTrabajo" href="#" onclick="removeBy('LugarDeTrabajo')"> 
										<img src="./imagenes/close.png" align="top"/> 
									</a>
								</div>
								<input type="text" name="autoCompleteLugarDeTrabajo" id="autoCompleteLugarDeTrabajo" width="200"/>
							</td>
						  </tr>
                          <tr>
                            <td class="CformNombre">
                              País:
                              <span class="dato_obligatorio">*</span>&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:select styleId="cboPais" disabled="false" property="pais" >
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
                              <html:select styleId="cboProvincia" disabled="false" property="provincia" >
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
                              Escalafón:
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
                              Categoría:
                              <span class="dato_obligatorio">(1)</span>
                            </td>
                            <td class="CformDato">
                              <html:select styleId="per_categoria" disabled="true" property="categoria">
                                <html:options collection="comboCategoria" property="value" labelProperty="label" />
                              </html:select>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre">
                              Observaciones:&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="CformDato">
                              <html:textarea styleId="observaciones"  property="observaciones"  disabled="true"/>
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
                <span class="dato_obligatorio">* Datos obligatorios</span>
                <div align="right">
                   <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                   <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </div>
              </td>
            </tr>
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
      </div>
    </div>
  </logic:equal>

  <logic:equal property="accion" value="seleccionarGrupo" name="cEntidadActionForm">
    <div class="tab-container" id="container">
      <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <ul class="tabs">
              <li>
                <a href="cEntidadAltaAction.do?accion=entidad" onClick="return confirmaPerdidaEntidad(this)">Entidad</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('datos', this)" id="tab1">Datos</a>
              </li>
              <li>
                <a href="#" onClick="return mostrarPanel('integrantes', this)" id="tab2">Integrantes</a>
              </li>
            </ul>
          </td>
        </tr>
      </table>
      <div>

        <div id="datos">
          <table class="tablaMin" align="center">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irTabInicial()"/>
                  <input type="button" class="CformBotonTranspBorde" value="<" onclick=" irTabAnterior()"/>
                  <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table align="center" cellpadding="0" cellspacing="0" width="100%">
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
                            Descripción:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="descripcionSigla" size="50" maxlength="80" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Domicilio:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:textarea rows="3" property="domicilio" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            País:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:select  styleId="cboPais" disabled="false" property="pais" >
                              <html:options collection="comboPais" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Provincia:
                            <span class="dato_obligatorio">(2)</span>
                          </td>
                          <td class="CformDato">
                            <html:select  styleId="cboProvincia" disabled="false" property="provincia" >
                              <html:options collection="comboProvincia" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Partido:
                            <span class="dato_obligatorio">(2)</span>
                          </td>
                          <td class="CformDato">
                            <html:select  styleId="cboPartido" disabled="false" property="partido">
                              <html:options collection="comboPartido" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Localidad:
                            <span class="dato_obligatorio">(2)</span>
                          </td>
                          <td class="CformDato">
                            <html:select  styleId="cboLocalidad" disabled="false" property="localidad">
                              <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            E-Mail:
                            <span class="dato_obligatorio">*</span>
                          </td>
                          <td class="CformDato">
                            <html:text property="mail" maxlength="50" size="50" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
                            Teléfono:&nbsp;
                          </td>
                          <td class="CformDato">
                            <html:text property="telefono" maxlength="50" size="50" />
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">
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
                  <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </div>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <span class="dato_obligatorio">(2)</span> Si el país es Argentina, se requerirá Provincia, Partido y Localidad.
              </td>
            </tr>
          </table>
        </div>

        <div id="integrantes">
          <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cEntidadActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cEntidadActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cEntidadActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cEntidadActionForm" onclick="irTabFinal()" />
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
                      Integrantes:<span class="dato_obligatorio">*</span>
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="asignados" name="cEntidadActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadActionForm.asignados" style="width: 100%" decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                        <display:column property="indice" title="#" headerClass="tableCellHeader" />
                        <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="150" style="width: 230px;" />
                        <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                        <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                        <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
                        <display:column property="esJefe" title="Responsable" headerClass="tableCellHeader" />
                      </display:table>
                     </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="asignados" name="cEntidadActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionaron Integrantes.&nbsp;
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
                      <span class="dato_obligatorio"> * Datos obligatorios</span>
                      <div align="right">
                        <html:submit property="btnSubmit" value="Agregar Integrantes" styleClass="CformBoton" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
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
