<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/dialog/dialogManoObra.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	initDialogManoObra();	 
	  
});
</script>

	
<bean:define id="form" name='<%= request.getParameter("form") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName")%>'/>

<div id="dialogManoDeObra" title="Valores de Mano de Obra" width="100%">
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
	    <tr>
	      <td>
	        <table align="center" width="100%">
	          <tr bgcolor="#DDEEFF">
	            <td>
	              Investigadores
	            </td>
	          </tr>
	          <tr> 
	          <td>         
	            <display:table sort="external" export="false" requestURI='<%=request.getParameter("actionName")+".do"%>' name='<%="sessionScope."+request.getParameter("form")+".valoresInvestigadores"%>' style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
	              <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="false" style="width: 150px;" />
	              <display:column property="valor" title="Valor Hora ($) *" headerClass="sortable" sortable="false"  style="width: 125px;" />
	              <display:column property="actualizacion" title="Actualizado el:"  headerClass="sortable" sortable="false" style="width: 125px;" />
	            </display:table>
	            </td>  
	          </tr>
	        </table>
        </td>
     </tr>
   </table>
   <table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
      <tr>
        <td>
          <table align="center" width="100%">
            <tr bgcolor="#DDEEFF">
              <td>
                Técnicos
              </td>
            </tr>
            <tr>       
            <td>       
	           <display:table sort="external" export="false" requestURI='<%= request.getParameter("actionName")+".do" %>' name='<%="sessionScope."+request.getParameter("form")+".valoresTecnicos"%>' style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
	              <display:column property="categoria" title="Categoría" headerClass="sortable" sortable="false" style="width: 150px;" />
	              <display:column property="valor" title="Valor Hora ($) *" headerClass="sortable" sortable="false"  style="width: 125px;" />
	              <display:column property="actualizacion" title="Actualizado el:" headerClass="sortable" sortable="false" style="width: 125px;" />
	            </display:table>
	            </td>
	          </tr>          
            <tr bgcolor="#DDEEFF">
              <td>
                * Valor Hora: Hora hombre promedio por categoría.
              </td>
            </tr>
          </table>
        </td>
     </tr>
   </table>
 </div>