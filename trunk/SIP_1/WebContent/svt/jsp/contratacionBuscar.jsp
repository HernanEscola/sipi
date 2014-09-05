<%@include file="layout/include.jsp"%>

<br>
<h1 align=" center" class="titulo">Búsqueda de Contrataciones</h1>

<html:form action="cContratacionBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Contratación</td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
            <table width="100%" cellpadding="2" cellspacing="2">
                <tr>
               		<td class="CformNombre" width="140">Código:</td>
	                <td class="CformDato"><html:text property="codigo"  maxlength="20" size="20"/></td>
              	</tr>
              
              <tr>
                <td class="CformNombre" width="140">Clasificación:</td>
                <td class="CformDato">
                  <html:text name="cContratacionBuscarActionForm" property="clasificacionBusqueda"/>
                </td>
                <td class="CformNombre" width="100">Tipo:</td>
                <td class="CformDato">
                  <html:select disabled="false" property="tipoBusqueda">
                    <html:options name="cContratacionBuscarActionForm" collection="comboTipoContratacion" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>

              <tr>
                <td class="CformNombre" width="140">Responsable Técnico:</td>
                <td class="CformDato">
                  <html:text name="cContratacionBuscarActionForm" property="responsableTecnicoBusqueda"/>
                </td>
                <td class="CformNombre" width="100">Contacto:</td>
                <td class="CformDato">
                  <html:text name="cContratacionBuscarActionForm" property="contactoBusqueda"/>
                </td>

              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" >
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
      </div>
    </td>
  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table align="center" width="600">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Resultados de la Búsqueda</td>
          </tr>
          <tr>
            <td colspan="10">
              <display:table id="contratacionBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cContratacionBuscarActionForm.resultados"  requestURI="cContratacionBuscarAction.do"  decorator="conicet.apps.svt.web.instrumento.decorator.CContratacionDisplayWrapper">
                <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
                <display:column sortName="srt_codigo" property="codigo" title="Cód." headerClass="tableCellHeader" sortable="true" />
                <display:column sortName="srt_clasificacion" property="clasificacion" title="Clasificación" maxLength="25" headerClass="tableCellHeader" sortable="true" />
                <display:column sortName="srt_tipo" property="tipo" title="Tipo" maxLength="25" headerClass="tableCellHeader" sortable="true" />
                <display:column sortName="srt_tipoContacto" property="tipoContacto" title="Tipo Contacto" headerClass="tableCellHeader" sortable="true"  />
                <display:column sortName="srt_contacto" property="contacto" title="Contacto" headerClass="tableCellHeader" sortable="true"  />
                <display:column sortName="srt_responsableTecnico" property="responsableTecnico" title="Responsable" headerClass="tableCellHeader" sortable="true"  maxLength="120" style="width: 150px;"/>
                <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.instrumento.decorator.CContratacionDisplayWrapper" />
                <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.instrumento.decorator.CContratacionDisplayWrapper" />
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" class="headTabla" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
</table>
</html:form>
