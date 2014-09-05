<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<script>
window.onload=function(){
setupPanes("container", document.cUvtAltaActionForm.cambiaPanel.value);
}

function setFoco(){
	x=event.keyCode
	//alert(x)
	if((x==13)){ // enter
		window.event.returnValue = false
	}
}


function irA(obj){
document.cUvtAltaActionForm.cambiaPanel.value=obj;
setupPanes("container", document.cUvtAltaActionForm.cambiaPanel.value);
}


function pedirConfirmacion(){
  input_box=confirm("Se perderán los datos no grabados, ¿desea continuar?");
  if (input_box==false){
	window.event.returnValue = false
  }
}
</script>
<br>
<h1 align=" center" class="titulo">Registro de UVT</h1>
<html:form action="cUvtAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="cambiaPanel"/>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
     <tr>
      <td>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
          <tr>
             <td>
	             <table width="100%" cellpadding="2" cellspacing="2">
	                <tr bgcolor="#BFDFFF">
	                  <td><strong>
	                    UVT
	                    </strong>
	                  </td>
	                </tr>
                </table>
            	  <table width="100%" cellpadding="2" cellspacing="2">
	            	  <tr>
	                    <td class="CformNombre" width="180">
	                       Tipo:
	                    </td>
	                    <td class="CformDato">
	                    	<html:select property="tipoUvt" styleId="tipoUvt" disabled="true">
	                        	<html:options collection="comboTipoUvt" property="value" labelProperty="label"  />
	                      	</html:select>
	                    </td>
	                  </tr>
	                <tr>
	                
                    <td class="CformNombre" width="180">Depende de: </td>
                    <td class="CformDato" colspan="3">
                         <html:select property="central" disabled="true" >
                           <html:options collection="comboCentralesYDelegaciones" property="value" labelProperty="label"  />
                         </html:select>
                    </td>
                  </tr>
	                <tr>
                    <td class="CformNombre" width="180">Sigla:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="sigla"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Denominaci&oacute;n:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cUvtAltaActionForm" property="descripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Cuit:</td>
                    <td class="CformDato" colspan="3">
                    <!--  <html:text property="cuit"/></td-->
                    <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                      <bean:write name="cUvtAltaActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo"/>-
                      <bean:write name="cUvtAltaActionForm" property="cuitNumero"/>
                      <html:hidden property="cuitNumero"/>-
                      <bean:write name="cUvtAltaActionForm" property="cuitSufijo"/>
                      <html:hidden property="cuitSufijo"/>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Nro. Delegación:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="numeroSucursal"/></td>
                  </tr>
                   <tr>
                    <td class="CformNombre" width="180">Situación Iva: </td>
                    <td class="CformDato" colspan="3">
                         <html:select property="iva" disabled="true" >
                           <html:options collection="comboIva" property="value" labelProperty="label"  />
                         </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Alícuota:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="alicuota"/>%</td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail Oficial:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="email"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Web:</td>
                    <td class="CformDato" colspan="3">
                    <html:textarea rows="4" cols="60" disabled="disabled" readonly="true" property="web"/>
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>
                      Domicilio
                    </strong>
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Domicilio Legal:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">Dirección:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="domicilioLegal"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Provincia:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="provinciaDomicilioLegal" disabled="true">
                        <html:options collection="comboProvinciaDomicilioLegal" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Partido:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="partidoDomicilioLegal" disabled="true">
                        <html:options collection="comboPartidoDomicilioLegal" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Localidad:</td>
                    <td class="CformDato" colspan="3">
                     <html:select property="localidadDomicilioLegal" disabled="true">
                        <html:options collection="comboLocalidadDomicilioLegal" property="value" labelProperty="label"/>
                      </html:select>
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Domicilio Administrativo:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">Dirección:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="domicilio"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Provincia:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="provincia" disabled="true">
                        <html:options collection="comboProvinciaG" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Partido:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="partido" disabled="true">
                        <html:options collection="comboPartido" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Localidad:</td>
                    <td class="CformDato" colspan="3">
                     <html:select property="localidad" disabled="true">
                        <html:options collection="comboLocalidadG" property="value" labelProperty="label"/>
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">C&oacute;digo Postal:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="codPostal"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Casilla de Correo:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="casillaCorreo"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Tel&eacute;fono 1:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="telefono"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Tel&eacute;fono 2:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="telefono2"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Tel&eacute;fono 3:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="telefono3"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fax:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="fax"/></td>
                  </tr>
                   <tr>
                    <td class="CformNombre" width="180">E-Mail 1:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="email1"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail 2:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="email2"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail 3:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="email3"/></td>
                  </tr>
                </table> 
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>
                      Contacto
                    </strong></td>
                  </tr>
                </table> 
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Presidente:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
				            <td colspan="10">
				              <display:table name="sessionScope.cUvtAltaActionForm.director" style="width:100%" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
				                <display:column property="descripcion" title="Apellido, Nombre" headerClass="tableCellHeader" style="width: 500px;" />
				                <display:column property="mail" title="E-mail" headerClass="tableCellHeader" style="width: 90px;" />
				              </display:table>
				            </td>
				          </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Contacto Gerencial:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">Apellido:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="gerenciaApellido"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Nombre:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="gerenciaNombre"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Cargo:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="gerenciaCargo"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="gerenciaMail"/></td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Contacto Administrativo:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">Apellido:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="administracionApellido"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Nombre:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="administracionNombre"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Cargo:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="administracionCargo"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="administracionMail"/></td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>
                     Seguimiento
                    </strong></td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Convenio de Trabajo:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">
                           Se firmó Convenio de Trabajo:
                    </td>
                    <td class="CformDato">
                             Sí
                             <html:radio property="firmaConvenioLaboral" value="S" disabled="true" />
                             No
                             <html:radio property="firmaConvenioLaboral" value="N" disabled="true" />
                           <html:hidden property="firmaConvenioLaboral" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Responsable:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="responsableConvenioLaboral"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fecha:</td>
                    <logic:equal property="firmaConvenioLaboral" value="S" name="cUvtAltaActionForm">
                    <td class="CformDato" colspan="3">
                    <bean:write name="cUvtAltaActionForm" property="convenioLaboralFecha"/>
                    </td>
                    </logic:equal>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Responsable:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="responsableConvenioLaboral"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Resolución Tipo:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="tipoResolucionConvenioLaboral" disabled="true">
                        <html:options collection="comboTipoResolucionConvenioLaboral" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Número:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="numeroConvenioLaboral"/></td>
                  </tr>
                </table>
					       <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Convenio Marco:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">
                           Se firmó Convenio Marco:
                    </td>
                    <td class="CformDato">
                             Sí
                             <html:radio property="firmaConvenioMarco" value="S" disabled="true" />
                             No
                             <html:radio property="firmaConvenioMarco" value="N" disabled="true" />
                           <html:hidden property="firmaConvenioMarco" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Responsable:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="responsableConvenioMarco"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fecha:</td>
                    <logic:equal property="firmaConvenioMarco" value="S" name="cUvtAltaActionForm">
                    <td class="CformDato" colspan="3">
                    <bean:write name="cUvtAltaActionForm" property="convenioMarcoFecha"/>
                    </td>
                    </logic:equal>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Responsable:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="responsableConvenioMarco"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Resolución Tipo:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="tipoResolucionConvenioLaboral" disabled="true">
                        <html:options collection="comboTipoResolucionConvenioMarco" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Número:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cUvtAltaActionForm" property="numeroConvenioMarco"/></td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Web:
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
	                <tr>
	                   <td class="CformNombre" width="180">
	                        Publicación Web:
	                   </td>
	                   <td class="CformDato">
	                            Sí
	                            <html:radio property="publicar" value="S" disabled="true" />
	                            No
	                            <html:radio property="publicar" value="N" disabled="true" />
	                          <html:hidden property="publicar" />
	                   </td>
	                 </tr>
                </table>
				<table width="100%">
					<tr>
						<td class="CformAreaBotones">
							<div align="right">
						      <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
						      <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
						      <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
						    </div>
						</td>
					</tr>
				</table>
		      </table>
            </td>
          </tr>
          
        </table>
      
</html:form>
