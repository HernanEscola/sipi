<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="convenioItemTramiteForm" name='<%= request.getParameter("convenioItemTramiteForm") %>' />
<bean:define id="actionPage" name="convenioItemTramiteForm" property="actionName" />
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>


$(document).ready(function() {

	
});


function removeArchivo()
{
	document.<%= request.getParameter("convenioItemTramiteForm") %>.removerArchivo.value = "si";
	document.<%= request.getParameter("convenioItemTramiteForm") %>.submit();
}

function subirArchivo()
{
	document.<%= request.getParameter("convenioItemTramiteForm") %>.removerArchivo.value = "no";
	document.<%= request.getParameter("convenioItemTramiteForm") %>.submit();
}

</script>  


<logic:equal value="input" name="tipoPantalla">
<input type="hidden" name="nombreInputsFecha" value="id_fecha" id="id_nombres_fecha">
 <html:hidden property="removerArchivo" styleId="removerArchivo"/>
 
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
	 <tr>
    	<td>
    	
    	<table  width="100%">

        	<tr>
	        	<td class="CformNombre">Evento:&nbsp;<span class="dato_obligatorio">*</span></td>
	         	<td class="CformDato">
	         		<logic:equal property="accion" value="alta" name="cConvenioItemTramiteForm">
			           	<html:select styleId="cboEvento" property="evento" >
			             	<html:options collection="cboEvento" property="value" labelProperty="label" />
			          	</html:select>
		          	</logic:equal>
		          	<logic:equal property="accion" value="modificar" name="cConvenioItemTramiteForm">
		          		<html:select disabled="true" styleId="cboEvento" property="evento" >
                      		<html:options collection="cboEvento" property="value" labelProperty="label" />
                    	</html:select>
                    </logic:equal>
	         	</td>
	       	</tr>
	
    		<tr>
	    		<td class="CformNombre">Fecha:&nbsp;<span class="dato_obligatorio">*</span></td>
             	<td class="CformDato">	                       
                 <html:text styleId="id_fecha" property="fecha" ></html:text>
            	</td>
           	</tr>
                     	
			<tr>
                 <td class="CformNombre" >Observaciones:&nbsp;</td>
                 <td class="CformDato" width="75%" ><html:textarea property="observacion" rows="3" /></td>
	    	</tr>
                    
            <tr>
                <td class="CformNombre">Archivo:&nbsp;</td>
                
                <logic:empty name="convenioItemTramiteForm" property="file">
	                <logic:empty name="convenioItemTramiteForm" property="archivo">
						<td id="documentoUpload">
							<html:file property="file" size="50" onchange="subirArchivo()"/>
						</td>
					</logic:empty>
				</logic:empty>
				<logic:notEmpty name="convenioItemTramiteForm" property="file">
					<td id ="documentoLink"><bean:write name="convenioItemTramiteForm" property="fileName"/>
					<a href="#" onclick="removeArchivo()"><img src="./imagenes/close.png" align="top"></a></td>
				</logic:notEmpty>
				<logic:empty name="convenioItemTramiteForm" property="file">
					<logic:notEmpty name="convenioItemTramiteForm" property="archivo">
						<td id="documentoLink">
							<a href="./<%= actionPage %>.do?method=descargar">
								<bean:write name="convenioItemTramiteForm" property="fileName"/>
							<a href="#" onclick="removeArchivo()"><img src="./imagenes/close.png" align="top"></a>
							</a>
						</td>
					</logic:notEmpty>
				</logic:empty>
			</tr> 	
                     	
       	</table>
       </td>
    </tr>
    
	 <tr>
		 <td class="CformAreaBotones">
           <div align="right">
             <jsp:include page="/jsp/layout/botones.jsp">
                <jsp:param name="formulario" value='<%= request.getParameter("convenioItemTramiteForm") %>' />
                <jsp:param name="entidad" value="convenioItemTramite" />
             </jsp:include> 
           </div>
         </td>
     </tr>
		      
    </table>

</logic:equal>

<logic:equal value="view" name="tipoPantalla"> 

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="5" width="100%">
         <tr>
            <td colspan="100%">
                <table width="100%" cellpadding="2" cellspacing="2">
                
	             	
                    <tr>
                        <td class="CformNombre" width="160" >Evento:</td>
                        <td class="CformDato" width="440">
                            <html:select disabled="true" styleId="cboEvento" property="evento" >
                              <html:options collection="cboEvento" property="value" labelProperty="label" />
                            </html:select>
                        </td>
                    </tr>
	                <tr>
	                    <td class="CformNombre" width="160" >Fecha:</td>
	                    <td class="CformDato"  width="440" ><bean:write property="fecha" name="convenioItemTramiteForm" /></td>
	                </tr>

	                <tr>
	                    <td class="CformNombre" width="160" >Observaciones:</td>
	                    <td class="CformDato" width="440"><bean:write name="convenioItemTramiteForm" property="observacion"/></td>
	                </tr>
	                

	          		<tr>
						<td class="CformNombre">Archivo:</td>
						<logic:notEmpty name="convenioItemTramiteForm" property="file">
							<td id ="documentoLink"><bean:write name="convenioItemTramiteForm" property="fileName"/>
							</td>
						</logic:notEmpty>
						<logic:empty name="convenioItemTramiteForm" property="file">
							<logic:notEmpty name="convenioItemTramiteForm" property="archivo">
								<td class="CformDato" id="documentoLink">
									<a href="./<%= actionPage %>.do?method=descargar">
										<bean:write name="convenioItemTramiteForm" property="fileName"/>
									</a>
								</td>
							</logic:notEmpty>
						</logic:empty>
					</tr>
         		</table>
        <tr>
         <td class="CformAreaBotones">
           <div align="right">
             <jsp:include page="/jsp/layout/botones.jsp">
                <jsp:param name="formulario" value='<%= request.getParameter("convenioItemTramiteForm") %>' />
                <jsp:param name="entidad" value="convenioItemTramite" />
             </jsp:include> 
             
           </div>
         </td>
       </tr>
    </table>  
    </td>
  </tr>
</table> 


</logic:equal>

   