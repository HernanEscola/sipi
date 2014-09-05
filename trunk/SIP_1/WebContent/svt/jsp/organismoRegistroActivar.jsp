<%@include file="layout/include.jsp"%>
<!--Se cambia el título de la Jsp por Tipo de Imputación-->
<br>

<logic:equal property="estado" value="N" name="cOrganismoRegistroActivarActionForm">
<h1 align="center" class="titulo">Deshabilitar Organismo de Registro</h1>
</logic:equal>

<logic:equal property="estado" value="I" name="cOrganismoRegistroActivarActionForm">
<h1 align="center" class="titulo">Habilitar Organismos de Registro</h1>
</logic:equal>


<html:form action="cOrganismoRegistroActivarAction.do" method="POST">
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
            <bean:write name="cOrganismoRegistroActivarActionForm" property="descripcion"/>
            
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="220">Sigla:</td>
          <td class="CformDato">
            <bean:write name="cOrganismoRegistroActivarActionForm" property="sigla"/>
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
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
       </div>
    </td>
  </tr>
</table>

</html:form>
