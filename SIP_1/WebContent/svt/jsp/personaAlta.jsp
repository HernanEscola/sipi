<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script type="text/javascript"   src="./js/generalScript.js"></script>

<script>
window.onload=function(){	
	generarCombos("cPersonaAltaAction.do","","<%=CConstantes.paisArgentina%>");
	generarCombos("cPersonaAltaAction.do","Particular","<%=CConstantes.paisArgentina%>");

	prepararBusqueda("LugarDeTrabajo");	
	
	habilitarProvinciaPartidoLocalidad();

}

function prepararBusqueda(tipo) {

	var conicetGeneral = new ConicetGeneral();

	conicetGeneral.autocomplete({
		idInput      		: 	"autoComplete"+ tipo,
		url          		:	'cPersonaAltaAction.do?btnSubmit=autoComplete' + tipo ,
		onSelectFunction 	: 	function(item) {
									$("#"+ tipo + "Seleccionado").attr("value", item.data.id);
									$("#autoComplete" + tipo + "Texto").text(item.data.nombre);
									intercambiar(tipo);
								},
		valueDefault 		: 	"",
		formatItem   		: 	function(item) {
									return item.nombre;
								}
	});
	
	$('#autoComplete' + tipo).show().css("width", "388px")
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

function limpiarDatos(){
    document.cPersonaActionForm.nombre.value = "";
    document.cPersonaActionForm.apellido.value = "";
    document.cPersonaActionForm.tipoDocumento.value = "-1";
    document.cPersonaActionForm.nroDocumento.value = "";
    document.cPersonaActionForm.provincia.value = "-1";
    document.cPersonaActionForm.partido.value = "-1";
    document.cPersonaActionForm.localidad.value = "-1";
    document.cPersonaActionForm.codigoPostal.value = "";
    document.cPersonaActionForm.mail.value = "";
    document.cPersonaActionForm.telefono.value = "";
    document.cPersonaActionForm.lugarTrabajo.value = "";
    document.cPersonaActionForm.escalafon.value = "";
    document.cPersonaActionForm.categoria.value = "";

}




function setFocus(){
  document.getElementById('Busqueda').focus()
}

function prepararComboProvincias(){
	document.cPersonaActionForm.action = 'cPersonaAltaAction.do?btnSubmit=prepararComboProvincias';
	document.cPersonaActionForm.submit();
}


function prepararComboPartidos(){
	document.cPersonaActionForm.action = 'cPersonaAltaAction.do?btnSubmit=prepararComboPartidos';
	document.cPersonaActionForm.submit();
}

function prepararComboLocalidades(){
	document.cPersonaActionForm.action = 'cPersonaAltaAction.do?btnSubmit=prepararComboLocalidades';
	document.cPersonaActionForm.submit();
}

function prepararComboPProvincias(){
	document.cPersonaActionForm.action = 'cPersonaAltaAction.do?btnSubmit=prepararComboProvinciasParticular';
	document.cPersonaActionForm.submit();
}



function prepararComboPPartidos(){
	document.cPersonaActionForm.action = 'cPersonaAltaAction.do?btnSubmit=prepararComboPartidosParticular';
	document.cPersonaActionForm.submit();


}

function prepararComboPLocalidades(){
	document.cPersonaActionForm.action = 'cPersonaAltaAction.do?btnSubmit=prepararComboLocalidadesParticular';
	document.cPersonaActionForm.submit();
}

function habilitarProvinciaPartidoLocalidad() {

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
		if ($('#cboPaisParticular').val() != "01") {
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



</script>

<br>
<h1 align="center" class="titulo">Registro de Persona</h1>
<html:form action="cPersonaAltaAction.do" method="POST">

<html:hidden property="accion"/>
<html:hidden property="esPersonaGlobal"/>
<html:hidden property="cambiaPanel"/>


<logic:equal property="accion" value="seleccionarPersona" name="cPersonaActionForm">
      <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table align="center" cellpadding="0" cellspacing="0" width="100%">

              <logic:equal name="cPersonaActionForm" property="tipoBusqueda" value="descripcion">

	              <tr>
        	        <td>
                	  <table width="100%" cellpadding="2" cellspacing="2">
	                    <tr>
        	              <td class="CformNombre" width="100">Tipo:&nbsp;</td>
                	      <td class="CformDato">
                        	<html:select disabled="true" property="tipo">
	                          <html:options collection="comboTipoEntidad" property="value" labelProperty="label"/>
        	                </html:select>
                	      </td>
	                    </tr>
        	            <tr>
                	      <td class="CformNombre" height="20" width="100">Apellido:&nbsp;</td>
	                      <td class="CformDato"><html:text property="entidadBuscar"/></td>
        	            </tr>
                	  </table>
	                </td>
	             </tr>

	             <tr>
        	        <td class="CformAreaBotones" height="21" id="Busqueda">
                	    <div align="right">
	                       <html:submit property="btnSubmit" styleClass="CformBoton" onclick="limpiarDatosE()" value="Buscar"/>
        	            </div>
	                </td>
        	    </tr>
		</logic:equal>

              <logic:equal name="cPersonaActionForm" property="tipoBusqueda" value="collection">
	              <tr>
        	        <td>
                	  <table width="100%" cellpadding="2" cellspacing="2">
	                    <tr>
        	              <td class="CformNombre" width="100">Tipo:&nbsp;</td>
                	      <td class="CformDato">
                        	<html:select disabled="true" property="tipo">
	                          <html:options collection="comboTipoEntidad" property="value" labelProperty="label"/>
        	                </html:select>
                	      </td>
	                    </tr>
        	            <tr>
                	      <td class="CformNombre" height="20" width="100">Apellido:&nbsp;</td>
	                      <td class="CformDato">
                                <html:select disabled="false" property="entidadSeleccionada" >
	                         <html:options collection="comboEntidad" property="value" labelProperty="label"/>
  	       	                 </html:select>
                              </td>
        	            </tr>
                	  </table>
	                </td>
	             </tr>
	             <tr>
        	        <td class="CformAreaBotones" height="21" id="Busqueda">
                	    <div align="right">
	                       <html:submit property="btnSubmit" styleClass="CformBoton" value="Elegir"/>
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
                  <!-- Esto se muestra solo cuando se carga la página y cuando eS NUEVO-->

                <logic:equal name="cPersonaActionForm" property="esPersonaGlobal" value="si">
                  <table width="100%" >

                    <tr>
                      <td class="CformNombre">Apellido:<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato">
                        <html:text property="apellido" styleClass="CformTextDisabled" maxlength="60" size="60" disabled="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">Nombre:<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato">
                        <html:text property="nombre" styleClass="CformTextDisabled" maxlength="60" size="60" disabled="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">Documento tipo:<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato">
                        <html:select disabled="true" property="tipoDocumento">
                          <html:options collection="comboTipoDoc" property="value" labelProperty="label"/>
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">Documento Nro.:<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato">
                        <html:text property="nroDocumento" styleClass="CformTextDisabled" size="60" disabled="true" maxlength="8"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="120">Cuit/Cuil:<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato" colspan="3">
                        <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                        <html:text property="cuitPrefijo" maxlength="2" size="2" disabled="true" onkeypress="validarNumero()"/> -
                        <html:text property="cuitNumero" maxlength="8" size="9" disabled="true" onkeypress="validarNumero()"/> -
                        <html:text property="cuitSufijo" maxlength="1" size="1" disabled="true" onkeypress="validarNumero()"/>
                      </td>
                    </tr>
                    <tr>
                          <td class="CformNombre">Domicilio:&nbsp;</td>
                          <td class="CformDato">
                            <html:textarea rows="2" property="domicilio" disabled="true"/>
                          </td>
                    </tr>
                  <tr>
                   <td class="CformNombre" width="120">País:&nbsp;</td>
                   <td class="CformDato">
                     <html:text property="paisParticularDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
                   </td>
                  </tr>

                  <tr>
                   <td class="CformNombre" width="120">Provincia:&nbsp;</td>
                   <td class="CformDato">
                     <html:text property="provinciaParticularDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
                   </td>
                  </tr>
                  <tr>
                   <td class="CformNombre" width="120">Partido:&nbsp;</td>
                   <td class="CformDato">
                     <html:text property="partidoParticularDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
                   </td>
                  </tr>

                  <tr>
                   <td class="CformNombre" width="120">Localidad:&nbsp;</td>
                   <td class="CformDato">
                     <html:text property="localidadParticularDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
                   </td>
                  </tr>
                    <tr>
                      <td class="CformNombre">Código Postal:&nbsp;</td>
                      <td class="CformDato">
                        <html:text property="codigoPostal" styleClass="CformTextDisabled" maxlength="8" size="60" disabled="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">E-Mail:<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato">
                        <html:text property="mail" styleClass="CformTextDisabled" disabled="true" maxlength="60" size="60"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="120">Teléfono:&nbsp;</td>
                      <td class="CformDato">
                        <html:text property="telefono" styleClass="CformTextDisabled" disabled="true" maxlength="50" size="60"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">Lugar de Trabajo:&nbsp;</td>
                      <!-- td class="CformDato">
                       <html:textarea rows="3" disabled="true" property="lugarTrabajoDescrip"/>
                      </td-->
                        <td class="CformDato">
							<html:text property="lugarDeTrabajoDescripcion" styleClass="CformTextDisabled" disabled="true" maxlength="50" size="60"/>
						</td>
                    </tr>
                    <tr>
	                   <td class="CformNombre" width="120">País:<span class="dato_obligatorio">*</span></td>
	                   <td class="CformDato">
	                     <html:text property="paisDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
	                   </td>
	                </tr>
                    
                    <tr>
	                   <td class="CformNombre" width="120">Provincia:<span class="dato_obligatorio">*</span></td>
	                   <td class="CformDato">
	                     <html:text property="provinciaDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
	                   </td>
	                </tr>
	                <tr>
	                   <td class="CformNombre" width="120">Partido:<span class="dato_obligatorio">*</span></td>
	                   <td class="CformDato">
	                     <html:text property="partidoDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
	                   </td>
	                  </tr>

                    <tr>
	                   <td class="CformNombre" width="120">Localidad:<span class="dato_obligatorio">*</span></td>
        	           <td class="CformDato">
	                     <html:text property="localidadParticularDescripcion" maxlength="60" size="60" styleClass="CformTextDisabled" disabled="true"/>
                	   </td>
 	               	</tr>
                    
                    
                    <tr>
                      <td class="CformNombre">Escalafón:&nbsp;</td>
                      <td class="CformDato">
                        <html:select disabled="true" property="escalafon">
                         <html:options collection="comboEscalafon" property="value" labelProperty="label"/>
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">Categoría:&nbsp;</td>
                		<td class="CformDato">
                        <html:select disabled="true" property="categoria">
                         <html:options collection="comboCategoria" property="value" labelProperty="label"/>
                        </html:select>
                		</td>
                    </tr>
                <logic:notEqual name="cPersonaActionForm" property="bloquearObservaciones" value="si">
                    <tr>
                      <td class="CformNombre">Observaciones:&nbsp;</td>
                      <td class="CformDato">
                        <html:textarea property="observaciones"/>
                      </td>
                    </tr>
                </logic:notEqual >
                <logic:equal name="cPersonaActionForm" property="bloquearObservaciones" value="si">
        	            <tr>
                	      <td class="CformNombre">Observaciones:&nbsp;</td>
	                      <td class="CformDato">
        	                <html:textarea property="observaciones" disabled="true" styleClass="CformTextDisabled"/>
                	      </td>
	                    </tr>
        	 </logic:equal >


		</table>
                </logic:equal>

                  <!-- Es ta parte se muestra una vez que el usuario realizo un búsqueda -->
                <logic:notEqual name="cPersonaActionForm" property="esPersonaGlobal" value="si">
                  <table width="100%" >

                        <tr>
                          <td class="CformNombre" width="120">Apellido:<span class="dato_obligatorio">*</span></td>
                          <td class="CformDato">
                            <html:text property="apellido" maxlength="60" size="60"/>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">Nombre:<span class="dato_obligatorio">*</span></td>
                          <td class="CformDato">
                            <html:text property="nombre" maxlength="60" size="60"/>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre">Documento tipo:<span class="dato_obligatorio">*</span></td>
                          <td class="CformDato">
                            <html:select disabled="false" property="tipoDocumento">
                              <html:options collection="comboTipoDoc" property="value" labelProperty="label"/>
                            </html:select>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" onkeypress="validarNumero()" >Documento Nro.:<span class="dato_obligatorio">*</span></td>
                          <td class="CformDato">
                            <html:text property="nroDocumento" onchange="validarNumero()" maxlength="8" size="60"/>
                          </td>
                        </tr>
                        <tr>
                          <td class="CformNombre" width="120">Cuit/Cuil:<span class="dato_obligatorio">*</span></td>
                          <td class="CformDato" colspan="3">
                          <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                            <html:text property="cuitPrefijo" maxlength="2" size="2"  onkeypress="validarNumero()"/> -
                            <html:text property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()"/> -
                            <html:text property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()"/>
                          </td>
			</tr>


                        <tr>
                          <td class="CformNombre">Domicilio:&nbsp;</td>
                          <td class="CformDato">
                            <html:textarea property="domicilio" />
                          </td>
                       </tr>
	                  <tr>
	                   <td class="CformNombre" width="120">País:</td>
	                   <td class="CformDato">
	                       <html:select styleId="cboPaisParticular" disabled="false" property="paisParticular">
	                         <html:options collection="comboPaisParticular" property="value" labelProperty="label" />
	                       </html:select>
	                   </td>
                   </tr>

	                  <tr>
	                   <td class="CformNombre" width="120">Provincia:</td>
	                   <td class="CformDato">
	                       <html:select styleId="cboProvinciaParticular" disabled="false" property="provinciaParticular">
	                         <html:options collection="comboProvinciaParticular" property="value" labelProperty="label" />
	                       </html:select>
	                   </td>
                   </tr>
                   <tr>
	                   <td class="CformNombre" width="120">Partido:</td>
	                   <td class="CformDato">
	                       <html:select styleId="cboPartidoParticular" disabled="false" property="partidoParticular">
	                         <html:options collection="comboPartidoParticular" property="value" labelProperty="label" />
	                       </html:select>
	                   </td>
                   </tr>

                    <tr>
	                   <td class="CformNombre" width="120">Localidad:</td>
        	           <td class="CformDato">
	                      <html:select styleId="cboLocalidadParticular" disabled="false" property="localidadParticular">
	                        <html:options collection="comboLocalidadParticular" property="value" labelProperty="label" />
	                      </html:select>
                	   </td>
 	               	</tr>
                    <tr>
                          <td class="CformNombre">Código Postal:&nbsp;</td>
                          <td class="CformDato">
                            <html:text property="codigoPostal" maxlength="8" size="60"/>
                          </td>
                    </tr>

                    <tr>
                          <td class="CformNombre">E-Mail:<span class="dato_obligatorio">*</span></td>
                          <td class="CformDato">
                            <html:text property="mail" maxlength="50" size="60"/>
                          </td>
                    </tr>
                    <tr>
                          <td class="CformNombre" width="120">Teléfono:&nbsp;</td>
                          <td class="CformDato">
                            <html:text property="telefono" maxlength="50" size="60"/>
                          </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">Lugar de Trabajo:&nbsp;</td>
                      <td class="CformDato">
                      		<html:hidden property="lugarDeTrabajoSeleccionado" styleId="LugarDeTrabajoSeleccionado" />
							<div id="autoCompleteLugarDeTrabajoDescripcion" style='display: inline-block;'>
								<label id="autoCompleteLugarDeTrabajoTexto">
									<bean:write name="cPersonaActionForm" property="lugarDeTrabajoDescripcion" /> 
								</label> 
								<a id="removeLugarDeTrabajo" href="#" onclick="removeBy('LugarDeTrabajo')">
									<img src="./imagenes/close.png" align="top"/>
								</a>
							</div>
							<input type="text" name="autoCompleteLugarDeTrabajo" id="autoCompleteLugarDeTrabajo" width="200" />
                      </td>

                    </tr>
                    <tr>
	                   <td class="CformNombre" width="120">País:<span class="dato_obligatorio">*</span></td>
	                   <td class="CformDato">
	                     <html:select styleId="cboPais" disabled="false" property="pais" >
                           <html:options collection="comboPais" property="value" labelProperty="label" />
                         </html:select>
	                   </td>
	                </tr>

                    <tr>
	                   <td class="CformNombre" width="120">Provincia:<span class="dato_obligatorio">(2)</span></td>
	                   <td class="CformDato">
	                       <html:select styleId="cboProvincia" disabled="false" property="provincia" >
	                         <html:options collection="comboProvincia" property="value" labelProperty="label" />
	                       </html:select>
	                   </td>
	                </tr>
	                <tr>
	                   <td class="CformNombre" width="120">Partido:<span class="dato_obligatorio">(2)</span></td>
	                   <td class="CformDato">
	                       <html:select styleId="cboPartido" disabled="false" property="partido">
	                         <html:options collection="comboPartido" property="value" labelProperty="label" />
	                       </html:select>
	                   </td>
	                </tr>
                    <tr>
	                   <td class="CformNombre" width="120">Localidad:<span class="dato_obligatorio">(2)</span></td>
        	           <td class="CformDato">
	                       <html:select styleId="cboLocalidad" disabled="false" property="localidad">
	                         <html:options collection="comboLocalidad" property="value" labelProperty="label" />
	                       </html:select>
                	   </td>
 	               	</tr>
                    
                    <tr>
                      <td class="CformNombre">Escalafón:&nbsp;</td>
                      <td class="CformDato">
                        <html:select disabled="true" property="escalafon">
                         <html:options collection="comboEscalafon" property="value" labelProperty="label"/>
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre">Categoría:&nbsp;</td>
	                <td class="CformDato">
                          <html:select disabled="true" property="categoria">
                           <html:options collection="comboCategoria" property="value" labelProperty="label"/>
                          </html:select>
        	        </td>
                    </tr>
                       <tr>
                        <td class="CformNombre">Observaciones:&nbsp;</td>
                        <td class="CformDato">
                          <html:textarea property="observaciones"/>
                        </td>
                       </tr>
                </table>
                </logic:notEqual>

                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="CformAreaBotones" height="35"><span class="dato_obligatorio">  * Datos obligatorios</span>
            <div align="right">
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
	      <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
            </div>
          </td>
        </tr>
      </table>
     <table  align="center" cellpadding="0" cellspacing="0" width="550">
          <tr>
  		<td >
		      Los datos que vienen de TRAMIX no pueden ser modificados desde SVT
	      </td>
         </tr>
    </table>
</logic:equal>

<logic:equal property="accion" value="altaCfm" name="cPersonaActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="500">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Persona </td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td>
             <table width="100%" cellpadding="2" cellspacing="2">
               <tr>
                 <td class="CformNombre" width="120">Tipo:</td>
                 <td class="CformDato">
                   <html:select disabled="true" property="tipo">
                     <html:options collection="comboTipoEntidad" property="value" labelProperty="label"/>
                   </html:select>
                 </td>
               </tr>
              <tr>
                <td class="CformNombre">Apellido:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaActionForm" property="apellido"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Nombre:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaActionForm" property="nombre"/>
                </td>
                <td width="10"></td>
              </tr>
              <tr>
                <td class="CformNombre">Documento tipo:</td>
                <td class="CformDato">
                  <html:select disabled="true" property="tipoDocumento">
                    <html:options collection="comboTipoDoc" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Documento Nro.:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaActionForm" property="nroDocumento"/>
                </td>
                <td width="10"></td>
              </tr>
              <tr>
                <td class="CformNombre">Cuit:</td>
                <td class="CformDato"  colspan="3">
                <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                <bean:write name="cPersonaActionForm" property="cuitPrefijo" />
                <html:hidden property="cuitPrefijo"/>-
                <bean:write name="cPersonaActionForm" property="cuitNumero"/>
                <html:hidden property="cuitNumero"/>-
                <bean:write name="cPersonaActionForm" property="cuitSufijo"/>
                <html:hidden property="cuitSufijo"/>
                </td>
              </tr>

              <tr>
                <td class="CformNombre">Domicilio:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaActionForm" property="domicilio"/>
                </td>
                <td width="10"></td>
              </tr>

              <logic:equal name="cPersonaActionForm" property="esPersonaGlobal" value="si">
	                  <tr>
	                   <td class="CformNombre" width="120">País:&nbsp;</td>
	                   <td class="CformDato">
		                  <bean:write name="cPersonaActionForm" property="paisParticularDescripcion"/>
	                   </td>
	                  </tr>

	                  <tr>
	                   <td class="CformNombre" width="120">Provincia:&nbsp;</td>
	                   <td class="CformDato">
		                  <bean:write name="cPersonaActionForm" property="provinciaParticularDescripcion"/>
	                   </td>
	                  </tr>
	                  <tr>
	                   <td class="CformNombre" width="120">Partido:&nbsp;</td>
	                   <td class="CformDato">
	                     <bean:write name="cPersonaActionForm" property="partidoParticularDescripcion"/>
	                   </td>
	                  </tr>
	
	                  <tr>
	                   <td class="CformNombre" width="120">Localidad:&nbsp;</td>
	                   <td class="CformDato">
	                      <bean:write name="cPersonaActionForm" property="localidadParticularDescripcion"/>
	                   </td>
	                  </tr>
 			  </logic:equal>

              <logic:notEqual name="cPersonaActionForm" property="esPersonaGlobal" value="si">
		               <tr>
		                   <td class="CformNombre" >País:&nbsp;</td>
		       	           <td class="CformDato">
		                	     <html:select disabled="true" property="paisParticular">
			                       <html:options collection="cboPaisParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		               	   </td>
				       </tr>

		               <tr>
		                   <td class="CformNombre" >Provincia:&nbsp;</td>
		       	           <td class="CformDato">
		                	     <html:select disabled="true" property="provinciaParticular">
			                       <html:options collection="cboProvinciaParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		               	   </td>
				       </tr>
		               <tr>
		                   <td class="CformNombre" >Partido:&nbsp;</td>
		       	           <td class="CformDato">
		                	     <html:select disabled="true" property="partidoParticular">
			                       <html:options collection="cboPartidoParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		               	   </td>
				       </tr>
		               <tr>
		                   <td class="CformNombre" >Localidad:&nbsp;</td>
		       	           <td class="CformDato">
		                	     <html:select disabled="true" property="localidadParticular">
			                       <html:options collection="cboLocalidadParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		               	   </td>
				       </tr>
				</logic:notEqual>
	            <tr>
	                <td class="CformNombre">Código Postal:</td>
	                <td class="CformDato">
	                  <bean:write name="cPersonaActionForm" property="codigoPostal"/>
	                </td>
	            </tr>
	            <tr>
	                <td class="CformNombre">E-Mail:</td>
	                <td class="CformDato">
	                  <bean:write name="cPersonaActionForm" property="mail"/>
	                </td>
	            </tr>
	            <tr>
	                <td class="CformNombre">Teléfono:</td>
	                <td class="CformDato">
	                  <bean:write name="cPersonaActionForm" property="telefono" />
	                </td>
	            </tr>
	            <tr>
	                <td class="CformNombre">Lugar de trabajo:</td>
	                <td class="CformDato">
	                  <bean:write name="cPersonaActionForm" property="lugarTrabajoDescrip" />
	                </td>
	            </tr>
	
	            <logic:equal name="cPersonaActionForm" property="esPersonaGlobal" value="si">
	                    <tr>
		                   <td class="CformNombre" width="120">País:</td>
		                   <td class="CformDato">
			                  <bean:write name="cPersonaActionForm" property="paisDescripcion" />
		                   </td>
		                </tr>

	                    <tr>
		                   <td class="CformNombre" width="120">Provincia:</td>
		                   <td class="CformDato">
			                  <bean:write name="cPersonaActionForm" property="provinciaDescripcion" />
		                   </td>
		                </tr>
		                <tr>
		                   <td class="CformNombre" width="120">Partido:</td>
		                   <td class="CformDato">
	                  		<bean:write name="cPersonaActionForm" property="partidoDescripcion" />
		                   </td>
	                    </tr>
	                    <tr>
		                   <td class="CformNombre" width="120">Localidad:</td>
	        	           <td class="CformDato">
	                  		<bean:write name="cPersonaActionForm" property="localidadParticularDescripcion" />
	                	   </td>
	 	               	</tr>
				</logic:equal>                    
              	<logic:notEqual name="cPersonaActionForm" property="esPersonaGlobal" value="si">
		              <tr>
			                   <td class="CformNombre" width="120">País:</td>
			                   <td class="CformDato">
			                     <html:select disabled="true" property="pais" >
			                       <html:options collection="cboPais" property="value" labelProperty="label"/>
			                     </html:select>
			                   </td>
			          </tr>

		              <tr>
			                   <td class="CformNombre" width="120">Provincia:</td>
			                   <td class="CformDato">
			                     <html:select disabled="true" property="provincia" >
			                       <html:options collection="cboProvincia" property="value" labelProperty="label"/>
			                     </html:select>
			                   </td>
			          </tr>
			          <tr>
			                   <td class="CformNombre" width="120">Partido:</td>
			                   <td class="CformDato">
			                     <html:select disabled="true" property="partido">
			                       <html:options collection="cboPartido" property="value" labelProperty="label"/>
			                     </html:select>
			                   </td>
			          </tr>
		
		               <tr>
			                   <td class="CformNombre" width="120">Localidad:</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="localidad">
			                       <html:options collection="cboLocalidad" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
		 	           </tr>
				</logic:notEqual>              
                <tr>
	                <td class="CformNombre">Escalafón:</td>
	                 <td class="CformDato">
	                        <html:select disabled="true" property="escalafon">
	                         <html:options collection="comboEscalafon" property="value" labelProperty="label"/>
	                        </html:select>
	                 </td>
	            </tr>
	            <tr>
	                <td class="CformNombre">Categoría:</td>
	                <td class="CformDato">
	                        <html:select disabled="true" property="categoria">
	                         <html:options collection="comboCategoria" property="value" labelProperty="label"/>
	                        </html:select>
	                </td>
	            </tr>
	            <tr>
	                         <td class="CformNombre">Observaciones:</td>
	                         <td class="CformDato">
		                  <bean:write name="cPersonaActionForm" property="observaciones"/>
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
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
      </div>
    </td>
  </tr>
</table>
</logic:equal>


</html:form>
