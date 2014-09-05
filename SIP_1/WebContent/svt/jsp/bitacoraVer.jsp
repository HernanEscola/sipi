<%@include file="layout/include.jsp"%>

<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script >
/***********************************************
* Textarea Maxlength script- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/
function isMaxLength(ta,maxlength){
	var mlength = parseInt(maxlength);
	if (ta.getAttribute && ta.value.length>mlength){
		ta.value=ta.value.substring(0,mlength);
	}
}

$(document).ready(function() {
	document.cBitacoraActionForm.visible.value= $("#id_visibilidadDefault").val();
});


</script>

<div style="padding:0px;">

<html:form action="cBitacoraAction.do" method="POST" >
<html:hidden property="visibilidadDefault" name="cBitacoraMostrarActionForm"  styleId="id_visibilidadDefault" />
  <table align="center" width="90%">

    <logic:equal value="no" name="cBitacoraMostrarActionForm" property="strHayDetalle">
    <tr>
      <td>
      <!-- SI EL USUARIO SOLO PUEDE CONSULTAR Y NO HAY REGISTROS MOSTRAR ESTE MENSAJE -->
      	<logic:equal value="CONSULTA" name="cBitacoraMostrarActionForm" property="accionUsuario">
	      	<logic:empty property="elementosBitacora" name="cBitacoraMostrarActionForm">
		      	No se encontraron comentarios
	      	</logic:empty>
      	</logic:equal>
      <!-- SI HAY REGISTROS MOSTRAR CON EL USUARIO COMPLETO SI ES DV -->
      <logic:notEmpty property="elementosBitacora" name="cBitacoraMostrarActionForm">
      	<logic:equal value="DV" name="cBitacoraMostrarActionForm" property="accionUsuario">
	    	<logic:iterate id="elemento" name="cBitacoraMostrarActionForm" property="elementosBitacora">
	        <li>
	          <html:link action="cBitacoraAction" indexed="true"><bean:write name="elemento" property="comentario"/></html:link> - <strong><bean:write name="elemento" property="usuarioDV"/></strong> (<bean:write name="elemento" property="fecha"/>)
	        </li>
	    	</logic:iterate>
		</logic:equal>
		<!-- SI NO ES DV  Y ES OT DEBE MOSTRAR SECTOR, RESTO DE LOS CASOS MUESTRA USUARIO COMPLETO -->
      	<logic:notEqual value="DV" name="cBitacoraMostrarActionForm" property="accionUsuario">
	    	<logic:iterate id="elemento" name="cBitacoraMostrarActionForm" property="elementosBitacora">
	        <li>
	          <html:link action="cBitacoraAction" indexed="true"><bean:write name="elemento" property="comentario"/></html:link> - <strong><bean:write name="elemento" property="usuario"/></strong> (<bean:write name="elemento" property="fecha"/>)
	        </li>
	    	</logic:iterate>
		</logic:notEqual>
		</logic:notEmpty>
		
      </td>
    </tr>
    </logic:equal>
	
	<!-- SI NO HAY REGISTROS NO MOSTRAR BOTONES MOSTRAR TODOS O RECIENTES(PORQUE NO HAY NINGUNO) -->
   	<logic:notEmpty property="elementosBitacora" name="cBitacoraMostrarActionForm">
	    <tr>
	      <td valign="middle" align="center">
	      	<logic:equal value="si" name="cBitacoraMostrarActionForm" property="strHayMas">
	      		<html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Ver Todos"/>
	      	</logic:equal>
	      	<logic:equal value="si" name="cBitacoraMostrarActionForm" property="strOcultar">
	      		<html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Ver Recientes"/>
	      	</logic:equal>
	        <logic:equal value="si" name="cBitacoraMostrarActionForm" property="strHayDetalle">
	      		<html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Ver Recientes"/>
	      	</logic:equal>
	      </td>
	    </tr>
	</logic:notEmpty>    
    
	 <tr>
	      <td>
	      <table width="100%" align="right">
	      <!-- El usuario según su rol puede registrar o solo consultar. Además al registrar puede seleccionar o no visibilidad -->
			
			<!--  USUARIOS QUE PUEDEN REGISTRAR PERMITE ALTA -->
			<logic:notEqual value="CONSULTA" name="cBitacoraMostrarActionForm" property="accionUsuario">
		        <logic:equal value="no" name="cBitacoraMostrarActionForm" property="strHayDetalle">
		          <tr>
		        	<td colspan="2"><strong>Nuevo comentario:</strong></td>
				  </tr>
		
				  <tr>
					<td colspan="2">
		                  <html:textarea property="nuevoComentario" cols="80" rows="3" style="width: 100%;" onkeyup="isMaxLength(this,300)"/>
		            </td>
				  </tr>
				  
				   <td >Visibilidad:&nbsp;
 	          			<html:select property="visible" styleId="visible" >
         	    			<html:options collection="comboVisibilidadUsuario" property="value" labelProperty="label"/>
            			</html:select>
    	    		</td>
		             <td valign="middle">
		                	<div align="right">
		                  		<html:submit property="btnSubmit" styleClass="CformBoton" value="Agregar"/>
		                  	</div>
		             </td>
		           </tr>
		        </logic:equal>
	        </logic:notEqual>
	        
	        
	        <logic:equal value="si" name="cBitacoraMostrarActionForm" property="strHayDetalle">
	          <tr>
				<td colspan="2">
	                  <bean:write name="cBitacoraMostrarActionForm" property="detalle.comentarioCompleto" />
	            </td>
	          </tr>
	          
				<!-- SI USUARIO ES DVJ O DVH MOSTRAR USUARIO COMPLETO -->
	          <logic:equal value="DV" name="cBitacoraMostrarActionForm" property="rolUsuario">
	          <tr>
	        	<td colspan="2">
	                  <strong><bean:write name="cBitacoraMostrarActionForm" property="detalle.usuarioDV"/></strong>
					   (<bean:write name="cBitacoraMostrarActionForm" property="detalle.fecha"/>)
					   [<bean:write name="cBitacoraMostrarActionForm" property="detalle.visibilidadDescripcionCorta"/>]
	            </td>
	          </tr>
	          </logic:equal>
	          
	          <!-- SI USUARIO NO ES DV Y ES UNA OT MOSTRAR SECTOR, RESTO DE LOS CASOS MOSTRAR USUARIO COMPLETO -->
	          <logic:notEqual value="DV" name="cBitacoraMostrarActionForm" property="rolUsuario">
	          <tr>
	        	<td colspan="2">
	                  <strong><bean:write name="cBitacoraMostrarActionForm" property="detalle.usuario"/></strong>
					   (<bean:write name="cBitacoraMostrarActionForm" property="detalle.fecha"/>)
					   [<bean:write name="cBitacoraMostrarActionForm" property="detalle.visibilidadDescripcionCorta"/>]
	            </td>
	          </tr>
			  </logic:notEqual>	          
	          
	        </logic:equal>
	      </table>
	      </td>
	 </tr>
	
    
  </table>
</html:form>

</div>
