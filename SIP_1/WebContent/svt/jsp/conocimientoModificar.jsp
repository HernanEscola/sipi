<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/scriptaculous/jquery-1.7.2.min.js"></script>

<script>
<capplication:isApplication application="SVT">
  solapas = new Array('tab1', 'equiposConocimiento','tab2','tabSeguimiento');
</capplication:isApplication>

<capplication:isApplication application="SVTP">
  solapas = new Array('tab1','equiposConocimiento','tab2','tabSeguimiento');
</capplication:isApplication>

function irTabFinal(){
  document.cConocimientoModificarActionForm.tab.value=solapas[solapas.length-1];
  setupPanes("container", document.cConocimientoModificarActionForm.tab.value);
}

function irTabInicial(){
  document.cConocimientoModificarActionForm.tab.value=solapas[0];
  setupPanes("container", document.cConocimientoModificarActionForm.tab.value);
}

function irTabAnterior(){
  var obj = document.cConocimientoModificarActionForm.tab.value;
  for(i=1;i<solapas.length;i++){
    if ((solapas[i] == obj)) {
      document.cConocimientoModificarActionForm.tab.value=solapas[i-1];
      break;
    }  
  }  
  setupPanes("container", document.cConocimientoModificarActionForm.tab.value);
}

function irTabSiguiente(){
  var obj = document.cConocimientoModificarActionForm.tab.value;
  for(i=0;i<(solapas.length-1);i++){
    if ((solapas[i] == obj)) {
      document.cConocimientoModificarActionForm.tab.value=solapas[i+1];
      break;
    }  
  }  
  setupPanes("container", document.cConocimientoModificarActionForm.tab.value);
}

window.onload=function(){
setupPanes("container", document.cConocimientoModificarActionForm.tab.value);
<capplication:isApplication application="SVTP">
  marcarObligatorios();
</capplication:isApplication>
}

function setFoco(){
	x=event.keyCode
	if((x==13)){ // enter
		window.event.returnValue = false
	}
}

function mostrarPanel(obj1, obj2){
  	document.cConocimientoModificarActionForm.tab.value = obj2.id;
  	return showPane(obj1, obj2);
}


function ComboSeleccionadoDP() {

	for (m=document.cConocimientoModificarActionForm.comboDisciplinaPrimariaM.options.length-1;m>0;m--){
		if(document.cConocimientoModificarActionForm.comboDisciplinaPrimariaM.options[m].selected = false){
		document.cConocimientoModificarActionForm.comboDisciplinaPrimariaM.options[m]=null;}
	}
}

function habilitarCamposByDP(){

  if ((document.cConocimientoModificarActionForm.principalDP.value == "-1") ||(document.cConocimientoModificarActionForm.principalDP.value == "-2")) {
	document.cConocimientoModificarActionForm.loteOtrosDP.disabled=true;
	document.cConocimientoModificarActionForm.loteOtrosDP.className = 'CformTextDisabled';
	for (m=document.cConocimientoModificarActionForm.loteOtrosDP.options.length-1;m>0;m--){
	 document.cConocimientoModificarActionForm.loteOtrosDP.options[m].selected = false;
	}

  }else {
	document.cConocimientoModificarActionForm.loteOtrosDP.disabled=false;
	document.cConocimientoModificarActionForm.loteOtrosDP.className = 'CformTextEnabled';
  }
}

function habilitarCamposByDD(){

  if ((document.cConocimientoModificarActionForm.principalDD.value == "-1") ||(document.cConocimientoModificarActionForm.principalDD.value == "-2")) {
    document.cConocimientoModificarActionForm.loteOtrosDD.disabled=true;
    document.cConocimientoModificarActionForm.loteOtrosDD.className = 'CformTextDisabled';
    for (m=document.cConocimientoModificarActionForm.loteOtrosDD.options.length-1;m>0;m--){
	 document.cConocimientoModificarActionForm.loteOtrosDD.options[m].selected = false;
    }

  } else{
    document.cConocimientoModificarActionForm.loteOtrosDD.disabled=false;
    document.cConocimientoModificarActionForm.loteOtrosDD.className = 'CformTextEnabled';

  }
}


function habilitarCamposByCA(){

  if ((document.cConocimientoModificarActionForm.principalCA.value == "-1") ||(document.cConocimientoModificarActionForm.principalCA.value == "-2")) {
    document.cConocimientoModificarActionForm.loteOtrosCA.disabled=true;
    document.cConocimientoModificarActionForm.loteOtrosCA.className = 'CformTextDisabled';
    for (m=document.cConocimientoModificarActionForm.loteOtrosCA.options.length-1;m>0;m--){
	 document.cConocimientoModificarActionForm.loteOtrosCA.options[m].selected = false;
    }

  } else{
    document.cConocimientoModificarActionForm.loteOtrosCA.disabled=false;
    document.cConocimientoModificarActionForm.loteOtrosCA.className = 'CformTextEnabled';
  }
}

function habilitarCamposByCO(){

  if ((document.cConocimientoModificarActionForm.principalCO.value == "-1") ||(document.cConocimientoModificarActionForm.principalCO.value == "-2")) {
    document.cConocimientoModificarActionForm.loteOtrosCO.disabled=true;
    document.cConocimientoModificarActionForm.loteOtrosCO.className = 'CformTextDisabled';
    for (m=document.cConocimientoModificarActionForm.loteOtrosCO.options.length-1;m>0;m--){
	 document.cConocimientoModificarActionForm.loteOtrosCO.options[m].selected = false;
    }

  } else{
    document.cConocimientoModificarActionForm.loteOtrosCO.disabled=false;
    document.cConocimientoModificarActionForm.loteOtrosCO.className = 'CformTextEnabled';
  }
}




function habilitarPublicacionByHabilitados(obj){
	
	if (document.cConocimientoModificarActionForm.rolUsuario.value!="DVH"){
		
			
	        <logic:iterate id="estadoTipoOferta"  property="estadosByTipoOferta" name="cConocimientoModificarActionForm">
        	     <bean:define id="EstadosTipoOfertaId" name="estadoTipoOferta" property="tipoEstado"/>


                	if ( obj.value == <bean:write name="EstadosTipoOfertaId" property="id" /> ){
			  if (<bean:write property="publicable" name="estadoTipoOferta" />){

        	                document.cConocimientoModificarActionForm.publica[0].disabled=false;
                	        document.cConocimientoModificarActionForm.publica[1].disabled=false;
			  }else {


        	                document.cConocimientoModificarActionForm.publica[0].checked=false;
                	        document.cConocimientoModificarActionForm.publica[0].disabled=true;
                        	document.cConocimientoModificarActionForm.publica[1].checked=true;
	                        document.cConocimientoModificarActionForm.publica[1].disabled=true;
        	          }
			}

		</logic:iterate>
		
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
<html:form action="cConocimientoModificarAction.do" method="POST">
  <html:hidden property="tab" />
  <html:hidden property="publicable" />
  <html:hidden property="accion" />
  <html:hidden property="rolUsuario" />
  
  <logic:equal property="accion" value="modificar" name="cConocimientoModificarActionForm">
    <div class="tab-container" id="container">
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin" >
        <tr>
          <td>
            <ul class="tabs">
              <li><a href="#" onClick="return mostrarPanel('tema', this)" id="tab1">DYC</a></li>
              <!--  
              <capplication:isApplication application="SVT">
                <li><a href="#" onClick="return mostrarPanel('gestor', this)" id="tabGestor">UVT</a></li>
              </capplication:isApplication>
              -->
              <li><a href="#" onClick="return mostrarPanel('equiposTema', this)" id="equiposConocimiento">Equipamientos</a></li>
              <li><a href="#" onClick="return mostrarPanel('informacionTecnologica', this)" id="tab2">Inf.Tecnológica</a></li>
              <!--  
              <li><a href="#" onClick="return mostrarPanel('palabrasClaves', this)" id="tab3">Palabras Claves</a></li>
              -->
              <li><a href="#" onClick="return mostrarPanel('seguimiento', this)" id="tabSeguimiento">Seguimiento</a></li>
            </ul>
          </td>
        </tr>
      </table>

      <div>
        <!--tab1-->
        <div id="tema">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cConocimientoModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cConocimientoModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cConocimientoModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center"  >

       <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>Prestador:&nbsp;<span class="dato_obligatorio">*</span></td>
             </tr>
            </table>

             <logic:notEmpty property="prestadorLote" name="cConocimientoModificarActionForm">
              <table width="100%" >
                <tr>
                  <td colspan="10">
                    <display:table name="sessionScope.cConocimientoModificarActionForm.prestadorLote" style="width:100%" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
                      <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader"/>
                      <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 300px;" />
                      <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                      <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 140px;" />
                    </display:table>
                  </td>
                 </tr>
               </table>
            </logic:notEmpty>
            <logic:empty property="prestadorLote" name="cConocimientoModificarActionForm">
              <table width="100%" >
                <tr >
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
                  <td class="CformAreaBotones" >
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
          <logic:equal value="N" property="prestadorBloqueado" name="cConocimientoModificarActionForm">
          <tr>
            <td>
              <table width="100%" >
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
          </logic:equal>
          </capplication:isApplication>
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Desarrollos y Conocimientos&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="150">Título:&nbsp;<span class="dato_obligatorio">*</span></td>
                    <td class="CformDato">
                      <html:textarea property="descripcion" rows="3" onkeydown="setFoco()" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="150">Detalle:&nbsp;</td>
                    <td class="CformDato">
                      <html:textarea property="detalle" rows="3"/>
                    </td>
                  </tr>
                  <tr>
	                 <td class="CformNombre" width="150">Responsable Técnico:&nbsp;&nbsp;</td>
	                 <td class="CformDato" ><html:text property="responsable"  maxlength="80" size="63"/></td>
              	</tr>
                  <!--  
                    <tr>
                      <td class="CformNombre" width="150">Estado:&nbsp;<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato">
                        <html:select disabled="false" property="tipoEstado" onchange="habilitarPublicacionByHabilitados(this)">
                          <html:options collection="comboEstadosByTipoOferta" property="value" labelProperty="label" />
                        </html:select>
                      </td>
                    </tr>
                    <capplication:isApplication application="SVT">
                    <tr>
                      <td class="CformNombre" width="150">Publicación Web:&nbsp;</td>
                      <logic:equal value="S" property="publicable" name="cConocimientoModificarActionForm">
                        <td class="CformDato">
                          Sí<html:radio property="publica" value="S" />
                          No<html:radio property="publica" value="N" />
                        </td>
                      </logic:equal>
                      <logic:equal value="N" property="publicable" name="cConocimientoModificarActionForm">
                        <td class="CformDato">
                          Sí<html:radio property="publica" value="S" disabled="true" />
                          No<html:radio property="publica" value="N" disabled="true" />
                        </td>
                      </logic:equal>
                      <html:hidden property="publica" />
                    </tr>
                  </capplication:isApplication>
                  -->
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        
        <!--Tab gestor-->
        <!--  
        <div id="gestor">
          <table align="center" cellpadding="0" cellspacing="0" width="600">
            <tr>
              <td width="600" class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cConocimientoModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cConocimientoModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cConocimientoModificarActionForm" onclick="irTabFinal()" />
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
                <logic:notEmpty property="colGestor" name="cConocimientoModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cConocimientoModificarActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                          <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colGestor" name="cConocimientoModificarActionForm">
                  <table width="100%">
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        -->
          <!--Tab 4 Equipos/-->
        <div id="equiposTema">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cConocimientoModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cConocimientoModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cConocimientoModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Equipamientos:&nbsp;
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="equiposLote" name="cConocimientoModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table style="width:100%" name="sessionScope.cConocimientoModificarActionForm.equiposLote" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" maxLength="22" />
                          <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="marca" title="Marca" headerClass="tableCellHeader" style="width: 350px;" maxLength="15" />
                          <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
                          <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" maxLength="6" style="width: 80px;" />
    
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="equiposLote" name="cConocimientoModificarActionForm">
                  <tr>
                    <td>
                      No se seleccionaron equipamientos&nbsp;
                    </td>
                  </tr>
                </logic:empty>
              </td>
            </tr>
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
            <tr>
              <td>
                <table width="100%">
                  <tr>
                    <td width="40%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">
                        &nbsp;
                      </div>
                    </td>
                    <td width="60%" class="CformAreaBotones">
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
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
                    <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cConocimientoModificarActionForm" onclick="irTabInicial()" />
                    <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cConocimientoModificarActionForm" onclick="irTabAnterior()" />
                    <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                    <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cConocimientoModificarActionForm" onclick="irTabFinal()" />
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
                      <td class="CformNombre" width="55" id="dispPrimariaPpal">Principal:&nbsp;</td>
                      <td class="CformDato">
                        <html:select property="principalDP" onchange="habilitarCamposByDP()">
                          <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="55">Otras:&nbsp;</td>
                      <td class="CformDato">
                        <logic:lessEqual value="-1" property="principalDP" name="cConocimientoModificarActionForm">
                          <html:select disabled="true" property="loteOtrosDP" multiple="true" size="3" onchange="habilitarCamposByDP()">
                            <html:options collection="comboDisciplinaPrimariaM" property="value" labelProperty="label" />
                          </html:select>
                        </logic:lessEqual>
                        <logic:greaterThan value="-1" property="principalDP" name="cConocimientoModificarActionForm">
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
                      <td class="CformNombre" width="55" id="dispDesagregadaPpal">Principal:&nbsp;</td>
                      <td class="CformDato">
                        <html:select disabled="false" property="principalDD" onchange="habilitarCamposByDD()">
                          <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="55">Otras:&nbsp;</td>
                      <td class="CformDato">
                        <logic:lessEqual value="-1" property="principalDD" name="cConocimientoModificarActionForm">
                          <html:select disabled="true" property="loteOtrosDD" multiple="true" size="3" onchange="habilitarCamposByDD()">
                            <html:options collection="comboDisciplinaDesagregadaM" property="value" labelProperty="label" />
                          </html:select>
                        </logic:lessEqual>
                        <logic:greaterThan value="-1" property="principalDD" name="cConocimientoModificarActionForm">
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
                      <td class="CformNombre" width="55" id="campoAplicPpal">Principal:&nbsp;</td>
                      <td class="CformDato">
                        <html:select disabled="false" property="principalCA" onchange="habilitarCamposByCA()">
                          <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="55">Otras:&nbsp;</td>
                      <td class="CformDato">
                        <logic:lessEqual value="-1" property="principalCA" name="cConocimientoModificarActionForm">
                          <html:select disabled="true" property="loteOtrosCA" multiple="true" size="3" onchange="habilitarCamposByCA()">
                            <html:options collection="comboCampoAplicacionM" property="value" labelProperty="label" />
                          </html:select>
                        </logic:lessEqual>
                        <logic:greaterThan value="-1" property="principalCA" name="cConocimientoModificarActionForm">
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
                      <td class="CformNombre" width="60" id="activIndPpal">Principal:&nbsp;
                      </td>
                      <td class="CformDato">
                        <html:select disabled="false" property="principalCO" onchange="habilitarCamposByCO()">
                          <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" filter="false"/>
                        </html:select>
                      </td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="55">Otras:&nbsp;</td>
                      <td class="CformDato">
                        <logic:lessEqual value="-1" property="principalCO" name="cConocimientoModificarActionForm">
                          <html:select disabled="true" property="loteOtrosCO" multiple="true" size="3" onchange="habilitarCamposByCO()">
                            <html:options collection="comboClasificacionOnuM" property="value" labelProperty="label" filter="false"/>
                          </html:select>
                        </logic:lessEqual>
                        <logic:greaterThan value="-1" property="principalCO" name="cConocimientoModificarActionForm">
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
                    <td class="CformNombre" width="100" id="pClave1">1ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave1" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave2">2ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave2" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave3">3ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave3" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave4">4ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave4" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave5">5ª:&nbsp;</td>
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
                          <input type="button" class="CformBoton" value="Siguiente" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
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
                  <b>
                    Futuros clientes realizarán búsquedas en base a estos campos, cuanta más información coloque mejor promovida será su OT.
                 </b>
              </td>
             </tr>
            </table>
        </div>


        <!--tab3  -  PALABRAS CLAVES-->
        <!--  
        <div id="palabrasClaves">
          <table align="center" cellpadding="0" cellspacing="0" width="600">
            <tr>
              <td width="600" class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cConocimientoModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cConocimientoModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cConocimientoModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>

          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="400">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>Palabras Claves&nbsp;</td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100" id="pClave1">1ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave1" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave2">2ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave2" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave3">3ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave3" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave4">4ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave4" maxlength="40" size="40" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100" id="pClave5">5ª:&nbsp;</td>
                    <td class="CformDato">
                      <html:text property="palabraClave5" maxlength="40" size="40" />
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table>
                  <tr id="areaBotonesPClaves">
                    <td width="400" class="CformAreaBotones">
                      <div align="right">
                        <input type="button" class="CformBoton" value="Siguiente" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        -->

         <!--Tab Seguimiento-->
         <div id="seguimiento">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cConocimientoModificarActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cConocimientoModificarActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cConocimientoModificarActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cConocimientoModificarActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" >
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
                      <logic:notEqual value="DVH" property="rolUsuario" name="cConocimientoModificarActionForm">
	                      <logic:equal value="S" property="publicable" name="cConocimientoModificarActionForm">
	                        <td class="CformDato">
	                          Sí
	                          <html:radio property="publica" value="S" />
	                          No
	                          <html:radio property="publica" value="N" />
	                        </td>
	                      </logic:equal>
	                      <logic:equal value="N" property="publicable" name="cConocimientoModificarActionForm">
	                        <td class="CformDato">
	                          Sí
	                          <html:radio property="publica" value="S" disabled="true" />
	                          No
	                          <html:radio property="publica" value="N" disabled="true" />
	                        </td>
	                      </logic:equal>
					  </logic:notEqual>	                      
                      
                      <logic:equal value="DVH" property="rolUsuario" name="cConocimientoModificarActionForm">
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
                    <td width="60%" class="CformAreaBotones">
                      <div align="left" class="dato_obligatorio">
                        * Datos obligatorios
                      </div>
                    </td>
                   
                    <td width="40%" class="CformAreaBotones">
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
                  Para su contratación el estado del Conocimiento debe ser "Aprobado" o "Autorizado".
                </td>
              </tr>
            </table>
          </capplication:isApplication>
        </div>
       <!-- Fin tabSeguimiento -->

      </div>
    </div>
  </logic:equal>

  <!--  CONFIRMACION -->

  <logic:equal property="accion" value="modificarCfm" name="cConocimientoModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Desarrollos y Conocimientos&nbsp;</strong>
                    </td>
                  </tr>
                </table>

                <table width="100%">
	                <logic:notEmpty property="codigoId" name="cConocimientoModificarActionForm">
	                  <tr>
	                    <td class="CformNombre" width="114">Código:&nbsp;</td>
	                    <td class="CformDato">
	                      <bean:write name="cConocimientoModificarActionForm" property="codigoId" />
	                    </td>
	                  </tr>
                  </logic:notEmpty>
                  <tr>
                    <td class="CformNombre" width="114">Título:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="descripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="114">Detalle:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="detalle" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="114">Responsable Técnico:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="responsable" />
                    </td>
                  </tr>
                  <!-- 
                  <tr>
                    <td class="CformNombre" width="114">Estado:&nbsp;</td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipoEstado">
                        <html:options collection="comboTipoEstado" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                   <capplication:isApplication application="SVT">
                    <tr>
                      <td class="CformNombre" width="110">Publicar:</td>
                      <td class="CformDato">
                        Sí<html:radio property="publica" value="S" disabled="true" />
                        No<html:radio property="publica" value="N" disabled="true" />
                        <html:hidden property="publica" />
                      </td>
                    </tr>
                  </capplication:isApplication>
                  -->
                </table>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Prestador &nbsp;</strong></td>
                  </tr>
                </table>
                
                <table width="100%" >
                  <tr>
                    <td colspan="10">
                      <display:table name="sessionScope.cConocimientoModificarActionForm.prestadorLote" style="width:100%" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 300px;" />
                        <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 140px;" />
                      </display:table>
                    </td>
                  </tr>
                </table>
                
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Equipamientos&nbsp;</strong></td>
                  </tr>
                </table>
                <logic:notEmpty property="equiposLote" name="cConocimientoModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table  name="sessionScope.cConocimientoModificarActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
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
                <logic:empty property="equiposLote" name="cConocimientoModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>No se seleccionaron equipamientos&nbsp;</td>
                    </tr>
                  </table>
                </logic:empty>
                <!--  
                <capplication:isApplication application="SVT"> 
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>UVT:&nbsp;</strong></td>
                  </tr>
                </table>
                <logic:notEmpty property="colGestor" name="cConocimientoModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cConocimientoModificarActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                          <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colGestor" name="cConocimientoModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>No se seleccionó UVT.&nbsp;</td>
                    </tr>
                  </table>
                </logic:empty>
              </capplication:isApplication>
              -->
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
                      <logic:greaterThan value="0" property="principalDP" name="cConocimientoModificarActionForm">
                        <html:select  disabled="true"  property="principalDP">
                          <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosDP" name="cConocimientoModificarActionForm">
                        <html:select property="loteOtrosDPVista" multiple="true" size="3">
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
                      <logic:greaterThan value="0" property="principalDD" name="cConocimientoModificarActionForm">
                        <html:select disabled="true"  property="principalDD">
                          <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosDD" name="cConocimientoModificarActionForm">
                        <html:select property="loteOtrosDDVista" multiple="true" size="3">
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
                      <logic:greaterThan value="0" property="principalCA" name="cConocimientoModificarActionForm">
                        <html:select disabled="true"  property="principalCA">
                          <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosCA" name="cConocimientoModificarActionForm">
                        <html:select property="loteOtrosCAVista" multiple="true" size="3">
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
                      <logic:greaterThan value="0" property="principalCO" name="cConocimientoModificarActionForm">
                        <html:select disabled="true"  property="principalCO">
                          <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">Otras:&nbsp;</td>
                    <td class="CformDato">
                      <logic:notEmpty property="loteOtrosCO" name="cConocimientoModificarActionForm">
                        <html:select property="loteOtrosCOVista" multiple="true" size="3">
                          <html:options collection="comboClasificacionOnuC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>

                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td><strong>Palabras Claves&nbsp;</strong></td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="100">1ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="palabraClave1" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">2ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="palabraClave2" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">3ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="palabraClave3" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">4ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="palabraClave4" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">5ª:&nbsp;</td>
                    <td class="CformDato">
                      <bean:write name="cConocimientoModificarActionForm" property="palabraClave5" />
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
