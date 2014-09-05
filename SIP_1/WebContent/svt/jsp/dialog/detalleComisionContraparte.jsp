<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/dialog/dialogDetalleComisionContraparte.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	initDialogDetalleComisionContraparte();	 
	  
});
</script>

	
<bean:define id="form" name='<%= request.getParameter("form") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName")%>'/>

<div id="dialogDetalleComisionContraparte" title="Comisión Contraparte" width="100%">
	<div id="encabezadoDiv" width="100%">
	        <table id="encabezado" align="center" width="100%">
	          <tr  bgcolor="#DDEEFF">
	            <td>
	            	Contraparte
	            </td>
	            <td>
	            	Importe
	            </td>
	          </tr>
				
	         
	        </table>
       </div> 
 </div>