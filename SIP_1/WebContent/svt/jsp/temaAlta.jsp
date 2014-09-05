<%@include file="layout/include.jsp"%>

<%@page import="java.net.URLEncoder"%><link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/scriptaculous/jquery-1.7.2.min.js"></script>

<script>

<capplication:isApplication application="SVT">
  solapas = new Array('tab1','tab4','tab2', 'tabSeguimiento');
</capplication:isApplication>

<capplication:isApplication application="SVTP">
  solapas = new Array('tab1','tab4','tab2', 'tabSeguimiento');
</capplication:isApplication>

window.onload=function(){
setupPanes("container", document.cTemaActionForm.cambiaPanel.value);
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

function irTabFinal(){
  document.cTemaActionForm.cambiaPanel.value=solapas[solapas.length-1];
  setupPanes("container", document.cTemaActionForm.cambiaPanel.value);
}

function irTabInicial(){
  document.cTemaActionForm.cambiaPanel.value=solapas[0];
  setupPanes("container", document.cTemaActionForm.cambiaPanel.value);
}

function irTabAnterior(){
  var obj = document.cTemaActionForm.cambiaPanel.value;
  for(i=1;i<solapas.length;i++){
    if ((solapas[i] == obj)) {
      document.cTemaActionForm.cambiaPanel.value=solapas[i-1];
      break;
    }  
  }  
  setupPanes("container", document.cTemaActionForm.cambiaPanel.value);
}

function irTabSiguiente(){
  var obj = document.cTemaActionForm.cambiaPanel.value;
  for(i=0;i<(solapas.length-1);i++){
    if ((solapas[i] == obj)) {
      document.cTemaActionForm.cambiaPanel.value=solapas[i+1];
      break;
    }  
  }  
  setupPanes("container", document.cTemaActionForm.cambiaPanel.value);
}

function mostrarPanel(obj1, obj2){
  document.cTemaActionForm.cambiaPanel.value = obj2.id;
  return showPane(obj1, obj2);
}

function habilitarCamposByDP(){
  if ((document.cTemaActionForm.principalDP.value == "-1") ||(document.cTemaActionForm.principalDP.value == "-2")) {
	document.cTemaActionForm.disciplinaPrimaria.disabled=true;
	document.cTemaActionForm.disciplinaPrimaria.className = 'CformTextDisabled';
	for (m=document.cTemaActionForm.disciplinaPrimaria.options.length-1;m>0;m--){
		document.cTemaActionForm.disciplinaPrimaria.options[m].selected = false;
	}

  }else {
	document.cTemaActionForm.disciplinaPrimaria.disabled=false;
	document.cTemaActionForm.disciplinaPrimaria.className = 'CformTextEnabled';
  }
}

function habilitarCamposByDD(){
  if ((document.cTemaActionForm.principalDD.value == "-1") ||(document.cTemaActionForm.principalDD.value == "-2")) {
    document.cTemaActionForm.disciplinaDesagregada.disabled=true;
    document.cTemaActionForm.disciplinaDesagregada.className = 'CformTextDisabled';
    for (m=document.cTemaActionForm.disciplinaDesagregada.options.length-1;m>0;m--){
	document.cTemaActionForm.disciplinaDesagregada.options[m].selected = false;
    }

  } else{
    document.cTemaActionForm.disciplinaDesagregada.disabled=false;
    document.cTemaActionForm.disciplinaDesagregada.className = 'CformTextEnabled';

  }
}
function habilitarCamposByCO(){
  if ((document.cTemaActionForm.principalCO.value == "-1") ||(document.cTemaActionForm.principalCO.value == "-2")) {
    document.cTemaActionForm.clasificacionOnu.disabled=true;
    document.cTemaActionForm.clasificacionOnu.className = 'CformTextDisabled';
    for (m=document.cTemaActionForm.clasificacionOnu.options.length-1;m>0;m--){
	document.cTemaActionForm.clasificacionOnu.options[m].selected = false;
    }

  } else{
    document.cTemaActionForm.clasificacionOnu.disabled=false;
    document.cTemaActionForm.clasificacionOnu.className = 'CformTextEnabled';

  }
}
function habilitarCamposByCA(){
  if ((document.cTemaActionForm.principalCA.value == "-1") ||(document.cTemaActionForm.principalCA.value == "-2")) {
    document.cTemaActionForm.campoAplicacion.disabled=true;
    document.cTemaActionForm.campoAplicacion.className = 'CformTextDisabled';
    for (m=document.cTemaActionForm.campoAplicacion.options.length-1;m>0;m--){
	document.cTemaActionForm.campoAplicacion.options[m].selected = false;
    }

  } else{
    document.cTemaActionForm.campoAplicacion.disabled=false;
    document.cTemaActionForm.campoAplicacion.className = 'CformTextEnabled';

  }
}

function pedirConfirmacion(url){
    url.href = 'cTemaAltaAction.do?accion=oferta';
    msg = 'Se perderán los datos no grabados, ¿desea continuar?';
    if (window.confirm(msg)){
      url.href = url.href;
    }else{
      url.href = '#';
    }
  }


function habilitarPublicacionByHabilitados(obj){

		if (document.cTemaActionForm.rolUsuario.value!="DVH"){
			<logic:iterate id="estadoTipoOferta"  property="estadosByTipoOferta" name="cTemaActionForm">
	             <bean:define id="EstadosTipoOfertaId" name="estadoTipoOferta" property="tipoEstado"/>
				    if ( obj.value == <bean:write name="EstadosTipoOfertaId" property="id" /> ){
				         if (<bean:write property="publicable" name="estadoTipoOferta" />){
			                        document.cTemaActionForm.publica[0].disabled=false;
			                        document.cTemaActionForm.publica[1].disabled=false;
						  }else {
			                        document.cTemaActionForm.publica[0].checked=false;
			                        document.cTemaActionForm.publica[0].disabled=true;
			                        document.cTemaActionForm.publica[1].checked=true;
			                        document.cTemaActionForm.publica[1].disabled=true;
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
<capplication:isApplication application="SVTP">
  <logic:equal value="si" property="modificaOferta" name="cTemaActionForm">
  Modificaci&oacute;n de Oferta Tecnol&oacute;gica
  </logic:equal>
  <logic:notEqual value="si" property="modificaOferta" name="cTemaActionForm">
  Registro de Desarrollos y Conocimientos
  </logic:notEqual>
</capplication:isApplication>
<capplication:isApplication application="SVT">
  Registro de Desarrollos y Conocimientos
</capplication:isApplication>
</h1>
<html:form action="cTemaAltaAction.do" method="POST">
  <html:hidden property="accion" />
  <html:hidden property="cambiaPanel" />
  <html:hidden property="publicable" />
  <html:hidden property="rolUsuario" />
  <logic:equal property="accion" value="alta" name="cTemaActionForm">
    <div class="tab-container" id="container">
      <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
        <tr>
          <td>
            <ul class="tabs">
              <capplication:isApplication application="SVTP">
  				      <logic:notEqual value="si" property="modificaOferta" name="cTemaActionForm">
	                  <li><a href="cTipoOfertaSeleccionarAction.do?accion=volver" onClick="return pedirConfirmacion(this)">Oferta</a></li>
				        </logic:notEqual>
			        </capplication:isApplication>
              <capplication:isApplication application="SVT">
	               <li><a href="cTipoOfertaSeleccionarAction.do?accion=volver" onClick="return pedirConfirmacion(this)">Oferta</a></li>
			        </capplication:isApplication>
              <li><a href="#" onClick="return mostrarPanel('tema', this)" id="tab1">DYC</a></li>
              <li><a href="#" onClick="return mostrarPanel('equipos', this)" id="tab4">Equipamientos</a></li>
              <!--  
              <capplication:isApplication application="SVT">
                <li><a href="#" onClick="return mostrarPanel('gestor', this)" id="tabGestor">UVT</a></li>
              </capplication:isApplication>
              -->
              <li><a href="#" onClick="return mostrarPanel('informacionTecnologica', this)" id="tab2">Información Tecnológica</a></li>
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
                <div align="center" >
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cTemaActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cTemaActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cTemaActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cTemaActionForm" onclick="irTabFinal()" />
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
                      Prestador:&nbsp;
                      <span class="dato_obligatorio">*</span>
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="prestadorLote" name="cTemaActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cTemaActionForm.prestadorLote" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
                          <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="prestadorLote" name="cTemaActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionó prestador&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
              </td>
            </tr>
            <capplication:isApplication application="SVT">
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
            </capplication:isApplication>
            <capplication:isApplication application="SVTP">
            <logic:equal value="N" property="prestadorBloqueado" name="cTemaActionForm">
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
            </logic:equal>
            </capplication:isApplication>
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Desarrollos y Conocimientos:&nbsp;
                    </td>
                  </tr>
                </table>

                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="150">
                      Título:&nbsp;<span class="dato_obligatorio">*</span>
                    </td>
                    <td class="CformDato">
                      <html:textarea property="descripcion" rows="3" onkeydown="setFoco()" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="150">
                      Detalle:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:textarea property="detalle" rows="3"/>
                    </td>
                  </tr>
                  <tr>
	                 <td class="CformNombre" width="150">Responsable Técnico:&nbsp;&nbsp;</td>
	                 <td class="CformDato" ><html:text property="responsable"  maxlength="80" size="63"/></td>
              	</tr>
                  
                  <!-- No borrar lo comentado
                  <capplication:isApplication application="SVT">
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
                    <tr>
                      <td class="CformNombre" width="150">
                        Publicación Web:&nbsp;
                      </td>
                      <logic:equal value="S" property="publicable" name="cTemaActionForm">
                        <td class="CformDato">
                          Sí
                          <html:radio property="publica" value="S" />
                          No
                          <html:radio property="publica" value="N" />
                        </td>
                      </logic:equal>
                      <logic:equal value="N" property="publicable" name="cTemaActionForm">
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
                  -->
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cTemaActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                        <logic:notEmpty property="copiarNuevaOferta" name="cTemaActionForm">
                          <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                        </logic:notEmpty>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        <!-- tabGestor-->
        <!--  
        <capplication:isApplication application="SVT">
        <div id="gestor">
          <table align="center" cellpadding="0" cellspacing="0" width="600">
            <tr>
              <td width="600" class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cTemaActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cTemaActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cTemaActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cTemaActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      UVT:&nbsp;
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="colGestor" name="cTemaActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cTemaActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                          <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                          <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colGestor" name="cTemaActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionó UVT.&nbsp;
                      </td>
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cTemaActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        </capplication:isApplication>
        -->
        
        <div id="informacionTecnologica">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td width="600" class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cTemaActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cTemaActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cTemaActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cTemaActionForm" onclick="irTabFinal()" />
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
                      Disciplina Primaria&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="55" id="dispPrimariaPpal">Principal:&nbsp;</td>
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
                      <logic:lessEqual value="-1" property="principalDP" name="cTemaActionForm">
                        <html:select disabled="true" property="disciplinaPrimaria" multiple="true" size="3" onchange="habilitarCamposByDP()">
                          <html:options collection="comboDisciplinaPrimariaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalDP" name="cTemaActionForm">
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
                      <logic:lessEqual value="-1" property="principalDD" name="cTemaActionForm">
                        <html:select disabled="true" property="disciplinaDesagregada" multiple="true" size="3" onchange="habilitarCamposByDD()">
                          <html:options collection="comboDisciplinaDesagregadaM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalDD" name="cTemaActionForm">
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
                    <td>
                      Campo Aplicación&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
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
                      <logic:lessEqual value="-1" property="principalCA" name="cTemaActionForm">
                        <html:select disabled="true" property="campoAplicacion" multiple="true" size="3" onchange="habilitarCamposByCA()">
                          <html:options collection="comboCampoAplicacionM" property="value" labelProperty="label" />
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalCA" name="cTemaActionForm">
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
                    <td>
                      Actividades Industriales&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
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
                      <logic:lessEqual value="-1" property="principalCO" name="cTemaActionForm">
                        <html:select disabled="true" property="clasificacionOnu" multiple="true" size="3" onchange="habilitarCamposByCO()">
                          <html:options collection="comboClasificacionOnuM" property="value" labelProperty="label" filter="false"/>
                        </html:select>
                      </logic:lessEqual>
                      <logic:greaterThan value="-1" property="principalCO" name="cTemaActionForm">
                        <html:select disabled="false" property="clasificacionOnu" multiple="true" size="3" onchange="habilitarCamposByCO()">
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
                    <td>
                      Palabras Claves&nbsp;
                    </td>
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cTemaActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
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
        <!--  
        <div id="palabrasClaves">
          <table align="center" cellpadding="0" cellspacing="0" width="400">
            <tr>
              <td width="400" class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cTemaActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cTemaActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cTemaActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cTemaActionForm" onclick="irTabFinal()" />
                </div>
              </td>
            </tr>
          </table>
          <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="400">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Palabras Claves&nbsp;
                    </td>
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cTemaActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        -->
        
        <!--Tab 4 Equipos/-->
        <div id="equipos">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cTemaActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cTemaActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cTemaActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cTemaActionForm" onclick="irTabFinal()" />
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
                <logic:notEmpty property="equiposLote" name="cTemaActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cTemaActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
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
                <logic:empty property="equiposLote" name="cTemaActionForm">
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
                        <input type="button" class="CformBoton" value="Siguiente" name="cTemaActionForm" onclick="irTabSiguiente()" />
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
        
         <!--Tab Seguimiento-->
         <div id="seguimiento">
          <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
            <tr>
              <td class="CformAreaBotones">
                <div align="center">
                  <input type="button" class="CformBotonTranspBorde" value="|&lt;&lt;" name="cTemaActionForm" onclick="irTabInicial()" />
                  <input type="button" class="CformBotonTranspBorde" value="&lt;" name="cTemaActionForm" onclick="irTabAnterior()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;" name="cTemaActionForm" onclick="irTabSiguiente()" />
                  <input type="button" class="CformBotonTranspBorde" value="&gt;&gt;|" name="cTemaActionForm" onclick="irTabFinal()" />
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
                      <logic:notEqual value="DVH" property="rolUsuario" name="cTemaActionForm">
	                      <logic:equal value="S" property="publicable" name="cTemaActionForm">
	                        <td class="CformDato">
	                          Sí
	                          <html:radio property="publica" value="S" />
	                          No
	                          <html:radio property="publica" value="N" />
	                        </td>
	                      </logic:equal>
	                      <logic:equal value="N" property="publicable" name="cTemaActionForm">
	                        <td class="CformDato">
	                          Sí
	                          <html:radio property="publica" value="S" disabled="true" />
	                          No
	                          <html:radio property="publica" value="N" disabled="true" />
	                        </td>
	                      </logic:equal>
                      </logic:notEqual>
                      <logic:equal value="DVH" property="rolUsuario" name="cTemaActionForm">
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
                        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
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

  <logic:equal property="accion" value="altaCfm" name="cTemaActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Desarrollos y Conocimientos&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="114">
                      Título:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="descripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="114">
                      Detalle:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="detalle" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="114">
                      Responsable Técnico:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="responsable" />
                    </td>
                  </tr>
                  <!--  
                  <capplication:isApplication application="SVT"> 
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
                  -->
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Prestador &nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td colspan="10">
                      <display:table name="sessionScope.cTemaActionForm.prestadorLote" style="width:100%" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                      </display:table>
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
                <logic:notEmpty property="equiposLote" name="cTemaActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cTemaActionForm.equiposLote" style="width:100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
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
                <logic:empty property="equiposLote" name="cTemaActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionaron equipamientos&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
                <!--  
                <capplication:isApplication application="SVT">
                  <table width="100%">
                    <tr bgcolor="#BFDFFF">
                      <td>
                        <strong>UVT:&nbsp;</strong>
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colGestor" name="cTemaActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cTemaActionForm.colGestor" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                            <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                            <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                            <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                            <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colGestor" name="cTemaActionForm">
                    <table width="100%">
                      <tr>
                        <td>
                          No se seleccionó UVT.&nbsp;
                        </td>
                      </tr>
                    </table>
                  </logic:empty>
                </capplication:isApplication>
                -->
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Información Tecnológica&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>
                      Disciplina Primaria&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="80">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalDP" name="cTemaActionForm">
                        <html:select disabled="true" property="principalDP">
                          <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="disciplinaPrimaria" name="cTemaActionForm">
                        <html:select property="disciplinaPrimariaVista" multiple="true" size="3">
                          <html:options collection="comboDisciplinaPrimariaC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>
                      Disciplina Desagregada&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="80">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalDD" name="cTemaActionForm">
                        <html:select disabled="true"  property="principalDD">
                          <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="disciplinaDesagregada" name="cTemaActionForm">
                        <html:select property="disciplinaDesagregadaVista" multiple="true" size="3">
                          <html:options collection="comboDisciplinaDesagregadaC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>
                      Campo Aplicación&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="80">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalCA" name="cTemaActionForm">
                        <html:select disabled="true"  property="principalCA">
                          <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="campoAplicacion" name="cTemaActionForm">
                        <html:select property="campoAplicacionVista" multiple="true" size="3">
                          <html:options collection="comboCampoAplicacionC" property="value" labelProperty="label" />
                        </html:select>
                      </logic:notEmpty>
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DFEFFF">
                    <td>
                      Actividades Industriales&nbsp;
                    </td>
                  </tr>
                </table>
                <table width="100%">
                  <tr>
                    <td class="CformNombre" width="80">
                      Principal:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:greaterThan value="0" property="principalCO" name="cTemaActionForm">
                        <html:select disabled="true"   property="principalCO">
                          <html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
                        </html:select>
                      </logic:greaterThan>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      Otras:&nbsp;
                    </td>
                    <td class="CformDato">
                      <logic:notEmpty property="clasificacionOnu" name="cTemaActionForm">
                        <html:select  property="clasificacionOnuVista" multiple="true" size="3">
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
                <table width="100%" cellpadding="5" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="80">
                      1ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="palabraClave1" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      2ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="palabraClave2" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      3ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="palabraClave3" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      4ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="palabraClave4" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      5ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cTemaActionForm" property="palabraClave5" />
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
