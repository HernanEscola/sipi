<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<script>

$(document).ready(
		function(){
			setupPanes("container", document.cPropiedadActionForm.cambiaPanel.value);
			//seteo al campo de porcentaje de titularidad para que lo maneje como numero
			var inputPorcentajeTit = new CInputNumero(true);
			inputPorcentajeTit.bind("*[id^='titularPorcentajeMapped_']");
			var inputPorcentajePart = new CInputNumero(true);
			inputPorcentajePart.bind("*[id^='participacionPorcentajeMapped_']");
			
		}
);

/***********************************************
* Textarea Maxlength script- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/
/**la invoco en textarea con -> onkeyup="isMaxLength(this,500)"  */
function isMaxLength(ta,maxlength){
	var mlength = parseInt(maxlength);
	if (ta.getAttribute && ta.value.length>mlength){
		alert('el límite son 500 caracteres.');
		ta.value=ta.value.substring(0,mlength);
	}
}

function setFoco(){
x=event.keyCode 
//alert(x)
if((x==13)){ // enter
window.event.returnValue = false
}
}

function irA(obj){
document.cPropiedadActionForm.cambiaPanel.value=obj;
setupPanes("container", document.cPropiedadActionForm.cambiaPanel.value);
}

function mostrarPanel(obj1, obj2){
  document.cPropiedadActionForm.cambiaPanel.value = obj2.id;
  return showPane(obj1, obj2);
}

function habilitarCamposByDP(){
  if ((document.cPropiedadActionForm.principalDP.value == "-1") ||(document.cPropiedadActionForm.principalDP.value == "-2")) {
	document.cPropiedadActionForm.disciplinaPrimaria.disabled=true;
	document.cPropiedadActionForm.disciplinaPrimaria.className = 'CformTextDisabled';
	for (m=document.cPropiedadActionForm.disciplinaPrimaria.options.length-1;m>0;m--){
	document.cPropiedadActionForm.disciplinaPrimaria.options[m].selected = false;
	}

  }else {
	document.cPropiedadActionForm.disciplinaPrimaria.disabled=false;
	document.cPropiedadActionForm.disciplinaPrimaria.className = 'CformTextEnabled';
  }
}

function habilitarCamposByDD(){
  if ((document.cPropiedadActionForm.principalDD.value == "-1") ||(document.cPropiedadActionForm.principalDD.value == "-2")) {
    document.cPropiedadActionForm.disciplinaDesagregada.disabled=true;
    document.cPropiedadActionForm.disciplinaDesagregada.className = 'CformTextDisabled';
    for (m=document.cPropiedadActionForm.disciplinaDesagregada.options.length-1;m>0;m--){
	document.cPropiedadActionForm.disciplinaDesagregada.options[m].selected = false;
    }

  } else{
    document.cPropiedadActionForm.disciplinaDesagregada.disabled=false;
    document.cPropiedadActionForm.disciplinaDesagregada.className = 'CformTextEnabled';

  }
}

function habilitarCamposByCO(){
  if ((document.cPropiedadActionForm.principalCO.value == "-1") ||(document.cPropiedadActionForm.principalCO.value == "-2")) {
    document.cPropiedadActionForm.clasificacionOnu.disabled=true;
    document.cPropiedadActionForm.clasificacionOnu.className = 'CformTextDisabled';
    for (m=document.cPropiedadActionForm.clasificacionOnu.options.length-1;m>0;m--){
	document.cPropiedadActionForm.clasificacionOnu.options[m].selected = false;
    }

  } else{
    document.cPropiedadActionForm.clasificacionOnu.disabled=false;
    document.cPropiedadActionForm.clasificacionOnu.className = 'CformTextEnabled';

  }
}

function habilitarCamposByCA(){
  if ((document.cPropiedadActionForm.principalCA.value == "-1") ||(document.cPropiedadActionForm.principalCA.value == "-2")) {
    document.cPropiedadActionForm.campoAplicacion.disabled=true;
    document.cPropiedadActionForm.campoAplicacion.className = 'CformTextDisabled';
    for (m=document.cPropiedadActionForm.campoAplicacion.options.length-1;m>0;m--){
	document.cPropiedadActionForm.campoAplicacion.options[m].selected = false;
    }

  } else{
    document.cPropiedadActionForm.campoAplicacion.disabled=false;
    document.cPropiedadActionForm.campoAplicacion.className = 'CformTextEnabled';

  }
}

function habilitarPublicacionByHabilitados(obj){

	if (document.cPropiedadActionForm.rolUsuario.value!="DVH"){
	    	<logic:iterate id="estadoTipoOferta"  property="estadosByTipoOferta" name="cPropiedadActionForm">
	         <bean:define id="EstadosTipoOfertaId" name="estadoTipoOferta" property="tipoEstado"/>
	
	            if ( obj.value == <bean:write name="EstadosTipoOfertaId" property="id" /> ){
					  if (<bean:write property="publicable" name="estadoTipoOferta" />){
	                    document.cPropiedadActionForm.publica[0].disabled=false;
	                    document.cPropiedadActionForm.publica[1].disabled=false;
	  				}else {
	                    document.cPropiedadActionForm.publica[0].checked=false;
	                    document.cPropiedadActionForm.publica[0].disabled=true;
	                    document.cPropiedadActionForm.publica[1].checked=true;
	                    document.cPropiedadActionForm.publica[1].disabled=true;
 		            }
				}
			</logic:iterate>
	}

		
}

function habilitarCampoFechaRegistrado(obj){
  if (obj.value == "2" ) {
    document.cPropiedadActionForm.pdia.disabled=false;
    document.cPropiedadActionForm.pdia.className = 'CformTextEnabled';
    document.cPropiedadActionForm.pmes.disabled=false;
    document.cPropiedadActionForm.pmes.className = 'CformTextEnabled';
    document.cPropiedadActionForm.panio.disabled=false;
    document.cPropiedadActionForm.panio.className = 'CformTextEnabled';

  } else{
    document.cPropiedadActionForm.pdia.disabled=true;
    document.cPropiedadActionForm.pdia.className = 'CformTextDisabled';
    document.cPropiedadActionForm.pdia.value = "";
    document.cPropiedadActionForm.pmes.disabled=true;
    document.cPropiedadActionForm.pmes.className = 'CformTextDisabled';
    document.cPropiedadActionForm.pmes.value = "";
    document.cPropiedadActionForm.panio.disabled=true;
    document.cPropiedadActionForm.panio.className = 'CformTextDisabled';
    document.cPropiedadActionForm.panio.value = "";
  }
}

function habilitarCamposParaPatentes(obj){

  if (obj.value == "8" ) {
    document.cPropiedadActionForm.cip.disabled=false;
    document.cPropiedadActionForm.cip.className = 'CformTextEnabled';
  } else{
    document.cPropiedadActionForm.cip.disabled=true;
    document.cPropiedadActionForm.cip.className ='CformTextDisabled';
  }

}

function cambioEstado(){

}

function pedirConfirmacion(url){
    url.href = 'cPropiedadAltaAction.do?accion=oferta';
    msg = 'Se perderán los datos no grabados, ¿desea continuar?';
    if (window.confirm(msg)){
      url.href = url.href;
    }else{
      url.href = '#';
    }
  }

 function controlAcumulado() {
 /*En x se guarda el numero de elem. de la lista titulares*/
 var x = 0;
 <bean:define id="listaTitulares" name="cPropiedadActionForm" property="titularLote"/>
 <logic:iterate name="listaTitulares" id ="p">
  x++;
 </logic:iterate>
 var totalScp = 0.00;
 for (var i = 0, j = x; i < j; i++) {
  var a = $('#titularPorcentajeMapped_'+i);
  var porcentaje = ($(a).val());
  var esSCP = ($('#esSCP'+i)[0].selectedIndex);
  /*El valor Numero 2 corresponde al Sí*/
  if (esSCP == '2'){
    var a = 0;
    a = eval(porcentaje);
    a = Math.round((a) * 100) / 100;
    totalScp = Math.round((totalScp + a) * 100) /100;
    a = a.toFixed(2);
  } 
 }
  totalScp = totalScp.toFixed(3);
  cPropiedadActionForm.totalScp.value = totalScp;
  return 1;
}

// le formatea dos decimales a un importe y calcula el total usando la funcion controlAcumulado
function formatImporteCalcularTotal(obj) {
  formatImporte(obj);
  controlAcumulado();
}

function controlAcumuladoDistribucion() {
 /*En x se guarda el numero de elem. de la lista inventores*/
 var x = 0;
 <bean:define id="listaInventores" name="cPropiedadActionForm" property="inventorLote"/>
 <logic:iterate name="listaInventores" id ="p">
  x++;
 </logic:iterate>

 var distribucionScp = 0.00;
 var totalScp = 0.00;
 totalScp = cPropiedadActionForm.totalScp.value;
 var totalParticipacion = 0.00;
 var totalPar = $("#participacionTotal");
 for (var i = 0, j = x; i < j; i++) {
  
  var esSCPInventor = ($('#esSCPInventor'+i)[0].selectedIndex);
  var b = $("#participacionPorcentajeMapped_"+i);
  var porcentaje = b.val();
  
  /*El valor Numero 2 corresponde al Sí*/
  var totalDist = $("#totalDistribucion_"+i);
  if (esSCPInventor == '2' && porcentaje != "" ){
    b.attr('readonly', false);
    var a = 0;
    a = eval(porcentaje);
    a = Math.round((a) * 100) / 100;
    /*distribucionScp = ((Math.round(a * 100) /100)* (eval(cPropiedadActionForm.totalScp.value)))/100;*/
    distribucionScp = (a * (eval(cPropiedadActionForm.totalScp.value)))/100;
    /*a = a.toFixed(2);*/
    distribucionScp = distribucionScp.toFixed(3);
    totalDist.attr("value", distribucionScp);
    totalParticipacion = parseInt(totalParticipacion) + parseInt(a);
    totalParticipacion = Math.round((totalParticipacion) * 100) / 100;
    totalParticipacion = totalParticipacion.toFixed(2);
    /*cPropiedadActionForm.totalParticipacion.value = totalParticipacion;*/
  }
  else if(esSCPInventor == '3'){
    b.attr("value", "0.00");
    totalDist.attr("value", "0.00");
    b.attr('readonly', true); 
  }
  else{
    totalDist.attr("value", "0.00");
  }
    
 }
  totalPar.attr("value", (totalParticipacion));
  return 1;
}

// le formatea dos decimales a un importe y calcula el total usando la funcion controlAcumuladoDistribucion
function formatImporteCalcularTotalDistribucion(obj) {
  formatImporte(obj);
  controlAcumuladoDistribucion();
}

<capplication:isApplication application="SVT">
solapas = new Array('tab1','tab6','tab2','tab4','distribucionPI','tab5','tabInstancia', 'tabSeguimientoEstado');
</capplication:isApplication>

<capplication:isApplication application="SVTP">
solapas = new Array('tab1','tab6','tab2','tab4','distribucionPI','tab5','tabInstancia', 'tabSeguimientoEstado');
</capplication:isApplication>

window.onload=function(){
	setupPanes("container", document.cPropiedadActionForm.cambiaPanel.value);
	<capplication:isApplication application="SVTP">
	  marcarObligatorios();
	</capplication:isApplication>
}

function irTabFinal(){
	  document.cPropiedadActionForm.cambiaPanel.value=solapas[solapas.length-1];
	  setupPanes("container", document.cPropiedadActionForm.cambiaPanel.value);
	}

	function irTabInicial(){
	  document.cPropiedadActionForm.cambiaPanel.value=solapas[0];
	  setupPanes("container", document.cPropiedadActionForm.cambiaPanel.value);
	}

	function irTabAnterior(){
	  var obj = document.cPropiedadActionForm.cambiaPanel.value;
	  for(i=1;i<solapas.length;i++){
	    if ((solapas[i] == obj)) {
	      document.cPropiedadActionForm.cambiaPanel.value=solapas[i-1];
	      break;
	    }  
	  }  
	  setupPanes("container", document.cPropiedadActionForm.cambiaPanel.value);
	}

	function irTabSiguiente(){
	  var obj = document.cPropiedadActionForm.cambiaPanel.value;
	  for(i=0;i<(solapas.length-1);i++){
	    if ((solapas[i] == obj)) {
	      document.cPropiedadActionForm.cambiaPanel.value=solapas[i+1];
	      break;
	    }  
	  }  
	  setupPanes("container", document.cPropiedadActionForm.cambiaPanel.value);
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
    $('#pClave3').append(asterisco);
    $('#pClave4').append(asterisco);
    $('#pClave5').append(asterisco);
    $('#areaBotonesPClaves').prepend(msgObligatorios);
}


</script>

<br>
<h1 align="center" class="titulo">Registro de Propiedad Intelectual  </h1>
<html:form action="cPropiedadAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="cambiaPanel"/>
<html:hidden property="rolUsuario"/>

<logic:equal property="accion" value="alta" name="cPropiedadActionForm">
  <div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td>
          <ul class="tabs">
            <li><a href="cTipoOfertaSeleccionarAction.do?accion=volver" onClick="return pedirConfirmacion(this)">Oferta</a></li>
            <li><a href="#" onClick="return mostrarPanel('tema', this)" id="tab1">Prop.Int</a></li>
            <!--  
            <li><a href="#" onClick="return mostrarPanel('gestor', this)" id="tabGestor">UVT</a></li>
            -->
            <li><a href="#" onClick="return mostrarPanel('equipos', this)" id="tab6">Equipamientos</a></li>
            <li><a href="#" onClick="return mostrarPanel('informacionTecnologica', this)" id="tab2">Inf.Tecnológica</a></li>
            <!--  
            <li><a href="#" onClick="return mostrarPanel('palabrasClaves', this)" id="tab3">Palabras Claves</a></li>
            -->
            <li><a href="#" onClick="return mostrarPanel('inventores', this)" id="tab4">Inventores</a></li>
            <li><a href="#" onClick="return mostrarPanel('distribucionPropiedad', this)" id="distribucionPI">Beneficios</a></li>
            <li><a href="#" onClick="return mostrarPanel('seguimiento', this)" id="tab5">Registro</a></li>
            <li><a href="#" onClick="return mostrarPanel('instancia', this)" id="tabInstancia">Instancias</a></li>
            <li><a href="#" onClick="return mostrarPanel('seguimientoEstado', this)" id="tabSeguimientoEstado">Seguimiento</a></li>
          </ul>
        </td>
      </tr>
    </table>
  <div>

  <div id="tema">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td  class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()"/>
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irTabAnterior()" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Prestador / Titular :&nbsp;<span class="dato_obligatorio">*</span></td>
            </tr>
          </table>

          <logic:notEmpty property="titularLote" name="cPropiedadActionForm">
            <div id="titularesLote">
            <table width="100%" >
              <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cPropiedadActionForm.titularLote" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
                    <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader"/>
                    <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="comboEsTitular" title="Rol" headerClass="tableCellHeader" style="width: 80px;" media="html" />
                    <display:column property="titularidad" title="%Titularidad" headerClass="tableCellHeader" style="text-align:right;width:100px;"/>
                    <display:column property="comboEsScp" title="SCP" headerClass="tableCellHeader" style="width: 20px;" media="html"/>
                  </display:table>
                </td>
              </tr>
            </table>
            </div>
            <table>
             <tr class="tableRowFooter">
               <td align="left" width="100%">Total SCP:&nbsp;</td>
                 <td class="CformNombre" width="150" >
                   <html:text style="text-align:right" readonly="true" maxlength="12" property="totalScp" name="cPropiedadActionForm" size="16" />
                 </td>
             </tr>
           </table>
 
            
          </logic:notEmpty>
          <logic:empty property="titularLote" name="cPropiedadActionForm">
            <table width="100%" >
              <tr>
                <td>No se seleccionó titular&nbsp;</td>
              </tr>
            </table>
          </logic:empty>
        </td>
      </tr>
      <tr>
        <td>
          <table width="100%">
            <tr>
              <td class="CformAreaBotones" width="100%">
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
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Propiedad Intelectual:&nbsp;</td>
            </tr>
          </table>
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td class="CformNombre" width="110">Número:&nbsp;</td>
                <td class="CformDato">
                  <html:text property="numeroPropiedad" onkeydown="setFoco()"   maxlength="20" size="24"/>
                </td>
            </tr>
						<tr>
							<td class="CformNombre" width="150">Título:&nbsp;<span class="dato_obligatorio">*</span></td>
							<td class="CformDato">
							  <html:textarea property="descripcion"	rows="3" onkeydown="setFoco()" /></td>
						</tr>
						<tr>
							<td class="CformNombre" width="150">Detalle:</td>
							<td class="CformDato">
							  <html:textarea property="detalle"	rows="3" /></td>
						</tr>
          <!--
					<tr>
              <td class="CformNombre" width="110">Estado:<span class="dato_obligatorio">*</span></td>
              <td class="CformDato">
                <html:select disabled="false" property="tipoEstado" onchange="habilitarPublicacionByHabilitados(this)" >
                  <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
                </html:select>
              </td>
            </tr>
            -->
            <tr>
              <td class="CformNombre" width="110">Tipo:<span class="dato_obligatorio">*</span></td>
              <td class="CformDato">
                <html:select disabled="false" property="tipoPropiedad" onchange="habilitarCamposParaPatentes(this)" >
                  <html:options collection="comboTipoPropiedad" property="value" labelProperty="label"/>
                </html:select>
              </td>
            </tr>
            
            <!--  
            <tr>
              <td class="CformNombre" width="110">Publicación Web:&nbsp;</td>
          		  <logic:equal value="S" property="publicable" name="cPropiedadActionForm">
		              <td class="CformDato" >
	                   Sí <html:radio property="publica" value="S"  />
        	           No <html:radio property="publica" value="N" />
                  </td>
  			       </logic:equal>
          		  <logic:equal value="N" property="publicable" name="cPropiedadActionForm">
		              <td class="CformDato" >
	                   Sí <html:radio property="publica" value="S"  disabled="true" />
        	           No <html:radio property="publica" value="N" disabled="true" />
                  </td>
		          	</logic:equal>
       			  <html:hidden property="publica"/>
            </tr>
            -->
          </table>
        </td>
      </tr>
      <tr>
        <td>
	        <table width="100%">
            <tr>
              <td width="60%" class="CformAreaBotones" ><div align="left" class="dato_obligatorio">* Datos obligatorios </div></td>
              <td width="40%" class="CformAreaBotones">
                <div align="right" >
                  <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                </div>
              </td>
            </tr>
	        </table>
         </td>
      </tr>
    </table>
    <table  align="center" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td>
          Atención: Más Datos Obligatorios en Instancias e Inventores.
        </td>
      </tr>
      <tr>
        <td>
          Para su contratación el estado debe ser "Habilitado".
        </td>
      </tr>
    </table>
  </div>

<!-- tabGestor-->
 <!-- 
  <div id="gestor">
    <table align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td width="600" class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irA('tab1')" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irA('tab2')" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>UVT:&nbsp;</td>
             </tr>
            </table>
            <logic:notEmpty property="colGestor" name="cPropiedadActionForm">
              <table width="100%" >
                <tr>
                  <td colspan="10">
                    <display:table name="sessionScope.cPropiedadActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                      <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader"/>
                      <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                      <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                      <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                    </display:table>
                  </td>
                </tr>
	            </table>
            </logic:notEmpty>
            <logic:empty property="colGestor" name="cPropiedadActionForm">
              <table width="100%" >
       	        <tr>
                  <td>No se seleccionó UVT.&nbsp;</td>
       	        </tr>
	           </table>
            </logic:empty>
	        </td>
        </tr>
        <tr>
	        <td>
	          <table>
		          <tr>
		            <td class="CformAreaBotones" width="600">
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
	          <table width="100%">
              <tr>
                <td class="CformAreaBotones">
                  <div align="right" >
                    <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm" irTabSiguiente() />
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                  </div>
               </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </div>
     -->
     
    <div id="equipos">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td  class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irTabAnterior()" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Equipamientos:&nbsp;</td>
            </tr>
          </table>
          <logic:notEmpty property="equiposLote" name="cPropiedadActionForm">
            <table width="100%" >
              <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cPropiedadActionForm.equiposLote" style="width:100%"  decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                    <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" maxLength="22" />
                    <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                    <display:column property="marca" title="Marca" headerClass="tableCellHeader" style="width: 350px;" maxLength="15" />
                    <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
                    <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
                  </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
          <logic:empty property="equiposLote" name="cPropiedadActionForm">
            <tr >
              <td>No se seleccionaron equipamientos&nbsp;</td>
            </tr>
          </logic:empty>
        </td>
      </tr>
      <tr>
        <td>
          <table width="100%">
            <tr>
              <td class="CformAreaBotones" width="100%">
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
          <table width="100%">
              <tr>
                <td width="100%" class="CformAreaBotones">
                  <div align="right" >
                    <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
                  </div>
                </td>
              </tr>
         </table>
        </td>
      </tr>
    </table>
  </div>

    <div id="informacionTecnologica">
      <table align="center" cellpadding="0" cellspacing="0"class="tablaMin">
	      <tr>
 		      <td class="CformAreaBotones">
		        <div align="center" >
			        <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()" />
			        <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irTabAnterior()" />
			        <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
			        <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
	 	  	    </div>
          </td>
		    </tr>
	    </table>

      <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td>
            <table width="100%">
              <tr bgcolor="#DDEEFF">
                <td>Disciplina Primaria&nbsp;</td>
              </tr>
       	    </table>
            <table width="100%">
              <tr>
                <td class="CformNombre" width="55">Principal:&nbsp;</td>
                <td class="CformDato">
                  <html:select disabled="false" property="principalDP" onchange="habilitarCamposByDP()">
                    <html:options collection ="comboDisciplinaPrimaria" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="55">Otras:&nbsp;</td>
                <td class="CformDato">
                   <logic:lessEqual value="-1" property="principalDP" name="cPropiedadActionForm">
                    <html:select disabled="true" property="disciplinaPrimaria" multiple="true" size="3" onchange="habilitarCamposByDP()">
       	              <html:options collection="comboDisciplinaPrimariaM" property="value" labelProperty="label" />
               	    </html:select>
		              </logic:lessEqual>
		              <logic:greaterThan value="-1" property="principalDP" name="cPropiedadActionForm">
               	    <html:select disabled="false" property="disciplinaPrimaria" multiple="true" size="3" onchange="habilitarCamposByDP()">
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
               <td>Disciplina Desagregada&nbsp;</td>
             </tr>
       	   </table>
           <table width="100%">
             <tr>
               <td class="CformNombre" width="55">Principal:&nbsp;</td>
               <td class="CformDato" >
                 <html:select disabled="false" property="principalDD" onchange="habilitarCamposByDD()">
                   <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                 </html:select>
               </td>
             </tr>
             <tr>
               <td class="CformNombre" width="55">Otras:&nbsp;</td>
               <td class="CformDato" >
                	<logic:lessEqual value="-1" property="principalDD" name="cPropiedadActionForm">
                   <html:select disabled="true" property="disciplinaDesagregada" multiple="true" size="3" onchange="habilitarCamposByDD()">
                     <html:options collection="comboDisciplinaDesagregadaM" property="value" labelProperty="label" />
                   </html:select>
		             </logic:lessEqual>
		             <logic:greaterThan value="-1" property="principalDD" name="cPropiedadActionForm">
                   <html:select disabled="false" property="disciplinaDesagregada" multiple="true" size="3" onchange="habilitarCamposByDD()">
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
               <td>Campo Aplicación&nbsp;</td>
             </tr>
       	   </table>
           <table width="100%">
             <tr>
               <td class="CformNombre" width="55">Principal:&nbsp;</td>
               <td class="CformDato" >
                 <html:select disabled="false" property="principalCA" onchange="habilitarCamposByCA()">
                   <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                 </html:select>
               </td>
             </tr>
             <tr>
               <td class="CformNombre" width="55">Otras:&nbsp;</td>
                 <td class="CformDato" >
                   <logic:lessEqual value="-1" property="principalCA" name="cPropiedadActionForm">
        	           <html:select disabled="true" property="campoAplicacion" multiple="true" size="3" onchange="habilitarCamposByCA()">
                	     <html:options collection="comboCampoAplicacionM" property="value" labelProperty="label" />
	                   </html:select>
			             </logic:lessEqual>
			             <logic:greaterThan value="-1" property="principalCA" name="cPropiedadActionForm">
	                   <html:select disabled="false" property="campoAplicacion" multiple="true" size="3" onchange="habilitarCamposByCA()">
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
               <td>Actividades Industriales&nbsp;</td>
             </tr>
       	   </table>
           <table width="100%">
             <tr>
               <td class="CformNombre" width="55">Principal:&nbsp;</td>
               <td class="CformDato" >
                 <html:select disabled="false" property="principalCO" onchange="habilitarCamposByCO()">
                   <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
                 </html:select>
               </td>
              </tr>
              <tr>
                <td class="CformNombre" width="55">Otras:&nbsp;</td>
                <td class="CformDato" >
	        	      <logic:lessEqual value="-1" property="principalCO" name="cPropiedadActionForm">
        	          <html:select disabled="true" property="clasificacionOnu" multiple="true" size="3" onchange="habilitarCamposByCO()">
                      <html:options collection="comboClasificacionOnuM" property="value" labelProperty="label" />
	                  </html:select>
			            </logic:lessEqual>
			            <logic:greaterThan value="-1" property="principalCO" name="cPropiedadActionForm">
	                  <html:select disabled="false" property="clasificacionOnu" multiple="true" size="3" onchange="habilitarCamposByCO()">
        	            <html:options collection="comboClasificacionOnuM" property="value" labelProperty="label" />
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
               <td>Clasificación Internacional Alfanumérica OMPI&nbsp;</td>
             </tr>
           </table>

           <table width="100%" cellpadding="2" cellspacing="2" >
             <tr>
                <td class="CformNombre" width="55">Cód.CIP:<span class="dato_obligatorio" id="dObliCodCip"></span></td>
                <td class="CformDato">
                  <html:text property="cip"  maxlength="20" size="60"/>
                </td>
              </tr>
           </table>
           
           <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Palabras Claves&nbsp;</td>
            </tr>
          </table>

          <table width="100%" >
            <tr>
              <td class="CformNombre" width="100">1ª:&nbsp;</td>
              <td class="CformDato"><html:text property="palabraClave1"  maxlength="40" /></td>
            </tr>
            <tr>
              <td class="CformNombre" width="100">2ª:&nbsp;</td>
              <td class="CformDato"><html:text property="palabraClave2"  maxlength="40" /></td>
            </tr>
            <tr>
              <td class="CformNombre" width="100">3ª:&nbsp;</td>
              <td class="CformDato"><html:text property="palabraClave3"  maxlength="40" /></td>
            </tr>
            <tr>
              <td class="CformNombre" width="100">4ª:&nbsp;</td>
              <td class="CformDato"><html:text property="palabraClave4"  maxlength="40" /></td>
            </tr>
            <tr>
              <td class="CformNombre" width="100">5ª:&nbsp;</td>
              <td class="CformDato"><html:text property="palabraClave5"  maxlength="40" /></td>
            </tr>
          </table>
  
       	</td>
      </tr>
      <tr>
	      <td>
	        <table width="100%">
            <tr id="areaBotonesInfTecnologica">
              <td width="100%" class="CformAreaBotones">
                <div align="right">
                  <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm" onclick="irTabSiguiente()" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
   </table>
   <table  align="center" cellpadding="0" cellspacing="0" width="100%">
	   <tr>
   	   <td>
			   Atención: Para seleccionar más de un ítem en "Otras" presionar CTRL+Botón izquierdo del mouse
	     </td>
     </tr>
   </table>
  </div>
<!--  
  <div id="palabrasClaves">
    <table align="center" cellpadding="0" cellspacing="0" width="600">
	    <tr>
 		    <td width="600" class="CformAreaBotones">
		      <div align="center" >
			      <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irA('tab1')" />
			      <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irA('tab2')" />
			      <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irA('tab4')" />
			      <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
	 	  	  </div>
        </td>
		  </tr>
	  </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="400" >
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Palabras Claves&nbsp;</td>
            </tr>
          </table>

          <table width="100%" >
	          <tr>
              <td class="CformNombre" width="100">1ª:&nbsp;</td>
	            <td class="CformDato"><html:text property="palabraClave1"  maxlength="20" /></td>
		        </tr>
	          <tr>
              <td class="CformNombre" width="100">2ª:&nbsp;</td>
        	    <td class="CformDato"><html:text property="palabraClave2"  maxlength="20" /></td>
		        </tr>
	          <tr>
              <td class="CformNombre" width="100">3ª:&nbsp;</td>
             	<td class="CformDato"><html:text property="palabraClave3"  maxlength="20" /></td>
		        </tr>
	          <tr>
              <td class="CformNombre" width="100">4ª:&nbsp;</td>
	            <td class="CformDato"><html:text property="palabraClave4"  maxlength="20" /></td>
		        </tr>
	          <tr>
              <td class="CformNombre" width="100">5ª:&nbsp;</td>
        	    <td class="CformDato"><html:text property="palabraClave5"  maxlength="20" /></td>
		        </tr>
          </table>
	      </td>
	    </tr>
      <tr>
	      <td>
	        <table>
		        <tr>
			        <td width="400" class="CformAreaBotones">
		        	  <div align="right" >
         		      <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
			            <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
    			      </div>
		          </td>
		        </tr>
	        </table>
        </td>
      </tr>
    </table>
  </div>
  -->

<!--TAB4-->
   <div id="inventores">
     <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
	   	<tr>
 		    <td  class="CformAreaBotones">
		      <div align="center" >
			      <input type="button"  class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()" />
			      <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irTabAnterior()" />
			      <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
			      <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
			    </div>
	 	    </td>
		  </tr>
    </table>
     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Inventores&nbsp;<span class="dato_obligatorio">*</span></td>
             </tr>
           </table>
           <logic:notEmpty property="inventorLote" name="cPropiedadActionForm">
             <table width="100%">
               <tr>
                 <td colspan="10">
                   <display:table name="sessionScope.cPropiedadActionForm.inventorLote" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
                     <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 120px;" />
                     <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                     <display:column property="comboEsScpInventor" title="SCP" headerClass="tableCellHeader" style="text-align:right;width: 20px;" media="html"/>
                     <display:column property="importeAAlta" title="%Autoría" headerClass="tableCellHeader" style="text-align:right;width:100px;" />
                     <display:column property="participacionPorcentaje" title="%Participación" headerClass="tableCellHeader" style="text-align:right;width:100px;"/>
                     <display:column property="distribucionPorcentaje" title="Total % de Distribución" headerClass="tableCellHeader" style="text-align:right;width:100px;"/>
                   </display:table>
                 </td>
               </tr>
             </table>
             <table width="100%">
             <tr class="tableRowFooter">
               <td align="left" width="400">Total Participación:&nbsp;</td>
                 <td class="CformNombre" width="150" >
                   <html:text styleId="participacionTotal" style="text-align:right" readonly="true" maxlength="12" property="totalParticipacion" name="cPropiedadActionForm" size="16" />
                 </td>
             </tr>
           </table>
           </logic:notEmpty>
           <logic:empty property="inventorLote" name="cPropiedadActionForm">
             <table width="100%" >
       	       <tr>
                 <td>No se seleccionaron inventores&nbsp;</td>
       	       </tr>
	           </table>
           </logic:empty>
	       </td>
        </tr>
        <tr>
	        <td>
	          <table width="100%">
		          <tr>
		            <td class="CformAreaBotones" width="100%">
	                <div align="right">
  	                <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
	                </div>
	 	            </td>
	           	</tr>
	          </table>
          </td>
        </tr>

        <tr>
	        <td>
	          <table width="100%">
			        <tr>
	        		  <td width="60%" class="CformAreaBotones" >
                  <div align="left" class="dato_obligatorio">* Datos obligatorios </div>
			          </td>
				        <td width="40%" class="CformAreaBotones">
		        	    <div align="right" >
          		      <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm" onclick="irTabSiguiente()" />
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
    			        </div>
		        		</td>
			        </tr>
            </table>
          </td>
        </tr>
     </table>

     <table  align="center" cellpadding="0" cellspacing="0" width="100%">
	     <tr>
     	   <td>
		       Atención: Debe informar al menos un Inventor y un Titular
	       </td>
    	 </tr>
     </table>
   </div>

  <!--TAB5-->
   <div id="seguimiento">
     <table  align="center" cellpadding="0" cellspacing="0" class="tablaMin">
		   <tr>
 		     <td  class="CformAreaBotones">
		       <div align="center" >
			       <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()" />
			       <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irTabAnterior()" />
			       <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
			       <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
		       </div>
	 	     </td>
		   </tr>
	   </table>

     <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >
       <tr>
         <td>
           <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Registro&nbsp;<span class="dato_obligatorio">(2)</span></td>
             </tr>
            </table>

            <table width="100%" >
        	    <tr>
            	  <td class="CformNombre"  width="100" >Fecha:</td>
                <td class="CformDato">
                 	<html:text property="pdia" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
                  <html:text property="pmes" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
                  <html:text property="panio" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
                </td>
    	        </tr>
      			  <tr>
                <td class="CformNombre" width="100" >Denominación:&nbsp; </td>
                <td>
                 	<html:textarea  property="denominacion" name="cPropiedadActionForm" cols="35" rows="3" onkeyup="isMaxLength(this,500)" />
                </td>
      			  </tr>
    	      </table>
    	      <table width="100%" >
  		        <tr>
    	      		<td>
        	    	  <table width="100%">
            	      <tr bgcolor="#DDEEFF">
                	 	  <td>Organismo de Registro&nbsp;</td>
               			</tr>
              	  </table>
			          	<logic:notEmpty property="organismoRegistroLote" name="cPropiedadActionForm">
  		      		    <table width="100%" >
 	 	      	         	<tr>
			        		      <td colspan="10">
			        	    	    <display:table name="sessionScope.cPropiedadActionForm.organismoRegistroLote" style="width:100%" decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
				                	  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		    		            	  <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 100px;" />
		        		        	  <display:column property="pais" title="País" headerClass="tableCellHeader" style="width:350px;" />
			      				      </display:table>
		            			  </td>
 		       		  	  	</tr>
	    			    	  </table>
          			  </logic:notEmpty>
           			  <logic:empty property="organismoRegistroLote" name="cPropiedadActionForm">
            			  <table width="100%" >
       	     				  <tr >
	               				<td>No se selecciono organismo de Registro&nbsp;</td>
    	   	     				</tr>
	    					    </table>
          				</logic:empty>
	   				    </td>
         		  </tr>
        		  <tr>
	  				    <td>
	    				    <table width="100%">
							      <tr>
		  					      <td class="CformAreaBotones" width="100%">
	            			   <div align="right" >
  	             			   <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
	           				   </div>
	 	 					        </td>
							      </tr>
	    				    </table>
         			  </td>
      			  </tr>
    	     </table>
    	  </td>
  	  </tr>
      <tr>
  		  <td>
	   		  <table width="100%">
				    <tr>
        		  <td width="60%" class="CformAreaBotones" >
                <div align="left" class="dato_obligatorio">*Datos Obligatorios&nbsp;</div>
              </td>
				      <td width="40%" class="CformAreaBotones">
		        	  <div align="right" >
			            <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
			            <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
  			        </div>
	       			</td>
				    </tr>
	  		  </table>
        </td>
      </tr>
  	</table>
    <table  align="center" cellpadding="0" cellspacing="0" width="100%">
	    <tr>
         <td>
            (1)Se pueden informar solo si el Tipo de Propiedad es Patente.
         </td>
      </tr>
      <tr>
        <td>
            (2)Si el estado de la Propiedad Intelectual es Habilitado los datos del Registro son obligatorios.
        </td>
    	</tr>
    </table>
  </div>



<!--TABINSTANCIA-->
  <div id="instancia">
    <table  align="center" cellpadding="0" cellspacing="0" class="tablaMin">
	    <tr>
 		    <td  class="CformAreaBotones">
		      <div align="center" >
			      <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()" />
			      <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irTabAnterior()" />
	          <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
	          <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
	        </div>
	  	  </td>
	 	  </tr>
	  </table>

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Instancias&nbsp;<span class="dato_obligatorio">*</span></td>
            </tr>
          </table>
          <logic:notEmpty property="instanciasLote" name="cPropiedadActionForm">
	          <table width="100%" >
	            <tr>
	              <td>
                  <display:table name="sessionScope.cPropiedadActionForm.instanciasLote" style="width:100%" decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
                    <display:column property="descripcionCfm" title="Instancia" headerClass="tableCellHeader" style="width: 400px;" />
                    <display:column property="fechaCfm" title="Fecha" headerClass="tableCellHeader" style="width: 200px;" />
	                </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>	

          <logic:empty property="instanciasLote" name="cPropiedadActionForm">
       			<table width="100%" >
 	     				<tr>
         				<td>No se seleccionaron Instancias &nbsp;</td>
 	     				</tr>
  					</table>
     		 </logic:empty>
         <table width="100%">
           <tr>
				     <td>
               <table width="100%">
                 <tr>
                   <td class="CformAreaBotones"></td>
                   <td width="100%" class="CformAreaBotones">
                     <div align="right" >
                       <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar"/>
                     </div>
                   </td>
                 </tr>
               </table>
             </td>
           </tr>
         </table>
        </td>
      </tr>
     <tr>
		   <td>
	  		 <table width="100%">
			     <tr>
        		 <td width="60%" class="CformAreaBotones" >
               <div align="left" class="dato_obligatorio">*Datos Obligatorios&nbsp;</div>
             </td>
				     <td width="40%" class="CformAreaBotones">
		        	 <div align="right" >
			           <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
			           <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
 			         </div>
				     </td>
				   </tr>
	  		 </table>
       </td>
      </tr>
    </table>

  </div>


 <!-- distribucionPI  SOLO PARA PROP.INTELECTUAL -->

  <div id="distribucionPropiedad">
   <table  align="center" cellpadding="0" cellspacing="0" class="tablaMin">
     <tr>
       <td  class="CformAreaBotones">
         <div align="center" >
           <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()" />
           <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irA('tab4')" />
           <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
           <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
         </div>
       </td>
     </tr>
   </table>

   <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
     <tr>
       <td>
         <table width="100%">
           <tr bgcolor="#DDEEFF">
             <td>Distribución Beneficios:&nbsp;<span class="dato_obligatorio">*</span></td>
           </tr>
         </table>

           <logic:notEmpty property="distribucionLote" name="cPropiedadActionForm">
             <table width="100%">
               <tr>
                 <td colspan="10">
                   <display:table name="sessionScope.cPropiedadActionForm.distribucionLote" style="width:100%" id="distribucionDetalleEnOferta" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
                     <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader"  />
                     <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width: 100px;" />
                     <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width: 200px;" />
                   </display:table>
                 </td>
               </tr>
    	       </table>
           </logic:notEmpty>
           <logic:empty property="distribucionLote" name="cPropiedadActionForm">
       	     <tr>
               <td>No se seleccionó distribución.&nbsp;</td>
       	     </tr>
           </logic:empty>
       </td>
     </tr>
     <tr>
	     <td>
	       <table width="100%">
		       <tr>
		         <td class="CformAreaBotones" width="100%">
	             <div align="right" >
                 <html:submit property="btnSubmit" value="Seleccionar" styleClass="CformBoton" />
	             </div>
	 	         </td>
		       </tr>
	       </table>
       </td>
     </tr>

     <tr>
	     <td>
	       <table width="100%">
           <tr>
             <td width="60%" class="CformAreaBotones" >
               <div align="left" class="dato_obligatorio">*Datos Obligatorios&nbsp;</div>
             </td>
             <td width="40%" class="CformAreaBotones">
               <div align="right" >
                 <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
                 <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
               </div>
             </td>
           </tr>
	       </table>
       </td>
     </tr>
   </table>
  </div>

  <!-- tabSeguimientoEstado-->
  <div id="seguimientoEstado">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td  class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadActionForm"   onclick="irTabInicial()" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadActionForm"   onclick="irTabAnterior()" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadActionForm"   onclick="irTabSiguiente()" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadActionForm"   onclick="irTabFinal()" />
          </div>
        </td>
      </tr>
    </table>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>
                Situación Actual:&nbsp;
              </td>
            </tr>
          </table>
          <table width="100%">
            <tr>
              <td class="CformNombre" width="150">
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
                <td class="CformNombre" width="150">
                  Publicación Web:&nbsp;
                </td>

                <logic:notEqual value="DVH" property="rolUsuario" name="cPropiedadActionForm">

                <logic:equal value="S" property="publicable" name="cPropiedadActionForm">
                  <td class="CformDato">
                    Sí
                    <html:radio property="publica" value="S" />
                    No
                    <html:radio property="publica" value="N" />
                  </td>
                </logic:equal>
                <logic:equal value="N" property="publicable" name="cPropiedadActionForm">
                  <td class="CformDato">
                    Sí
                    <html:radio property="publica" value="S" disabled="true" />
                    No
                    <html:radio property="publica" value="N" disabled="true" />
                  </td>
                </logic:equal>
                </logic:notEqual>
                <logic:equal value="DVH" property="rolUsuario" name="cPropiedadActionForm">
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
          <table width="100%">
            <tr>
              <td width="60%" class="CformAreaBotones">
                <div align="left" class="dato_obligatorio">
                  * Datos obligatorios
                </div>
              </td>
              
              <td width="40%" class="CformAreaBotones">
                <div align="right">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar" />
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <capplication:isApplication application="SVT">
       <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td>
            Para su contratación el estado de la Propiedad Intelectual debe ser "Aprobado" o "Autorizado".
          </td>
        </tr>
      </table>
    </capplication:isApplication>
  </div>
           
  </div>
  </div>

  </logic:equal>




  <logic:equal property="accion" value="altaCfm" name="cPropiedadActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%">
 	                <tr bgcolor="#BFDFFF">
        	           <td><strong>Propiedad Intelectual&nbsp;</strong></td>
	                 </tr>
                </table>

                <table width="100%" >
        	        <tr>
	                  <td class="CformNombre" width="114">Número:&nbsp;</td>
        	          <td class="CformDato"><bean:write name="cPropiedadActionForm" property="numeroPropiedad" /></td>
	                </tr>
        	        <tr>
        	        <tr>
	                  <td class="CformNombre" width="114">Título:&nbsp;</td>
        	          <td class="CformDato"><bean:write name="cPropiedadActionForm" property="descripcion" /></td>
	                </tr>
        	        <tr>
                    <td class="CformNombre" width="114">
                      Detalle:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadActionForm" property="detalle" />
                    </td>
                  </tr>
        	        <!--  
        	        <tr>
	                  <td class="CformNombre" width="114">Estado:&nbsp;</td>
        	          <td class="CformDato">
	                    <html:select disabled="true" property="tipoEstado"  >
        	              <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
                	    </html:select>
	                  </td>
	                </tr>
                  -->
                  <tr>
	                  <td class="CformNombre" width="114">Tipo Propiedad:&nbsp;</td>
        	          <td class="CformDato">
                	    <html:select disabled="true" property="tipoPropiedad" onchange="habilitarCamposParaPatentes(this)" >
	                      <html:options collection="comboTipoPropiedad" property="value" labelProperty="label"/>
        	            </html:select>
                	  </td>
	                </tr>
                </table>
                <!-- 
                <table width="100%" >
                  <tr>
                    <td class="CformNombre" width="110">Publicación Web:</td>
                    <td class="CformDato">
	                     Sí <html:radio property="publica" value="S" disabled="true"/>
        	             No <html:radio property="publica" value="N" disabled="true"/>
                    </td>
                  </tr>
                </table>
                -->

      	        <table width="100%">
              	  <tr bgcolor="#BFDFFF">
	                  <td><strong>Prestador / Titular &nbsp;</strong></td>
        	        </tr>
	              </table>

	              <table width="100%" >
        	        <tr>
	                  <td colspan="10">
        	            <display:table name="sessionScope.cPropiedadActionForm.titularLote" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
                	      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
	                      <display:column property="tipo" title="Tipo" headerClass="tableCellHeader"  />
        	              <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                	      <display:column property="comboEsTitularCfm" title="Rol" headerClass="tableCellHeader" style="width: 80px;" media="html" />
                        <display:column property="titularidad" title="%Titularidad" headerClass="tableCellHeader" style="text-align:right;width:15%;"/>
                        <display:column property="comboEsScpCfm" title="SCP" headerClass="tableCellHeader" style="width: 15%;" media="html"/>
	                   </display:table>
        	          </td>
	                </tr>
    	          </table>
                <table width="100%">
                  <tr class="tableRowFooter">
                    <td align="left" width="70%">%Total dentro del SCP:&nbsp;</td>
                    <td class="CformNombre" width="15%" >
                       <html:text style="text-align:right" readonly="true" maxlength="12" property="totalScp" name="cPropiedadActionForm" size="16" />
                    </td>
                    <td width="15%"> </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Equipamientos&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="equiposLote" name="cPropiedadActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" maxLength="22" />
                          <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="marca" title="Marca" headerClass="tableCellHeader" style="width: 350px;" maxLength="15" />
                          <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
                          <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="equiposLote" name="cPropiedadActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionaron equipamientos&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
                <!--  
                <table width="100%">
        	        <tr bgcolor="#BFDFFF">
	                   <td><strong>UVT:&nbsp;</strong></td>
        	        </tr>
	              </table>
                <logic:notEmpty property="colGestor" name="cPropiedadActionForm">
                  <table width="100%" >
                    <tr>
                      <td colspan="10">
                  	    <display:table name="sessionScope.cPropiedadActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                          <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader"/>
                          <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colGestor" name="cPropiedadActionForm">
        	        <table width="100%" >
       	    	      <tr>
                      <td>No se seleccionó UVT.&nbsp;</td>
       	            </tr>
	                </table>
                </logic:empty>
                -->

                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Información Tecnológica&nbsp;</strong></td>
                  </tr>
                </table>

                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>Disciplina Primaria&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalDP" name="cPropiedadActionForm">
                        <html:select disabled="true" property="principalDP" >
                          <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>

                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="disciplinaPrimaria" name="cPropiedadActionForm">
                        <html:select disabled="false" property="disciplinaPrimaria" multiple="true" size="3" >
                          <html:options collection="comboDisciplinaPrimariaC" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>Disciplina Desagregada&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato" >
                      <logic:greaterThan value="0" property="principalDD" name="cPropiedadActionForm">
                        <html:select disabled="true" property="principalDD" >
                          <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="disciplinaDesagregada" name="cPropiedadActionForm">
                        <html:select disabled="false" property="disciplinaDesagregada" multiple="true" size="3" >
                          <html:options collection="comboDisciplinaDesagregadaC" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>Campo Aplicación&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato" >
                      <logic:greaterThan value="0" property="principalCA" name="cPropiedadActionForm">
                        <html:select disabled="true" property="principalCA" >
                          <html:options collection="comboCampoAplicacion" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato" >
                      <logic:notEmpty property="campoAplicacion" name="cPropiedadActionForm">
                        <html:select disabled="false" property="campoAplicacion" multiple="true" size="3" >
                          <html:options collection="comboCampoAplicacionC" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>Actividades Industriales&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato" >
                      <logic:greaterThan value="0" property="principalCO" name="cPropiedadActionForm">
                        <html:select disabled="true" property="principalCO" >
                          <html:options collection="comboClasificacionOnu" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="clasificacionOnu" name="cPropiedadActionForm">
                        <html:select disabled="false" property="clasificacionOnu" multiple="true" size="3" >
                          <html:options collection="comboClasificacionOnuC" property="value" labelProperty="label"/>
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
	              </table>

                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Clasificación Internacional Alfanumérica OMPI&nbsp;</td>
                  </tr>
                </table>

              <table width="100%" >
                <tr>
                  <td class="CformNombre" width="100">Código CIP:&nbsp;</td>
                  <td class="CformDato"><bean:write name="cPropiedadActionForm" property="cip" /></td>
                </tr>
              </table>

              <table width="100%">
                <tr bgcolor="#BFDFFF">
                  <td><strong>Palabras Claves&nbsp;</strong></td>
                </tr>
              </table>

             <table width="100%" cellpadding="5" cellspacing="2" >
	             <tr>
                 <td class="CformNombre" width="100">1ª:&nbsp;</td>
	               <td class="CformDato">
                   <bean:write name="cPropiedadActionForm" property="palabraClave1"/>
                 </td>
		          </tr>
	            <tr>
                <td class="CformNombre" width="100">2ª:&nbsp;</td>
        	      <td class="CformDato"> 
                  <bean:write name="cPropiedadActionForm" property="palabraClave2"/>
                </td>
		          </tr>
	            <tr>
                <td class="CformNombre" width="100">3ª:&nbsp;</td>
               	<td class="CformDato"> 
                  <bean:write name="cPropiedadActionForm" property="palabraClave3"/>
                </td>
		          </tr>
	            <tr>
                <td class="CformNombre" width="100">4ª:&nbsp;</td>
                <td class="CformDato"> 
                  <bean:write name="cPropiedadActionForm" property="palabraClave4"/>
                </td>
		          </tr>
	            <tr>
                <td class="CformNombre" width="100">5ª:&nbsp;</td>
        	      <td class="CformDato"> 
                  <bean:write name="cPropiedadActionForm" property="palabraClave5"/>
                </td>
		          </tr>
            </table>

            <table width="100%">
               <tr bgcolor="#BFDFFF">
                 <td><strong>Inventores&nbsp;</strong></td>
               </tr>
            </table>

            <table width="100%" >
        	    <tr>
	        	    <td colspan="10">
	        	      <display:table name="sessionScope.cPropiedadActionForm.inventorLote" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
		                <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 120px;" />
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
        	        	<display:column property="importeAAltaConfirmado" title="%Autoría" headerClass="tableCellHeader"/>
                    <display:column property="comboEsScpInventorConfirmado" title="SCP" headerClass="tableCellHeader" media="html"/>
                    <display:column property="participacionPorcentajeConfirmado" title="%Participación" headerClass="tableCellHeader"/>
                    <display:column property="distribucionPorcentajeConfirmado" title="Total % de Distribución" headerClass="tableCellHeader"/>
                  </display:table>
		            </td>
        		  </tr>
           </table>

           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Distribución de Beneficios&nbsp;</strong></td>
             </tr>
           </table>
           <logic:notEmpty property="distribucionLote" name="cPropiedadActionForm">
             <table width="100%" >
               <tr>
                 <td colspan="10">
                   <display:table name="sessionScope.cPropiedadActionForm.distribucionLote" style="width:100%" id="distribucionDetalleEnOferta" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
                     <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader" style="width: 40%;" />
                     <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width: 30%;" />
                     <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width:30%;" />
                   </display:table>
                 </td>
               </tr>
	           </table>
             <table width="100%">
             <tr class="tableRowFooter">
               <td align="left" width="40%">%Total fuera del SCP:&nbsp;</td>
                 <td class="CformNombre" width="30%" >
                   <html:text style="text-align:right" readonly="true" maxlength="12" property="totalNoScp" name="cPropiedadActionForm" size="16" />
                 </td>
                 <td width="30%"> </td>
             </tr>
           </table>
           </logic:notEmpty>

           <logic:empty property="distribucionLote" name="cPropiedadActionForm">
             <table width="100%" >
               <tr>
                 <td>No se seleccionó distribución&nbsp;</td>
               </tr>
             </table>
           </logic:empty>

           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Instancias&nbsp;</strong></td>
             </tr>
           </table>
           <table width="100%" >
             <tr>
	             <td>
	               <display:table name="sessionScope.cPropiedadActionForm.instanciasLote" style="width:100%" decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
	                 <display:column property="descripcionCfm" title="Instancia" headerClass="tableCellHeader" style="width: 400px;" />
	                 <display:column property="fechaCfm" title="Fecha" headerClass="tableCellHeader" style="width: 200px;" />
	               </display:table>
	             </td>
	           </tr>
	         </table>

           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td><strong>Registro&nbsp;</strong></td>
             </tr>
           </table>

           <table width="100%" >
             <tr>
               <td class="CformNombre"  width="100" >Fecha:&nbsp; </td>
               <td class="CformDato">
                 <logic:notEmpty property="pdia" name="cPropiedadActionForm">
                   <bean:write name="cPropiedadActionForm" property="pdia" /> -
                   <bean:write name="cPropiedadActionForm" property="pmes" /> -
                   <bean:write name="cPropiedadActionForm" property="panio" />
                 </logic:notEmpty>
               </td>
             </tr>
             <tr>
               <td class="CformNombre" width="100">Denominación:&nbsp;</td>
               <td ><bean:write name="cPropiedadActionForm" property="denominacion"  /></td>
             </tr>
           </table>
    	     <table width="100%" >
  		       <tr>
    	         <td>
        	       <table width="100%">
        	     		 <tr bgcolor="#DDEEFF">
                	   <td>Organismo de Registro&nbsp;</td>
               		 </tr>
              	 </table>
			           <logic:notEmpty property="organismoRegistroLote" name="cPropiedadActionForm">
  		      		   <table width="100%" >
 	 	      	       	 <tr>
			        		     <td colspan="10">
			        	    	   <display:table name="sessionScope.cPropiedadActionForm.organismoRegistroLote" style="width:100%" decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
				                	 <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
		    		            	 <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 100px;" />
		        		        	 <display:column property="pais" title="País" headerClass="tableCellHeader" style="width:350px;" />
			      				     </display:table>
		            			 </td>
 		       		  	   </tr>
	    			    	 </table>
          			 </logic:notEmpty>
           			 <logic:empty property="organismoRegistroLote" name="cPropiedadActionForm">
            		   <table width="100%" >
       	     				 <tr >
	               			 <td>No se selecciono organismo de Registro&nbsp;</td>
    	   	     			 </tr>
	    					   </table>
          			 </logic:empty>
	   				   </td>
         		 </tr>
    	     </table>
           <table width="100%">
             <tr bgcolor="#BFDFFF">
               <td>
                 <strong>Seguimiento&nbsp;</strong>
               </td>
             </tr>
           </table>
           <table>
             <tr>
               <td class="CformNombre" width="114">
                 Estado:&nbsp;
               </td>
               <td class="CformDato">
                 <html:select disabled="true" property="tipoEstado">
                   <html:options collection="comboTipoEstado" property="value" labelProperty="label" />
                 </html:select>
               </td>
             </tr>
           </table>
           <table>
             <capplication:isApplication application="SVT"> 
               <tr>
                 <td class="CformNombre" width="110">
                   Publicación Web:
                 </td>
                 <td class="CformDato">
                   Sí
                   <html:radio property="publica" value="S" disabled="true" />
                   No
                   <html:radio property="publica" value="N" disabled="true" />
                 </td>
               </tr>
             </capplication:isApplication>
           </table>
           <!-- 
           <table width="100%">
             <tr bgcolor="#BFDFFF">
	             <td><strong>Equipamientos&nbsp;</strong></td>
	           </tr>
           </table>
           <logic:notEmpty property="equiposLote" name="cPropiedadActionForm">
             <table width="100%" >
        	     <tr>
	               <td colspan="10">
	                 <display:table name="sessionScope.cPropiedadActionForm.equiposLote" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                     <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" maxLength="22" />
                     <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                     <display:column property="marca" title="Marca" headerClass="tableCellHeader" style="width: 350px;" maxLength="15" />
                     <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
                     <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
        	         </display:table>
		             </td>
        	     </tr>
   	         </table>
           </logic:notEmpty>
           <logic:empty property="equiposLote" name="cPropiedadActionForm">
             <table width="100%">
               <tr>
	               <td>No se seleccionaron equipamientos&nbsp;</td>
               </tr>
             </table>
           </logic:empty>
           -->
	       </td>
	     </tr>
	   </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
      </div>
    </td>
  </tr>
</table>

</logic:equal>

</html:form>
