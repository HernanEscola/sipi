<%@include file="layout/include.jsp"%>
<script>
function add(){
	$.ajax({
		  url: './cPruebaAction.do?method=pepe',
		  success: function(data) {
		    $('.result').html(data);
		    alert(data);
		  }
		});
}
</script>

<br>
<h1 align="center" class="titulo">Selección de Proveedor </h1>

<html:form action="cPruebaAction.do" method="POST">


<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr>
    <td>
      <table align="center" width="100%">
        
          <tr>
            <td colspan="10"  align="center" class="headTabla">Proveedores Asignadas</td>
          </tr>
          <tr>
          <td>
          <logic:iterate id="elemento" indexId="elementoId" property="list" name="cPruebaActionForm">
               <div class="row">
               <span class='<%= elementoId.intValue()%2 == 0 ? "even" : "odd" %>' style="width:50%; height:20;">
                <bean:write name="elemento" property="dia"/>-<bean:write name="elemento" property="mes"/>-<bean:write name="elemento" property="anio"/>
               </span>
                <span class='<%= elementoId.intValue()%2 == 0 ? "even" : "odd" %>' style="width:40%;height:20;">
                  <bean:write name="elemento" property="importe"/>
                </span>
              </div>
           </logic:iterate>
           </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="method" value="Add" styleClass="CformBoton"/>
              <html:submit property="method" value="Edit" styleClass="CformBoton"/>
              <html:submit property="method" value="Error" styleClass="CformBoton"/>
              <input name="method" value="Edit" class="CformBoton" type="submit">
              
              <input type="button" class="CformBoton" onclick="add()" value="popup"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
    
    
</table>
</html:form>
