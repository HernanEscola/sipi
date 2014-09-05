<%@include file="layout/include.jsp"%>
<br>
<html:form action="cValorManoObraDetalleAction.do" method="POST">
    <h1 align="center" class="titulo">
      Detalle de Mano de Obra
    </h1>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
	    <tr>
	      <td>
	        <table width="100%" align="center" >
	          <tr bgcolor="#DDEEFF">
	            <td>
	              Investigadores
	            </td>
	          </tr>
	          <tr>            
	            <display:table sort="external" export="false" requestURI="cValorManoObraDetalleAction.do" name="sessionScope.cValorManoObraDetalleActionForm.valoresInvestigadores" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
	              <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="true" style="width: 300px;" />
	              <display:column property="valor" title="Valor Hora ($) *" headerClass="sortable" sortable="true"  style="width: 300px;" />
	              <display:column property="actualizacion" title="Actualizado el:"  headerClass="sortable" sortable="true" style="width: 400px;" />
	            </display:table>
	          </tr>
	        </table>
        </td>
     </tr>
   </table>
   <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <table width="100%" align="center" >
            <tr bgcolor="#DDEEFF">
              <td>
                Técnicos
              </td>
            </tr>
            <tr>            
	           <display:table sort="external" export="false" requestURI="cValorManoObraDetalleAction.do" name="sessionScope.cValorManoObraDetalleActionForm.valoresTecnicos" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
	              <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="true" style="width: 300px;" />
	              <display:column property="valor" title="Valor Hora ($) *" headerClass="sortable" sortable="true"  style="width: 300px;" />
	              <display:column property="actualizacion" title="Actualizado el:" headerClass="sortable" sortable="true" style="width: 400px;" />
	            </display:table>
	          </tr>          
            <tr bgcolor="#DDEEFF">
              <td>
                * Valor Hora: Hora hombre promedio por categoría.
              </td>
            </tr>
            <tr>
              <td colspan="10" class="headTabla" height="30">
                <!-- div align="right">
                 <capplication:isApplication application="SVT">
                  <html:submit property="btnSubmit" value="Modificar" styleClass="CformBoton" />
                  </capplication:isApplication>
                  <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
                </div -->
                <div align="right">
			        <jsp:include page="/jsp/layout/botones.jsp">
			            <jsp:param name="formulario" value="cValorManoObraDetalleActionForm" />
			            <jsp:param name="entidad" value="valor_mano_obra" />
			        </jsp:include>
			    </div>
              </td>
            </tr>
          </table>
        </td>
     </tr>
   </table>
</html:form>
  