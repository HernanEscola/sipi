<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<script>

</script>

<br>
<h1 align="center" class="titulo">Modificación de Administración de Prestadores</h1>
<html:form action="cAdministracionPrestadoresModificarAction.do" method="POST">
<html:hidden property="accion"/>

  <logic:equal property="accion" value="modificar" name="cAdministracionPrestadoresModificarActionForm">
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
        <!-- Seleccion de Organismo -->
        
        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Organismo:&nbsp;<span class="dato_obligatorio">*</span></td>
             </tr>
            </table>

            <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresModificarActionForm.organismoLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
		                <display:column property="descripcionOrganismo" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="localidad" title="Localidad" headerClass="tableCellHeader" style="width: 350px;" />
        		      </display:table>
		            </td>
        		  </tr>
	    	</table>
	      </td>
        </tr>
   
        <!-- Seleccion de PRestadores -->
        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Prestador:&nbsp;<span class="dato_obligatorio">*</span></td>
             </tr>
            </table>

            <logic:notEmpty property="admPrestadoresLote" name="cAdministracionPrestadoresModificarActionForm">
              <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresModificarActionForm.admPrestadoresLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
		                <display:column property="descripcionPrestadorEntOrgAdm" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
        						<display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
        						<display:column property="partidoEntOrgAdm" title="Partido" headerClass="tableCellHeader" style="width: 350px;" />
        						<display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 350px;" />
        						<display:column property="estadoEntOrgAdm" title="Estado" headerClass="tableCellHeader" style="width: 350px;" />
        		      </display:table>
		            </td>
        		  </tr>
	    	  </table>
            </logic:notEmpty>
            <logic:empty property="admPrestadoresLote" name="cAdministracionPrestadoresModificarActionForm">
             <table width="100%" >
       	       <tr >
                 <td>No se seleccionó prestador&nbsp;</td>
       	       </tr>
	         </table>
            </logic:empty>
	      </td>
        </tr>
        <tr>
	      <td>
	        <table width="100%">
		      <tr>
		        <td class="CformAreaBotones" >
	              <div align="right" >
  	              <jsp:include page="/jsp/layout/botones.jsp">
                    <jsp:param name="formulario" value="cAdministracionPrestadoresModificarActionForm" />
                    <jsp:param name="entidad" value="ad_pr" />
                    <jsp:param name="posicion" value="0" />
                  </jsp:include> 
	              </div>
	 	        </td>
		      </tr>
	        </table>
          </td>
        </tr>
        
        <!-- Botones -->
        <tr>
	     <td>
	       <table width="100%">
	  	     <tr>
        		<td width="40%" class="CformAreaBotones" >
              <div align="left" class="dato_obligatorio">* Datos obligatorios </div>
		        </td>
  			    <td width="60%" class="CformAreaBotones">
  		      	    <div align="right" >
                  <jsp:include page="/jsp/layout/botones.jsp">
                    <jsp:param name="formulario" value="cAdministracionPrestadoresModificarActionForm" />
                    <jsp:param name="entidad" value="ad_pr" />
                    <jsp:param name="posicion" value="1" />
                  </jsp:include> 
  		        	</div>
  				  </td>
		  	   </tr>
	       </table>
          </td>
        </tr>
     </table>
  </logic:equal>
  
  <!-- CONFIRMACION MODIFICACION-->
  
  <logic:equal property="accion" value="confirmar" name="cAdministracionPrestadoresModificarActionForm">
  	 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >	
  		<!-- Seleccion de Organismo -->
        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Organismo:&nbsp;</td>
             </tr>
            </table>

            <logic:notEmpty property="organismoLote" name="cAdministracionPrestadoresModificarActionForm">
              <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresModificarActionForm.organismoLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
		                <display:column property="descripcionOrganismo" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="localidad" title="Localidad" headerClass="tableCellHeader" style="width: 350px;" />
        		      </display:table>
		            </td>
        		  </tr>
	    	  </table>
            </logic:notEmpty>
	      </td>
        </tr>
  		
        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Prestador:&nbsp;</td>
             </tr>
            </table>

            <logic:notEmpty property="admPrestadoresLote" name="cAdministracionPrestadoresModificarActionForm">
              <table width="100%" >
        	      <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresModificarActionForm.admPrestadoresLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
		                <display:column property="descripcionPrestadorEntOrgAdm" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
						<display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
						<display:column property="partidoEntOrgAdm" title="Partido" headerClass="tableCellHeader" style="width: 350px;" />
						<display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 350px;" />
						<display:column property="estadoEntOrgAdm" title="Estado" headerClass="tableCellHeader" style="width: 350px;" />		                
        		      </display:table>
		            </td>
        		  </tr>
	    	  </table>
            </logic:notEmpty>
            <logic:empty property="admPrestadoresLote" name="cAdministracionPrestadoresModificarActionForm">
             <table width="100%" >
       	       <tr >
                 <td>No se seleccionó prestador&nbsp;</td>
       	       </tr>
	         </table>
            </logic:empty>
	      </td>
        </tr>
        
        <!-- Botones -->
        <tr>
	     <td>
	       <table width="100%">
	  	     <tr>
        		<td width="60%" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">* Datos obligatorios </div>
		        </td>
			    <td width="40%" class="CformAreaBotones">
		      	    <div align="right" >
		        	  <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
		          	  <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
		        	</div>
				</td>
		  	 </tr>
	       </table>
          </td>
        </tr>
        
     </table>
  </logic:equal>   
   
  </html:form>