<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>
<capplication:isApplication application="SVT">
solapas = new Array('tab1','equiposStan','tab2','tab5','tab4');
/* solapas = new Array('tab1','masInfStan','tabGestor','tab2','tab3','tab4','tab5','tab8','equiposStan');*/
</capplication:isApplication>

<capplication:isApplication application="SVTP">
solapas = new Array('tab1','equiposStan','tab2','tab5','tab4');
/*solapas = new Array('tab1','masInfStan','tab2','tab3','tab5','tab8','equiposStan');*/
</capplication:isApplication>

function irTabFinal(){
  document.cStanModificarActionForm.tab.value=solapas[solapas.length-1];
  setupPanes("container", document.cStanModificarActionForm.tab.value);
}

function irTabInicial(){
  document.cStanModificarActionForm.tab.value=solapas[0];
  setupPanes("container", document.cStanModificarActionForm.tab.value);
}

function irTabAnterior(){
  var obj = document.cStanModificarActionForm.tab.value;
  for(i=1;i<solapas.length;i++){
    if ((solapas[i] == obj)) {
      document.cStanModificarActionForm.tab.value=solapas[i-1];
      /*if (solapas[i-1] == 'tab5')
        updateUnidadPrestacion();
      else*/ if (solapas[i-1] == 'tab8')
        return submitCostos();
      break;
    }  
  }  
  setupPanes("container", document.cStanModificarActionForm.tab.value);
}

function irTabSiguiente(){
  var obj = document.cStanModificarActionForm.tab.value;
  for(i=0;i<(solapas.length-1);i++){
    if ((solapas[i] == obj)) {
      document.cStanModificarActionForm.tab.value=solapas[i+1];
      /*if (solapas[i+1] == 'tab5')
        updateUnidadPrestacion();
      else*/ if (solapas[i+1] == 'tab8')
        return submitCostos();
      break;
    }  
  }  
  setupPanes("container", document.cStanModificarActionForm.tab.value);
}


window.onload=function(){
  setupPanes("container", document.cStanModificarActionForm.tab.value);
  updateUnidadPrestacion();
  <capplication:isApplication application="SVTP">
    marcarObligatorios();
  </capplication:isApplication>
}

$(document).ready(function() {
});


function setFoco(){
  x=event.keyCode
  if((x==13)){ // enter
    window.event.returnValue = false
  }
}

function updateUnidadPrestacion(){
    if ($('#comboUPrestacion').get(0).value != "-1" && $('#comboUPrestacion').get(0).value != "-2"
        && $('#comboUPrestacion').get(0).value != "-4"){
      var select = document.getElementById("comboUPrestacion");
      for(var i=0;i<select.options.length;i++){
        if(select.options[i].selected){
          $('#unidadPrestacionDescripcion').text(select.options[i].text);
        }
      }
    }
    //-4 es "Otros"
    else if ($('#comboUPrestacion').get(0).value == "-4"){
      if ($('#descripcionUPrestacion').get(0).value != ""){
          $('#unidadPrestacionDescripcion').text($('#descripcionUPrestacion').get(0).value);
        }
      else
        $('#unidadPrestacionDescripcion').text("");
    }
  }

function mostrarPanel(obj1, obj2){
  if(document.cStanModificarActionForm.tab.value != 'tab8' && obj2.id == 'tab8'){
    return submitCostos();
  }
  //esto es para actualizar la unidad de Prestacion en la solapa costos
  /*if(document.cStanModificarActionForm.tab.value != 'tab5' && obj2.id == 'tab5'){
    updateUnidadPrestacion();
  }*/
  document.cStanModificarActionForm.tab.value = obj2.id;
  return showPane(obj1, obj2);
}




function ComboSeleccionadoDP() {

for (m=document.cStanModificarActionForm.comboDisciplinaPrimariaM.options.length-1;m>0;m--){
  if(document.cStanModificarActionForm.comboDisciplinaPrimariaM.options[m].selected = false){
  document.cStanModificarActionForm.comboDisciplinaPrimariaM.options[m]=null;}
}
}

function habilitarCamposByDP(){

  if ((document.cStanModificarActionForm.principalDP.value == "-1") ||(document.cStanModificarActionForm.principalDP.value == "-2")) {
  document.cStanModificarActionForm.loteOtrosDP.disabled=true;
  document.cStanModificarActionForm.loteOtrosDP.className = 'CformTextDisabled';
  for (m=document.cStanModificarActionForm.loteOtrosDP.options.length-1;m>0;m--){
   document.cStanModificarActionForm.loteOtrosDP.options[m].selected = false;
  }

  }else {
  document.cStanModificarActionForm.loteOtrosDP.disabled=false;
  document.cStanModificarActionForm.loteOtrosDP.className = 'CformTextEnabled';
  }
}

function habilitarCamposByDD(){

  if ((document.cStanModificarActionForm.principalDD.value == "-1") ||(document.cStanModificarActionForm.principalDD.value == "-2")) {
    document.cStanModificarActionForm.loteOtrosDD.disabled=true;
    document.cStanModificarActionForm.loteOtrosDD.className = 'CformTextDisabled';
    for (m=document.cStanModificarActionForm.loteOtrosDD.options.length-1;m>0;m--){
   document.cStanModificarActionForm.loteOtrosDD.options[m].selected = false;
    }

  } else{
    document.cStanModificarActionForm.loteOtrosDD.disabled=false;
    document.cStanModificarActionForm.loteOtrosDD.className = 'CformTextEnabled';

  }
}


function habilitarCamposByCA(){

  if ((document.cStanModificarActionForm.principalCA.value == "-1") ||(document.cStanModificarActionForm.principalCA.value == "-2")) {
    document.cStanModificarActionForm.loteOtrosCA.disabled=true;
    document.cStanModificarActionForm.loteOtrosCA.className = 'CformTextDisabled';
    for (m=document.cStanModificarActionForm.loteOtrosCA.options.length-1;m>0;m--){
   document.cStanModificarActionForm.loteOtrosCA.options[m].selected = false;
    }

  } else{
    document.cStanModificarActionForm.loteOtrosCA.disabled=false;
    document.cStanModificarActionForm.loteOtrosCA.className = 'CformTextEnabled';
  }
}

function habilitarCamposByCO(){

  if ((document.cStanModificarActionForm.principalCO.value == "-1") ||(document.cStanModificarActionForm.principalCO.value == "-2")) {
    document.cStanModificarActionForm.loteOtrosCO.disabled=true;
    document.cStanModificarActionForm.loteOtrosCO.className = 'CformTextDisabled';
    for (m=document.cStanModificarActionForm.loteOtrosCO.options.length-1;m>0;m--){
   document.cStanModificarActionForm.loteOtrosCO.options[m].selected = false;
    }

  } else{
    document.cStanModificarActionForm.loteOtrosCO.disabled=false;
    document.cStanModificarActionForm.loteOtrosCO.className = 'CformTextEnabled';
  }
}


function habilitarCamposParaPatentes(obj){
  if (obj.value == "7" ) {
    document.cStanModificarActionForm.cip.disabled=false;
    document.cStanModificarActionForm.cip.className = 'CformTextEnabled';

  } else{
    document.cStanModificarActionForm.cip.value="";
    document.cStanModificarActionForm.cip.disabled=true;
    document.cStanModificarActionForm.cip.className ='CformTextDisabled';

  }
}

function agregarDecimales(obj) {
  var a = 0;
  var a = eval(obj.value);
  a = Math.round((a) * 100) / 100;
  a = a.toFixed(2);
  cStanModificarActionForm.costoOtraMoneda.value = a;
  return 1;
}

function habilitarPublicacionByHabilitados(obj){


	if (document.cStanModificarActionForm.rolUsuario.value!="DVH"){
		
	
		  <logic:iterate id="estadoTipoOferta"  property="estadosByTipoOferta" name="cStanModificarActionForm">
		    <bean:define id="EstadosTipoOfertaId" name="estadoTipoOferta" property="tipoEstado"/>
		    if ( obj.value == <bean:write name="EstadosTipoOfertaId" property="id" /> ){
		      if (<bean:write property="publicable" name="estadoTipoOferta" />){
		        document.cStanModificarActionForm.publica[0].disabled=false;
		        document.cStanModificarActionForm.publica[1].disabled=false;
		    }else {
		        document.cStanModificarActionForm.publica[0].checked=false;
		        document.cStanModificarActionForm.publica[0].disabled=true;
		        document.cStanModificarActionForm.publica[1].checked=true;
		      document.cStanModificarActionForm.publica[1].disabled=true;
		      }
		  }
		  </logic:iterate>

	}

}

function controlAcumulado() {
  var totalAsignadoMap = 0;

  for(i=0;i<document.cStanModificarActionForm.elements.length;i++) {
      if (cStanModificarActionForm.elements[i].name.match(/importeAMapped/)){
        if (cStanModificarActionForm.elements[i].value == "" ){
        }
        else {
         var a = 0;
         a = eval(cStanModificarActionForm.elements[i].value);
         a = Math.round((a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) /100;
         a = a.toFixed(0);
         cStanModificarActionForm.elements[i].value = a;
        }
      }
  }
  totalAsignadoMap = totalAsignadoMap.toFixed(0);
  cStanModificarActionForm.importeTotalInventores.value = totalAsignadoMap;
  return 1;
}

function submitCostos(){
  document.cStanModificarActionForm.action = 'cStanModificarAction.do?accion=validarCostos';
  document.cStanModificarActionForm.submit();
}

function submitCostosCfm(){
  document.cStanModificarActionForm.action = 'cStanModificarAction.do?accion=validarCostosEnCfm';
  document.cStanModificarActionForm.submit();
}


function habilitarDescripcion(){
  if (document.cStanModificarActionForm.unidadPrestacion.value != "-4")  {
    document.cStanModificarActionForm.descripcionUnidadPrestacion.value = "";
    document.cStanModificarActionForm.descripcionUnidadPrestacion.disabled = true;
    document.cStanModificarActionForm.descripcionUnidadPrestacion.className = 'CformTextDisabled';
  }
  else{
    document.cStanModificarActionForm.descripcionUnidadPrestacion.disabled=false;
    document.cStanModificarActionForm.descripcionUnidadPrestacion.className = 'CformTextEnabled';
  }
}

function marcarObligatorios(){
  var asterisco = "<span class=\"dato_obligatorio\">*</span>";
  var msgObligatorios = "<td width=\"200\" class=\"CformAreaBotones\"><div align=\"left\" class=\"dato_obligatorio\">* Datos obligatorios </div></td>";
  $('#dispPrimariaPpal').append(asterisco);
  $('#dispDesagregadaPpal').append(asterisco);
  $('#campoAplicPpal').append(asterisco);
  $('#activIndPpal').append(asterisco);
  $('#areaBotonesInfTecnologica').prepend(msgObligatorios);  
  $('#pClave1').append(asterisco);
  $('#pClave2').append(asterisco);
  $('#pClave3').append("&nbsp;&nbsp;");
  $('#pClave4').append("&nbsp;&nbsp;");
  $('#pClave5').append("&nbsp;&nbsp;");
  $('#areaBotonesPClaves').prepend(msgObligatorios);
}

</script>

<br>
<h1 align="center" class="titulo">
  Modificaci&oacute;n de Oferta Tecnol&oacute;gica
</h1>
<html:form action="cStanModificarAction.do" method="POST">
  <html:hidden property="tab" />
  <html:hidden property="publicable" />
  <html:hidden property="accion" />
  <html:hidden property="rolUsuario" />
  <html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_autorizacion,id_fecha_resolucion"/>
  <bean:define id="responsablesTecnicos" name="cStanModificarActionForm" property="responsablesTecnicos" />
  
  
  <logic:equal property="accion" value="modificar" name="cStanModificarActionForm">

    <div class="tab-container" id="container">
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin" >
        <tr>
          <td>
            <ul class="tabs">
            
                <li><a href="#" onClick="return mostrarPanel('tema', this)" id="tab1">Stan</a></li>
           		<li><a href="#" onClick="return mostrarPanel('equipos', this)" id="equiposStan">Equipamientos</a></li>
           		<li><a href="#" onClick="return mostrarPanel('informacionTecnologica', this)" id="tab2">Inf.Tecnológica</a></li>
           		<li><a href="#" onClick="return mostrarPanel('costos', this)" id="tab5">Costos</a></li>
           		<li><a href="#" onClick="return mostrarPanel('resolucion', this)" id="tab4">Seguimiento</a></li>
            
            </ul>
          </td>
        </tr>
      </table>

      <div>
        <!--tab1-->
        <div id="tema">
          <table align="center" class="tablaMin">
            <tr>
              <td  class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cStanModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cStanModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cStanModificarActionForm"   onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cStanModificarActionForm"   onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center"  >
			<tr>
        	 <td>
            	<table width="100%">
				   <tr>
				         <td class="CformNombre" width="150">
				           Es Servicio:&nbsp;&nbsp;
				         </td>
				         <td class="CformDato">
				           <html:radio property="tipo" value="ST" disabled="true" />
				         </td>
				         <td class="CformNombre" width="150">
				           Es Asesoramiento:&nbsp;&nbsp;
				         </td>
				         <td class="CformDato">
				           <html:radio property="tipo" value="AINS" disabled="true" />
				         </td>
			       </tr>
			     </table>
			 </td>
			</tr>

            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Prestador:&nbsp;<span class="dato_obligatorio">*</span></td>
                  </tr>
                </table>
                <logic:notEmpty property="prestadorLote" name="cStanModificarActionForm">
                 <table width="100%">
                  <tr>
                   <td colspan="10">
                     <display:table name="sessionScope.cStanModificarActionForm.prestadorLote" style="width:100%" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
                       <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" />
                       <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                       <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                       <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                     </display:table>
                    </td>
                  </tr>
                 </table>
                </logic:notEmpty>
                <logic:empty property="prestadorLote" name="cStanModificarActionForm">
                <table width="100%">
                  <tr>
                   <td>No se seleccionó prestador&nbsp;</td>
                  </tr>
                 </table>
                </logic:empty>
              </td>
            </tr>
            <capplication:isApplication application="SVT">
              <tr>
                <td>
                  <table width="100%">
                    <tr>
                      <td class="CformAreaBotones">
                        <div align="right">
                          <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </capplication:isApplication>
            <capplication:isApplication application="SVTP">
              <logic:equal value="N" property="prestadorBloqueado" name="cStanModificarActionForm">
                <tr>
                  <td>
                    <table width="100%">
                      <tr>
                        <td class="CformAreaBotones" >
                          <div align="right">
                            <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
                          </div>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </logic:equal>
            </capplication:isApplication>

            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>STAN</td>
                  </tr>
                </table>
                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="150">
                      Título:
                      <span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:textarea property="descripcion" rows="3" onkeydown="setFoco()" />
                    </td>
                  </tr>
                  
                  <tr>
                    <td class="CformNombre" width="150">
                      Prestación:&nbsp;&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:textarea property="prestacionDescripcion" rows="3" />
                    </td>
                  </tr>
                </table>
                
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Especificación&nbsp;</td>
                  </tr>
                </table>
                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="150">Detalle STAN:&nbsp;<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato">
                      <html:textarea property="detalle" rows="3" />
                    </td>
                  </tr>


                  <tr>
                    <td class="CformNombre" width="150">Detalle Prestación:&nbsp;</td>
                    <td class="CformDato">
                      <html:textarea property="prestacionDetalle" rows="3" />
                    </td>
                  </tr>

                  <tr>
                    <td class="CformNombre" width="150">
                      Metodología:&nbsp;<span class="dato_obligatorio">(1)</span>
                    </td>
                    <td class="CformDato">
                      <html:textarea property="especificacionMetodologia" rows="6" />
                    </td>
                  </tr>
                  
                 

				<tr>
					<td colspan="10">
						<table width="100%">
							<tr bgcolor="#DDEEFF">
								<td><strong>Responsables Técnicos:</strong></td>
							</tr>
							<tr>
								<td width="100%">
									<display:table style="width='100%'" 
										class="CFormDisplayTable"
										name='<%= responsablesTecnicos %>'
										decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
										<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
										<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
										<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
										<display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />																									
										<display:column property="remove" title="Acción" headerClass="tableCellHeader" style="width: 10px;" />
										<display:footer>
											<tr style="background-color: #FAFAFA;">
												<td style="text-align: right; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 100px;"
													colspan="2">Ingresar Nuevo:</td>
												<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 300px;"
													colspan="1">
													<capplication:autoComplete tipoAutocomplete="responsableTecnico" actionIngresarNuevo="altaResponsableTecnico" tipoAction="BtnSubmit" />
												</td>
												<td style="text-align: left; border-color: #CCCCCC; border-style: solid; border-width: 1px; width: 200px;"
													colspan="2">
													<html:submit style="width:170px;" property="btnSubmit" value="Agregar Responsable Tecnico" styleClass="CformBoton" />
												</td>
											</tr>
										</display:footer>
									</display:table></td>
							</tr>
						</table>
					</td>
				</tr>
	               <logic:notEmpty property="responsable" name="cStanModificarActionForm" > 
	                  <tr>
	                    <td class="CformNombre" width="150">Resp.Técnico Texto:&nbsp;&nbsp;</td>
	                    <td class="CformDato">
	                      <bean:write property="responsable" name="cStanModificarActionForm" />
	                    </td>
	                  </tr>
                  </logic:notEmpty>          


	               <tr>
	                  <td class="CformNombre" width="150">Unidad de Prestación:&nbsp;<span class="dato_obligatorio">*</span></td>
	                  <td class="CformDato">
	                    <html:select styleId="comboUPrestacion" disabled="false" property="unidadPrestacion" onchange="habilitarDescripcion(),updateUnidadPrestacion()">
	                      <html:options collection="comboUnidadPrestacion" property="value" labelProperty="label" />
	                    </html:select>
	                    &nbsp;  
	                    <html:text styleId="descripcionUPrestacion" size="30" property="descripcionUnidadPrestacion" maxlength="30" onchange="updateUnidadPrestacion()"/>
	
	                  </td>
	               </tr>

                  <tr>
                    <td class="CformNombre" width="150">
                      Capacidad Operativa:&nbsp;&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="capacidadOperativa" maxlength="30" size="58" />
                    </td>
                  </tr>


	               <tr>
	                <td class="CformNombre" width="150">Cantidad Mínima:&nbsp;&nbsp;</td>
	                  <td colspan="100%" class="CformDato">
	                     <html:text  size="12" property="cantidadMinima" maxlength="10" onkeypress="validarImporte(this)"/>
	                  </td>
	               </tr>
		         </table>            
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%">
                  <tr>
                    <td width="60%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">
                        * Datos obligatorios
                      </div>
                    </td>
                    <td width="40%" class="CformAreaBotones">
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table  align="center" cellpadding="0" cellspacing="0" class="tablaMin">
 		 	<tr>
        		<td ><span class="dato_obligatorio">(1)</span>
      				Si existe prestación en el STAN la metodología deberá referirse a dicha prestación. Caso contrario será del STAN.
          		</td>
      		</tr>	
   		 </table>

          
          
        </div>


        <!--tab2  -INFORMACION TECNOLOGICA-->

        <div id="informacionTecnologica">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cStanModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cStanModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cStanModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Disciplina Primaria&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" id="dispPrimariaPpal" width="55">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="principalDP" onchange="habilitarCamposByDP()">
                        <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalDP" name="cStanModificarActionForm">
                        <html:select disabled="true" property="loteOtrosDP" multiple="true" size="3" onchange="habilitarCamposByDP()">
                          <html:options collection="comboDisciplinaPrimariaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalDP" name="cStanModificarActionForm">
                        <html:select disabled="false" property="loteOtrosDP" multiple="true" size="3" onchange="habilitarCamposByDP()">
                          <html:options collection="comboDisciplinaPrimariaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="caratula_texto"> <img src="./imagenes/ico_file_pdf.png">
                      <a target="_blank" href="./manuales/ListadoCodigosDisciplinasPrimarias.pdf"/>
                       PDF
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Disciplina Desagregada&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="55" id="dispDesagregadaPpal">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="principalDD" onchange="habilitarCamposByDD()">
                        <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalDD" name="cStanModificarActionForm">
                        <html:select disabled="true" property="loteOtrosDD" multiple="true" size="3" onchange="habilitarCamposByDD()">
                          <html:options collection="comboDisciplinaDesagregadaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalDD" name="cStanModificarActionForm">
                        <html:select disabled="false" property="loteOtrosDD" multiple="true" size="3" onchange="habilitarCamposByDD()">
                          <html:options collection="comboDisciplinaDesagregadaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>

                    </td>
                  </tr>
                  <tr>
		                <td class="caratula_texto"> <img src="./imagenes/ico_file_pdf.png">
		                  <a target="_blank" href="./manuales/ListadoCodigosDisciplinasDesagregadas.pdf"/>
		                  PDF
		                </td>
		              </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Campo Aplicación&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="55" id="campoAplicPpal">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="principalCA" onchange="habilitarCamposByCA()">
                        <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalCA" name="cStanModificarActionForm">
                        <html:select disabled="true" property="loteOtrosCA" multiple="true" size="3" onchange="habilitarCamposByCA()">
                          <html:options collection="comboCampoAplicacionM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalCA" name="cStanModificarActionForm">
                        <html:select disabled="false" property="loteOtrosCA" multiple="true" size="3" onchange="habilitarCamposByCA()">
                          <html:options collection="comboCampoAplicacionM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
		                <td class="caratula_texto"> <img src="./imagenes/ico_file_pdf.png">
		                  <a target="_blank" href="./manuales/ListadoCodigosAplicacion.pdf"/>
		                 PDF
		                </td>
		              </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Actividades Industriales&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="55" id="activIndPpal">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="principalCO" onchange="habilitarCamposByCO()">
                        <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" filter="false"/>
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalCO" name="cStanModificarActionForm">
                        <html:select disabled="true" property="loteOtrosCO" multiple="true" size="3" onchange="habilitarCamposByCO()">
                          <html:options collection="comboClasificacionOnuM" property="value" labelProperty="label" filter="false"/>
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalCO" name="cStanModificarActionForm">
                        <html:select disabled="false" property="loteOtrosCO" multiple="true" size="3" onchange="habilitarCamposByCO()">
                          <html:options collection="comboClasificacionOnuM" property="value" labelProperty="label" filter="false"/>
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="caratula_texto"> <img src="./imagenes/ico_file_pdf.png">
                      <a target="_blank" href="./manuales/ListadoCodigosActividadesIndustriales.pdf"/>
                      PDF
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Palabras Claves&nbsp;</td>
                  </tr>
                </table>

                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="55" id="pClave1">1ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave1" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55" id="pClave2">2ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave2" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55" id="pClave3">3ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave3" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55" id="pClave4">4ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave4" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55" id="pClave5">5ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave5" maxlength="40" size="40" />
                    </td>
                  </tr>
                </table>
              
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%">
                  <tr id="areaBotonesInfTecnologica">
                    <td class="CformAreaBotones">
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td>
                Atención: Para seleccionar más de un ítem en "Otras" presionar CTRL+Botón izquierdo del mouse
              </td>
            </tr>
            <tr>
              <td>
                <b> Futuros clientes realizaran búsquedas en base a estos campos, cuanta más información coloque mejor promovida estará su OT</b>
              </td>
            </tr>
          </table>
        </div>




        <div id="resolucion">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cStanModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cStanModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cStanModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
              <capplication:isApplication application="SVT">
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Expediente</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="125" align="left">
                      Nro:
                    </td>
                    <td class="CformDato">
                      <html:text size="6" property="expedienteNro" maxlength="6" onkeypress="validarNumero()" />/
                      <html:text size="4" property="expedienteAnio" maxlength="4" onkeypress="validarNumero()" />
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Autorización&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="125">
                      Fecha:&nbsp;<span class="dato_obligatorio">(1)</span>
                    </td>
                    <td class="CformDato">
                      <html:text styleId="id_fecha_autorizacion" property="fechaAutorizacion" maxlength="10" size="10" onkeypress="validarNumero()"/>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Resolución&nbsp;</td>
                  </tr>
                </table>
                <table>
                  <tr>
                    <td class="CformNombre" width="125">
                      Tipo:&nbsp;<span class="dato_obligatorio">(1)</span>
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="resolucionTipo">
                        <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                    <td class="CformNombre">Nro:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="resolucionNro" maxlength="6" size="6" onkeypress="validarImporte(this)" />
                    </td>
                  </tr>
                </table>
                <table>
                  <tr>
                    <td class="CformNombre" width="125">Fecha:&nbsp;</td>
                    <td class="CformDato">
                      <html:text styleId="id_fecha_resolucion" property="fechaResolucion" maxlength="10" size="10" onkeypress="validarNumero()"/>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="125">Estado:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="resolucionEstado">
                        <html:options collection="comboEstadoResolucion" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                </table>
				</capplication:isApplication>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Situación actual&nbsp;</td>
                  </tr>
                </table>
                <table>
                  <tr>
                    <td class="CformNombre" width="125">
                      Estado:&nbsp;<span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="tipoEstado" onchange="habilitarPublicacionByHabilitados(this)">
                        <html:options collection="comboEstadosByTipoOferta" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <capplication:isApplication application="SVT">
                  <tr>
                    <td class="CformNombre" width="125">Publicación Web:</td> 
                   <logic:notEqual value="DVH" property="rolUsuario" name="cStanModificarActionForm">
                 
                    <logic:equal value="S" property="publicable" name="cStanModificarActionForm">
                      <td class="CformDato">
                        Sí<html:radio property="publica" value="S" />
                        No<html:radio property="publica" value="N" />
                      </td>
                    </logic:equal>
                    <logic:equal value="N" property="publicable" name="cStanModificarActionForm">
                      <td class="CformDato">
                        Sí<html:radio property="publica" value="S" disabled="true" />
                        No<html:radio property="publica" value="N" disabled="true" />
                      </td>
                    </logic:equal>
					</logic:notEqual>
	                <logic:equal value="DVH" property="rolUsuario" name="cStanModificarActionForm">
	                       <td class="CformDato">
	                          Sí
	                           <html:radio property="publica" value="S" disabled="true" />
	                          No
	                          <html:radio property="publica" value="N" disabled="true" />
	                        </td>
				    </logic:equal>	


                    <html:hidden property="publica" />
                  </tr>
                  </capplication:isApplication>
				</table>                
                
                
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%" >
                  <tr>
                    <td width="50%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">
                        * Datos obligatorios
                      </div>
                    </td>
                    <td width="50%" class="CformAreaBotones">
                      <div align="right">
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />

                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <capplication:isApplication application="SVT">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td>
                <span class="dato_obligatorio">(1)</span> Si el estado del STAN es "Aprobado" o "Denegado" los datos de la Resolución son obligatorios.  Si el estado es "Autorizado" la fecha de
                autorización es obligatoria.
              </td>
            </tr>
          </table>
    	</capplication:isApplication>
        </div>
	

        <!--tab5 - -->

        <div id="costos">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cStanModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cStanModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cStanModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          
            <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
   
           <tr>
          <td>
            <table width="100%">
               <tr bgcolor="#DDEEFF">
                 <td>Costos:&nbsp;<span class="dato_obligatorio">*</span>
                 
                 (Unidad de Prestación:&nbsp;<div id="unidadPrestacionDescripcion" style="display: inline;"></div>)
                 
                 </td>
               </tr>
            </table>


           <logic:notEmpty property="stanCostos" name="cStanModificarActionForm">

            <table width="100%" >
                    <tr>
                <td colspan="10">
                  <display:table id="stanModificar" name="sessionScope.cStanModificarActionForm.stanCostos" style="width:100%" requestURI="cStanModificarAction.do"   decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
                   <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 80px;"/>
                   <display:column property="fechaDesde" title="Vigencia Desde" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
                   <display:column property="fechaHasta" title="Vigencia Hasta" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
                   <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
                    </display:table>
                </td>
              </tr>
      </table>
          </logic:notEmpty>
           <logic:empty property="stanCostos" name="cStanModificarActionForm">
             <tr >
               <td>No se informaron costos&nbsp;</td>
             </tr>
          </logic:empty>


       </td>
      </tr>

      <tr>
    <td>
      <table width="100%">
		    <tr>
		      <td class="CformAreaBotones" >
		              <div align="right" >
		                 <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
		             </div>
		     </td>
		    </tr>
      </table>
         </td>
      </tr>
    <tr>
      <td>
        <table width="100%"  >
          <tr>
            <td width="40%" class="CformAreaBotones" >
              <div align="left" class="dato_obligatorio">* Datos obligatorios </div>
            </td>
            <td width="60%" class="CformAreaBotones">
              <div align="right" >
                <input type="button" class="CformBoton" value="Siguiente" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                <!-- html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/-->
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

    <div id="equipos">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin" >
            <tr>
              <td  class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cStanModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cStanModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cStanModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Equipamientos:&nbsp;</td>
                  </tr>
                </table>
                <logic:notEmpty property="equipos" name="cStanModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cStanModificarActionForm.equipos" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                          <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                          <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                          <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                        
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="equipos" name="cStanModificarActionForm">
                  <tr>
                    <td>No se seleccionaron equipamientos&nbsp;</td>
                  </tr>
                </logic:empty>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%" >
                  <tr>
                    <td class="CformAreaBotones" >
                      <div align="right">
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%" >
                  <tr>
                    <td width="40%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">&nbsp;</div>
                    </td>
                    <td width="60%" class="CformAreaBotones">
                      <div align="right">
		                <input type="button" class="CformBoton" value="Siguiente" name="cStanModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>

      </div>
    </div>
  </logic:equal>
<script>
  habilitarDescripcion();
</script>


  <!--  CONFIRMACION -->

  <logic:equal property="accion" value="modificarCfm" name="cStanModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>STAN&nbsp;</strong>
                    </td>
                  </tr>
                </table>
               
                <table width="100%">
                  <logic:notEmpty property="codigoId" name="cStanModificarActionForm"> 
                  <tr>
                    <td class="CformNombre" width="130">
                      Código:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="codigoId" />
                    </td>
                  </tr>
                  </logic:notEmpty>
				  <tr>

				   <tr>
				         <td class="CformNombre" width="150">
				           Es Servicio:&nbsp;&nbsp;
				         </td>
				         <td class="CformDato">
				           <html:radio property="tipo" value="ST" disabled="true" />
				         </td>
				         <td class="CformNombre" width="150">
				           Es Asesoramiento:&nbsp;&nbsp;
				         </td>
				         <td class="CformDato">
				           <html:radio property="tipo" value="AINS" disabled="true" />
				         </td>
			       </tr>
			   
                  <tr>
                    <td class="CformNombre" width="130">
                      Título:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="descripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="130">
                      Prestación:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="prestacionDescripcion" />
                    </td>
                  </tr>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Prestador &nbsp;</strong>
                    </td>
                  </tr>
                </table>
                   <logic:notEmpty property="prestador" name="cStanModificarActionForm">
	                 <table width="100%">
	                  <tr>
	                   <td colspan="10">
	                     <display:table name="sessionScope.cStanModificarActionForm.prestadorLote" style="width:100%" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
	                       <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
	                       <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
	                       <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
	                     </display:table>
	                    </td>
	                  </tr>
	                 </table>
                  
<!--                <table width="100%">
                    <tr>
                      <td class="CformNombre" width="125">Descripción:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write property="prestador.entidad.descripcion" name="cStanModificarActionForm" />
                    </td>
                    </tr>
                  </table>
-->
                </logic:notEmpty>  
                <logic:empty property="prestador" name="cStanModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td class="CformNombre" width="100">Prestador&nbsp;<span class="dato_obligatorio">*</span></td>
                      <td>No se seleccionó prestador&nbsp;</td>
                    </tr>
                  </table>
                </logic:empty>
                   
                
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Especificación&nbsp;</strong>
                    </td>
                  </tr>
                </table>

                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="130">
                      Detalle STAN:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="detalle" />
                    </td>
                  </tr>

                  <tr>
                    <td class="CformNombre" width="130">
                      Detalle Prestación:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="prestacionDetalle" />
                    </td>
                  </tr>

                  <tr>
                    <td class="CformNombre" width="130">
                      Metodología:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="especificacionMetodologia" />
                    </td>
                  </tr>

					<tr>
						<td colspan="10">
							<table width="100%">
								<tr bgcolor="#DDEEFF">
									<td><strong>Responsables Técnicos:</strong></td>
								</tr>
								<tr>
									<td colspan="10">
										<display:table class="CFormDisplayTable" name='<%= responsablesTecnicos %>'
												decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
											<display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 10px;" />
											<display:column property="apellido" title="Apellido" headerClass="tableCellHeader" />
											<display:column property="nombre" title="Nombre" headerClass="tableCellHeader" />
											<display:column property="documentacion" title="Documentación" headerClass="tableCellHeader" />											
										</display:table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				  <logic:empty name="cStanModificarActionForm" property="responsablesTecnicos"  > 
					  <logic:notEmpty name="cStanModificarActionForm" property="responsable"  > 
		                  <tr>
		                    <td class="CformNombre" width="130">
		                      Resp.Técnico Texto:&nbsp;
		                    </td>
		                    <td class="CformDato">
		                      <bean:write name="cStanModificarActionForm" property="responsable" />
		                    </td>
		                  </tr>
					  </logic:notEmpty>					  
				  </logic:empty>
         		  <tr>
                     <td class="CformNombre" width="130">Unidad de Prestación:&nbsp;</td>
                     <td class="CformDato">
                       <html:select disabled="true" property="unidadPrestacion" >
                         <html:options collection="comboUnidadPrestacion" property="value" labelProperty="label"/>
                       </html:select>
                       <logic:equal value="-4" property="unidadPrestacion" name="cStanModificarActionForm">
                         <bean:write name="cStanModificarActionForm" property="descripcionUnidadPrestacion"/>
                       </logic:equal>
                     </td>
	             </tr>

                  <tr>
                    <td class="CformNombre" width="130">
                      Capacidad Operativa:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="capacidadOperativa" />
                    </td>
                  </tr>


	             <tr>          
		           <td class="CformNombre" width="130">Cantidad Mínima:&nbsp;</td>
	                 <td class="CformDato">
		                     <bean:write name="cStanModificarActionForm" property="cantidadMinima"/>
	                 </td>
	             </tr>
		      </table>

                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Equipamientos&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="equipos" name="cStanModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cStanModificarActionForm.equipos" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                          <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                          <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                          <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                        
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="equipos" name="cStanModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionaron equipamientos&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>


                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Información Tecnológica&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Disciplina Primaria&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalDP" name="cStanModificarActionForm">
                        <html:select disabled="true" property="principalDP">
                          <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosDP" name="cStanModificarActionForm">
                        <html:select  property="loteOtrosDPVista" multiple="true" size="3">
                          <html:options collection="comboDisciplinaPrimariaC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Disciplina Desagregada&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalDD" name="cStanModificarActionForm">
                        <html:select disabled="true" property="principalDD">
                          <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosDD" name="cStanModificarActionForm">
                        <html:select property="loteOtrosDDVista" multiple="true" size="3">
                          <html:options collection="comboDisciplinaDesagregadaC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Campo de Aplicación&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalCA" name="cStanModificarActionForm">
                        <html:select disabled="true" property="principalCA">
                          <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosCA" name="cStanModificarActionForm">
                        <html:select property="loteOtrosCAVista" multiple="true" size="3">
                          <html:options collection="comboCampoAplicacionC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Actividades Industriales&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalCO" name="cStanModificarActionForm">
                        <html:select disabled="true" property="principalCO">
                          <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosCO" name="cStanModificarActionForm">
                        <html:select property="loteOtrosCOVista" multiple="true" size="3">
                          <html:options collection="comboClasificacionOnuC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Palabras Claves&nbsp;</strong>
                    </td>
                  </tr>
                </table>

                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">1ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="palabraClave1" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">2ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="palabraClave2" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">3ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="palabraClave3" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">4ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="palabraClave4" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">5ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cStanModificarActionForm" property="palabraClave5" />
                    </td>
                  </tr>
                </table>

    	        <table width="100%">
	                <tr bgcolor="#BFDFFF">
	                  <td><strong>Costos&nbsp;</strong></td>
	                </tr>
	            </table>

		        <logic:notEmpty property="stanCostos" name="cStanModificarActionForm">
	
		            <table width="100%" >
		                    <tr>
		                <td colspan="10">
		                  <display:table name="sessionScope.cStanModificarActionForm.stanCostosCfm" style="width:100%" requestURI="cStanModificarAction.do"   decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
		                   <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 80px;"/>
		                   <display:column property="fechaDesde" title="Vigencia Desde" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
		                   <display:column property="fechaHasta" title="Vigencia Hasta" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
		                   <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
		                    </display:table>
		                </td>
		              </tr>
		      		</table>
	          	</logic:notEmpty>
	           	<logic:empty property="stanCostos" name="cStanModificarActionForm">
		             <tr >
		               <td>No se informaron costos&nbsp;</td>
		             </tr>
	          	</logic:empty>


                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Seguimiento &nbsp;</strong>
                    </td>
                  </tr>
                </table>

                <table width="100%">
	              	<capplication:isApplication application="SVT">
	
	                  <tr>
	                    <td class="CformNombre" width="130">
	                      Expediente Nro:&nbsp;
	                    </td>
	                    <logic:notEmpty property="expedienteNro" name="cStanModificarActionForm">
	                      <td class="CformDato">
	                        <bean:write name="cStanModificarActionForm" property="expedienteNro" />/
	                        <bean:write name="cStanModificarActionForm" property="expedienteAnio" />
	                      </td>
	                    </logic:notEmpty>
	                  </tr>
	                  <tr>
	                    <td class="CformNombre" width="130">Fecha Autorización:&nbsp;</td>
	                    <td class="CformDato">
	                      <logic:notEmpty property="fechaAutorizacion" name="cStanModificarActionForm">
                            <bean:write name="cStanModificarActionForm" property="fechaAutorizacion" />
                        </logic:notEmpty>
	                    </td>
	                  </tr>
	                  <tr>
	                    <td class="CformNombre" width="130">Resolución:&nbsp;</td>
	                    <td class="CformDato">
	                      <logic:notEmpty property="resolucionNro" name="cStanModificarActionForm">Tipo:&nbsp;
	                        <html:select disabled="true" property="resolucionTipo">
	                          <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
	                        </html:select>&nbsp;
	                        Nro: <bean:write name="cStanModificarActionForm" property="resolucionNro" />
	                      </logic:notEmpty>
	                      <logic:notEmpty property="fechaResolucion" name="cStanModificarActionForm"> &nbsp;&nbsp;
                            <bean:write name="cStanModificarActionForm" property="fechaResolucion" /> 
                        </logic:notEmpty>
	                     <logic:greaterThan value="-1" property="resolucionEstado" name="cStanModificarActionForm">
	                        <html:select disabled="true" property="resolucionEstado">
	                          <html:options collection="comboEstadoResolucion" property="value" labelProperty="label" />
	                        </html:select>
	                      </logic:greaterThan>
	                    </td>
	                  </tr>
	               </capplication:isApplication>
                  <tr>
                    <td class="CformNombre" width="130">
                      Estado:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipoEstado">
                        <html:options collection="comboTipoEstado" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <capplication:isApplication application="SVT">
	                  <tr>
	                    <td class="CformNombre" width="130">Publicar:</td>
	                    <td class="CformDato">
	                      Sí<html:radio property="publica" value="S" disabled="true" />
	                      No<html:radio property="publica" value="N" disabled="true" />
	                      <html:hidden property="publica" />
	                    </td>
	                  </tr>
                 </capplication:isApplication> 
                </table>


              </td>
            </tr>
         
      <tr>
        <td class="CformAreaBotones" height="35">
          <div align="right">
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
          </div>
        </td>
      </tr>
         
         
         
          </table>
        </td>
      </tr>
    </table>
  </logic:equal>

</html:form>

