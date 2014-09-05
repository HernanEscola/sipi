<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Detalle de la Persona</h1>
<html:form action="cPersonaDetalleAction.do" method="POST">
<html:hidden property="entidadTipo" name="cPersonaDetalleActionForm"/>
<!-- Cuando el Tipo es 1 es del Tipo Persona -->
<logic:equal property="entidadTipo" value="persona" name="cPersonaDetalleActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
 <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;Persona
    </td>
  </tr>
  <logic:equal value="E" property="estado" name="cPersonaDetalleActionForm">
    <tr>
      <td align="center">
        <b class="CformDetalleRojo">Esta Persona se encuentra Eliminada</b>
      </td>
    </tr>
  </logic:equal>
  <tr>
    <td>
	<logic:equal value="S" name="cPersonaDetalleActionForm" property="visualizarFichaCompleta">


      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td>
             <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="107">Apellido:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="apellido"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" >Nombre:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="nombre"/>
                </td>
                <td width="10"></td>
              </tr>
              <tr>
                <td class="CformNombre" >Documento tipo:</td>
                <td class="CformDato">
                  <html:select disabled="true" property="documentoTipo">
                    <html:options collection="comboTipoDoc" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
               <tr>
                <td class="CformNombre" >Documento Nro.:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="documentoNro"/>
                </td>
                <td width="10"></td>
              </tr>
              <tr>
                <td class="CformNombre" >Cuit:</td>
                <td class="CformDato" >
                  <!--  <html:text property="cuit"/></td-->
                  <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                  <bean:write name="cPersonaDetalleActionForm" property="cuitPrefijo" />
                  <html:hidden property="cuitPrefijo"/>-
                  <bean:write name="cPersonaDetalleActionForm" property="cuitNumero"/>
                  <html:hidden property="cuitNumero"/>-
                  <bean:write name="cPersonaDetalleActionForm" property="cuitSufijo"/>
                  <html:hidden property="cuitSufijo"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="107">Domicilio:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="domicilio"/>
                  <html:hidden property="domicilio"/>
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">País:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="paisParticularDescripcion"/>
                </td>
              </tr>

              <tr>
                 <td class="CformNombre">Provincia:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="provinciaParticularDescripcion"/>
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">Partido: </td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="partidoParticularDescripcion"/>
    
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">Localidad:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="localidadParticularDescripcion"/>
    
                </td>
              </tr>
              <tr>
                <td class="CformNombre" >Código Postal:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="codigoPostal"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" >E-Mail:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="mail"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" >Teléfono:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="telefono"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Lugar de trabajo:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="lugarTrabajoDescrip"/>
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">País:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="paisDescripcion"/>
                </td>
              </tr>

              <tr>
                 <td class="CformNombre">Provincia:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="provinciaDescripcion"/>
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">Partido: </td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="partidoDescripcion"/>
    
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">Localidad:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="localidadDescripcion"/>
    
                </td>
              </tr>
              
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
                  <bean:write name="cPersonaDetalleActionForm" property="observaciones"/>
                </td>
              </tr>
             </table>
          </td>
          <td width="10" rowspan="100"></td>
        </tr>
      </table>
    </logic:equal>
    
    

	<logic:notEqual value="S" name="cPersonaDetalleActionForm" property="visualizarFichaCompleta">


      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td>
             <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="107">Apellido:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="apellido"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" >Nombre:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="nombre"/>
                </td>
                <td width="10"></td>
              </tr>
              <tr>
                <td class="CformNombre">Lugar de trabajo:</td>
                <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="lugarTrabajoDescrip"/>
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">País:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="paisDescripcion"/>
                </td>
              </tr>

              <tr>
                 <td class="CformNombre">Provincia:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="provinciaDescripcion"/>
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">Partido: </td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="partidoDescripcion"/>
    
                </td>
              </tr>
              <tr>
                 <td class="CformNombre">Localidad:</td>
                 <td class="CformDato">
                  <bean:write name="cPersonaDetalleActionForm" property="localidadDescripcion"/>
    
                </td>
              </tr>
              
             </table>
          </td>
          <td width="10" rowspan="100"></td>
        </tr>
      </table>
    </logic:notEqual>
    
    
    
    
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>
</table>
</logic:equal>
</html:form>
