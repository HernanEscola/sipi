<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script type="text/javascript">
function submitCostos(){
	document.cStanActionForm.action = 'cStanAltaAction.do?btnSubmit=cargarComboCostos';
	document.cStanActionForm.submit();
}
</script>

<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<br>
<h1 align="center" class="titulo">
	<capplication:isApplication application="SVTP">
		<logic:equal value="si" property="modificaOferta" name="cStanActionForm">
			Modificaci&oacute;n de Oferta Tecnol&oacute;gica
		</logic:equal>
		<logic:notEqual value="si" property="modificaOferta" name="cStanActionForm">
			Registro de STAN
		</logic:notEqual>
	</capplication:isApplication>
	<capplication:isApplication application="SVT">
		Registro de STAN
	</capplication:isApplication>
</h1>
<html:form action="cStanAltaAction.do" method="POST">
  <html:hidden property="accion" />
  <html:hidden property="cambiaPanel" />
  <html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_autorizacion,id_fecha_resolucion"/>
  <bean:define id="responsablesTecnicos" name="cStanActionForm" property="responsablesTecnicos" />

  <logic:equal property="accion" value="altaCfm" name="cStanActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
        
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
              
                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>STAN&nbsp;</strong>
                    </td>
                  </tr>
                </table>
                <table cellpadding="0" cellspacing="0">
                  <capplication:isApplication application="SVTP">
  						<logic:equal value="si" property="modificaOferta" name="cStanActionForm">
		                  <tr>
		                    <td class="CformNombre" width="130">
		                      Código:&nbsp;
		                    </td>
		                    <td class="CformDato">
		                      <bean:write name="cStanActionForm" property="codigoId" />
		                    </td>
		                  </tr>
    					</logic:equal>
    				</capplication:isApplication>
    		  	  <tr>
				         <td class="CformNombre" width="130">
				           Es Servicio:&nbsp;
				         </td>
				         <td class="CformDato" width="50">
				           <html:radio property="tipo" value="ST" disabled="true" />
				         </td>
				         <td class="CformNombre" width="200">
				           Es Asesoramiento:&nbsp;&nbsp;
				         </td>
				         <td class="CformDato" width="50">
				           <html:radio property="tipo" value="AINS" disabled="true" />
				         </td>
			      </tr>		              
                  <tr>
                    <td class="CformNombre" width="130">
                      Título:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="descripcion" />
                    </td>
                  </tr>
                                    
                  <tr>
                    <td class="CformNombre" width="130">
                      Prestación:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="prestacionDescripcion" />
                    </td>
                  </tr>
                </table>

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
                      <display:table name="sessionScope.cStanActionForm.prestadorLote" style="width:100%" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                        <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                        <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                      </display:table>
                    </td>
                  </tr>
                </table>


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
                      <bean:write name="cStanActionForm" property="detalle" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="130">
                      Detalle Prestación:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="prestacionDetalle" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="130">
                      Metodología:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="especificacionMetodologia" />
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

                  <tr>
                    <td class="CformNombre" width="130">
                      Unidad de Prestación:&nbsp;
                    </td>

                    <td class="CformDato">
                      <html:select disabled="true" property="unidadPrestacion">
                        <html:options collection="comboUnidadPrestacion" property="value" labelProperty="label" />
                      </html:select>
                      <logic:equal value="-4" property="unidadPrestacion" name="cStanActionForm">
                        <bean:write name="cStanActionForm" property="descripcionUnidadPrestacion" />
                      </logic:equal>
                    </td>
                  </tr>
                  
                  <tr>
                    <td class="CformNombre" width="130">
                      Capacidad Operativa:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="capacidadOperativa" />
                    </td>
                  </tr>
                  
                  
                  <tr>
                    <td class="CformNombre" width="130">
                      Cantidad Mínima:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="cantidadMinima" />
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

                <logic:notEmpty property="equiposLote" name="cStanActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table style="width:100%" name="sessionScope.cStanActionForm.equiposLote" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
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

                <logic:empty property="equiposLote" name="cStanActionForm">
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
                  <tr>
                    <td></td>
                  </tr>
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
                      <logic:greaterThan value="-1" property="principalDP" name="cStanActionForm">
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
                      <logic:notEmpty property="disciplinaPrimaria" name="cStanActionForm">
                        <html:select disabled="false" property="disciplinaPrimariaVista" multiple="true" size="3">
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
                      <logic:greaterThan value="-1" property="principalDD" name="cStanActionForm">
                        <html:select disabled="true" property="principalDD">
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
                      <logic:notEmpty property="disciplinaDesagregada" name="cStanActionForm">
                        <html:select disabled="false" property="disciplinaDesagregadaVista" multiple="true" size="3">
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
                      <logic:greaterThan value="-1" property="principalCA" name="cStanActionForm">
                        <html:select disabled="true" property="principalCA">
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
                      <logic:notEmpty property="campoAplicacion" name="cStanActionForm">
                        <html:select disabled="false" property="campoAplicacionVista" multiple="true" size="3">
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
                      <logic:greaterThan value="-1" property="principalCO" name="cStanActionForm">
                        <html:select disabled="true" property="principalCO">
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
                      <logic:notEmpty property="clasificacionOnu" name="cStanActionForm">
                        <html:select disabled="false" property="clasificacionOnuVista" multiple="true" size="3">
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
                    <td class="CformNombre" width="80">
                      1ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="palabraClave1" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      2ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="palabraClave2" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      3ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="palabraClave3" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      4ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="palabraClave4" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="80">
                      5ª:&nbsp;
                    </td>
                    <td class="CformDato">
                      <bean:write name="cStanActionForm" property="palabraClave5" />
                    </td>
                  </tr>
                </table>


                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Costos&nbsp;</strong>
                    </td>
                  </tr>
                </table>



                <logic:notEmpty property="stanCostos" name="cStanActionForm">

                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cStanActionForm.stanCostosCfm" requestURI="cStanAltaAction.do" 
                          decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
                          <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="costoConsolidado" title="Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 80px;"/>
                          <display:column property="fechaDesde" title="Vigencia desde" headerClass="tableCellHeader" style="text-align:right; width: 150px;"/>
	        	       	  <display:column property="fechaHasta" title="Vigencia hasta" headerClass="tableCellHeader" style="text-align:right; width: 150px;"/>
                          <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 150px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="stanCostos" name="cStanActionForm">
                  <table width="100%">
                  
	                  <tr>
	                    <td>
	                      No se informaron costos&nbsp;
	                    </td>
	                  </tr>
                 </table>
                </logic:empty>
                




                <table width="100%">
                  <tr bgcolor="#BFDFFF">
                    <td>
                      <strong>Seguimiento &nbsp;</strong>
                    </td>
                  </tr>
                </table>
				<capplication:isApplication application="SVT">
                		<table width="100%">  
		                  <tr>
		                    <td class="CformNombre" width="130">
		                      Expediente Nro:&nbsp;
		                    </td>
		                    <td class="CformDato">
		                      <logic:notEmpty property="nroExpediente" name="cStanActionForm">
		                        <bean:write name="cStanActionForm" property="nroExpediente" /> /
				  				<bean:write name="cStanActionForm" property="anioExpediente" />
		                      </logic:notEmpty>
		                    </td>
		                  </tr>
		                </table>
		                <table width="100%">
		                  <tr>
		                    <td class="CformNombre" width="130">
		                      Fecha Autorización:&nbsp;
		                    </td>
		                    <td class="CformDato">
		                      <logic:notEmpty property="fechaAutorizacion" name="cStanActionForm">
		                        <bean:write name="cStanActionForm" property="fechaAutorizacion" />
		                      </logic:notEmpty>
		                    </td>
		                  </tr>
		                </table>
		                
		                <table width="100%">
		                  <tr>
		                    <td class="CformNombre" width="130">
		                     Resolución:&nbsp;
		                    </td>
		                    <td class="CformDato">
		                      <logic:notEmpty property="nroResolucion" name="cStanActionForm">Tipo:
		                        <html:select disabled="true" property="tipoResolucion">
		                          <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
		                        </html:select>&nbsp;Nro: <bean:write name="cStanActionForm" property="nroResolucion" />
		                      </logic:notEmpty>
		                      
		                      <logic:notEmpty property="fechaResolucion" name="cStanActionForm"> &nbsp;&nbsp;
		                        <bean:write name="cStanActionForm" property="fechaResolucion" /> 
		                      </logic:notEmpty>
		                      <logic:greaterThan value="-1" property="estadoResolucion" name="cStanActionForm">
		                        <html:select disabled="true" property="estadoResolucion">
		                          <html:options collection="comboEstadoResolucion" property="value" labelProperty="label" />
		                        </html:select>
		                      </logic:greaterThan>
		                    </td>
		                  </tr>
		                </table>
				</capplication:isApplication>                
				<table>
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
				</table>


				<capplication:isApplication application="SVT">
                
		                <table width="100%" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="CformNombre" width="130">
		                      Publicar:
		                    </td>
		                    <td class="CformDato">
		                      Sí
		                      <html:radio property="publica" value="S" disabled="true" />
		                      No
		                      <html:radio property="publica" value="N" disabled="true" />
		                    </td>
		                  </tr>
		                  <tr>
		                    <td height="10" colspan="10"></td>
		                  </tr>
		                </table>

				</capplication:isApplication>


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




<!--
	VER DISTRIBUCION ANULADO 
  <logic:equal property="accion" value="distribucionStan" name="cStanActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="680">
      <tr>
        <td>
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr bgcolor="#DDEEFF">
              <td class="CformNombre" width="55">
                Costos:&nbsp;
              </td>
              <td class="CformDato">
                <html:select disabled="false" property="indiceCosto" onchange="submitCostos()">
                  <html:options collection="comboCostos" property="value" labelProperty="label" />
                </html:select>
              </td>
            </tr>
          </table>
          <table width="100%" align="center">
            <tr>
              <td>
                <div class="content" style="margin-right: auto; margin-left: auto;">
                  <div class="row">
                    <span class="header" style="width: 30%;">&nbsp;</span>
                    <span class="header" style="width: 20%; text-align: center;">Categoría A</span>
                    <span class="header" style="width: 20%; text-align: center;">Categoría B</span>
                    <span class="header" style="width: 20%; text-align: center;">Categoría C</span>
                  </div>
                  <div class="row">
                    <span class="even" style="width: 30%; height: 28;">Costo</span>
                    <span class="even" style="width: 20%; height: 28; font-weight: bold; text-align: right;">$&nbsp;<bean:write name="cStanActionForm" property="costoPesos" /></span>
                    <span class="even" style="width: 20%; height: 28; font-weight: bold; text-align: right;">$&nbsp;<bean:write name="cStanActionForm" property="costoPesos" /></span>
                    <span class="even" style="width: 20%; height: 28; font-weight: bold; text-align: right;">$&nbsp;<bean:write name="cStanActionForm" property="costoPesos" /></span>
                  </div>
                  <div class="row">
                    <span class="odd" style="width: 30%; height: 28;">% Ganancia</span>
                    <logic:iterate id="categ" indexId="indice" property="categorias" name="cStanActionForm">
                      <span class="odd" style="width: 20%; height: 28; text-align: right;"><bean:write property='<%="gananciaCategoria(" + indice + ")"%>' name="cStanActionForm" />&nbsp;%</span>
                    </logic:iterate>
                  </div>
                  <div class="row">
                    <span class="even" style="width: 30%; height: 28;">Importe ganancia</span>
                    <logic:iterate id="categ" indexId="indice" property="categorias" name="cStanActionForm">
                      <span class="even" style="width: 20%; height: 28; text-align: right;">$&nbsp;<bean:write property='<%="importeGanacia(" + indice + ")"%>' name="cStanActionForm" /></span>
                    </logic:iterate>
                  </div>
                  <div class="row">
                    <span class="tableRowFooter" style="width: 30%;">Precio Parcial</span>
                    <logic:iterate id="categ" indexId="indice" property="categorias" name="cStanActionForm">
                      <span class="tableRowFooter" style="width: 20%; text-align: right;">$&nbsp;<bean:write property='<%="precioParcial(" + indice + ")"%>' name="cStanActionForm" /></span>
                    </logic:iterate>
                  </div>
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
                Comisiones:&nbsp;
              </td>
            </tr>
          </table>
          <table width="70%" align="center">
            <tr>
              <td>
                <div class="content">
                  <div class="row">
                    <span class="header" style="width: 50%; text-align: center;">Comisiones</span>
                    <span class="header" style="width: 40%; text-align: center;">%</span>
                  </div>
                  <logic:iterate id="tipoEgreso" indexId="comisionId" property="comisiones" name="cStanActionForm">
                    <bean:define id="grupoEgreso" name="tipoEgreso" property="grupoEgreso" />
                    <logic:notEqual value="1" name="grupoEgreso" property="id">
                      <div class="row">
                        <span class='<%=comisionId.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 50%; height: 28;">%&nbsp;<bean:write name="tipoEgreso" property="descripcionCorta" />
                        </span>
                        <span class='<%=comisionId.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 40%; text-align: right; height: 28;"><bean:write
                            property='<%="porcentajeComision(" + comisionId + ")"%>' name="cStanActionForm" /></span>
                      </div>
                    </logic:notEqual>
                  </logic:iterate>
                  <div class="row">
                    <span class="tableRowFooter" style="width: 50%; text-align: left;">Total Comisiones</span>
                    <span class="tableRowFooter" style="width: 40%; text-align: right;"><bean:write name="cStanActionForm" property="totalComisiones" /></span>
                  </div>
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
                Distribución:&nbsp;
              </td>
            </tr>
          </table>
          <table width="100%" align="center">
            <tr>
              <td>
                <div class="content">
                  <div class="row">
                    <span class="header" style="width: 20%; height: 32; text-align: center;">Comisiones&nbsp;(%)</span>
                    <span class="header" style="width: 12.5%; height: 32; text-align: center;">&nbsp;</span>
                    <span class="header" style="width: 16%; height: 32; text-align: center;">Sugerido Conv. Marco</span>

                    <span class="header" style="width: 14%; height: 32; text-align: center;">Categoría A&nbsp;($)</span>
                    <span class="header" style="width: 14%; height: 32; text-align: center;">Categoría B&nbsp;($)</span>
                    <span class="header" style="width: 14%; height: 32; text-align: center;">Categoría C&nbsp;($)</span>
                  </div>
                  <logic:iterate id="tipoEgreso" indexId="index" property="comisiones" name="cStanActionForm">
                    <bean:define id="tipoEgredoId" name="tipoEgreso" property="id" />
                    <bean:define id="grupoEgreso" name="tipoEgreso" property="grupoEgreso" />
                    <div class="row">
                      <span class='<%=index.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 20%; height: 28;">%&nbsp;<bean:write name="tipoEgreso" property="descripcionCorta" />
                      </span>
                      <span class='<%=index.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 12.5%; height: 28; text-align: right;"><bean:write
                          property='<%="porcentajeComision(" + index + ")"%>' name="cStanActionForm" /></span>
                      <span class='<%=index.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 16%; height: 28; text-align: right;"><bean:write
                          property='<%="porcentajeComisionSugerido(" + index + ")"%>' name="cStanActionForm" /></span>
                      <span class='<%=index.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 14%; height: 28; text-align: right;"><bean:write
                          property='<%="importeCategoriaComision(0_" + index + ")"%>' name="cStanActionForm" /></span>
                      <span class='<%=index.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 14%; height: 28; text-align: right;"><bean:write
                          property='<%="importeCategoriaComision(1_" + index + ")"%>' name="cStanActionForm" /></span>
                      <span class='<%=index.intValue() % 2 == 0 ? "even" : "odd"%>' style="width: 14%; height: 28; text-align: right;"><bean:write
                          property='<%="importeCategoriaComision(2_" + index + ")"%>' name="cStanActionForm" /></span>
                    </div>
                  </logic:iterate>
                  <div class="row">
                    <span class="tableRowFooter" style="width: 20%; text-align: left;">Total</span>
                    <span class="tableRowFooter" style="width: 12.5%; text-align: right;"><bean:write name="cStanActionForm" property="totalPorcentajes" /></span>
                    <span class="tableRowFooter" style="width: 16%;height:18; text-align: left;">&nbsp;</span>

                    <span class="tableRowFooter" style="width: 14%; text-align: right;"><bean:write name="cStanActionForm" property="precioFinal(0)" /></span>
                    <span class="tableRowFooter" style="width: 14%; text-align: right;"><bean:write name="cStanActionForm" property="precioFinal(1)" /></span>
                    <span class="tableRowFooter" style="width: 14%; text-align: right;"><bean:write name="cStanActionForm" property="precioFinal(2)" /></span>
                  </div>
                </div>
              </td>
            </tr>
          </table>

        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr>
              <td width="210" class="CformAreaBotones">
                <div align="left" class="dato_obligatorio">
                  &nbsp;
                </div>
              </td>
              <td width="470" class="CformAreaBotones">
                <div align="right">
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </logic:equal>
-->
  
