<%@include file="layout/include.jsp"%>
<script>
</script>
<br>
<h1 align=" center" class="titulo">Registro de  Entidad</h1>

<html:form action="cEntidadAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="bloquearDatos" />
<logic:equal property="accion" value="altaCfm" name="cEntidadActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Entidad</td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td>
            <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="100">Tipo:</td>
                <td class="CformDato">
                  <html:select disabled="true" property="tipo">
                    <html:options collection="comboTipoEntidad" property="value" labelProperty="label"/>
                  </html:select>
                  <html:hidden property="tipo"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Sigla:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="descripcionSigla"/>
                  <html:hidden property="descripcionSigla"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Denominaci�n:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="denominacion"/>
                  <html:hidden property="denominacion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Cuit:</td>
                <td class="CformDato"  colspan="3">
                <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                <bean:write name="cEntidadActionForm" property="cuitPrefijo" />
                <html:hidden property="cuitPrefijo"/>-
                <bean:write name="cEntidadActionForm" property="cuitNumero"/>
                <html:hidden property="cuitNumero"/>-
                <bean:write name="cEntidadActionForm" property="cuitSufijo"/>
                <html:hidden property="cuitSufijo"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Domicilio:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="domicilio"/>
                  <html:hidden property="domicilio"/>
                </td>
              </tr>
              
            <logic:equal value="4" property="tipo" name="cEntidadActionForm">
	              
	              <tr>
	                <td class="CformNombre" width="100">Pa�s:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="paisDescripcion"/>
	                  
	                </td>
	              </tr>
	              
	              <tr>
	                <td class="CformNombre" width="100">Provincia:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="provinciaDescripcion"/>
	                  
	                </td>
	              </tr>
                  <tr>
	                <td class="CformNombre" width="100">Partido:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="partidoDescripcion"/>
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="100">Localidad:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="localidadDescripcion"/>
	                </td>
	              </tr>
            
            
            </logic:equal>  
            <logic:notEqual value="4" property="tipo" name="cEntidadActionForm">
	            <logic:equal value="si" property="bloquearDatos" name="cEntidadActionForm">
	              <tr>
	                <td class="CformNombre" width="100">Pa�s:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="paisDescripcion"/>
	                  
	                </td>
	              </tr>
	              
	              <tr>
	                <td class="CformNombre" width="100">Provincia:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="provinciaDescripcion"/>
	                  
	                </td>
	              </tr>
                  <tr>
	                <td class="CformNombre" width="100">Partido:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="partidoDescripcion"/>
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="100">Localidad:</td>
	                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="localidadDescripcion"/>
	                </td>
	              </tr>
	              </logic:equal>
				  <logic:notEqual value="si" property="bloquearDatos" name="cEntidadActionForm">
	              <tr>
	                <td class="CformNombre" width="100">Pa�s:</td>
	                <td class="CformDato">
	                  <html:select disabled="true" property="pais">
	                    <html:options collection="comboPais" property="value" labelProperty="label"/>
	                  </html:select>
	                  <html:hidden property="pais"/>
	                </td>
	              </tr>

	              <tr>
	                <td class="CformNombre" width="100">Provincia:</td>
	                <td class="CformDato">
	                  <html:select disabled="true" property="provincia">
	                    <html:options collection="comboProvincia" property="value" labelProperty="label"/>
	                  </html:select>
	                  <html:hidden property="provincia"/>
	                </td>
	              </tr>
	                            <tr>
	                <td class="CformNombre" width="100">Partido:</td>
	                <td class="CformDato">
	                  <html:select disabled="true" property="partido">
	                    <html:options collection="comboPartido" property="value" labelProperty="label"/>
	                  </html:select>
	                  <html:hidden property="partido"/>
	                </td>
	              </tr>
	              <tr>
	                <td class="CformNombre" width="100">Localidad:</td>
	                <td class="CformDato">
	                  <html:select disabled="true" property="localidad">
	                    <html:options collection="comboLocalidad" property="value" labelProperty="label"/>
	                  </html:select>
	                  <html:hidden property="localidad"/>
	                </td>
	              </tr>
	              </logic:notEqual>
              </logic:notEqual>
              <tr>
                <td class="CformNombre" width="100">E-Mail:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="mail"/>

                  <html:hidden property="mail"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="100">Tel�fono:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="telefono" />
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Observaciones:</td>
                <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="observaciones"/>
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
</table>
</logic:equal>
</html:form>
