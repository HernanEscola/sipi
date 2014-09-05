<%@ include file="/jsp/layout/include.jsp"%>
<%
conicet.framework.error.CException ex = (conicet.framework.error.CException)request.getAttribute("errorFatal");
%>
<script language="javascript" type="text/javascript">
function mostrarError() {
  if (document.all.linkError.value == "Ver Detalles") {
    document.all.areaError.rows="23";
    document.all.areaError.style.visibility="visible";
    document.all.linkError.value="Ocultar Detalles";
    } else if (document.all.linkError.value == "Ocultar Detalles") {
      document.all.areaError.rows="1";
      document.all.areaError.style.visibility="hidden";
      document.all.linkError.value="Ver Detalles";
    }
}
</script>
<br>
<h1 align="center">
Página de Errores
</h1>
<html:form action="errorHandlerAction.do">
<table width="650" border="1" align="center" cellpadding="0" cellspacing="0" >

  	<% if (ex!=null) {%>
<html:hidden property="exception" value="<%=ex.toString()%>"/>
	<% } else { %>
	Ocurrió un error.
	<% } %>

   <tr>
      <td height="25" class="CformRowHeader">&nbsp;
	Se ha producido el siguiente error en el sistema:
      </td>
   </tr>
    <tr>
      <td height="70">
	  <div>&nbsp;</div>
	  <div>
	<ul><li>
	<% if (ex!=null) {%>
	<%= ex.getMessage()%>
	<% } else { %>
	Ocurrio un error.
	<% } %>
	</li></ul></div>
      <div align="right">
	<input type="button" name="linkError" value="Ver Detalles" onclick="mostrarError()" class="CformBotonTransp">
	</div>
	<div align="center">
	<textarea cols="70" rows="1" id="areaError" style="visibility:hidden" name="areaError" readonly="readonly">
          <%=ex.toString()%>
	</textarea>
	</div>
        <div align="justify">
<p>Sr. usuario, se ha producido un error en el sistema.  Para poder resolverlo en forma efectiva se solicita nos brinde un detalle sintético de los datos o acciones que estaba realizando al momento de efectuarse el error. Muchas Gracias.</p>
<p>&nbsp;</p>
        </div>
        <div align="center">
          <html:textarea property="descripcion" cols="60" rows="20"></html:textarea>
        </div>
      </td>
  </tr>

  <tr>
     <td class="headTabla" height="30"><div align="right">
       <html:submit property="submit" value="Enviar y Salir" styleClass="CformBoton"/>
     </div>
     </td>
  </tr>
</table>
</html:form>
