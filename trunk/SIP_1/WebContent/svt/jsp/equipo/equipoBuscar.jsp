<%@include file="/jsp/layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>

<h1 align="center" class="titulo">
  Búsqueda de Equipamiento
</h1>
<html:form action="cEquipoBuscarAction.do" method="POST">
  <html:hidden property="accion" />



  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
    
    
    <tr>
      <td>
        <table align="left" cellpadding="0" cellspacing="0" width="100%">
          <tr>
                            
                <td class="CformNombre" width="20%">
                  Descripción:
                </td>
                <td class="CformDato">
                  <html:text property="descripcionBusqueda" size="50" />
                </td>
           </tr>
          <tr>
                 <td class="CformNombre" >
                  Marca:
                </td>
                <td class="CformDato">
                  <html:text property="marcaBusqueda" size="30" />
                </td>
           </tr>
          <tr>

               <td class="CformNombre" >
                  N° Serie:
                </td>
                <td class="CformDato">
                  <html:text property="nroSerie" size="30" />
                </td>
           </tr>
          <tr>
                
                <td class="CformNombre" >
                  Nombre:
                </td>
                <td class="CformDato">
                  <html:text property="nombre" size="50" />
                </td>
           </tr>
          <tr>

                <td class="CformNombre" >
                  Tipo:
                </td>
                <td class="CformDato">
                  <html:text property="tipo" size="30" />
                </td>
				
             </tr>
          </table>
        </td>
      </tr>
     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cEquipoBuscarActionForm" />
                  <jsp:param name="entidad" value="equipamiento" />
                   <jsp:param name="posicion" value="0" />
                </jsp:include> 
		          </div>
		        </td>
		      </tr>
  </table>

  <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>
        <table align="center" width="100%">
          <tr>
             <display:table id="equipoBuscarTabla" sort="list" export="true" requestURI="cEquipoBuscarAction.do" name="sessionScope.cEquipoBuscarActionForm.resultados" 
             				style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
             	
              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                
              <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper" />
              <display:setProperty name="export.excel.filename" value="Equipos.xls" />
              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper" />
              <display:setProperty name="export.pdf.filename" value="Equipos.pdf" />
              <display:column sortName="srt_indice" property="indice" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
              <display:column sortName="srt_descripcion" property="descripcion" title="Descripción"  sortable="true" headerClass="sortable" media="html" />
              <display:column sortName="srt_marca" property="marca" title="Marca" style="width:120px" sortable="true"  headerClass="sortable" media="html" />
              <display:column sortName="srt_modelo" property="modelo" title="Modelo" style="width:100px" sortable="true" headerClass="sortable" media="html" />
              <display:column sortName="srt_anio" property="anio" title="Año" style="width:30px" sortable="true" headerClass="sortable" media="html" />
              <display:column sortName="srt_nroPatrimonio" property="nroPatrimonio" title="Nro Pat" style="width:100px" sortable="true"  headerClass="sortable" media="html" />
              <display:column sortName="srt_propietario" property="propietario" title="Propietario" style="width:100px" sortable="true"  headerClass="sortable" media="html" />
              <display:column sortName="srt_nroSerie" property="nroSerie" title="Nro Serie" style="width:100px" sortable="true"  headerClass="sortable" media="html" />
              <display:column property="estado" title="Estado" style="width:100px" sortable="true" headerClass="sortable" />
              
              <display:column property="descripcion" title="Descripción" media="excel pdf" headerClass="tableCellHeader" />
              <display:column property="marca" title="Marca" media="excel pdf" headerClass="tableCellHeader" />
              <display:column property="modelo" title="Modelo" media="excel pdf" headerClass="tableCellHeader" />
              <display:column property="anio" title="Año" media="excel pdf" headerClass="tableCellHeader" />
              <display:column property="nroPatrimonio" title="Nro Pat" media="excel pdf" headerClass="tableCellHeader" />
              <display:column property="propietario" title="Propietario" media="excel pdf" headerClass="tableCellHeader" />
              <display:footer media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
            </display:table>

          </tr>
          <tr>
            <td colspan="10" class="headTabla" height="30">
              <div align="right">
                <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cEquipoBuscarActionForm" />
                  <jsp:param name="entidad" value="equipamiento" />
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
