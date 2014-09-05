<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Modificaci&oacute;n de Organismo de Registro </h1>
<html:form action="cOrganismoRegistroModificarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="modificar" name="cOrganismoRegistroModificarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#DDEEFF">
        <td><strong>Organismo de Registro</strong></td>
        </tr>
      </table>

      <table width="100%">
        <tr><td height="10" colspan="0"></td></tr>
        <tr>
          <td class="CformNombre">Descripción:<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
            <html:text property="descripcion" maxlength="80" size="50" />
          </td>
        </tr>
        <tr>
          <td class="CformNombre">Sigla:&nbsp;</td>
          <td class="CformDato">
            <html:text property="sigla"  maxlength="30" size="50"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">Tipo de Propiedad:<span class="dato_obligatorio">*</span></td>
			<logic:equal value="N" property="tipoPropiedadModificable" name="cOrganismoRegistroModificarActionForm">
	          <td class="CformDato">
	            <html:select disabled="true" property="tipoPropiedad" >
	              <html:options collection="comboTipoPropiedad" property="value"  labelProperty="label"/>
	            </html:select>
	          </td>
			</logic:equal>
			<logic:equal value="S" property="tipoPropiedadModificable" name="cOrganismoRegistroModificarActionForm" >
	          <td class="CformDato">
	            <html:select disabled="false" property="tipoPropiedad" >
	              <html:options collection="comboTipoPropiedad" property="value"  labelProperty="label"/>
	            </html:select>
	          </td>
			</logic:equal>
        </tr>
        <tr>
          <td class="CformNombre">País:<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
	            <html:select disabled="false" property="pais" >
	              <html:options collection="comboPais" property="value"  labelProperty="label"/>
	            </html:select>
          </td>
        </tr>
        
        
      <tr><td height="10" colspan="0"></td></tr>
      </table>

      <table width="100%">
        <tr>
          <td class="CformAreaBotones" height="35">
            <div align="left">
              <span class="dato_obligatorio">* Datos obligatorios </span>
              

            </div>
            
          
          </td>
          <td class="CformAreaBotones" height="35">
            <div align="right">
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table align="center" width="600">
	<tr>
		<td>
			 No podrá modificar Tipo de Propiedad si existen ofertas relacionadas
		</td>
	</tr>
</table>

</logic:equal>

<logic:equal property="accion" value="confirmar" name="cOrganismoRegistroModificarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr>
    <td>

      <table width="100%">
        <tr bgcolor="#DDEEFF">
        <td><strong>Organismo de Registro</strong></td>
        </tr>
      </table>

      <table width="100%">
        <tr><td height="10" colspan="0"></td></tr>
        <tr>
          <td class="CformNombre" width="220">Descripción:</td>
          <td class="CformDato">
            <bean:write name="cOrganismoRegistroModificarActionForm" property="descripcion"/>
            
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="220">Sigla:</td>
          <td class="CformDato">
            <bean:write name="cOrganismoRegistroModificarActionForm" property="sigla"/>
            
          </td>
        </tr>
         <tr>
           <td class="CformNombre" width="220">Tipo de Propiedad:</td>
           <td class="CformDato">
             <html:select disabled="true" property="tipoPropiedad">
               <html:options collection="comboTipoPropiedad" property="value" labelProperty="label"/>
             </html:select>
           </td>
         </tr>
        <tr>
          <td class="CformNombre">País:<span class="dato_obligatorio">*</span></td>
          <td class="CformDato">
            <html:select disabled="true" property="pais" >
              <html:options collection="comboPais" property="value"  labelProperty="label"/>
            </html:select>
          </td>
        </tr>
        
         <tr><td height="10" colspan="0"></td></tr>
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

