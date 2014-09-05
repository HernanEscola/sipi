<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<br>
<html:form action="cOfertaTecnologicaBuscarAction.do" method="POST">
  <logic:equal property="accion" value="formulario" name="cOfertaTecnologicaBuscarActionForm">
    <h1 align="center" class="titulo">
      Búsqueda de Oferta Tecnológica
    </h1>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td>
                <table width="100%" >
                  <tr>
                    <td class="CformNombre" width="107">
                      Código Oferta:
                    </td>
                    <td class="CformDato">
                      <html:text property="codigoIdB" maxlength="20" size="20" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Título:
                    </td>
                    <td class="CformDato">
                      <html:text property="descripcionB" maxlength="80" size="50" />
                    </td>
                    <td class="CformDato">
                      <html:checkbox property="incluirPC" name="cOfertaTecnologicaBuscarActionForm" />
                    </td>
                    <td align="left">
                      Incluir Palabras Claves en la búsqueda
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Tipo Oferta:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="tipoOfertaB">
                        <html:options collection="comboTipoOferta" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Estado:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="tipoEstadoB">
                        <html:options collection="comboTipoEstado" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Prestador/Titular:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="prestadorDescripcionB" maxlength="80" size="50" />
                    </td>
                    <td class="CformDato">
                      <html:checkbox property="incluirI" name="cOfertaTecnologicaBuscarActionForm" />
                    </td>
                    <td align="left">
                      Incluir integrantes/inventores en la búsqueda.
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Administrador:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="administrador" maxlength="80" size="50" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Búsqueda Avanzada" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>

  <logic:equal property="accion" value="formularioBAvanzada" name="cOfertaTecnologicaBuscarActionForm">
    <h1 align="center" class="titulo">
      Búsqueda Avanzada de Oferta Tecnológica
    </h1>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >

      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="107">
                      Código Oferta:
                    </td>
                    <td class="CformDato">
                      <html:text property="codigoIdB" maxlength="20" size="20" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Título:
                    </td>
                    <td class="CformDato">
                      <html:text property="descripcionB" maxlength="80" size="50" />
                    </td>
                    <td class="CformDato">
                      <html:checkbox property="incluirPC" name="cOfertaTecnologicaBuscarActionForm" />
                    </td>
                    <td align="left">
                      Incluir Palabras Claves en la búsqueda.
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Tipo Oferta:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="tipoOfertaB">
                        <html:options collection="comboTipoOferta" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Estado:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="tipoEstadoB">
                        <html:options collection="comboTipoEstado" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Prestador/Titular:
                    </td>
                    <td class="CformDato">
                      <html:text property="prestadorDescripcionB" maxlength="80" size="50" />
                    </td>
                    <td class="CformDato">
                      <html:checkbox property="incluirI" name="cOfertaTecnologicaBuscarActionForm" />
                    </td>
                    <td align="left">
                      Incluir integrantes/inventores en la búsqueda.
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Administrador:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="administrador" maxlength="80" size="50" />
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%" >
                  <!--tr><td colspan="10">&nbsp;</td></tr-->
                  <tr>
                    <td class="CformNombre" width="111">
                      &nbsp;Dis.Primaria:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="disciplinaPrimariaB">
                        <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <!--tr><td colspan="10">&nbsp;</td></tr-->
                  <tr>
                    <td class="CformNombre" width="111">
                      &nbsp;Dis.Desagregada:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="disciplinaDesagregadaB">
                        <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <!--tr><td colspan="10">&nbsp;</td></tr-->
                  <tr>
                    <td class="CformNombre" width="111">
                      Campo Aplicación:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="campoAplicacionB">
                        <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <!--tr><td colspan="10">&nbsp;</td></tr-->
                  <tr>
                    <td class="CformNombre" width="111">
                      &nbsp;Act.Industriales:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="clasificacionOnuB">
                        <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" style="width:450px"/>
                      </html:select>
                    </td>
                  </tr>
                  <!--tr><td colspan="10">&nbsp;</td></tr-->
                  <tr>
                    <td class="CformNombre" width="111">
                      &nbsp;Palabra Clave:
                    </td>
                    <td class="CformDato">
                      <html:text property="palabraClaveB" maxlength="10" size="55" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar" />
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>

  <logic:notEqual property="accion" value="formularioBAvanzada" name="cOfertaTecnologicaBuscarActionForm">
    <logic:equal property="accion" value="formularioAvanzada" name="cOfertaTecnologicaBuscarActionForm">
      <h1 align="center" class="titulo">
        Búsqueda Avanzada de Oferta Tecnológica
      </h1>
    </logic:equal>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >

      <tr>
        <td>
          <table align="center" width="100%">
            <thead>
              <!--logic:equal property="accion" value="formularioAvanzada" name="cOfertaTecnologicaBuscarActionForm"-->
              <tr>
                <td colspan="12" align="center" class="headTabla">
                  Criterios de la búsqueda:
                </td>
              </tr>
              <tr>
                <td>
                  <bean:write name="cOfertaTecnologicaBuscarActionForm" property="criterioBusqueda" />
                </td>
              <tr>
                <!-- /logic:equal-->
                <html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Configuración lista" />
              <tr>
                <td colspan="12" align="center" class="headTabla">
                  Resultados de la búsqueda:
                </td>
              </tr>
              <tr>
                <td colspan="12">
                  <display:table id="ofertaTecnoBuscarTabla" sort="external" style="width: 100%" class="displayTable" export="true" name="sessionScope.cOfertaTecnologicaBuscarActionForm.resultados" requestURI="cOfertaTecnologicaBuscarAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper">
                    <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                    <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" sortable="false" />
                    <display:column sortName="srt_id" property="id" title="Código" headerClass="tableCellHeader" media="html pdf excel" style="width: 40px;" sortable="true" />
                    <logic:iterate type="conicet.apps.svt.object.vistaListado.CVistaListado" id="dato" indexId="indice" property="colConfigurable" name="cOfertaTecnologicaBuscarActionForm">
                      <logic:equal value="descripcionOT" property="campoTabla" name="dato">
                        <logic:equal value="true" property="incluirPC" name="cOfertaTecnologicaBuscarActionForm">
                          <!-- Esta 2 veces cada uno de los displColumn porque uno muestra con "..." y el otro exporta a excell COMPLETO -->
                          <!-- A uno le saque el dato.getMaxLength(). Esto lo hice en las otras búsquedas de OT -->
                          <display:column media="html" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
                          <display:column media="excel pdf" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
                        </logic:equal>
                        <logic:notEqual value="true" property="incluirPC" name="cOfertaTecnologicaBuscarActionForm">
                          <display:column media="html" property="<%=dato.getCampoTabla()%>" title="Título" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
                          <display:column media="excel pdf" property="<%=dato.getCampoTabla()%>" title="Título" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
                        </logic:notEqual>
                      </logic:equal>
                      <logic:notEqual value="descripcionOT" property="campoTabla" name="dato">
                        <display:column media="html" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
                        <display:column media="excel pdf" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
                      </logic:notEqual>
                    </logic:iterate>
                    <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
                    <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper" />
                    <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper" />
                    <display:setProperty name="export.excel.filename" value="ListadoDeOfertasTecnologicas.xls" />
                    <display:setProperty name="export.pdf.filename" value="ListadoDeOfertasTecnologicas.pdf" />
                  </display:table>
                </td>
              </tr>
            </thead>
            <thead>
              <tr>
                <td colspan="12" class="headTabla" height="30">
                  <div align="right">
                    <logic:notEqual property="accion" value="formulario" name="cOfertaTecnologicaBuscarActionForm">
                      <html:submit property="btnSubmit" value="Nueva Búsqueda" styleClass="CformBoton" />
                    </logic:notEqual>
                    <jsp:include page="/jsp/layout/botones.jsp">
                      <jsp:param name="formulario" value="cOfertaTecnologicaBuscarActionForm" />
                      <jsp:param name="entidad" value="ot" />
                    </jsp:include> 
                    <!--html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/-->
                  </div>
                </td>
              </tr>
            </thead>
          </table>
          <logic:lessEqual value="-1" property="tipoOfertaB" name="cOfertaTecnologicaBuscarActionForm">
            <logic:notEmpty property="tiposDeOferta" name="cOfertaTecnologicaBuscarActionForm">
              <table align="center" width="100%" >
                <tr>
                  <td class="CformDato">
                    <logic:iterate id="elemento" name="cOfertaTecnologicaBuscarActionForm" property="tiposDeOferta">
                      <strong><bean:write name="elemento" property="descCorta" />:</strong>
                      <bean:write name="elemento" property="descripcion" /> -
			              </logic:iterate>
                  </td>
                </tr>
              </table>
            </logic:notEmpty>
          </logic:lessEqual>
        </td>
      </tr>
    </table>
  </logic:notEqual>
</html:form>
