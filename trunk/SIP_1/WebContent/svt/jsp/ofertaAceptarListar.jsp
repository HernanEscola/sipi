<%@include file="layout/include.jsp"%>
<script src="./js/scriptaculous/jquery-1.7.2.min.js" type="text/javascript"></script>
<link href="./js/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="./js/facebox/facebox.js" type="text/javascript"></script>
 
<script type="text/javascript">
	jQuery(document).ready( function($) {
		$('a[rel*=facebox]').facebox({})
	})
</script>

<br>
<html:form action="cOfertaAceptarListarAction.do" method="POST">
  <html:hidden property="accion" />
  
    <!-- logic:equal property="accion" value="formulario" name="cOfertaAceptarListarActionForm"-->
	<h1 align=" center" class="titulo">
  	Búsqueda de Novedades
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
                      Título/Prestación:
                    </td>
                    <td class="CformDato">
                      <html:text property="descripcionB" maxlength="80" size="50" />
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
                      Prestador:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="prestadorDescripcionB" maxlength="80" size="50" />
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
                  <tr>
                    <td class="CformNombre" width="107">
                      Código Envío:
                    </td>
                    <td class="CformDato">
                      <html:text property="codigoEnvioB" maxlength="18" size="20" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
          </div>
        </td>
      </tr>
    </table>
  <!-- /logic:equal-->
  
  
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
    <tr>
      <td>
        <table align="center" width="100%">
          <thead>
          
              <tr>
                <td colspan="12" align="center" class="headTabla">
                  Criterio de la búsqueda:
                </td>
              </tr>
              <tr>
                <td>
                  <bean:write name="cOfertaAceptarListarActionForm" property="criterioBusqueda" />
                </td>
              </tr>
          
          
          
            <tr>
                <td colspan="10" align="center" class="headTabla">
                  Resultados de la búsqueda:
                </td>
            </tr>
          
          
            <tr>
              <td colspan="10"  align="center">
                <display:table id="ofertaTecnoBuscarTabla"  sort="external" style="width: 100%" export="true" name="sessionScope.cOfertaAceptarListarActionForm.resultados"
                    requestURI="cOfertaAceptarListarAction.do" decorator="conicet.apps.svt.web.moduloPrestador.decorator.COfertaTecnologicaAceptarDisplayWrapper">
                    <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                     <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                
                  <!-- display:column property="indice2" title="#2" headerClass="tableCellHeader" style="width: 40px;" /-->
                  <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 40px;" media="html"/>

                  <display:column sortName="srt_codigo" property="codigo" title="Código" headerClass="tableCellHeader"  style="width: 40px;" sortable="true" media="html excel pdf"/>
                  
                  
                  <display:column sortName="srt_descripcion" property="descripcion" title="Título" headerClass="sortable" sortable="true" maxLength="30" style="width: 200px;" media="html"/>
                  <display:column sortName="srt_descripcion" property="descripcion" title="Título" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                  
                  <logic:notEqual value="2" property="tipoOfertaB" name="cOfertaAceptarListarActionForm">
                  		<display:column sortName="srt_prestadorSVTP" property="prestador_TC" title="Prestador" maxLength="25" headerClass="sortable" sortable="true" style="width: 200px;" media="html" />
                  		<display:column sortName="srt_prestadorSVTP" property="prestador_TC" title="Prestador" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
				  </logic:notEqual>	
                  <logic:equal value="2" property="tipoOfertaB" name="cOfertaAceptarListarActionForm">
	                  	<display:column sortName="srt_prestadorSVTP" property="prestador_TC" title="Prestador/Titular" maxLength="25" headerClass="sortable" sortable="true" style="width: 200px;" media="html" />
    	              	<display:column sortName="srt_prestadorSVTP" property="prestador_TC" title="Prestador/Titular" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                  		<display:column sortName="srt_fechaRegistrada" property="fechaRegistrada" title="Registrado" headerClass="sortable" sortable="true" maxLength="30" style="width: 200px;" media="html"/>
                  		<display:column sortName="srt_fechaRegistrada" property="fechaRegistrada" title="Registrado" headerClass="sortable" sortable="true" style="width: 200px;" media="excel pdf" />
                  </logic:equal>
                  
                  <logic:lessEqual value="-1" property="tipoOfertaB" name="cOfertaAceptarListarActionForm">
                  	<display:column sortName="srt_tipoOferta" property="tipo" title="Oferta" headerClass="tableCellHeader" sortable="true" maxLength="15" style="width: 80px;"  media="html excel pdf"/>
                  </logic:lessEqual>
                  
                  <logic:equal property="tipoOfertaB" value="3" name="cOfertaAceptarListarActionForm">
                      <display:column sortName="srt_prestacionDescripcion" property="prestacionDescripcion" title="Prestación" maxLength="20" headerClass="tableCellHeader" sortable="true"
                        style="width: 100px;" />
                      <display:column sortName="srt_nroResolucion" property="nroResolucion" title="Resolución" maxLength="20" headerClass="tableCellHeader" sortable="true"
                        style="width: 50px;" />
                      <display:column sortName="srt_nroExpediente" property="nroExpediente" title="Expte" maxLength="20" headerClass="tableCellHeader" sortable="true"
                        style="width: 50px;" />    
                   </logic:equal>
                  
                  
                    <display:column sortName="srt_estado" property="estado" title="Estado" headerClass="sortable" style="width: 100px;"  sortable="true" media="html excel pdf"/>
 
                    <display:footer media="excel">Criterio de Búsqueda:<%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
                    <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.moduloPrestador.decorator.COfertaTecnologicaAceptarDisplayWrapper" />
                    <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.moduloPrestador.decorator.COfertaTecnologicaAceptarDisplayWrapper" />

                    <display:setProperty name="export.excel.filename" value="ListadoDeNovedades.xls" />
                    <display:setProperty name="export.pdf.filename" value="ListadoDeNovedades.pdf" />

                </display:table>
              </td>
            </tr>
          </thead>
          <thead>
              <tr>
                <td colspan="10" class="headTabla" height="30">
                  <div align="right">

                  </div>
                </td>
              </tr>
            </thead>
          
        </table>
        
        <logic:lessEqual value="-1" property="tipoOfertaB" name="cOfertaAceptarListarActionForm">
            <logic:notEmpty property="tiposDeOferta" name="cOfertaAceptarListarActionForm">
              <table align="center" width="100%">
                <tr>
                  <td class="CformDato">
                    <logic:iterate id="elemento" name="cOfertaAceptarListarActionForm" property="tiposDeOferta">
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
</html:form>
