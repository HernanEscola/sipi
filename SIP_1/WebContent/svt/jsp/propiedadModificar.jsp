<%@include file="layout/include.jsp"%>

<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />

<script>
  window.onload=function(){
    setupPanes("container", document.cPropiedadModificarActionForm.cambiaPanel.value);
  }

  function setFoco(){
    x=event.keyCode

    if((x==13)){ // enter
      window.event.returnValue = false
    }
  }


  function irA(obj){
    document.cPropiedadModificarActionForm.cambiaPanel.value=obj;
    setupPanes("container", document.cPropiedadModificarActionForm.cambiaPanel.value);
  }

  function mostrarPanel(obj1, obj2){
    document.cPropiedadModificarActionForm.cambiaPanel.value = obj2.id;
    return showPane(obj1, obj2);
  }

  function ComboSeleccionadoDP() {
    for (m=document.cPropiedadModificarActionForm.comboDisciplinaPrimariaM.options.length-1;m>0;m--){
      if(document.cPropiedadModificarActionForm.comboDisciplinaPrimariaM.options[m].selected = false){
      document.cPropiedadModificarActionForm.comboDisciplinaPrimariaM.options[m]=null;}
    }
}

  function habilitarCamposByDP(){

    if ((document.cPropiedadModificarActionForm.principalDP.value == "-1") ||(document.cPropiedadModificarActionForm.principalDP.value == "-2")) {
      document.cPropiedadModificarActionForm.loteOtrosDP.disabled=true;
      document.cPropiedadModificarActionForm.loteOtrosDP.className = 'CformTextDisabled';
      for (m=document.cPropiedadModificarActionForm.loteOtrosDP.options.length-1;m>0;m--){
        document.cPropiedadModificarActionForm.loteOtrosDP.options[m].selected = false;
      }

    }else {
      document.cPropiedadModificarActionForm.loteOtrosDP.disabled=false;
      document.cPropiedadModificarActionForm.loteOtrosDP.className = 'CformTextEnabled';
    }
}

  function habilitarCamposByDD(){

    if ((document.cPropiedadModificarActionForm.principalDD.value == "-1") ||(document.cPropiedadModificarActionForm.principalDD.value == "-2")) {
      document.cPropiedadModificarActionForm.loteOtrosDD.disabled=true;
      document.cPropiedadModificarActionForm.loteOtrosDD.className = 'CformTextDisabled';
      for (m=document.cPropiedadModificarActionForm.loteOtrosDD.options.length-1;m>0;m--){
        document.cPropiedadModificarActionForm.loteOtrosDD.options[m].selected = false;
      }
    } else{
      document.cPropiedadModificarActionForm.loteOtrosDD.disabled=false;
      document.cPropiedadModificarActionForm.loteOtrosDD.className = 'CformTextEnabled';
    }
}


  function habilitarCamposByCA(){

    if ((document.cPropiedadModificarActionForm.principalCA.value == "-1") ||(document.cPropiedadModificarActionForm.principalCA.value == "-2")) {
      document.cPropiedadModificarActionForm.loteOtrosCA.disabled=true;
      document.cPropiedadModificarActionForm.loteOtrosCA.className = 'CformTextDisabled';
      for (m=document.cPropiedadModificarActionForm.loteOtrosCA.options.length-1;m>0;m--){
        document.cPropiedadModificarActionForm.loteOtrosCA.options[m].selected = false;
      }

    } else{
      document.cPropiedadModificarActionForm.loteOtrosCA.disabled=false;
      document.cPropiedadModificarActionForm.loteOtrosCA.className = 'CformTextEnabled';
    }
  }

  function habilitarCamposByCO(){

    if ((document.cPropiedadModificarActionForm.principalCO.value == "-1") ||(document.cPropiedadModificarActionForm.principalCO.value == "-2")) {
      document.cPropiedadModificarActionForm.loteOtrosCO.disabled=true;
      document.cPropiedadModificarActionForm.loteOtrosCO.className = 'CformTextDisabled';
      for (m=document.cPropiedadModificarActionForm.loteOtrosCO.options.length-1;m>0;m--){
        document.cPropiedadModificarActionForm.loteOtrosCO.options[m].selected = false;
      }

    } else{
      document.cPropiedadModificarActionForm.loteOtrosCO.disabled=false;
      document.cPropiedadModificarActionForm.loteOtrosCO.className = 'CformTextEnabled';
  }
}

  function habilitarCamposParaPatentes(obj){
  if (obj.value == "8" ) {
    document.cPropiedadModificarActionForm.cip.disabled=false;
    document.cPropiedadModificarActionForm.cip.className = 'CformTextEnabled';
  } else{
    document.cPropiedadModificarActionForm.cip.disabled=true;
    document.cPropiedadModificarActionForm.cip.className ='CformTextDisabled';
  }

}
  function agregarDecimales(obj) {
    var a = 0;
    var a = eval(obj.value);
    a = Math.round((a) * 100) / 100;
    a = a.toFixed(2);
    cPropiedadModificarActionForm.costoOtraMoneda.value = a;
    return 1;
}

  function habilitarPublicacionByHabilitados(obj){

		if (document.cPropiedadModificarActionForm.rolUsuario.value!="DVH"){
		  
	  
			    <logic:iterate id="estadoTipoOferta"  property="estadosByTipoOferta" name="cPropiedadModificarActionForm">
			         <bean:define id="EstadosTipoOfertaId" name="estadoTipoOferta" property="tipoEstado"/>
		
			            if ( obj.value == <bean:write name="EstadosTipoOfertaId" property="id" /> ){
			  if (<bean:write property="publicable" name="estadoTipoOferta" />){
		
			                    document.cPropiedadModificarActionForm.publica[0].disabled=false;
			                    document.cPropiedadModificarActionForm.publica[1].disabled=false;
		
			  }else {
			                    document.cPropiedadModificarActionForm.publica[0].checked=false;
			                    document.cPropiedadModificarActionForm.publica[0].disabled=true;
			                    document.cPropiedadModificarActionForm.publica[1].checked=true;
			                    document.cPropiedadModificarActionForm.publica[1].disabled=true;
		
			              }
			}
			    </logic:iterate>

		}
  }


  function controlAcumulado() {
 /*En x se guarda el numero de elem. de la lista titulares*/
 var x = 0;
 <bean:define id="listaTitulares" name="cPropiedadModificarActionForm" property="titularLote"/>
 <logic:iterate name="listaTitulares" id ="p">
  x++;
 </logic:iterate>
 var totalScp = 0.00;
 for (var i = 0, j = x; i < j; i++) {
  var a = 'input#titularPorcentajeMapped_'+i;
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
  cPropiedadModificarActionForm.totalScp.value = totalScp;
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
 <bean:define id="listaInventores" name="cPropiedadModificarActionForm" property="inventorLote"/>
 <logic:iterate name="listaInventores" id ="p">
  x++;
 </logic:iterate>

 var distribucionScp = 0.00;
 var totalScp = 0.00;
 totalScp = cPropiedadModificarActionForm.totalScp.value;
 var totalParticipacion = 0.00;
 var totalPar = $('input#participacionTotal');
 for (var i = 0, j = x; i < j; i++) {
  
  var esSCPInventor = ($('#esSCPInventor'+i)[0].selectedIndex);
  var b = $('input#participacionPorcentajeMapped_'+i);
  var porcentaje = b.val();
  
  /*El valor Numero 2 corresponde al Sí*/
  var totalDist = $('input#totalDistribucion_'+i);
  if (esSCPInventor == '2' && porcentaje != "" ){
    b.attr('readonly', false);
    var a = 0;
    a = eval(porcentaje);
    a = Math.round((a) * 100) / 100;
    /*distribucionScp = ((Math.round(a * 100) /100)* (eval(cPropiedadModificarActionForm.totalScp.value)))/100;*/
    distribucionScp = (a * (eval(cPropiedadModificarActionForm.totalScp.value)))/100;
    /*a = a.toFixed(2);*/
    distribucionScp = distribucionScp.toFixed(3);
    totalDist.attr("value", distribucionScp);
    totalParticipacion = parseInt(totalParticipacion) + parseInt(a);
    totalParticipacion = Math.round((totalParticipacion) * 100) / 100;
    totalParticipacion = totalParticipacion.toFixed(2);
    /*cPropiedadModificarActionForm.totalParticipacion.value = totalParticipacion;*/
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
solapas = new Array('tab1','equiposPI','tab2','inventores','distribucionPI','tabSeguimiento','tabInstancia', 'tabSeguimientoEstado');
</capplication:isApplication>

<capplication:isApplication application="SVTP">
solapas = new Array('tab1','equiposPI','tab2','inventores','distribucionPI','tabSeguimiento','tabInstancia', 'tabSeguimientoEstado');
</capplication:isApplication>

window.onload=function(){
  setupPanes("container", document.cPropiedadModificarActionForm.cambiaPanel.value);
  <capplication:isApplication application="SVTP">
    marcarObligatorios();
  </capplication:isApplication>
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

function irTabFinal(){
	  document.cPropiedadModificarActionForm.cambiaPanel.value=solapas[solapas.length-1];
	  setupPanes("container", document.cPropiedadModificarActionForm.cambiaPanel.value);
	}

	function irTabInicial(){
	  document.cPropiedadModificarActionForm.cambiaPanel.value=solapas[0];
	  setupPanes("container", document.cPropiedadModificarActionForm.cambiaPanel.value);
	}

	function irTabAnterior(){
	  var obj = document.cPropiedadModificarActionForm.cambiaPanel.value;
	  for(i=1;i<solapas.length;i++){
	    if ((solapas[i] == obj)) {
	      document.cPropiedadModificarActionForm.cambiaPanel.value=solapas[i-1];
	      break;
	    }  
	  }  
	  setupPanes("container", document.cPropiedadModificarActionForm.cambiaPanel.value);
	}

	function irTabSiguiente(){
	  var obj = document.cPropiedadModificarActionForm.cambiaPanel.value;
	  for(i=0;i<(solapas.length-1);i++){
	    if ((solapas[i] == obj)) {
	      document.cPropiedadModificarActionForm.cambiaPanel.value=solapas[i+1];
	      break;
	    }  
	  }  
	  setupPanes("container", document.cPropiedadModificarActionForm.cambiaPanel.value);
	}

function mostrarPanel(obj1, obj2){
  document.cPropiedadModificarActionForm.cambiaPanel.value = obj2.id;
  return showPane(obj1, obj2);
}
</script>

<br>
<h1 align="center" class="titulo">
  Modificaci&oacute;n de Oferta Tecnol&oacute;gica
</h1>
<html:form action="cPropiedadModificarAction.do" method="POST">
  <html:hidden property="cambiaPanel" />
  <html:hidden property="publicable" />
  <html:hidden property="accion" />
    <html:hidden property="rolUsuario" />
  <logic:equal property="accion" value="modificar" name="cPropiedadModificarActionForm">

    <div class="tab-container" id="container">
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
        <tr>
          <td>
            <ul class="tabs">
              <li><a href="#" onClick="return mostrarPanel('tema', this)" id="tab1">Prop.Int</a></li>
							<!--               
								<li><a href="#" onClick="return mostrarPanel('gestor', this)" id="tabGestor">Gestor</a></li>
							-->    
              <li><a href="#" onClick="return mostrarPanel('equiposPropiedad', this)" id="equiposPI">Equipamientos</a></li>
							<li><a href="#" onClick="return mostrarPanel('informacionTecnologica', this)" id="tab2">Inf.Tecnológica</a></li>
              <li><a href="#" onClick="return mostrarPanel('inventoresPI', this)" id="inventores">Inventores</a></li>
              <li><a href="#" onClick="return mostrarPanel('distribucionPropiedad', this)" id="distribucionPI">Beneficios</a></li>
              <li><a href="#" onClick="return mostrarPanel('seguimiento', this)" id="tabSeguimiento">Registro</a></li>
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
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irTabFinal()" />
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
                      Prestador / Titular:&nbsp;
                      <span class="dato_obligatorio">*</span>
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="titularLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.titularLote"  style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadModificarDisplayWrapper">
                          <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="comboModificarEsTitular" title="Rol" headerClass="tableCellHeader" style="width: 80px;" media="html" />
                          <display:column property="titularidad" title="%Titularidad" headerClass="tableCellHeader" style="text-align:right;width:15%;"/>
                          <display:column property="comboEsScp" title="SCP" headerClass="tableCellHeader" style="width: 15%;" media="html"/>
                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr class="tableRowFooter">
                      <td align="left" width="70%">Total SCP:&nbsp;</td>
                      <td class="CformNombre" width="15%" >
                        <html:text style="text-align:right" readonly="true" maxlength="12" property="totalScp" name="cPropiedadModificarActionForm" size="16" />
                      </td>
                      <td class="CformNombre" width="15%" ></td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="titularLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td class="CformNombre" width="110">Titular:&nbsp;<span class="dato_obligatorio">*</span>
                      </td>
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
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Propiedad Intelectual
                      &nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="125">
                      Número:&nbsp;&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="numeroPropiedad" onkeydown="setFoco()" maxlength="20" size="24" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="125">
                      Título:<span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:textarea property="descripcion" rows="3" onkeydown="setFoco()" />
                    </td>
                  </tr>
									<tr>
                    <td class="CformNombre" width="125">
                      Detalle:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:textarea property="detalle" rows="3" onkeydown="setFoco()" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="125">
                      Tipo:<span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:select disabled="false" property="tipoPropiedad" onchange="habilitarCamposParaPatentes(this)">
                        <html:options collection="comboTipoPropiedad" property="value" labelProperty="label" />
                      </html:select>
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>Atención: Más Datos Obligatorios en Instancias e Inventores</td>
            </tr>
            <tr>
              <td>Para su contratación el estado debe ser "Habilitado".</td>
            </tr>
          </table>
        </div>
        
        <!--Tab gestor-->
       <!-- <div id="gestor">
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td width="100%" class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irA('tab1')" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irA('tab2')" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irA('equiposPI')" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Gestor:&nbsp;</td>
                  </tr>
                </table>
                <logic:notEmpty property="colGestor" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                          <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colGestor" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>No se seleccionó gestor.&nbsp;</td>
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
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
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
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
				-->
 			 <!-- equipo propiedad -->
        <div id="equiposPropiedad">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td  class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irTabFinal()" />
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
                <logic:notEmpty property="equiposLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.equiposLote" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                          <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                          <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                          <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="equiposLote" name="cPropiedadModificarActionForm">
                  <tr>
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
                <table width="100%">
                  <tr>
                    <td width="60%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">&nbsp;</div>
                    </td>
                    <td width="40%" class="CformAreaBotones">
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>

        <!--tab2  -  INFORMACION TECNOLOGICA-->
        <div id="informacionTecnologica">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irTabFinal()" />
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
                        <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalDP" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="loteOtrosDP" multiple="true" size="3" onchange="habilitarCamposByDP()">
                          <html:options collection="comboDisciplinaPrimariaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalDP" name="cPropiedadModificarActionForm">
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
                    <td>Disciplina Desagregada&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="55">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="principalDD" onchange="habilitarCamposByDD()">
                        <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalDD" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="loteOtrosDD" multiple="true" size="3" onchange="habilitarCamposByDD()">
                          <html:options collection="comboDisciplinaDesagregadaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalDD" name="cPropiedadModificarActionForm">
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
                    <td>Campo Aplicación&nbsp;</td>
                  </tr>
                </table>

                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="55">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="principalCA" onchange="habilitarCamposByCA()">
                        <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalCA" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="loteOtrosCA" multiple="true" size="3" onchange="habilitarCamposByCA()">
                          <html:options collection="comboCampoAplicacionM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalCA" name="cPropiedadModificarActionForm">
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
                    <td>Actividades Industriales&nbsp;</td>
                  </tr>
                </table>

                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="55">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="false" property="principalCO" onchange="habilitarCamposByCO()">
                        <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="55">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:lessEqual value="-1" property="principalCO" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="loteOtrosCO" multiple="true" size="3" onchange="habilitarCamposByCO()">
                          <html:options collection="comboClasificacionOnuM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalCO" name="cPropiedadModificarActionForm">
                        <html:select disabled="false" property="loteOtrosCO" multiple="true" size="3" onchange="habilitarCamposByCO()">
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

                <table width="100%" cellpadding="2" cellspacing="2">
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

                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">1ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave1" maxlength="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">2ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave2" maxlength="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">3ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave3" maxlength="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">4ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave4" maxlength="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">5ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave5" maxlength="40" />
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
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                Atención: Para seleccionar más de un ítem en "Otras" presionar CTRL+Botón izquierdo del mouse
              </td>
            </tr>
          </table>
        </div>
           
        <div id="inventoresPI">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
               <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Inventores :&nbsp;<span class="dato_obligatorio">*</span>
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="inventorLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.inventorLote"  style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadModificarDisplayWrapper">
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 120px;" />
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" />
                          <display:column property="importeA" title="%Autoría" headerClass="tableCellHeader" style="text-align:right;width:100px;" />
                          <display:column property="comboEsScpInventor" title="SCP" headerClass="tableCellHeader" style="width: 20px;" media="html"/>
                          <display:column property="participacionPorcentaje" title="%Participación" headerClass="tableCellHeader" style="width: 15%;"/>
                          <display:column property="distribucionPorcentaje" title="Total % de Distribución" headerClass="tableCellHeader" style="width: 15%;"/>
                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr class="tableRowFooter">
                      <td align="left" width="70%">Total Participación:&nbsp;</td>
                      <td class="CformNombre" width="15%" >
                        <html:text styleId="participacionTotal" style="text-align:right" readonly="true" maxlength="12" property="totalParticipacion" name="cPropiedadModificarActionForm" size="16" />
                      </td>
                      <td width="15%"> </td>
                    </tr>
                </table>
                </logic:notEmpty>
                <logic:empty property="inventorLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td class="CformNombre" width="100">Inventores:&nbsp;<span class="dato_obligatorio">*</span></td>
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
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
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
                    <td width="60%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">* Datos obligatorios</div>
                    </td>
                    <td width="40%" class="CformAreaBotones">
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>Atención: Debe informar al menos un Inventor</td>
            </tr>
          </table>
        </div>
        
         <div id="distribucionPropiedad">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td  class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irTabFinal()" />
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
                <logic:notEmpty property="distribucionLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.distribucionLote" id="distribucionDetalleEnOferta" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
                          <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader" style="width: 40%;" />
                          <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width: 30%;" />
                          <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width: 30%" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="distribucionLote" name="cPropiedadModificarActionForm">
                  <tr>
                    <td>No se seleccionó distribución&nbsp;</td>
                  </tr>
                </logic:empty>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%">
                  <tr>
                    <td class="CformAreaBotones" width="100%">
                      <div align="right">
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
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>

				<div id="seguimiento">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td  class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Registro&nbsp;<span class="dato_obligatorio">(2)</span></td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Fecha:</td>
                    <td class="CformDato">
                      <html:text property="pdia" maxlength="2" size="2" onkeypress="validarImporte(this)" />-
                      <html:text property="pmes" maxlength="2" size="2" onkeypress="validarImporte(this)" />-
                      <html:text property="panio" maxlength="4" size="4" onkeypress="validarImporte(this)" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Denominación:&nbsp;</td>
                    <td>
                      <html:textarea property="denominacion" cols="35" rows="3" onkeyup="isMaxLength(this,500)" />
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td>
                      <table width="100%">
                        <tr bgcolor="#DDEEFF">
                          <td>Organismo de Registro&nbsp;</td>
                        </tr>
                      </table>
                      <logic:notEmpty property="organismoRegistroLote" name="cPropiedadModificarActionForm">
                        <table width="100%">
                          <tr>
                            <td colspan="10">
                              <display:table name="sessionScope.cPropiedadModificarActionForm.organismoRegistroLote" decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
                                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                                <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 100px;" />
                                <display:column property="pais" title="País" headerClass="tableCellHeader" style="width:350px;" />
                              </display:table>
                            </td>
                          </tr>
                        </table>
                      </logic:notEmpty>
                      <logic:empty property="organismoRegistroLote" name="cPropiedadModificarActionForm">
                        <table width="100%">
                          <tr>
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
                            <div align="right">
                              <html:submit property="btnSubmit" styleClass="CformBoton" value="Seleccionar" />
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
                    <td width="60%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">*Datos Obligatorios&nbsp;</div>
                    </td>
                    <td width="40%" class="CformAreaBotones">
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>(1)Se pueden informar solo si el Tipo de Propiedad es Patente.</td>
            </tr>
            <tr>
              <td>(2)Si el estado de la Propiedad Intelectual es habilitado los datos del Registro son obligatorios.</td>
            </tr>
          </table>
        </div>

	<!--TABINSTANCIA-->
  <div id="instancia">
    <table  align="center" cellpadding="0" cellspacing="0" class="tablaMin">
	    <tr>
 		    <td class="CformAreaBotones">
		      <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm" onclick="irTabFinal()" />
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
          <logic:notEmpty property="instanciasLote" name="cPropiedadModificarActionForm">
	          <table width="100%" >
	            <tr>
	              <td>
                  <display:table name="sessionScope.cPropiedadModificarActionForm.instanciasLote" style="width:100%" decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
                    <display:column property="descripcionCfm" title="Instancia" headerClass="tableCellHeader"  />
                    <display:column property="fechaCfm" title="Fecha" headerClass="tableCellHeader" style="width: 200px;" />
	                </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>	

          <logic:empty property="instanciasLote" name="cPropiedadModificarActionForm">
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
			           <input type="button" class="CformBoton" value="Siguiente" name="cPropiedadModificarActionForm"   onclick="irTabSiguiente()" />
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
        <td class="CformAreaBotones">
          <div align="center" >
            <input type="button" class="CformBotonTranspBorde" value="|<<" name="cPropiedadModificarActionForm"   onclick="irTabInicial()" />
            <input type="button" class="CformBotonTranspBorde" value="<" name="cPropiedadModificarActionForm"   onclick="irTabAnterior()" />
            <input type="button" class="CformBotonTranspBorde" value=">" name="cPropiedadModificarActionForm"   onclick="irTabSiguiente()" />
            <input type="button" class="CformBotonTranspBorde" value=">>|" name="cPropiedadModificarActionForm"   onclick="irTabFinal()" />
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
                
	             <logic:notEqual value="DVH" property="rolUsuario" name="cPropiedadModificarActionForm">
	                <logic:equal value="S" property="publicable" name="cPropiedadModificarActionForm">
	                  <td class="CformDato">
	                    Sí
	                    <html:radio property="publica" value="S" />
	                    No
	                    <html:radio property="publica" value="N" />
	                  </td>
	                </logic:equal>
	                <logic:equal value="N" property="publicable" name="cPropiedadModificarActionForm">
	                  <td class="CformDato">
	                    Sí
	                    <html:radio property="publica" value="S" disabled="true" />
	                    No
	                    <html:radio property="publica" value="N" disabled="true" />
	                  </td>
	                </logic:equal>
                </logic:notEqual>
	             <logic:equal value="DVH" property="rolUsuario" name="cPropiedadModificarActionForm">
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

  <!--  CONFIRMACION -->

  <logic:equal property="accion" value="modificarCfm" name="cPropiedadModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Propiedad Intelectual&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                
                <table width="100%">
                  <logic:notEmpty property="codigoId" name="cPropiedadModificarActionForm">
                    <tr>
                      <td class="CformNombre" width="114">Código:&nbsp;</td>
                      <td class="CformDato">
                        <bean:write name="cPropiedadModificarActionForm" property="codigoId" />
                      </td>
                    </tr>
                  </logic:notEmpty>
                  <tr>
                    <td class="CformNombre" width="114">
                      Número:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="numeroPropiedad" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="114">
                      Título:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="descripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="114">Tipo Propiedad:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipoPropiedad">
                        <html:options collection="comboTipoPropiedad" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Prestador / Titular &nbsp;</strong></td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td colspan="10">
                      <display:table name="sessionScope.cPropiedadModificarActionForm.titularLote"  style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadModificarDisplayWrapper">
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="comboModificarEsTitularCfm" title="Rol" headerClass="tableCellHeader" style="width: 80px;" media="html" />
                        <display:column property="titularidadCfm" title="%Titularidad" headerClass="tableCellHeader" style="text-align:right;width:100px;"/>
                        <display:column property="comboEsScpCfm" title="SCP" headerClass="tableCellHeader" style="width: 15%;" media="html"/>
                      </display:table>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr class="tableRowFooter">
                    <td align="left" width="85%">%Total dentro del SCP:&nbsp;</td>
                    <td class="CformNombre" width="15%" >
                       <html:text style="text-align:right" readonly="true" maxlength="12" property="totalScp" name="cPropiedadModificarActionForm" size="16" />
                    </td>
                  </tr>
                </table>
                <!--  
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Gestor:&nbsp;</td>
                  </tr>
                </table>
                <logic:notEmpty property="colGestor" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                          <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colGestor" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>No se seleccionó gestor.&nbsp;</td>
                    </tr>
                  </table>
                </logic:empty>
                
                -->
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Equipamientos&nbsp;</strong></td>
                  </tr>
                </table>
                <logic:notEmpty property="equiposLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="22" style="width: 350px;" />
                          <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="marca" title="Marca" headerClass="tableCellHeader" maxLength="15" style="width: 350px;" />
                          <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
                          <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="equiposLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>No se seleccionaron equipamientos&nbsp;</td>
                    </tr>
                  </table>
                </logic:empty>

                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Información Tecnológica&nbsp;</strong></td>
                  </tr>
                </table>

                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Disciplina Primaria&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalDP" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="principalDP">
                          <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosDP" name="cPropiedadModificarActionForm">
                        <html:select disabled="false" property="loteOtrosDP" multiple="true" size="3">
                          <html:options collection="comboDisciplinaPrimariaC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
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
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalDD" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="principalDD">
                          <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosDD" name="cPropiedadModificarActionForm">
                        <html:select disabled="false" property="loteOtrosDD" multiple="true" size="3">
                          <html:options collection="comboDisciplinaDesagregadaC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Campo de Aplicación&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalCA" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="principalCA">
                          <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosCA" name="cPropiedadModificarActionForm">
                        <html:select disabled="false" property="loteOtrosCA" multiple="true" size="3">
                          <html:options collection="comboCampoAplicacionC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
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
                    <td class="CformNombre" width="100">Principal:&nbsp;</td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalCO" name="cPropiedadModificarActionForm">
                        <html:select disabled="true" property="principalCO">
                          <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosCO" name="cPropiedadModificarActionForm">
                        <html:select disabled="false" property="loteOtrosCO" multiple="true" size="3">
                          <html:options collection="comboClasificacionOnuC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Clasificación Internacional Alfanumérica OMPI&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">
                      Código CIP:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="cip" />
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
                      <bean:write name="cPropiedadModificarActionForm" property="palabraClave1" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">2ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="palabraClave2" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">3ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="palabraClave3" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">4ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="palabraClave4" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">5ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="palabraClave5" />
                    </td>
                  </tr>
                </table>
                
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Inventores&nbsp;</strong></td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td colspan="10">
                      <display:table name="sessionScope.cPropiedadModificarActionForm.inventorLote" style="width:100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadModificarDisplayWrapper">
                        <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 120px;" />
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="importeAConfirmado" title="% de autoría" headerClass="tableCellHeader" style="text-align:right; width: 100px;" />
                        <display:column property="comboEsScpInventorConfirmado" title="SCP" headerClass="tableCellHeader" media="html"/>
                        <display:column property="participacionPorcentajeConfirmado" title="%Participación" headerClass="tableCellHeader"/>
                        <display:column property="distribucionPorcentajeConfirmado" title="%Total Distribución" headerClass="tableCellHeader"/>
                      </display:table>
                    </td>
                  </tr>
                </table>

                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Distribución de Beneficios&nbsp;</strong></td>
                  </tr>
                </table>
                <logic:notEmpty property="distribucionLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cPropiedadModificarActionForm.distribucionLote"  style="width:100%" id="distribucionDetalleEnOferta" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadInventorDistribucionDisplayWrapper">
                          <display:column property="tipoEgresoDescripcion" title="Tipo Imputación" headerClass="tableCellHeader" style="width: 300px;" />
                          <display:column property="importePorcentual" title="% Asignado" headerClass="tableCellHeader" style="text-align:right;width: 100px;" />
                          <display:column property="sugerido" title="% Sugerido" headerClass="tableCellHeader" style="width: 200px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr class="tableRowFooter">
                      <td align="left" width="60%">%Total fuera del SCP:&nbsp;</td>
                      <td class="CformNombre" width="150" >
                        <html:text style="text-align:right" readonly="true" maxlength="12" property="totalNoScp" name="cPropiedadModificarActionForm" size="16" />
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="distribucionLote" name="cPropiedadModificarActionForm">
                  <table width="100%">
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
                <table width="100%">
                  <tr>
                    <td>
	                  <display:table name="sessionScope.cPropiedadModificarActionForm.instanciasLote" style="width:100%" decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
	                    <display:column property="descripcionCfm" title="Instancia" headerClass="tableCellHeader" style="width: 400px;" />
	                    <display:column property="fechaCfm" title="Fecha" headerClass="tableCellHeader" style="width: 200px;" />
	                  </display:table>
                    </td>
                  </tr>
                </table>

                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Registro&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">Fecha:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cPropiedadModificarActionForm" property="pdia" />-
                      <bean:write name="cPropiedadModificarActionForm" property="pmes" />-
                      <bean:write name="cPropiedadModificarActionForm" property="panio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Denominación:&nbsp;</td>
                    <td>
                      <bean:write name="cPropiedadModificarActionForm" property="denominacion" />
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td>
                      <table width="100%">
                        <tr bgcolor="#DDEEFF">
                          <td>Organismo de Registro&nbsp;</td>
                        </tr>
                      </table>
                      <logic:notEmpty property="organismoRegistroLote" name="cPropiedadModificarActionForm">
                        <table width="100%">
                          <tr>
                            <td colspan="10">
                              <display:table name="sessionScope.cPropiedadModificarActionForm.organismoRegistroLote" decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
                                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                                <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 100px;" />
                                <display:column property="pais" title="País" headerClass="tableCellHeader" style="width:350px;" />
                              </display:table>
                            </td>
                          </tr>
                        </table>
                      </logic:notEmpty>
                      <logic:empty property="organismoRegistroLote" name="cPropiedadModificarActionForm">
                        <table width="100%">
                          <tr>
                            <td>No se selecciono organismo de Registro&nbsp;</td>
                          </tr>
                        </table>
                      </logic:empty>
                    </td>
                  </tr>
                </table>
                 <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Situación Actual&nbsp;</strong></td>
                  </tr>
                </table>
                <table width="100%">
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
                  <tr>
                    <td class="CformNombre" width="114">Publicar:&nbsp;</td>
                    <td class="CformDato">
                      Sí<html:radio property="publica" value="S" disabled="true" />
                      No<html:radio property="publica" value="N" disabled="true" />
                      <html:hidden property="publica" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>

  
</html:form>
