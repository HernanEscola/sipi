<%@include file="layout/include.jsp"%>

<br>
<h1 align=" center" class="titulo">Detalle de Contrataci&oacute;n de Stan</h1>

<html:form action="cContratacionStanDetalleAction.do" method="POST">
<html:hidden property="accion"/>

<logic:equal property="accion" value="detalle" name="cContratacionStanDetalleActionForm">
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Contrataci&oacute;n Stan</td>
  </tr>

  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="100"></td>
          <td>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="130">Responsable Técnico&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cContratacionStanDetalleActionForm" property="responsableTecnico"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Clasificación&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cContratacionStanDetalleActionForm" property="clasificacion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Tipo Contacto&nbsp;:</td>
                <td class="CformDato" >
                  <html:select disabled="true" property="tipoContacto" >
                    <html:options collection="comboTipoContacto" property="value" labelProperty="label" />
                  </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="130">Contacto&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cContratacionStanDetalleActionForm" property="contacto"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" align="center">Publicar:</td>
                <td class="CformDato" >
                  <html:checkbox  property="publicar" disabled="true" name="cContratacionStanDetalleActionForm"/>
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
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table align="center">
        <tr>
          <td colspan="10" width="600" align="center" class="headTabla">Contratantes</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cContratacionStanDetalleActionForm.contratantes" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteDisplayWrapper" style="width: 100%">
              <display:column property="indiceDetalle" title="#" headerClass="tableCellHeader" />
              <display:column property="tipoContratante" title="Tipo" headerClass="tableCellHeader" />
              <display:column property="nombreRazon" title="Nombre o Razón Social" headerClass="tableCellHeader" />
              <display:column property="cuit" title="cuit" headerClass="tableCellHeader" />
              <display:column property="pais" title="país" headerClass="tableCellHeader" />
              <display:column property="provincia" title="provincia" headerClass="tableCellHeader" />
            </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<logic:notEmpty property="instrumentos" name="cContratacionStanDetalleActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table align="center">
        <tr>
          <td colspan="10" width="600" align="center" class="headTabla">Instrumentos</td>
        </tr>
        <tr>
          <td colspan="10">
            <display:table name="sessionScope.cContratacionStanDetalleActionForm.instrumentos" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoListarDisplayWrapper" style="width: 100%">
              <display:column property="indice" title="#" headerClass="tableCellHeader" />
              <display:column property="descripcion" maxLength="30" title="Descripción" headerClass="tableCellHeader" />
              <display:column property="tipoOferta" title="Tipo Oferta" headerClass="tableCellHeader" />
              <display:column property="gestor" title="UVT" headerClass="tableCellHeader" />
              <display:column property="tipoEstado" title="Estado" headerClass="tableCellHeader" />
              <display:column property="cantidad" title="Cant." headerClass="tableCellHeader" />
            </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</logic:notEmpty>

</logic:equal>
</html:form>
