<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css"
	media="screen, print" />
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<script language="JavaScript1.2" src="./js/comboPaisAjax.js?<resourceVersion:version
virtualPath='/js/comboPaisAjax.js'/>"></script>
<script language="JavaScript1.2" src="./js/contratante.js?<resourceVersion:version
virtualPath='/js/contratante.js'/>"></script>
<script language="JavaScript1.2" src="./js/tablaUtil.js?<resourceVersion:version
virtualPath='/js/tablaUtil.js'/>"></script>

<bean:define id="form" name="cContratanteActionForm" />
<bean:define id="actionPage" name="form" property="altaActionName" />

<br>
<h1 align="center" class="titulo">Registro de Contratante</h1>

<html:form action="cContratanteAltaAction.do" method="POST"
	enctype="multipart/form-data">
	<html:hidden property="accion" />
	<html:hidden property="esConsumidorFinal" />
	<html:hidden property="bloquearDatos" />
	<html:hidden property="tipoBusqueda" />
	<html:hidden property="cambiaPanel" />
	<html:hidden property="esNuevoContratante" />
	<html:hidden property="idBuscar" />
	<!-- 
Esta variable la uso en contratante.jsp en la confirmación para que muestre bien el combo 
ya hay casos en que se bloquea y la variable original no se popula 
-->
	<html:hidden styleId="seleccionadoComboCentral"
		property="seleccionadoComboCentral" />
	<html:hidden styleId="tab" property="seleccionadoComboCentral" />

	<logic:equal property="accion" value="alta"
		name="cContratanteActionForm">



		<script>

			solapas = new Array('tabDatos', 'tabContacto', 'tabDocumentacion');

			function setFoco() {
				x = event.keyCode
				if ((x == 13)) { // enter
					window.event.returnValue = false
				}
			}

			function irTabFinal() {
				document.cContratanteActionForm.cambiaPanel.value = solapas[solapas.length - 1];
				setupPanes("container",
						document.cContratanteActionForm.cambiaPanel.value);
			}

			function irTabInicial() {
				document.cContratanteActionForm.cambiaPanel.value = solapas[0];
				setupPanes("container",
						document.cContratanteActionForm.cambiaPanel.value);
			}

			function irTabAnterior() {
				var obj = document.cContratanteActionForm.cambiaPanel.value;
				for (i = 1; i < solapas.length; i++) {
					if ((solapas[i] == obj)) {
						document.cContratanteActionForm.cambiaPanel.value = solapas[i - 1];
						break;
					}
				}
				setupPanes("container",
						document.cContratanteActionForm.cambiaPanel.value);
			}

			function irTabSiguiente() {
				var obj = document.cContratanteActionForm.cambiaPanel.value;
				for (i = 0; i < (solapas.length - 1); i++) {
					if ((solapas[i] == obj)) {
						document.cContratanteActionForm.cambiaPanel.value = solapas[i + 1];
						break;
					}
				}
				setupPanes("container",
						document.cContratanteActionForm.cambiaPanel.value);
			}

			function mostrarPanel(obj1, obj2) {
				document.cContratanteActionForm.cambiaPanel.value = obj2.id;
				return showPane(obj1, obj2);
			}

			function irA(obj) {
				document.cContratanteActionForm.cambiaPanel.value = obj;
				setupPanes("container",
						document.cContratanteActionForm.cambiaPanel.value);

			}

			function setFocus() {
				document.getElementById('Busqueda').focus()
			}

			var categoriaIvaAnterior = "0";

			function hideForms() {
				var catIva = $("#tipoContratante").val();
				document.cContratanteActionForm.esNuevoContratante.value;

				if (catIva == "Seleccionar" || catIva == -1 || catIva == -2) {
					$("[id^=formBusqueda]").hide();
					$("[id^=formEmpresa]").hide();
					$("[id^=formConsumidorFinal]").hide();

				} else if (catIva == "Consumidor Final" || catIva == 0) {
					$("[id^=formEmpresa]").hide();
					$("[id^=formConsumidorFinal]").show();
					$("[id^=formBusqueda]").hide();
				} else {
					$("[id^=formConsumidorFinal]").hide();
					// si cambio de tipo y no es consumidor final debo mostrar en disabled
					$('#campos :input').attr('disabled', true);
					$('#campos :input').addClass('CformTextDisabled');
					$("[id^=formEmpresa]").show();
					$("[id^=formBusqueda]").show();

					irTabInicial();
				}

				// si cambio entre consumidor final y otro o viceversa limpio y actualizo la pantalla.
				if (categoriaIvaAnterior == 0 || catIva == 0) {
					if (document.cContratanteActionForm.tipoBusqueda != "nuevo") {
						document.cContratanteActionForm.accion.value = "limpiarPantalla"
					}

					document.cContratanteActionForm.submit();
				}
				//}

				// si cambio entre consumidor final y otro o viceversa limpio y actualizo la pantalla.

			}

			function hideTodo() {

				var catIva = $("#tipoContratante").val();

				if (catIva == "Seleccionar" || catIva == -1 || catIva == -2) {
					$("[id^=formBusqueda]").hide();
					$("[id^=formEmpresa]").hide();
					$("[id^=formConsumidorFinal]").hide();

				} else if (catIva == 0) {
					$("[id^=formEmpresa]").hide();
					$("[id^=formConsumidorFinal]").show();
					$("[id^=formBusqueda]").hide();
				} else {
					$("[id^=formConsumidorFinal]").hide();
					$("[id^=formEmpresa]").show();
					$("[id^=formBusqueda]").show();
				}

				categoriaIvaAnterior = $("#tipoContratante").val();

			}

			
			function prepararBusquedaCuit() {

				var conicetGeneral = new ConicetGeneral();

				conicetGeneral
						.autocomplete({
							idInput : "autoCompleteCuit",
							url : "cContratanteAltaAction.do?btnSubmit=autoCompleteCuit",
							onSelectFunction : function(data) {
								if (data.value != "-1" && data.value != "-2") {
									document.cContratanteActionForm.idBuscar.value = data.data.id;
									document.cContratanteActionForm.submit();
								}
							},
							valueDefault : "",
							formatItem : function(data) {
								if (data.nombreRazon != null
										&& data.nombreRazon.length > 1) {
									return data.nombre.substring(0, 2)
											+ "-"
											+ data.nombre.substring(2,
													data.nombre.length - 1)
											+ "-"
											+ data.nombre.substring(
													data.nombre.length - 1,
													data.nombre.length) + " / "
											+ data.nombreRazon;
								} else {
									return data.nombre;
								}
							}
						});
			}
			
			$(document).ready(function() { // TODO Refactorizar funcion
				var actionName = '<%=actionPage%>';
				
				
				generarCombos("cContratanteAltaAction.do",null,"<%=CConstantes.paisArgentina%>");
	          	generarCombos("cContratanteAltaAction.do","Adm","<%=CConstantes.paisArgentina%>");
	          	generarCombos("cContratanteAltaAction.do","Contacto","<%=CConstantes.paisArgentina%>");

				hideTodo();
				setupPanes("container", document.cContratanteActionForm.cambiaPanel.value);
				//document.cContratanteActionForm.cambiaPanel.value = "tabDatos";

				prepararBusquedaContratante(actionName);
				prepararBusquedaCuit();

				if (document.cContratanteActionForm.esNuevoContratante.value == "true") {
					$('#campos :input').removeAttr('disabled');
					$('#campos :input').removeClass('CformTextDisabled');
					//si hubo un error de datos obligatorios y se recarga la página esta llamada mantiene el bloqueo de campos.
					if ($("#tipoContratante").val() != 0) {
						cargarDatosDeCentralElegida();
						habilitarCuitCategoriaIva();
						botonCentralChange(false);
					}
					if(esContratanteOtro()) {
						documentReadyContratanteOtro(actionName);
					}
				} else {
					$('#campos :input').attr('disabled', true);
					$('#campos :input').addClass('CformTextDisabled');
					$("#botonBorrarOrganismo").hide();
				}

				if (document.cContratanteActionForm.tipoBusqueda.value == "nuevo" || 
					(document.cContratanteActionForm.tipoBusqueda.value == "select" && $('#tipoContratante').val() != 0)) {
					$("#tipoContratante").attr('disabled', true);
				} else {
					$("#tipoContratante").removeAttr('disabled');
				}

				$("#iva").find("option[value='4']").remove();

				habilitarProvinciaPartidoLocalidad("",true,"<%=CConstantes.paisArgentina%>");
				habilitarProvinciaPartidoLocalidad("Contacto",false,"<%=CConstantes.paisArgentina%>");
				habilitarProvinciaPartidoLocalidad("Adm",true,"<%=CConstantes.paisArgentina%>");
				$('#centralSeleccionada').change(
					function() {
						//con esto lo que hago es que me popule en la variable hidden lo que quedó,
						//sino, como el combo se deshabilitaba, no me hace el populate de la variable relacionada 
						//y queda lo viejo en la pantalla de confirmación
						$('#seleccionadoComboCentral').attr('value',$('#centralSeleccionada').val());
				});
				
				if (esContratanteOtro() &&  esMigrado() ){
					$('#campos :input').removeAttr('disabled');
					$('#campos :input').removeClass('CformTextDisabled');
					//si hubo un error de datos obligatorios y se recarga la página esta llamada mantiene el bloqueo de campos.
					documentReadyContratanteOtro(actionName);						
			}
				/*if(esContratanteOtro()) {
					documentReadyContratanteOtro(actionName);
				}*/
				

			});

			
			
		</script>


		<div class="tab-container" id="container">
			<table align="center" cellpadding="0" cellspacing="0"
				class="tablaMin">
				<tr>
					<td>
						<ul class="tabs">
							<li><a href="#" onClick="return mostrarPanel('datos', this)"
								id="tabDatos">Datos</a></li>
							<li id="formEmpresaTab"><a href="#"
								onClick="return mostrarPanel('contacto', this)" id="tabContacto">Contacto</a></li>
							<capplication:isApplication application="SVT">
								<li id="formEmpresaTab"><a href="#"
									onClick="return mostrarPanel('documentacion', this)"
									id="tabDocumentacion">Documentación</a></li>
							</capplication:isApplication>
						</ul>
					</td>
				</tr>
			</table>
			<div>
				<jsp:include page="/jsp/entidades/contratanteInput.jsp">
					<jsp:param name="contratanteForm" value="cContratanteActionForm" />
					<jsp:param name="showBtnLimpiar" value="si" />
					<jsp:param name="showBtnVolver" value="no" />
					<jsp:param name="isAlta" value="si" />
				</jsp:include>
			</div>
		</div>

	</logic:equal>

	<logic:equal property="accion" value="altaCfm"
		name="cContratanteActionForm">
		<jsp:include page="/jsp/entidades/contratanteView.jsp">
			<jsp:param name="contratanteForm" value="cContratanteActionForm" />
			<jsp:param name="pageName" value="contratanteCfm" />
		</jsp:include>
	</logic:equal>

</html:form>
