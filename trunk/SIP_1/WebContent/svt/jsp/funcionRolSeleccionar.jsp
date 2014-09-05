<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>


<script>

function setFoco(){
  x=event.keyCode
  if((x==13)){ // enter
    window.event.returnValue = false
  }

}







</script>


<br>

<h1 align=" center" class="titulo">Selección de Funciones para un Rol</h1>


<html:form action="cFuncionRolSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

  

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
      <tr>
        <td>
          <table width="100%">
           <tbody>
				<tr>
				<td bgcolor="efefef" >
							<table width="100%"> 
							     <tr>
							                <td class="CformNombre"  width="20%"  >Rol:</td>
							                   <td class="CformDato">&nbsp;
								                	<html:text property="rol" size="4" maxlength="3"  /> 
												</td>
								         </tr>
									    <tr>
							                    <td class="CformNombre" width="20%" >Descripción Función:</td>
								       	        <td class="CformDato">&nbsp;
								                	<html:text property="funcionDescripcion" size="60" maxlength="60"  /> 
												</td>
							            </tr>
							</table>
							<table width="100%"> 	
							   <tr>
					                <td colspan="10" bgcolor="efefef" height="30">
					                  <div align="right">
					                    &nbsp;
					                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
					                  </div>
					                </td>
					            </tr>
							</table>
				</td>
				</tr>	
			</tbody>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Funciones Asignadas:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cFuncionRolSeleccionarActionForm.asignados" style="width: 600" decorator="conicet.apps.svt.web.funcionRol.decorator.CRolDisplayWrapper">
		            <display:column property="idFuncion" title="Id" headerClass="tableCellHeader" style="width: 100px;" />
	    	        <display:column property="descripcionFuncion" title="Descripción" headerClass="tableCellHeader" style="width: 450px;" />
                    <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>

            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Listado de Funciones:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cFuncionRolSeleccionarActionForm.noAsignados" style="width: 600" decorator="conicet.apps.svt.web.funcionRol.decorator.CRolDisplayWrapper">
		            <display:column property="idFuncion" title="Id" headerClass="tableCellHeader" style="width: 100px;" />
	    	        <display:column property="descripcionFuncion" title="Descripción" headerClass="tableCellHeader" style="width: 450px;" />
                  	<display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" bgcolor="efefef" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Grabar" styleClass="CformBoton" />
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
          </div>
        </td>
      </tr>
      <tr>
    </table>
 
</html:form>




