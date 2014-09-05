<%@include file="layout/include.jsp"%>
<script type="text/javascript" src="./js/scriptaculous/prototype.js"></script>
<script type="text/javascript" src="./js/scriptaculous/scriptaculous.js"></script>

<script>
  window.onload=function(){
    collapseOthers('none');
  }
  
  function collapseOthers(ignore){
    var elementos = document.getElementsByTagName('div');
    var pattern = new RegExp("(^| )" + 'collapsable' + "( |$)");
    var listado = new Array();
    for(var i=0;i<elementos.length;i++){
      if (pattern.test(elementos[i].className)) {
        if (elementos[i].visible() && elementos[i].id != ignore){
          Effect.toggle(elementos[i], 'slide');
          if($(elementos[i]).visible()){
            new Effect.Highlight($(elementos[i].id+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#E2EBF3' });
            $(elementos[i].id+'_label').update('Mostrar Actualizaciones');
          } else {
            new Effect.Highlight($(elementos[i].id+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
            $(elementos[i].id+'_label').update('Ocultar Actualizaciones');
          }
        } 
      }
    }
  }
  
  function toggleLayer(whichLayer){
    Effect.toggle(whichLayer, 'slide', { delay: 0.2 });
    if($(whichLayer).visible()){
      new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#E2EBF3' });
      $(whichLayer+'_label').update('Mostrar Actualizaciones');
    } else {
      new Effect.Highlight($(whichLayer+'_label'), { startcolor: '#b8d3e0', endcolor: '#626ae0', restorecolor :'#5998d9' });
      $(whichLayer+'_label').update('Ocultar Actualizaciones');
    }
    collapseOthers(whichLayer);
    return false;
  }
  
</script>

<style>
  .label{
    cursor: pointer;
    padding-left: 6px;
    font-weight: bold;
    font-size: 11px;
    margin-bottom: 1px;
    padding-bottom: 3px;
    color: #2f3d31;
    padding-top: 6px;
    border-bottom: #ddd 1px solid;
    height: 10px;
    background-color: #E2EBF3;
  }
  
  .content {
    background-color: #FAFCFF;
  }
</style>

<br>
<h1 align="center" class="titulo">
  Registro de Desarrollos y Conocimientos
</h1>
<html:form action="cOfertaTecnologicaAceptarModificacionesAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="aceptar" name="cOfertaTecnologicaAceptarModificacionesActionForm">
  
    <bean:define id="history" property="modificaciones" name="cOfertaTecnologicaAceptarModificacionesActionForm"/>
    <bean:define id="historyMap" property="attibutes" name="history"/>
    <bean:define id="original" property="oferta" name="history"/>
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table>           
            <tr>
              <td >
                <div>
                  <table width="100%">
                    <tr bgcolor="#BFDFFF">
                      <td>Desarrollos y Conocimientos&nbsp;</td>
                    </tr>
                  </table>
                  <table>
                    <tr>
                      <td class="CformNombre" width="114">Prestador:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="prestadorOriginal" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="114">Descripción:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionOriginal" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="114">Publicar:&nbsp;</td>
                      <td class="CformDato" >
                        Sí <html:radio property="publicarOriginal" value="S"  disabled="true" />
                        No <html:radio property="publicarOriginal" value="N" disabled="true" />
                      </td>
                    </tr>
                  </table>
                </div>
                <logic:equal value="S" property="hasNewsConocimiento" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="toggle_appear_label" onclick="javascript:toggleLayer('toggle_appear');" class="label">Mostrar Actualizaciones</div>
                  <div class="collapsable" id="toggle_appear" style="display: none;" >
                    <div class="content">
                      <table>
                        <logic:equal value="S" property="hasNews(descripcion)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="114">Descripción:&nbsp;</td>
                            <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="descripcionNew"/></td>
                          </tr>
                        </logic:equal>
                      </table>
                    </div>
                  </div>
                 </logic:equal>
               </td>
              </tr>
              
              <tr>
                <td>
                  <div>
                    <table width="100%">
                      <tr bgcolor="#BFDFFF">
                        <td>Gestor&nbsp;</td>
                      </tr>
                    </table>
                    <table width="100%" >
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.gestorOriginal" style="width:100%" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                            <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader"/>
                            <display:column property="descripcionSeleccion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" />
                            <display:column property="siglaSeleccion" title="Sigla" headerClass="tableCellHeader" style="width: 350px;" />
                            <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 150px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
              </tr>
              
              <tr>
                <td >
                  <div>
                    <table width="100%">
                      <tr bgcolor="#BFDFFF">
                        <td>Información Tecnológica&nbsp;</td>
                      </tr>
                    </table>
                    <table width="100%">
                    <tr>
                      <td colspan="10">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Disciplina Primaria&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="80">Principal:&nbsp;</td>
                            <td class="CformDato">
                              <logic:greaterThan value="-1" property="disciplinaPrimariaPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaPrimariaPpalOriginal">
                                  <html:options collection="comboDispPrimariaOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">Otras:&nbsp;</td>
                            <td class="CformDato">
                              <logic:notEmpty property="disciplinaPrimariaOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="disciplinaPrimariaOriginal" multiple="true" size="3">
                                  <html:options collection="comboDispPrimariaOrigM" property="value" labelProperty="label" />
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
                              <logic:greaterThan value="-1" property="disciplinaDesagregadaPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaDesagregadaPpalOriginal">
                                  <html:options collection="comboDispDesagregadaOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">
                              Otras:&nbsp;
                            </td>
                            <td class="CformDato">
                              <logic:notEmpty property="disciplinaDesagregadaOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="disciplinaDesagregadaOriginal" multiple="true" size="3">
                                  <html:options collection="comboDispDesagregadaOrigM" property="value" labelProperty="label" />
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
                            <td class="CformNombre" width="80">Principal:&nbsp;</td>
                            <td class="CformDato">
                              <logic:greaterThan value="-1" property="campoAplicacionPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="campoAplicacionPpalOriginal">
                                  <html:options collection="comboCampoAplicOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">Otras:&nbsp;</td>
                            <td class="CformDato">
                              <logic:notEmpty property="campoAplicacionOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="campoAplicacionOriginal" multiple="true" size="3">
                                  <html:options collection="comboCampoAplicOrigM" property="value" labelProperty="label" />
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
                            <td class="CformNombre" width="80">Principal:&nbsp;</td>
                            <td class="CformDato">
                              <logic:greaterThan value="-1" property="clasificacionONUPpalOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="clasificacionONUPpalOriginal">
                                  <html:options collection="comboCampoAplicOrig" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">Otras:&nbsp;</td>
                            <td class="CformDato">
                              <logic:notEmpty property="clasificacionONUOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="clasificacionONUOriginal" multiple="true" size="3">
                                  <html:options collection="comboCampoAplicOrigM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>

                      </td>
                    </tr>
                  </table>
                </div>
                <% /*Comeinzo de las actualizaciones de Información Tecnológica*/ %>
                <logic:equal value="S" property="hasNewsInformacionTecnologica" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="infoTecno_label" onclick="javascript:toggleLayer('infoTecno');" class="label">Mostrar Actualizaciones</div>
                  <div class="collapsable" id="infoTecno" style="display: none;">
                    <div class="content">
                      
                      <logic:equal value="S" property="hasNews(disciplinaPrimaria)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Disciplina Primaria&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="80">Principal:&nbsp;</td>
                            <td class="CformDato">
                              <logic:greaterThan value="-1" property="disciplinaPrimariaPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaPrimariaPpalNew">
                                  <html:options collection="comboDispPrimariaNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">Otras:&nbsp;</td>
                            <td class="CformDato">
                              <logic:notEmpty property="disciplinaPrimariaNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="disciplinaPrimariaNew" multiple="true" size="3">
                                  <html:options collection="comboDispPrimariaNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                      
                      <logic:equal value="S" property="hasNews(disciplinaDesagregada)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Disciplina Desagregada&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="80">Principal:&nbsp;</td>
                            <td class="CformDato">
                              <logic:greaterThan value="-1" property="disciplinaDesagregadaPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="disciplinaDesagregadaPpalNew">
                                  <html:options collection="comboDispDesagregadaNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">Otras:&nbsp;</td>
                            <td class="CformDato">
                              <logic:notEmpty property="disciplinaDesagregadaNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="disciplinaDesagregadaNew" multiple="true" size="3">
                                  <html:options collection="comboDispDesagregadaNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                      
                      <logic:equal value="S" property="hasNews(campoAplicacion)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Campo Aplicación&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="80">Principal:&nbsp;</td>
                            <td class="CformDato">
                              <logic:greaterThan value="-1" property="campoAplicacionPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="campoAplicacionPpalNew">
                                  <html:options collection="comboCampoAplicNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">Otras:&nbsp;</td>
                            <td class="CformDato">
                              <logic:notEmpty property="campoAplicacionNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="campoAplicacionNew" multiple="true" size="3">
                                  <html:options collection="comboCampoAplicNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                      
                      <logic:equal value="S" property="hasNews(clasificacionONU)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr bgcolor="#DFEFFF">
                            <td>Actividades Industriales&nbsp;</td>
                          </tr>
                        </table>
                        <table width="100%">
                          <tr>
                            <td class="CformNombre" width="80">Principal:&nbsp;</td>
                            <td class="CformDato">
                              <logic:greaterThan value="-1" property="clasificacionONUPpalNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="true" property="clasificacionONUPpalNew">
                                  <html:options collection="comboActivIndustrialesNew" property="value" labelProperty="label" />
                                </html:select>
                              </logic:greaterThan>
                            </td>
                          </tr>
                          <tr>
                            <td class="CformNombre" width="80">Otras:&nbsp;</td>
                            <td class="CformDato">
                              <logic:notEmpty property="clasificacionONUNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                                <html:select disabled="false" property="clasificacionONUNew" multiple="true" size="3">
                                  <html:options collection="comboActivIndustrialesNewM" property="value" labelProperty="label" />
                                </html:select>
                              </logic:notEmpty>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                    </div>
                  </div>
                </logic:equal>
              </td>
            </tr>
            
            <tr>
              <td>
                <div>
                  <table width="100%">
                    <tr bgcolor="#BFDFFF">
                      <td>Palabras Clave&nbsp;</td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr>
                      <td class="CformNombre" width="80">1ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave1Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="80">2ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="80">3ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="80">4ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4Original" /></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="80">5ª:&nbsp;</td>
                      <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave5Original" /></td>
                    </tr>
                  </table>
                </div>
                <logic:equal value="S" property="hasNewsPalabrasClaves" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="palabrasClave_label" onclick="javascript:toggleLayer('palabrasClave');" class="label">Mostrar Actualizaciones</div>
                  <div class="collapsable" id="palabrasClave" style="display: none;" >
                    <div class="content">
                      <table>
                        <logic:equal value="S" property="hasNews(palabraClave1)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="80">1ª:&nbsp;</td>
                            <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave1New" /></td>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave2)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="80">2ª:&nbsp;</td>
                            <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave2New" /></td>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave3)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="80">3ª:&nbsp;</td>
                            <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave3New" /></td>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave4)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="80">4ª:&nbsp;</td>
                            <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave4New" /></td>
                          </tr>
                        </logic:equal>
                        <logic:equal value="S" property="hasNews(palabraClave5)" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                          <tr>
                            <td class="CformNombre" width="80">5ª:&nbsp;</td>
                            <td class="CformDato"><bean:write name="cOfertaTecnologicaAceptarModificacionesActionForm" property="palabraClave5New" /></td>
                          </tr>
                        </logic:equal>
                      </table>
                    </div>
                  </div>
                </logic:equal>
              </td>
            </tr>
              
            <tr>
              <td >
                <div>
                  <table width="100%">
                    <tr bgcolor="#BFDFFF">
                      <td>Equipamientos&nbsp;</td>
                    </tr>
                  </table>
                  <logic:notEmpty property="equiposOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposOriginal"  style="width: 100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" maxLength="22" />
                            <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                            <display:column property="marca" title="Marca" headerClass="tableCellHeader" style="width: 350px;" maxLength="15" />
                            <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
                            <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
         
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="equiposOriginal" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                    <table width="100%">
                      <tr>
                        <td>
                          No se seleccionaron equipamientos&nbsp;
                        </td>
                      </tr>
                    </table>
                  </logic:empty>
                </div>
                <logic:equal value="S" property="hasNewsEquipamientos" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                  <div id="equipamientos_label" onclick="javascript:toggleLayer('equipamientos');" class="label">Mostrar Actualizaciones</div>
                  <div class="collapsable" id="equipamientos" style="display: none;" >
                    <div class="content">
                      <logic:notEmpty property="equiposNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr>
                            <td colspan="10">
                              <display:table name="sessionScope.cOfertaTecnologicaAceptarModificacionesActionForm.equiposNew" style="width: 100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
                                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 350px;" maxLength="22" />
                                <display:column property="anio" title="Año" headerClass="tableCellHeader" style="width: 50px;" />
                                <display:column property="marca" title="Marca" headerClass="tableCellHeader" style="width: 350px;" maxLength="15" />
                                <display:column property="modelo" title="Modelo" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
                                <display:column property="nroSerie" title="N°Serie" headerClass="tableCellHeader" style="width: 80px;" maxLength="6" />
                              </display:table>
                            </td>
                          </tr>
                        </table>
                      </logic:notEmpty>
                      <logic:empty property="equiposNew" name="cOfertaTecnologicaAceptarModificacionesActionForm">
                        <table width="100%">
                          <tr>
                            <td>
                              No se seleccionaron equipamientos&nbsp;
                            </td>
                          </tr>
                        </table>
                      </logic:empty>
                    </div>
                  </div>
                </logic:equal>
              </td>
            </tr>
            
            
          </table>
        </td>
      </tr>
    </table>
  </logic:equal>

</html:form>
