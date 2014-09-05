<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<script>

</script>

<br>
<h1 align="center" class="titulo">Administración de Prestadores</h1>
<html:form action="cAdministracionPrestadoresAction.do" method="POST">
<html:hidden property="accion"/>

  <logic:equal property="accion" value="alta" name="cAdministracionPrestadoresActionForm">
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
        <!-- Seleccion de Organismo -->
        
        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Organismo:&nbsp;<span class="dato_obligatorio">*</span></td>
             </tr>
            </table>

            <logic:notEmpty property="organismoLote" name="cAdministracionPrestadoresActionForm">
              <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresActionForm.organismoLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">                        
		                <display:column property="descripcionOrganismo" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
		                <display:column property="localidad" title="Localidad" headerClass="tableCellHeader" style="width: 350px;" />
        		      </display:table>
		            </td>
        		  </tr>
	    	  </table>
            </logic:notEmpty>
            <logic:empty property="organismoLote" name="cAdministracionPrestadoresActionForm">
             <table width="100%" >
       	       <tr >
                 <td>No se seleccionó organismo&nbsp;</td>
       	       </tr>
	         </table>
            </logic:empty>
	      </td>
        </tr>
        <tr>
	      <td>
	        <table width="100%">
		      <tr>
		      <capplication:isApplication application="SVT">
		        <td class="CformAreaBotones" >
	              <div align="right" >
  	                <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar Organismo"/>
	              </div>
	 	        </td>
	 	      </capplication:isApplication>
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

            <logic:notEmpty property="admPrestadoresLote" name="cAdministracionPrestadoresActionForm">
              <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresActionForm.admPrestadoresLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
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
            <logic:empty property="admPrestadoresLote" name="cAdministracionPrestadoresActionForm">
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
		      <logic:equal property="esAdmPrestadoresVacio" value="si" name="cAdministracionPrestadoresActionForm">
		        <td class="CformAreaBotones" >
	              <div align="right" >
  	                <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar Prestadores" />
	              </div>
	 	        </td>
	 	      </logic:equal>
		      </tr>
	        </table>
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
		      	    <!-- Uso el logic empty para que no modifique ni haga nada si ya registro prestadore. 
		      		Para modificar debe ir por la busqueda/detalle-->
		      		  <logic:equal property="esAdmPrestadoresVacio" value="si" name="cAdministracionPrestadoresActionForm">
		        	    <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
		          	    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
		          	  </logic:equal>
		          	  <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
		        	</div>
				</td>
		  	 </tr>
	       </table>
          </td>
        </tr>
     </table>
  </logic:equal>
  
  <!-- CONFIRMACION ALTA-->
  
  <logic:equal property="accion" value="confirmar" name="cAdministracionPrestadoresActionForm">
  	 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >	
  		<!-- Seleccion de Organismo -->
        <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Organismo:&nbsp;</td>
             </tr>
            </table>

            <logic:notEmpty property="organismoLote" name="cAdministracionPrestadoresActionForm">
              <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresActionForm.organismoLote" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
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

            <logic:notEmpty property="admPrestadoresLote" name="cAdministracionPrestadoresActionForm">
              <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cAdministracionPrestadoresActionForm.admPrestadoresLote" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
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
	      </td>
        </tr>
        
        <!-- Botones -->
        <tr>
	     <td>
	       <table width="100%">
	  	     <tr>
			    <td class="CformAreaBotones">
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


