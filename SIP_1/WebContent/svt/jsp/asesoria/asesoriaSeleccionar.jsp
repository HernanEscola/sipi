<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>


<script>

$(document).ready(function() {
	  var opciones = {"desde":"id_fechaDesdeAsesoria","hasta":"id_fechaHastaAsesoria"};
	  var x = new CPeriodoPicker(opciones);
   var input = new CInputNumero(false); // si false verifica que sea un nro. y NO lo trata como un importe
	   input.bind("input[id='expedienteNumeroB']");//selector de jquery
	   input.bind("input[id='resolucionNroB']");//selector de jquery 
	   input.bind("input[id='nroAsesoriaB']");//selector de jquery
	   input.bind("input[id='nroOrdenB']");//selector de jquery
	   input.bind("input[id='actuacionMesaEntradasB']");//selector de jquery
	   

});




function setFoco(){
  x=event.keyCode
  if((x==13)){ // enter
    window.event.returnValue = false
  }

}







</script>


<br>

<h1 align=" center" class="titulo">Selección de Asesorías</h1>


<html:form action="cAsesoriaSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_tramite,id_fecha_resolucion,id_fecha_ingreso" />

  

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
      <tr>
        <td>
          <table width="100%">
           <tbody>
				  <tr>
				     <td bgcolor="efefef" >
		        
				        <table width="100%">
						<tr>
		                      <td class="CformNombre" width="20%">Nro. Orden:   </td>
		                      <td class="CformDato" width="80%">
		                         <html:text styleId="nroOrdenB" property="nroOrdenB" maxlength="9" size="10" />
		                      </td>
		                      
		                 	</tr>
						
						  <tr>
		                      <td class="CformNombre" width="20%">Nro. Asesoría:  </td>
		                      <td class="CformDato" width="80%"><div id="nroAsesoriaB">
		                         <html:text styleId="nroAsesoriaB" property="nroAsesoriaB" maxlength="9" size="10" />
		                       	 <label style="  color: #626262;
											     font-family: Verdana,Arial,Helvetica,sans-serif;
											     font-size: 8pt;
											     text-align: right;">
		                      		/
		                      	 </label>
									<html:select styleId="añoId" property="añoPresentacionB">
											<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
									</html:select>
								</td>
		                 	</tr>

						   <tr>
		                      <td class="CformNombre" width="20%">Expediente: Nro.:</td>
		                      <td class="CformDato" width="80%">
		                          <html:text styleId="expedienteNumeroB" property="expedienteNumeroB" maxlength="9" size="10" />
								<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;
											    ">
		                      		/
		                      	</label>
			                   <html:select styleId="expedienteAnioB" property="expedienteAnioB" >
									<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
								</html:select>
								</td>
		                 	</tr>
						   <tr>
		                      <td class="CformNombre" width="20%">Resolución: Nro.:</td>
		                    
		                      <td class="CformDato" width="10%">
		                     <html:select styleId="resolucionTipoB" property="resolucionTipoB" >
									<html:options name="formulario" collection="comboTipoResolucion" property="value" labelProperty="label" />
								</html:select>
		                          <html:text styleId="resolucionNroB" property="resolucionNroB" maxlength="9" size="10" />
		                      
		                      
		                      	<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;
											    ">
		                      		/
		                      	</label>
		                    
		                      
			                   <html:select styleId="resolucionAnioB" property="resolucionAnioB" >
									<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
								</html:select>
								
								<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;">
		                      		Estado:
		                      	</label>
								
								<html:select styleId="resolucionEstadoB" property="resolucionEstadoB" >
									<html:options name="formulario" collection="comboEstadoResolucion" property="value" labelProperty="label" />
								</html:select>
								</td>
		                 	</tr>
						
						
							<tr>
		                      <td class="CformNombre" width="20%">Trámite: Fecha:</td>
		                      <td class="CformDato" width="80%">
		                          <html:text styleId="id_fecha_tramite" property="tramiteEstadoFechaB" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      	<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;">
		                      		Estado:
		                      	</label>
					                 <html:select styleId="tramiteEstadoB"   property="tramiteEstadoB">
					                 <html:options name="formulario"  collection="comboTipoTramiteEstado" property="value" labelProperty="label"  />
					                 </html:select>
			                    </td>
		                 	</tr>
							<tr>
		                      <td class="CformNombre" width="20%">Ingreso Mesa Entradas:</td>
		                      <td class="CformDato" width="80%">
		                          <html:text styleId="id_fecha_ingreso" property="fechaIngresoB" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      	<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;">
		                      		Actuación:
		                      	</label>
		                      	
		                          <html:text styleId="actuacionMesaEntradasB" property="actuacionMesaEntradasB" maxlength="9" size="10" />
		                      </td>
			                   
		                 	</tr>
		                  </table>
		                  
		               <table width="100%">
							 <tr>					            
					             <td class="CformNombre" width="20%">
					            	Asesor:
					            </td>
					            		                         	
		                         <td class="CformDato" width="80%">
		                         <html:text styleId="prestadorDescripcion" property="prestadorDescripcion" maxlength="80" size="52" />
							 	</td>
	                         </tr>
														
		                  <tr>					            
						        <td class="CformNombre" width="20%" >Contratante:</td>
			                    <td class="CformDato" width="80%">
		                         <html:text styleId="contratanteDescripcion" property="contratanteDescripcion" maxlength="80" size="52" />
							 	</td>
	                         </tr>
										
							 <tr>					            
						        <td class="CformNombre" width="20%" >UVT:</td>
			                    <td class="CformDato" width="80%">
		                         <html:text styleId="uvtDescripcion" property="uvtDescripcion" maxlength="80" size="52" />
							 	</td>
	                         </tr>
							
					  </table>	
				
				 </td>
			 </tr>
				
				<tr>
				<td bgcolor="efefef" >
							
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
                Asesoria Asignadas:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cAsesoriaSeleccionarActionForm.asignados" id="asesoriaSeleccionarAsignados" style="width: 100%" decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaSeleccionarDisplayWrapper">
				 <display:column property="indice" title="#" headerClass="tableCellHeader" style="width:20px" media="html"/>
	             <display:column property="nrosOrden"  title="Nro.Orden"  headerClass="tableCellHeader"   style="width: 120px;" />
				 <display:column property="nroAsesoriayAnioPresentacion" title="Nro.Asesoria"  headerClass="tableCellHeader"  style="width: 120px;" />
				 <display:column property="descripcionAsesores" title="Asesor"  headerClass="tableCellHeader" style="width: 120px;" />
				 <display:column property="descripcionContratante" title="Contratante"  headerClass="tableCellHeader" maxLength="40" style="width: 120px;" />
				 <display:column property="resolucionNroTipoAnio" title="Resolución"  headerClass="tableCellHeader"  style="width: 120px;" />
				 <display:column property="descripcionUvt" title="Forma Pago"  headerClass="tableCellHeader"  style="width: 120px;" />
		         <display:column property="montoTotal" title="Monto Total"  headerClass="tableCellHeader"    style="width: 120px;" media="html" />
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
                Listado de Asesorias :
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cAsesoriaSeleccionarActionForm.noAsignados"  id="asesoriaSeleccionarNoAsignados" style="width: 100%" decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaSeleccionarDisplayWrapper">
				 <display:column property="indice" title="#" headerClass="tableCellHeader" style="width:20px" media="html"/>
	             <display:column property="nrosOrden"  title="Nro.Orden"  headerClass="tableCellHeader"   style="width: 120px;" />
				 <display:column property="nroAsesoriayAnioPresentacion" title="Nro.Asesoria"  headerClass="tableCellHeader"  style="width: 120px;" />
				 <display:column property="descripcionAsesores" title="Asesor"  headerClass="tableCellHeader" style="width: 120px;" />
				 <display:column property="descripcionContratante" title="Contratante"  headerClass="tableCellHeader" maxLength="40" style="width: 120px;" />
				 <display:column property="resolucionNroTipoAnio" title="Resolución"  headerClass="tableCellHeader"  style="width: 120px;" />
				 <display:column property="descripcionUvt" title="Forma Pago"  headerClass="tableCellHeader"  style="width: 120px;" />
		         <display:column property="montoTotal" title="Monto Total"  headerClass="tableCellHeader"    style="width: 120px;" media="html" />
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
            <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
          </div>
        </td>
      </tr>
      <tr>
    </table>
 
</html:form>




