<%@include file="layout/include.jsp"%>
<script>
</script>

<br>
<html:form action="cPreOfertaTecnologicaBuscarAction.do" method="POST">

  <logic:equal property="accion" value="formulario" name="cPreOfertaTecnologicaBuscarActionForm">
    <h1 align="center" class="titulo">
      Búsqueda de Pre-Oferta Tecnológica
    </h1>

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="630">
      
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
                      Título/Prestación:
                    </td>
                    <td class="CformDato">
                      <html:text property="descripcionB" maxlength="80" size="50" />
                    </td>
                    <td class="CformDato">
                      <html:checkbox property="incluirPC" name="cPreOfertaTecnologicaBuscarActionForm" />
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
                      <html:select disabled="false" property="tipoOfertaB" onchange="habilitarCamposByOferta(this)">
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
                      <html:checkbox property="incluirI" name="cPreOfertaTecnologicaBuscarActionForm" />
                    </td>
                    <td align="left">
                      Incluir integrantes/inventores en la búsqueda
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="107">
                      Administrador:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="administradorB" maxlength="80" size="50" />
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
            <jsp:include page="/jsp/layout/botones.jsp">
                <jsp:param name="formulario" value="cPreOfertaTecnologicaBuscarActionForm" />
                <jsp:param name="entidad" value="pot" />
                <jsp:param name="posicion" value="0" />
            </jsp:include> 
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>

  <logic:equal property="accion" value="formularioBAvanzada" name="cPreOfertaTecnologicaBuscarActionForm">
    <h1 align="center" class="titulo">
      Búsqueda Avanzada de Oferta Tecnológica
    </h1>

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="630">

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
                      Título/Prestación:
                    </td>
                    <td class="CformDato">
                      <html:text property="descripcionB" maxlength="80" size="50" />
                    </td>
                    <td class="CformDato">
                      <html:checkbox property="incluirPC" name="cPreOfertaTecnologicaBuscarActionForm" />
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
                      <html:select disabled="false" property="tipoOfertaB" onchange="habilitarCamposByOferta(this)">
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
                      <html:checkbox property="incluirI" name="cPreOfertaTecnologicaBuscarActionForm" />
                    </td>
                    <td align="left">
                      Incluir integrantes/inventores en la búsqueda
                    </td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td>

                <table width="100%" cellpadding="0" cellspacing="0">


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
                        <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
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

  <logic:notEqual property="accion" value="formularioBAvanzada" name="cPreOfertaTecnologicaBuscarActionForm">
    <logic:equal property="accion" value="formularioAvanzada" name="cPreOfertaTecnologicaBuscarActionForm">
      <h1 align="center" class="titulo">
        Búsqueda Avanzada de Oferta Tecnológica
      </h1>
    </logic:equal>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >

      <tr>
        <td>
          <table align="center" width="100%">


            <thead>
              <logic:equal property="accion" value="formularioAvanzada" name="cPreOfertaTecnologicaBuscarActionForm">
                <tr>
                  <td colspan="12" align="center" class="headTabla">
                    Criterios de la búsqueda:
                  </td>
                </tr>

                <tr>
                  <td>
                    <bean:write name="cPreOfertaTecnologicaBuscarActionForm" property="criterioBusqueda" />
                  </td>
                </tr>
              </logic:equal>

              <tr>
                <td colspan="12" align="center" class="headTabla">
                  Resultados de la búsqueda:
                </td>
              </tr>
              <tr>
                <td colspan="12">
                  <display:table id="ofertaTecnoBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cPreOfertaTecnologicaBuscarActionForm.resultados"
                    requestURI="cPreOfertaTecnologicaBuscarAction.do" decorator="conicet.apps.svtp.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper">
                    <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                     <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                    
                    <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" sortable="false" />
                    <display:column sortName="srt_id" property="id" title="ID" headerClass="tableCellHeader"  style="width: 40px;" sortable="true" media="html excel pdf"/>
                    <display:column sortName="srt_codigo" property="codigo" title="Código" headerClass="tableCellHeader"  style="width: 40px;" sortable="true" media="html excel pdf"/>

                    <logic:equal property="incluirPC" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                      <logic:notEqual property="tipoOfertaB" value="2" name="cPreOfertaTecnologicaBuscarActionForm">
                      <display:column sortName="srt_descripcion" property="descripcionYPalabrasClavesLarga" title="Título" headerClass="sortable" sortable="true" maxLength="20"
                        style="width: 200px;" media="html" />
                      <display:column sortName="srt_descripcion" property="descripcionYPalabrasClavesLarga" title="Título" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf"/>
                      </logic:notEqual>
                      <logic:equal property="tipoOfertaB" value="2" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_descripcion" property="descripcionYPalabrasClavesLarga" title="Descripción" headerClass="sortable" sortable="true" maxLength="20"
                        style="width: 200px;" media="html" />
                      <display:column sortName="srt_descripcion" property="descripcionYPalabrasClavesLarga" title="Descripción" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf"/>
                      </logic:equal>
                    </logic:equal>
                    
                    <logic:notEqual property="incluirPC" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                      <logic:notEqual property="tipoOfertaB" value="2" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_descripcion" property="descripcion" title="Título" headerClass="sortable" sortable="true" maxLength="20" style="width: 200px;" media="html"/>
                        <display:column sortName="srt_descripcion" property="descripcion" title="Título" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                      </logic:notEqual>
                      <logic:equal property="tipoOfertaB" value="2" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_descripcion" property="descripcion" title="Descripción" headerClass="sortable" sortable="true" maxLength="20" style="width: 200px;" media="html"/>
                      <display:column sortName="srt_descripcion" property="descripcion" title="Descripción" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                      </logic:equal>
                    </logic:notEqual>




                    <!--si tipo oferta es 1 o 3 titulo debe ser prestador. si of. es vacio o 3 debe decir prestador/titular-->
                    <logic:equal property="tipoOfertaB" value="1" name="cPreOfertaTecnologicaBuscarActionForm">
                      <logic:equal property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador" maxLength="20" headerClass="sortable" sortable="true" style="width: 200px;" media="html" />
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                      </logic:equal>
                      <logic:notEqual property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador" maxLength="20" headerClass="tableCellHeader" sortable="true" style="width: 200px;" media="html" />
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                      </logic:notEqual>
                    </logic:equal>

                    <logic:equal property="tipoOfertaB" value="3" name="cPreOfertaTecnologicaBuscarActionForm">
                      <logic:equal property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador" maxLength="20" headerClass="sortable" sortable="true" style="width: 200px;" media="html"/>
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                      </logic:equal>
                      <logic:notEqual property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador" maxLength="20" headerClass="tableCellHeader" sortable="true" style="width: 200px;" media="html"/>
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador" headerClass="tableCellHeader" sortable="true" style="width: 200px;" media="excel pdf" />
                      </logic:notEqual>
                    </logic:equal>


                    <logic:equal property="tipoOfertaB" value="2" name="cPreOfertaTecnologicaBuscarActionForm">
                      <logic:equal property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador/Titular" maxLength="20" headerClass="sortable" sortable="true" style="width: 200px;" media="html" />
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador/Titular" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />

                      </logic:equal>
                      <logic:notEqual property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador/Titular" maxLength="20" headerClass="tableCellHeader" sortable="true" style="width: 200px;" media="html" />
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador/Titular" headerClass="tableCellHeader" sortable="true" style="width: 200px;" media="excel pdf" />

                      </logic:notEqual>
                    </logic:equal>
                    <logic:lessEqual value="-1" property="tipoOfertaB" name="cPreOfertaTecnologicaBuscarActionForm">
                      <logic:equal property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador/Titular" maxLength="20" headerClass="sortable" sortable="true" style="width: 200px;" media="html" />
                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador/Titular" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf"  />

                      </logic:equal>
                      <logic:notEqual property="incluirI" value="true" name="cPreOfertaTecnologicaBuscarActionForm">
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador/Titular" maxLength="20" headerClass="tableCellHeader" sortable="true" style="width: 200px;" media="html"/>
                        <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador/Titular" headerClass="tableCellHeader" sortable="true" style="width: 200px;" media="excel pdf" />

                      </logic:notEqual>
                    </logic:lessEqual>

                    <logic:equal property="tipoOfertaB" value="3" name="cPreOfertaTecnologicaBuscarActionForm">
                      <display:column sortName="srt_prestacionDescripcion" property="prestacionDescripcion" title="Prestación" maxLength="20" headerClass="tableCellHeader" sortable="true"
                        style="width: 100px;" />
                      <display:column sortName="srt_nroResolucion" property="nroResolucion" title="Resolución" maxLength="20" headerClass="tableCellHeader" sortable="true"
                        style="width: 50px;" />
                      <display:column sortName="srt_nroExpediente" property="nroExpediente" title="Expediente" maxLength="20" headerClass="tableCellHeader" sortable="true"
                        style="width: 50px;" />    
                    </logic:equal>

                    <logic:equal property="tipoOfertaB" value="1" name="cPreOfertaTecnologicaBuscarActionForm">
                      <display:column sortName="srt_tipoEstado" property="tipoEstado" title="Estado" headerClass="tableCellHeader" sortable="true" style="width: 80px;" />
                    </logic:equal>

                    <logic:equal property="tipoOfertaB" value="2" name="cPreOfertaTecnologicaBuscarActionForm">
                      <display:column sortName="srt_fechaRegistrada" property="fechaRegistrada" title="Registrado" headerClass="tableCellHeader" sortable="true" style="width: 80px;" />
                      <display:column sortName="srt_tipoEstado" property="tipoEstado" title="Estado" headerClass="tableCellHeader" sortable="true" style="width: 80px;" />
                    </logic:equal>

                    <logic:equal property="tipoOfertaB" value="3" name="cPreOfertaTecnologicaBuscarActionForm">
                      <display:column sortName="srt_tipoEstado" property="tipoEstado" title="Estado" headerClass="tableCellHeader" sortable="true" style="width: 80px;" />
                    </logic:equal>

                    <logic:lessEqual value="-1" property="tipoOfertaB" name="cPreOfertaTecnologicaBuscarActionForm">
                      <display:column sortName="srt_tipoOferta" property="tipoOferta" title="Oferta" headerClass="tableCellHeader" sortable="true" maxLength="20" style="width: 80px;" />
                      <display:column sortName="srt_tipoEstado" property="tipoEstado" title="Estado" headerClass="tableCellHeader" sortable="true" maxLength="20" style="width: 80px;" />
                    </logic:lessEqual>


                    <display:footer media="excel">Criterio de Búsqueda:<%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
                    <display:setProperty name="export.excel.decorator" value="conicet.apps.svtp.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper" />
                    <display:setProperty name="export.pdf.decorator" value="conicet.apps.svtp.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper" />

                    <display:setProperty name="export.excel.filename" value="ListadoDePreOfertasTecnologicas.xls" />
                    <display:setProperty name="export.pdf.filename" value="ListadoDePreOfertasTecnologicas.pdf" />

                  </display:table>
                </td>
              </tr>
            </thead>
            <thead>
              <tr>
                <td colspan="12" class="headTabla" height="30">
                  <div align="right">
                    <jsp:include page="/jsp/layout/botones.jsp">
			                <jsp:param name="formulario" value="cPreOfertaTecnologicaBuscarActionForm" />
			                <jsp:param name="entidad" value="pot" />
			                <jsp:param name="posicion" value="1" />
		                </jsp:include>
                  </div>
                </td>
              </tr>
            </thead>
          </table>

          <logic:lessEqual value="-1" property="tipoOfertaB" name="cPreOfertaTecnologicaBuscarActionForm">
            <logic:notEmpty property="tiposDeOferta" name="cPreOfertaTecnologicaBuscarActionForm">
              <table align="center" width="100%">
                <tr>
                  <td class="CformDato">
                    <logic:iterate id="elemento" name="cPreOfertaTecnologicaBuscarActionForm" property="tiposDeOferta">
                      <strong>
                        <bean:write name="elemento" property="descCorta" />:
                      </strong>
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
