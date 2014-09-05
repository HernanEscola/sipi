<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>


</script>

<br>

<html:form action="cRolBuscarAction.do" method="POST">
<html:hidden property="accion"/>


<h1 align="center" class="titulo">Búsqueda de Función Rol</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">

							<table> 	
				              <tr>
					                <td class="CformNombre"  width="120"  >Código Rol:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="codigoRol" size="4" maxlength="3"  /> 
									</td>
							  </tr>
				              <tr>
					                <td class="CformNombre"  width="120"  >Tipo Usuario:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="codigoTipoUsuario" size="4" maxlength="3"  /> 
									</td>
							  </tr>
							  					         
				              <tr>
					                <td class="CformNombre"  width="120"  >Función:</td>
					       	        <td class="CformDato">&nbsp;
					                	<html:text property="descripcionFuncion" size="60" maxlength="60"  /> 
									</td>
							  </tr>
							</table>

							
					</table>
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cRolBuscarActionForm" />
		               <jsp:param name="entidad" value="funcionRol" />
		               <jsp:param name="posicion" value="0" />
		            </jsp:include>
		          </div>
		        </td>
		      </tr>
	   </table>
	 </td>
  </tr>
</table>







<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >

  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
          </tr>
          <tr>
             <td colspan="10">
	             <display:table style="width: 100%" export="true"  name="sessionScope.cRolBuscarActionForm.resultados" id="rolListar"  requestURI="cRolBuscarAction.do"  decorator="conicet.apps.svt.web.funcionRol.decorator.CRolDisplayWrapper">
				 <display:column property="indice" title="#" headerClass="tableCellHeader" style="width:20px" media="html"/>
	             <display:column property="rol"  title="Rol"  headerClass="sortable" sortable="true"  style="width: 120px;" />
				 <display:column property="descripcion" title="Descripción"  headerClass="sortable" sortable="true" style="width: 120px;" />
				 <display:column property="tipoUsuario" title="Tipo Usuario"  headerClass="sortable" sortable="true" style="width: 120px;" />
	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cRolBuscarActionForm" />
                  <jsp:param name="entidad" value="funcionRol" />
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



