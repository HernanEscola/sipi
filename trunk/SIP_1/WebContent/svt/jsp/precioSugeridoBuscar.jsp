<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>



<br>
<html:form action="cPrecioSugeridoBuscarAction.do" method="POST">
 
    <h1 align="center" class="titulo">
      Búsqueda de Precio Sugerido
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
                      <html:text property="codigoOferta" maxlength="20" size="20" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="220">
                      Título:
                    </td>
                    <td class="CformDato">
                      <html:text property="titulo" maxlength="80" size="50" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="220">
                      Prestador:
                    </td>
                    <td class="CformDato">
                      <html:text property="prestadorDescripcion" maxlength="80" size="50" />
                    </td>
                    <capplication:isNotApplication application="SIUVT">
						<td class="CformNombre"  width="120">Sigla Exacta:</td>
		       	        <td class="CformDato">
		                	<html:checkbox property="prestadorDescripcionExacta"/>
						</td>
					</capplication:isNotApplication>
                  </tr>
                  <tr>
                   <td class="CformNombre" width="220">
                      Estado:
                    </td>
                    <td class="CformDato">
                    <html:select property="estadoOferta" >
		             <html:options collection="comboEstado" property="value" labelProperty="label" />
		             </html:select>
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
               <jsp:param name="formulario" value="cPrecioSugeridoBuscarActionForm" />
               <jsp:param name="entidad" value="precioSugerido" />
               <jsp:param name="posicion" value="0" />
            </jsp:include>
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
    <tr>
      <td>
        <table align="center" width="100%">
          <tr>            
            <display:table id="precioSugeridoBuscarTabla" sort="external" export="true" requestURI="cPrecioSugeridoBuscarAction.do" name="sessionScope.cPrecioSugeridoBuscarActionForm.resultados" style="width:100%" decorator="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoDisplayWrapper">
              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                
              <display:column property="indice" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
              <display:column sortName="srt_codigoOferta" property="codigoOferta" title="Código OT" headerClass="sortable" sortable="true"  />
              <display:column sortName="srt_titulo" property="titulo" title="Título"  maxLength="20" headerClass="sortable" sortable="true" style="width: 200xp;"/>
              <display:column sortName="srt_prestador" property="prestador" title="Prestador"  maxLength="100" headerClass="sortable" sortable="true" style="width: 200px;" />
              <display:column sortName="srt_descripcionCosto" property="descripcionCosto" title="Desc.Costo" maxLength="100"  headerClass="sortable" sortable="true" style="width: 200px;" />
              <display:column sortName="srt_importeCosto" property="importeCosto" title="Costo"  maxLength="100" headerClass="sortable" sortable="true" style="width: 200px;" />
              <display:column sortName="srt_descripcionPrecio" property="descripcionPrecio" title="Desc. Precio Sugerido" maxLength="100" headerClass="sortable" sortable="true" style="width: 200px;" />
              <display:column sortName="srt_precio" property="precio" title="Precio" maxLength="100" headerClass="sortable" sortable="true" style="width: 200px;" />
              <display:column sortName="srt_estado" property="estado" title="Estado" maxLength="80"  headerClass="sortable" sortable="true" style="width: 50px;" />
              <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
              
              <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoDisplayWrapper" />
              <display:setProperty name="export.excel.filename" value="ListadoDePrecioSugeridos.xls" />
              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.precioSugerido.decorator.CPrecioSugeridoDisplayWrapper" />
              <display:setProperty name="export.pdf.filename" value="ListadoDePrecioSugeridos.pdf" />
            </display:table>
          </tr>
          <tr>
            <td colspan="10" class="headTabla" height="30">
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cPrecioSugeridoBuscarActionForm" />
                  <jsp:param name="entidad" value="precio_sugerido" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</html:form>
