<%@include file="/jsp/layout/include.jsp"%>

<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<%@page import="conicet.apps.svt.object.asesoria.EEstadoTramite"%>
<%@page import="conicet.apps.svt.object.asesoria.EModalidadFacturacion"%>


<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionName" value='<%= request.getParameter("actionName") %>' />
<bean:define id="actionPage" name="formulario" property="actionName" />
<bean:define id="displayLinks" value='<%= request.getParameter("displayLinks") %>' />
<bean:define id="botones" name="formulario" property="botones" />
<bean:define id="asesoriaEntidad" name="formulario" property="asesoriaEntidad" />
<bean:define id="asesoriaResolucion" name="formulario" property="asesoriaResolucion" />
<bean:define id="publicarWeb" name="formulario" property="publicarWeb" />
<bean:define id="asesoriaFecha" name="formulario" property="asesoriaFecha" />
<script>


	function ocultarAutoComplete(tipo) {
		$('#autoComplete'+ tipo +'').hide().val("");
		$('#autoComplete'+ tipo + 'Descripcion').hide().val("");
	}
	
	function prepararBusqueda(tipo) {

		var conicetGeneral = new ConicetGeneral();
		
		conicetGeneral.autocomplete({
			idInput : "autoComplete"+ tipo,
			url : '<%=actionPage%>.do?method=auto Complete '+ tipo ,
			onSelectFunction : function(item) {
					// si eligió Ingresar Nuevo se va a ventana de alta
					if (item.data.id == 0){
						if (tipo == "Contacto"){
							document.<%=request.getParameter("formulario")%>.action = "<%=actionName%>?btnSubmit=ingresar Nuevo Contratante";
						}
						else{
							document.<%=request.getParameter("formulario")%>.action = "<%=actionName%>?btnSubmit=ingresar Nuevo "+ tipo;
						}
						document.<%=request.getParameter("formulario")%>.submit();	
					}
					
					
					$("#"+ tipo + "Seleccionado").attr("value", item.data.id);
					$("#"+ tipo + "Descripcion").attr("value", item.data.nombre);
					$("#autoComplete"+ tipo + "Texto").text(item.data.nombre);
					intercambiar(tipo);
				},
			valueDefault : "",
			formatItem : function(item) {
					if (item.denominacion != null) {
						return item.nombre + "//" + item.denominacion;
					} else if (item.sigla != null) {
						return item.nombre + "//" + item.sigla;
					} else if (item.categoria != null && item.escalafon != null) {
						return item.nombre + " - " + item.categoria + " - " + item.escalafon;
					} else if (item.contactoNombre != null && item.contactoApellido != null) {
						return item.nombre + " // " + item.contactoApellido + ", " + item.contactoNombre;
					}
					return item.nombre;
				}

		});

		$('#autoComplete' + tipo).show().css("width", "200px").autocomplete("option", "position", {
						my : "right top",
						at : "right bottom"
		});
		$('#autoComplete' + tipo + 'Descripcion').hide();
		intercambiar(tipo);
	}

	function mostrar(i, tipo) {
		$("[id^=autoComplete" + tipo + "]").hide();
	}

	function removeBy(tipo) {
		$('#' + tipo + 'Seleccionado').attr("value", "");
		$('#autoComplete' + tipo).attr("value", "");
		intercambiar(tipo);
	}

	function intercambiar(tipo) {
		var select = $('#' + tipo + 'Seleccionado').val();
		if (select != "" && select != null) {
			$('#autoComplete' + tipo).hide();
			$('#autoComplete' + tipo + 'Descripcion').show();
		} else {
			$('#autoComplete' + tipo + 'Descripcion').hide();
			$('#autoComplete' + tipo).show();
		}
	}

	function btnDetallePersona(obj){
		submitAction("?method=detalle Persona&idEntidad="+obj);
	}
		
  
	$(document).ready(function() {
		var input = new CInputNumero(false); // si false verifica que sea un nro. y NO lo trata como un importe
		input.bind("input[id='expedienteNumero']");//selector de jquery
		input.bind("input[id='resolucionNro']");//selector de jquery 
	  	  
		prepararBusqueda("Prestador");
	  	
	  	prepararBusqueda("Contacto");
	  	prepararBusqueda("Uvt");
	  	mostrarPublicarWeb();
	  	mostrarUvt();
	});
 
	function setearNroAsesoria() {
		var val = $("#añoId").val();
		if (val != "-1" && val != "-2") {
			$.ajax({
					url : document.forms[0].action + "?method=setear Nro Asesoria",
					type : 'POST',
					dataType : "json",
					data : {
						match : val
					},
					success : function(data) {
						$("#nroAsesoria").text(data.value);
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$(this).removeClass( "ui-autocomplete-loading" );
				        alert("Ocurrio el siguiente error: "+thrownError);
				    }
			});
		} else {
			$("#nroAsesoria").text("");
		}
	}

	function mostrarPublicarWeb() {
		var varTramiteEstado = $("#tramiteEstado").val();
		var varUltimoEstadoResolucion = $("#ultimoEstadoResolucion").val();
		var varRolUsuario = $("#rolUsuario").val();  
		if(varTramiteEstado != null  && varTramiteEstado == '<%=EEstadoTramite.TC%>'
			&& varUltimoEstadoResolucion != null && varUltimoEstadoResolucion == "AU"  
			&& varRolUsuario != null  && varRolUsuario == 'DVJ') { 
			$("#publicarWeb").text("S");
		
			$("#publicarSi").removeAttr('disabled');
			$("#publicarNo").removeAttr('disabled');
		
		} else {
			$("#publicarWeb").text("N");
			$("#publicarSi").attr('disabled', true);
			$("#publicarNo").attr('disabled', true);
			
		}
	}
	
	function mostrarUvt() {
		var varModalidadFacturacion = $("#modalidadFacturacion").val();
		if(varModalidadFacturacion != null  && varModalidadFacturacion != '<%=EModalidadFacturacion.U%>') {
			$("#autoCompleteUvt").attr('disabled', true);
			$("#uvtSeleccionado").text("");
			removeBy("Uvt");
		} else {
			$("#autoCompleteUvt").removeAttr('disabled');
		}
	}

	function quitar(tipo, index) {
		submitAction("?method=remove " + tipo + "&removeIndex=" + index);
	}

	function detalle(tipo, index) {
		submitAction("?method=detalle " + tipo + "&index=" + index);
	}
</script>
 
<logic:equal value="input" name="tipoPantalla">
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_tramite,id_fecha_resolucion,id_fecha_directorio" />

<html:hidden property="contactoSeleccionado" styleId="ContactoSeleccionado" />
<html:hidden property="uvtSeleccionado" styleId="UvtSeleccionado" />
<html:hidden property="prestadorSeleccionado" styleId="PrestadorSeleccionado" />
<html:hidden property="ultimoEstadoResolucion" styleId="ultimoEstadoResolucion" />
<html:hidden property="prestadorTexto" styleId="prestadorTexto" />


<html:hidden property="rolUsuario" styleId="rolUsuario" />

<div id="asesoria">
<table class="tablaMin" align="center" cellpadding="0" cellspacing="0" width="720">
  <tr>
    <td class="CformAreaBotones">
      <div align="center">
        <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" onclick="irTabInicial()" />
        <input type="button" class="CformBotonTranspBorde" value="&lt;" onclick="irTabAnterior()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;"  onclick="irTabSiguiente()" />
        <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|"  onclick="irTabFinal()" />
      </div>
    </td>
  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	    <tr>
	      <td>
	        <table align="center" cellpadding="0" cellspacing="0" width="100%">
	        	<tr>
                 <td>
		        	 <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Asesoría &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						
						<table width="100%">
						   <tr>
		                      <td class="CformNombre" width="20%">Asesoría: Nro.:  </td>
		                      <td class="CformDato" width="20%"><div id="nroAsesoria">
		                          <bean:write name="formulario" property="nroAsesoria" />
		                      </td>
		                      
		                      <td class="CformNombre" width="10%">Año:<span class="dato_obligatorio">*</span></td>
			                  <td class="CformDato">
											<logic:equal value="alta" name="formulario" property="valueEAccion">
												<html:select styleId="añoId" property="añoPresentacion" onchange="setearNroAsesoria()">
													<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
												</html:select>
											</logic:equal>
											<logic:equal value="modificar" name="formulario" property="valueEAccion">
												<bean:write name="formulario" property="añoPresentacion"/>
											</logic:equal>
												</td>
		                 	</tr>

						   <tr>
		                      <td class="CformNombre" width="20%">Expediente: Nro.:</td>
		                      <td class="CformDato" width="20%">
		                          <html:text styleId="expedienteNumero" property="expedienteNumero" maxlength="9" size="10" />
		                      </td>
		                      
		                      <td class="CformNombre" width="10%">Año:&nbsp;</td>
			                  <td class="CformDato">
			                   <html:select styleId="expedienteAnio" property="expedienteAnio" >
									<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
								</html:select>
								</td>
		                 	</tr>
						
						
							<tr>
		                      <td class="CformNombre" width="20%">Fecha Trámite:<span class="dato_obligatorio">*</span></td>
		                      <td class="CformDato" width="20%">
		                          <html:text styleId="id_fecha_tramite" property="tramiteEstadoFecha" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      </td>
		                      	<td class="CformNombre" width="10%">Estado:<span class="dato_obligatorio">*</span></td>
			                    <td class="CformDato">
					                 <html:select  property="tramiteEstado" styleId="tramiteEstado" onchange="mostrarPublicarWeb()">
					                 <html:options collection="comboTipoTramiteEstado" property="value" labelProperty="label"  />
					                 </html:select>
			                    </td>
		                 	</tr>
		                      
		                  </table>
		                  
		                 <table width="100%">
							 <tr>					            
					             <td class="CformNombre" width="20%">
					            	Prestador:<span class="dato_obligatorio">*</span>
					            </td>
					            		                         	
		                         <td class="CformDato" width="80%">
									 	<div id="autoCompletePrestadorDescripcion" style='display: inline-block;'>
											<label id="autoCompletePrestadorTexto"><bean:write name="formulario" property="prestadorDescripcion" /> 
											</label> <a href="#" onclick="removeBy('Prestador')"><img	src="./imagenes/close.png" align="top" /></a>
										</div>
										<input type="text" name="autoCompletePrestador" id="autoCompletePrestador" width="200" />
									</td>
									 
							 	</td>
							 	
	                         </tr>
	                         
	                         <logic:notEmpty  property="prestadorTexto" name="formulario">
							  <tr>					            
					             <td class="CformNombre" width="20%">
					            	Prestador Carga Inicial:
					            </td>
					             <td class="CformDato" width="80%"><bean:write name="formulario" property="prestadorTexto"/>
					             </td>
					            
					            </tr>		
							 	</logic:notEmpty>
							 	
							 							
					    </table>
					         
					    
							<table width="100%">
								<tr>

									<td class="CformNombre" width="20%">Contratante / Contacto:<span class="dato_obligatorio">*</span>
									</td>
									<td class="CformDato" width="80%">
										<div id="autoCompleteContactoDescripcion" style='display: inline-block;'>
											<label id="autoCompleteContactoTexto"><bean:write name="formulario" property="contactoDescripcion" /> </label> <a href="#" onclick="removeBy('Contacto')"><img
												src="./imagenes/close.png" align="top" /> </a>
										</div> <input type="text" name="autoCompleteContacto" id="autoCompleteContacto" width="200" />
									</td>

								</tr>
							</table> 
							<logic:notEmpty property="contratanteTexto" name="formulario">
								<table width="100%">
									<tr>
										<td class="CformNombre" width="20%">Contratante Carga Inicial:</td>
										<td class="CformDato" width="80%"><bean:write name="formulario" property="contratanteTexto" />
										</td>
									</tr>
								</table>
							</logic:notEmpty>


							<table width="100%">
								<tr>
									<td class="CformNombre" width="20%">Modalidad Facturación:<span class="dato_obligatorio">*</span></td>
									<td class="CformDato" width="10%"><html:select property="modalidadFacturacion" styleId="modalidadFacturacion" onchange="mostrarUvt()">
											<html:options collection="comboModalidadFacturacion" property="value" labelProperty="label" />
										</html:select>
									</td>

									<td class="CformDato" width="70%">Uvt:
										<div id="autoCompleteUvtDescripcion" style='display: inline-block;'>
											<label id="autoCompleteUvtTexto"><bean:write name="formulario" property="uvtDescripcion" /> </label> <a href="#"  onclick="removeBy('Uvt')"><img src="./imagenes/close.png" align="top" />
											</a>
										</div> <input type="text" name="autoCompleteUvt" id="autoCompleteUvt" width="200" />
									</td>
								</tr>
							</table>
							<table width="100%">
						     <tr>
		                      <td class="CformNombre" width="20%">Fechas de Directorio:</td>
		                      <td class="CformDato" width="80%">
									<table width="100%">
						    			<tr>
											<td >
											<display:table class="CFormDisplayTable" style="width: 80%" name='<%= asesoriaFecha %>' id='<%= pageName %>'
												decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaDisplayWrapper" >
												<display:column property="fechaDirectorio" title="Fecha" headerClass="tableCellHeader" style="width: 100px;" />
												<display:column property="removeFecha" title="  " headerClass="tableCellHeader" style="width: 100px;" />
													<display:footer>
														<tr style="background-color: #FAFAFA;">
												
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 400px;">
															 <html:text name="formulario" styleId="id_fecha_directorio" property="fechaDirectorio" size="10" maxlength="10" onkeypress="validarNumero()"/>
															</td>
		
															<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;">
															<html:submit style="width:100px;" property="btnSubmit"	value="Agregar Fecha" styleClass="CformBoton" />
															</td>
														</tr>
													</display:footer>
												</display:table>
											</td>
										</tr>
									</table>
			                          
		                      </td>
		                      </tr>     
							</table>




							<table width="100%">
								<tr bgcolor="#BFDFFF">
				         		<td>
						          <strong>Resoluciones &nbsp;</strong>
				        		</td>
								</tr>
							</table>
							
							<table width="100%">
				    			<tr>
									<td colspan="10">
										<display:table class="CFormDisplayTable" name='<%= asesoriaResolucion %>' id='<%= pageName %>'
											decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaResolucionDisplayWrapper">
											<display:column property="numero" title="Número" headerClass="tableCellHeader" style="width: 25%;" />
											<display:column property="fecha" title="Fecha" headerClass="tableCellHeader" style="width: 10%" />
											<display:column property="estado" title="Estado" headerClass="tableCellHeader" style="width: 15%" />
											<display:column property="observacion" title="Observaciones" headerClass="tableCellHeader" style="width: 15%" />
											<display:column property="archivo" title="Archivo" headerClass="tableCellHeader" style="width: 30%" />
											<display:column property="remove" title="  " headerClass="tableCellHeader" />
											<display:footer>
												<tr style="background-color: #FAFAFA;">
							
													<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
														<html:select name="formulario" property="resolucionTipo">Ingresar Nuevo: 
															<html:options name="formulario" collection="comboTipoResolucion" property="value" labelProperty="label" />
														</html:select> &nbsp;
														<html:text name="formulario" styleId="resolucionNro" property="resolucionNro" size="4" maxlength="9"/>
													</td>
													<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
														 <html:text name="formulario" styleId="id_fecha_resolucion" property="resolucionFecha" size="10" maxlength="10" onkeypress="validarNumero()"/>
													</td>
	
													<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
														<html:select name="formulario" property="resolucionEstado">
															<html:options name="formulario" collection="comboEstadoResolucion" property="value" labelProperty="label" />
														</html:select>
													</td>
													<td style="text-align: center; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
														 <html:text name="formulario" property="resolucionObservaciones" size="25" />
													</td>
													
													<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">														
														<html:file property="archivoResolucion" size="30"/>														
													</td>
													
													<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px;">
														<html:submit style="width:100px;" property="btnSubmit" value="Agregar Resolucion" styleClass="CformBoton" />
													</td>
													
												</tr>
											</display:footer>
										</display:table>
									</td>
								</tr>
						</table>
		                     
		                 	
		                 	
		                <table width="100%">
						     <tr>
		                      <td class="CformNombre" width="20%">Observaciones:</td>
		                      <td class="CformDato" width="80%">
		                          <html:textarea property="observaciones" rows="3"/>
		                      </td>
		                      </tr>
					          <tr>
                       
                      <td class="CformNombre" width="150">
                        Publicación Web:&nbsp;
                      </td>

                      <logic:equal value="S" property="publicarWeb" name="formulario">
	                        <td class="CformDato">
	                          Sí
	                          <html:radio property="publicar" styleId="publicarSi" value="S" />
	                          No
	                          <html:radio property="publicar" styleId="publicarNo" value="N" />
	                        </td>
                      </logic:equal>	
	                  <logic:notEqual value="S" property="publicarWeb" name="formulario">
	                        <td class="CformDato">
	                          Sí
	                          <html:radio property="publicar" styleId="publicarSi" value="S" disabled="true" />
	                          No
	                          <html:radio property="publicar" styleId="publicarNo" value="N" disabled="true" />
	                        </td>
					  </logic:notEqual>
                    
                      <html:hidden property="publicar" />
                    </tr>
					        
					  
		                      
		                </table>
						
					</td>
				 </tr>	
    		</table>   
		  	
	</td>
</tr>

  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="left">
     <span class="dato_obligatorio">* Datos obligatorios</span>
     </div>
      <div align="right">
      	<logic:equal value="asesoriaAlta" name="pageName">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
        </logic:equal>
        <input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
      </div>
    </td>
  </tr>

</table>	



</div>


<div id="distribucion">
  <table class="tablaMin" align="center" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td class="CformAreaBotones">
        <div align="center">
          <input type="button" class="CformBotonTranspBorde" value="|<<" onclick="irTabInicial()" />
          <input type="button" class="CformBotonTranspBorde" value="<" onclick="irTabAnterior()" />
          <input type="button" class="CformBotonTranspBorde" value=">" onclick="irTabSiguiente()" />
          <input type="button" class="CformBotonTranspBorde" value=">>|" onclick="irTabFinal()" />
        </div>
      </td>
    </tr>
  </table>
  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
	  <tr>
	   <td>
	   		<table width="100%">
				<tr bgcolor="#BFDFFF">
				         <td>
						          <strong>Asesores &nbsp;</strong>
				        </td>
				</tr>
			</table>
						
			<table width="100%">
				     <tr>
					        <td colspan="10" >
					         <display:table sort="list" class="displayTable"   style="width: 100%" name='<%= asesoriaEntidad %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					            <display:column property="indice" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
					            <display:column property="nroOrden" title="N°Orden" headerClass="tableCellHeader" style="width: 5%;" />
					            <display:column property="personaSvtDescripcion" title="Asesor" headerClass="tableCellHeader" style="width: 20%;" />
					            <display:column property="fechaIngreso" title="Fe.Ingreso" headerClass="tableCellHeader" style="width: 5%;text-align: right" />
					            <display:column property="fechaInicio"  title="Fe.Inicio" headerClass="tableCellHeader" style="width: 5%;text-align: right" />
					            <display:column property="fechaFinalizacion" title="Fe.Fin" headerClass="tableCellHeader" style="width: 5%;text-align: right" />
					            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 40%;text-align: left" />
					            <display:column property="tipoMonedaYMonto" title="Importe" headerClass="tableCellHeader" style="width: 10%;" />
					          </display:table>
					        </td>
				     </tr>
			</table>
		</td>
	 </tr>
    <tr>
	          
		         <td class="CformAreaBotones">
		           <div align="left"><span class="dato_obligatorio">* Datos obligatorios</span>
					</div>		          
		           <div align="right">
		             <jsp:include page="/jsp/layout/botones.jsp">
		                <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
		                <jsp:param name="entidad" value="factura" />
		             </jsp:include> 
		           </div>
		   </td>
		 </tr>
		 
		 
    </table>

	  </div>
	</div>

</logic:equal>









		  	


    
<logic:equal value="view" name="tipoPantalla"> 

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
	<tr>
	 <td>
	 <table align="center" cellpadding="0" cellspacing="0" width="100%">

				<tr>
                   <td>
		        	   <table width="100%">
						      <tr bgcolor="#BFDFFF">
						        <td>
						          <strong>Asesoría &nbsp;</strong>
						        </td>
						      </tr>
						</table>
						
						<table width="100%">
					         <tr>
			                      <td class="CformNombre" width="20%">Asesoría:</td>
			                      <td class="CformDato" width="80%">
			                          Nro.: 
			                          <bean:write name="formulario" property="nroAsesoria"/>
			                          &nbsp;&nbsp;Año:&nbsp; 
			                          <bean:write name="formulario" property="añoPresentacion"/>
			                      </td>
							</tr>
							<tr>
	                      		<td class="CformNombre" width="20%">Expediente:</td>
			                      <td class="CformDato" width="80%">
			                          Nro.: 
			                           <bean:write name="formulario" property="expedienteNumero"/>
			                          &nbsp;&nbsp;Año:&nbsp; 
			                           <bean:write name="formulario" property="expedienteAnio"/>
			                      </td>
							</tr>
						
							
							<tr>
		                      <td class="CformNombre" width="20%">Trámite:</td>
			                      <td class="CformDato" width="80%">
			                          Fecha: 
			                           <bean:write name="formulario" property="tramiteEstadoFecha"/>
			                          &nbsp;&nbsp;Estado:&nbsp; 
			                           <bean:write name="formulario" property="tramiteEstado"/>
			                      </td>
								</tr>
								
						</table>
								
						
						
						<table width="100%">
							<tr>
								<td class="CformNombre" width="20%">Prestador:</td>
								<td class="CformDato" width="80%"><bean:write name="formulario" property="prestadorDescripcion" /></td>
							</tr>

							<tr>
								<td class="CformNombre">Contratante / Contacto:</td>
								<td class="CformDato"><bean:write name="formulario" property="contactoDescripcion" /></td>
							</tr>
							
							<logic:notEmpty property="contratanteTexto" name="formulario">
								         <tr>
									            <td class="CformNombre" width="20%">
								            		Contratante Carga Inicial:
									            </td>
										       <td class="CformDato" width="80%">
						                           <bean:write name="formulario" property="contratanteTexto"/>
					    	                  </td>
										</tr>
							</logic:notEmpty>
		                    
							
							<tr>					
							    <td class="CformNombre" width="20%" >Modalidad Facturación : </td>
							    <td class="CformDato"><bean:write name="formulario" property="modalidadFacturacion" />
			                   	</td>
							</tr>        
							
							<!-- SI UVT TEXTO TIENE ALGO TRAERLO DE CARGA INICIAL -->	
							<logic:notEmpty property="uvt" name="formulario">
									<tr>					
							         	<td class="CformNombre" width="20%">Uvt:&nbsp;
								       <td class="CformDato" >
												<bean:write name="formulario" property="uvtDescripcion"/>
													
										</td>
		 				        	</tr>
							</logic:notEmpty>
							<logic:notEmpty property="uvtTexto" name="formulario">
		 				        	<tr>					
								        <td class="CformNombre"  width="20%" >Uvt Carga Inicial:</td>
										<td class="CformDato" width="80%">
											<bean:write name="formulario" property="uvtTexto" />
										</td>
		 				        	</tr>
	 				        </logic:notEmpty>	
	 				       
		                    </table>
		                    
		                    
		                     <table width="100%">
						      <tr>
		                      <td class="CformNombre" width="20%">Fechas de Directorio:</td>
		                      <td class="CformDato" width="80%">
									<table >
							    		<tr>
											<td colspan="10"><display:table class="CFormDisplayTable" name='<%= asesoriaFecha %>' id='<%= pageName %>'
												decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaDisplayWrapper">
												<display:column property="fechaDirectorio" title="Fecha" headerClass="tableCellHeader" style="width: 100px;" />
											</display:table>
											</td>
											<td>
											</td>
										</tr>
									 </table>
		                      </td>
		                    </tr>     
		                    
		                    
		                    
		                    <table width="100%">					
						
							     <tr>
				                      <td class="CformNombre" width="20%">Observaciones:</td>
				                      <td class="CformDato" width="80%">
				                           <bean:write name="formulario" property="observaciones"/>
				                      </td>
			                      </tr>
			                            
							        <tr>
							          <td class="CformNombre" width="130">Publicar:&nbsp;</td>
							          <td class="CformDato">
							            Sí <html:radio name="formulario" property="publicar" value="S" disabled="true" /> 
							            No <html:radio name="formulario" property="publicar" value="N" disabled="true" />
							          </td>
							        </tr>
		                    </table>
					         <table width="100%">
								<tr bgcolor="#DDEEFF">
				         		<td>
						          <strong>Resoluciones &nbsp;</strong>
				        		</td>
								</tr>
							</table>
							
							<table width="100%">
				    		<tr>
								<td colspan="10"><display:table class="CFormDisplayTable" name='<%= asesoriaResolucion %>' id='<%= pageName %>'
									decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaResolucionDisplayWrapper">
									<display:column property="numero" title="Numero" headerClass="tableCellHeader" style="width: 300px;" />
									<display:column property="fecha" title="Fecha" headerClass="tableCellHeader" style="width: 80px;" />
									<display:column property="estado" title="Estado" headerClass="tableCellHeader" style="width: 80px;" />
									<display:column property="observacion" title="Observaciones" headerClass="tableCellHeader" style="width: 80px;" />
									<display:column property="archivoDescargar" title="Archivo" headerClass="tableCellHeader" style="width: 40%" />
								</display:table>
								</td>
							</tr>
						</table>
						
						
						
						
						<table width="100%">								
						<tr>
							<td class="CformDato">
							<logic:iterate id="idAsesoriaEntidad" property="asesoriaEntidad" name="formulario">
	    						<tr>
								 <td>
									<table width="100%" border="1">
										<tr bgcolor="#BFDFFF" >
										       <td align="center" width="100%">
												          <strong>Nro.Orden: &nbsp; <bean:write property="nroOrden" name="idAsesoriaEntidad"/></strong>
										        </td>
										 </tr>
									</table>
										<table width="100%">
										      <tr bgcolor="#DDEEFF">
											        <td>
													  <strong>Asesor&nbsp;</strong>
											        </td>
										      </tr>
									 </table>
																
									<table width="100%">
										 
										 <tr>
								             <td class="CformNombre" width="20%">
								            	Apellido y Nombre:
								            </td>
					                         <td class="CformDato" >
								                      <logic:notEmpty property="personaSvt" name="idAsesoriaEntidad">
														<logic:equal value="si" name="displayLinks">
																<input type="button" class=CformBotonTransp onclick="btnDetallePersona('<bean:write name="idAsesoriaEntidad" property="personaSvt.id" />')" 
						 										value="<bean:write name="idAsesoriaEntidad" property="personaSvt.apellido" />, &nbsp;<bean:write property="personaSvt.nombre" name="idAsesoriaEntidad"/>" />
														</logic:equal>
														<logic:equal value="no" name="displayLinks">
																<bean:write name="idAsesoriaEntidad" property="personaSvt.apellido" />, &nbsp;<bean:write property="personaSvt.nombre" name="idAsesoriaEntidad"/>												
														</logic:equal>
														</logic:notEmpty>
														<logic:empty property="personaSvt" name="idAsesoriaEntidad">
															<bean:write property="personaTexto" name="idAsesoriaEntidad"/>
														</logic:empty>
											 	</td>

				                         </tr>
				                         
				                     </table>    
				                    <table width="100%">
										      <tr bgcolor="#DDEEFF">
											        <td>
													  <strong>Detalle del asesoramiento&nbsp;</strong>
											        </td>
										      </tr>
									 </table>
				                     <table width="100%">    
										  <tr>
						                      <td class="CformNombre" width="20%">Descrición:</td>
						                      <td class="CformDato">
												      <bean:write property="descripcion" name="idAsesoriaEntidad"/>
						                      </td>
					                 	  </tr>
					                 	  <tr>
								                      <td class="CformNombre" width="20%">Impacto:</td>
								                      <td class="CformDato" >
								                          <bean:write property="impacto" name="idAsesoriaEntidad"/>
								                      </td>
						                  </tr>
										  <tr>
								                      <td class="CformNombre" width="20%">Mesa de Entradas:</td>
								                      <td class="CformDato"  >Fecha: 
												                         <bean:write name="idAsesoriaEntidad" property="fechaIngreso" format="dd/MM/yyyy" />
												                      	Actuación N°: <bean:write name="idAsesoriaEntidad"  property="actuacionMesaEntradas" />       
									                  </td>
							              </tr>
										  <tr>
							                      <td class="CformNombre" width="20%">Observaciones:</td>
							                      <td class="CformDato" >
												     <bean:write name="idAsesoriaEntidad"  property="observaciones" />
							              		  </td>
						                  </tr>
												                      
					                  </table>
									                 
									<table width="100%">
										      <tr bgcolor="#DDEEFF">
											        <td>
													  <strong>Lugar donde se realiza la asesoría&nbsp;</strong>
											        </td>
										      </tr>
									</table>
																
																
									<table width="100%">
										 <tr>					            
									            <td class="CformNombre" width="20%">
											            	Domicilio:
									            </td> 
									             <td class="CformDato"  >
								                          <bean:write name="idAsesoriaEntidad" property="domicilio"/>
						                    	 </td>
										</tr>
											
											 <tr>					            
											     <td class="CformNombre" width="20%">
											          	País:
											     </td> 
															            
											     <td class="CformDato"  >
											        <logic:notEmpty property="pais" name="idAsesoriaEntidad">
														<bean:write name="idAsesoriaEntidad" property="pais.descripcion"/>
													</logic:notEmpty>
												</td>
										</tr>
										 <tr>					            
											     <td class="CformNombre" width="20%">
											          	Provincia:
											     </td> 
															            
											     <td class="CformDato"  >
											        <logic:notEmpty property="provincia" name="idAsesoriaEntidad">
														<bean:write name="idAsesoriaEntidad" property="provincia.descripcion"/>
													</logic:notEmpty>
												</td>
										</tr>
											
											<logic:notEmpty property="lugarProvinciaTexto" name="idAsesoriaEntidad">
														 <tr>					            
													            <td class="CformNombre" width="20%">
																            	Provincia Carga Inicial:
													            </td> 
													             <td class="CformDato" >
													                          <bean:write name="idAsesoriaEntidad" property="lugarProvinciaTexto"  />
												               	 </td>
														</tr>
																	  
											  </logic:notEmpty>	
											 <tr>					            
									            <td class="CformNombre" width="20%">
										            	Partido:
									            </td> 
															            
									             <td class="CformDato"  >
										             <logic:notEmpty property="partido" name="idAsesoriaEntidad">
																		<bean:write name="idAsesoriaEntidad" property="partido.descripcion"/>
													</logic:notEmpty>
											
												</td>
											</tr>
											
											
																	
										 <tr>					            
									            <td class="CformNombre" width="20%">
												          	Localidad:
									            </td> 
									             <td class="CformDato">
															<logic:notEmpty property="localidad" name="idAsesoriaEntidad">
																<bean:write name="idAsesoriaEntidad" property="localidad.locDescrip"/>
															</logic:notEmpty>
												</td>
											</tr>
																																	
											<logic:notEmpty property="lugarLocalidadTexto" name="idAsesoriaEntidad">
												 <tr>					            
												           <td class="CformNombre" width="20%">
												            	Localidad Carga Inicial:
												           </td> 
												            <td class="CformDato" >
												                 <bean:write name="idAsesoriaEntidad" property="lugarLocalidadTexto"  />
												          	 </td>
												</tr>
											</logic:notEmpty>
											
									</table>
										
																
																																
								   <table width="100%">
									     <tr bgcolor="#DDEEFF">
									        <td>
									          <strong>Duración de la Actividad &nbsp;</strong>
									        </td>
									      </tr>
									</table>
																
									<table width="100%">
										<tr>
							                      <td class="CformNombre" width="20%">Fecha Inicio:</td>
							                      <td class="CformDato" width="25%">

								                      <logic:notEmpty property="fechaInicio" name="idAsesoriaEntidad" >
									                         <bean:write name="idAsesoriaEntidad"  property="fechaInicio" format="dd/MM/yyyy" />
									                  </logic:notEmpty>       
							                      </td>
							                      <td class="CformNombre"  width="25%">Fecha Finalización: </td>
							                    <td class="CformDato"  width="30%">
								                      <logic:notEmpty property="fechaFinalizacion" name="idAsesoriaEntidad">
										                          <bean:write name="idAsesoriaEntidad"  property="fechaFinalizacion" format="dd/MM/yyyy" />
										               </logic:notEmpty>           
							                    </td>
						                 	</tr>
							          </table>
									<bean:define id="asesoriaEntidadAnio" name="idAsesoriaEntidad" property="asesoriaEntidadAnio" />
									<table width="100%">
									      <tr>
									        <td colspan="10" >
													   <display:table sort="list" class="displayTable" defaultsort="1"  style="width: 100%" name='<%= asesoriaEntidadAnio %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
													          <display:column property="nroAño" title="Año" headerClass="tableCellHeader" style="width: 20%;" />
													           <display:column property="cantidadHoras" title="Cantidad Horas" headerClass="tableCellHeader" style="width: 80%;" />
													   </display:table>
									        </td>
									      </tr>
									</table>
									<bean:define id="asesoriaEntidadCampoAplicacion" name="idAsesoriaEntidad" property="asesoriaEntidadCampoAplicacion" />
									<bean:define id="asesoriaEntidadItemDistribucion" name="idAsesoriaEntidad" property="asesoriaEntidadItemDistribucion" />
								   <table width="100%">
										    <tr bgcolor="#DDEEFF">
										       <td>
										          <strong>Importe y Distribución de Fondos &nbsp;</strong>
										        </td>
										     </tr>
									</table>
									<table width="100%">
						                       <tr>					            
  								            	 <td class="CformNombre" width="20%">    	Importe&nbsp; </td> 
																																								
													<td class="CformDato" width="80%" >
												                <logic:notEmpty property="tipoMoneda" name="idAsesoriaEntidad">
														            <html:select  property="tipoMoneda.id" styleId="tipoMoneda"  name="idAsesoriaEntidad" disabled="true" >
					                 										<html:options collection="comboTipoMoneda" filter="false" property="value" labelProperty="label"  />
					                 								</html:select>
																</logic:notEmpty>
																<bean:write name="idAsesoriaEntidad"  property="montoFormateaMiles"  />
							                    	 </td>
												</tr>
									   </table>
									<table width="100%">
											  <tr>
											  	<td colspan="10" >
										           <display:table sort="list" class="displayTable" defaultsort="1"  style="width: 100%" name='<%= asesoriaEntidadItemDistribucion %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
										           <display:column property="distribucionTipoItemDescrip" title="Comisiones" headerClass="tableCellHeader" style="width: 40%;" />
										           <display:column property="distribucionPorcentaje" title="Porcentaje" headerClass="tableCellHeader" style="width: 30%;" />
										    	   <display:column property="distribucionImporte" title="Importe($)" headerClass="tableCellHeader" style="width: 30%;text-align: right" />
											       </display:table>
											   </td>
										    </tr>
									</table>
															
								   <table width="100%">
											  <tr bgcolor="#DDEEFF">
											      <td>
												          <strong>Campos de Aplicación &nbsp;</strong>
												   </td>
											   </tr>
									</table>
									<table width="100%">
															      <tr>
															        <td colspan="10" >
															         <display:table sort="list" class="displayTable" defaultsort="1"  style="width: 100%" name='<%= asesoriaEntidadCampoAplicacion %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
															            <display:column property="campoAplicacionId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
															            <display:column property="campoAplicacionDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />
															          </display:table>
															        </td>
															      </tr>
									</table>
									<bean:define id="asesoriaEntidadDisciplinaPrimaria" name="idAsesoriaEntidad" property="asesoriaEntidadDisciplinaPrimaria" />
															
									  <table width="100%">
										      <tr bgcolor="#DDEEFF">
										        <td>
												          <strong>Disciplinas Primarias &nbsp;</strong>
											        </td>
											      </tr>
									</table>
									<table width="100%">
										     <tr>
											    <td colspan="10" >
											        <display:table sort="list" class="displayTable" defaultsort="1"  style="width: 100%" name='<%= asesoriaEntidadDisciplinaPrimaria %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
															            <display:column property="disciplinaPrimariaId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
															            <display:column property="disciplinaPrimariaDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />
										
												          </display:table>
											        </td>
											      </tr>
										</table>

																
										<bean:define id="asesoriaEntidadDisciplinaDesagregada" name="idAsesoriaEntidad" property="asesoriaEntidadDisciplinaDesagregada" />
																
									   <table width="100%">
												  <tr bgcolor="#DDEEFF">
												        <td>
											          <strong>Disciplinas Desagregadas &nbsp;</strong>
												        </td>
												  </tr>
										</table>
										<table width="100%">
											      <tr>
											        <td colspan="10" >
												         <display:table sort="list" class="displayTable" defaultsort="1"  style="width: 100%" name='<%= asesoriaEntidadDisciplinaDesagregada %>' id='<%= pageName %>' decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
															            <display:column property="disciplinaDesagregadaId" title="Código" headerClass="tableCellHeader" style="width: 50%;" />
															            <display:column property="disciplinaDesagregadaDescripcion" title="Descripción" headerClass="tableCellHeader" style="width: 50%;" />
										
													       </display:table>
													   </td>
												   </tr>
										</table>
    								</td>
    							</tr>		
    							
    							
							</logic:iterate>
							</td>
						</tr>
						</table>							
							
					
					</td>
				 </tr>	
		</table>
    </td>
  </tr>
	
	
    <tr>
    
    
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value='<%= request.getParameter("formulario") %>' />
            <jsp:param name="entidad" value="asesoria" />
          </jsp:include>
        </div>
      </td>
    </tr>
      
</table> 


</logic:equal> 


