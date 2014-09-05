<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<script>

window.onload=function(){
habilitarRolesSinParametro();
}


function habilitarRolesSinParametro() {
	
	var valorRol =document.cUsuarioBuscarActionForm.rol.value; 
	document.cUsuarioBuscarActionForm.rol.disabled = false;
	if (document.cUsuarioBuscarActionForm.rol.options !=null){
		for ( m = document.cUsuarioBuscarActionForm.rol.options.length-1;m>0;m--){
			document.cUsuarioBuscarActionForm.rol.options[m]=null;
		}
		document.cUsuarioBuscarActionForm.rol.length = 0;
		document.cUsuarioBuscarActionForm.rol.options[0] = new Option("Seleccionar","-1");
		document.cUsuarioBuscarActionForm.rol.options[0].selected = true ;
	}
	var j = 1 ;
	<logic:iterate name="cUsuarioBuscarActionForm" property="roles" id="id">
        	var tuSvt = "";
                tuSvt = new String("<bean:write name="id" property="tipoUsuario.id"/>");
        	if (document.cUsuarioBuscarActionForm.tipoUsuarioSvt.value == tuSvt){
			document.cUsuarioBuscarActionForm.rol.options[j] = new Option("<bean:write name="id" property="descripcion"/>","<bean:write name="id" property="id"/>");
			if ( "<bean:write name="id" property="id"/>" == valorRol ){
				document.cUsuarioBuscarActionForm.rol.options[j].selected = true;
				document.cUsuarioBuscarActionForm.rol.value =valorRol;
			}

			j++;
		}
	</logic:iterate>
    return true;
}



function habilitarRoles(obj) {
	document.cUsuarioBuscarActionForm.rol.disabled = false;
	
	if (document.cUsuarioBuscarActionForm.rol.options !=null){
		for ( m = document.cUsuarioBuscarActionForm.rol.options.length-1;m>0;m--){
			document.cUsuarioBuscarActionForm.rol.options[m]=null;
		}
		document.cUsuarioBuscarActionForm.rol.length = 0;
		document.cUsuarioBuscarActionForm.rol.options[0] = new Option("Seleccionar","-1");
		document.cUsuarioBuscarActionForm.rol.options[0].selected = true ;
	}
	
	var j = 1 ;

	<logic:iterate name="cUsuarioBuscarActionForm" property="roles" id="id">
        	var tuSvt = "";
                tuSvt = new String("<bean:write name="id" property="tipoUsuario.id"/>");
        	if (document.cUsuarioBuscarActionForm.tipoUsuarioSvt.value == tuSvt){
			document.cUsuarioBuscarActionForm.rol.options[j] = new Option("<bean:write name="id" property="descripcion"/>","<bean:write name="id" property="id"/>");
			if ( "<bean:write name="id" property="id"/>" == "-1" ){
				document.cUsuarioBuscarActionForm.rol.options[j].selected = true;
			}
			j++;
		}
	</logic:iterate>
    return true;
}

</script>
<br>
<h1 align=" center" class="titulo">
  Búsqueda de Asignación de Roles
</h1>

<html:form action="cUsuarioBuscarAction.do" method="POST">
  <html:hidden property="accion" />

  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
     <tr>
      <td>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td>
              <table width="100%" cellpadding="3" cellspacing="3">
                <tr>
                  <td class="CformNombre">
                    Rol:&nbsp;
                  </td>
                  <td class="CformDato">
                    <html:select styleId="rolSeleccionado" disabled="false" property="rolBuscar">
                      <html:options name="cUsuarioBuscarActionForm" collection="roles" property="value" labelProperty="label" />
                    </html:select>
                    
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">
                    Apellido:&nbsp;
                  </td>
                  <td class="CformDato">
                    <html:text name="cUsuarioBuscarActionForm" property="apellidoUsuario" size="53" maxlength="80" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" width="120">
                    UVT/Entidad:&nbsp;
                  </td>
                  <td class="CformDato">
                    <html:text name="cUsuarioBuscarActionForm" property="gestorOEntidad" size="53" maxlength="80" />
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td class="CformAreaBotones">
        <div align="right">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar" />
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
        </div>
      </td>
    </tr>
  </table>

  <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>
        <table align="center" width="100%">
          <tr>
            <td colspan="10" align="center" class="headTabla">
              Resultados de la búsqueda
            </td>
          </tr>
          <tr>
            <td colspan="10">
              <display:table id="usuarioBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cUsuarioBuscarActionForm.resultados" requestURI="cUsuarioBuscarAction.do" decorator="conicet.apps.svt.web.usuario.decorator.CUsuarioDisplayWrapper">
                <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>       <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                <display:column property="indice"  title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
                <display:column property="usuarioIntranet"  title="Apellido y Nombre" headerClass="tableCellHeader" sortable="true" maxLength="40" style="width: 200px;" />
                <!-- Esta 2 veces cada uno de los displColumn porque uno muestra con "..." y el otro exporta a excell COMPLETO -->
                <!-- A uno le saque el dato.getMaxLength(). Esto lo hice en las otras búsquedas de OT -->
                <display:column media="html" property="descripcion" title="UVT/Entidad"  sortable="true" headerClass="tableCellHeader" maxLength="40" style="width: 200px;" />
                <display:column media="excel" property="descripcion" title="UVT/Entidad"sortable="true" headerClass="tableCellHeader" />
                <display:column media="pdf" property="descripcion" title="UVT/Entidad"  sortable="true" headerClass="tableCellHeader" />
                <display:column property="rolDescripcionCorta" title="Rol" headerClass="tableCellHeader" maxLength="30" sortable="true" style="width: 100px;" />
                <display:column property="estado" title="Estado" headerClass="tableCellHeader" maxLength="20" sortable="true" style="width: 100px;" />
                <capplication:isApplication application="SVT">
                <display:column media="html" property="mail"  title="E-mail" headerClass="tableCellHeader" maxLength="25" sortable="true" style="width: 200px;" />
                <display:column media="excel" property="mail" title="E-mail" headerClass="tableCellHeader" sortable="true" />
                <display:column media="pdf" property="mail"  title="E-mail" headerClass="tableCellHeader" sortable="true" />
				</capplication:isApplication>
                <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.usuario.decorator.CUsuarioDisplayWrapper" />
                <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.usuario.decorator.CUsuarioDisplayWrapper" />
                <display:setProperty name="export.pdf.filename" value="ListadoDeUsuarios.pdf" />
                <display:setProperty name="export.excel.filename" value="ListadoDeUsuarios.xls" />
                <display:footer media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" class="headTabla" height="30">
              <div align="right">
                <csecurity:hasFuncion funcion="usuario_registro">
                  <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton" />
                </csecurity:hasFuncion>
                <html:submit property="btnSubmit" value="Salir" styleClass="CformBoton" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</html:form>

