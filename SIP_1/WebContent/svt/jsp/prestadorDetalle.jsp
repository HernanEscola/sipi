<%@include file="layout/include.jsp"%>
<script language="JavaScript1.2" src="./js/prototype.js"></script>
<script language="JavaScript1.2" src="./js/ricoCommon.js"></script>
<script language="JavaScript1.2" src="./js/ricoEffects.js"></script>
<script language="JavaScript1.2" src="./js/ricoAccordion.js"></script>

<script>
	   function iniciarAccordion(){
		var auto_normal_accordion_options={
	    	panelWidth:"auto",
	    	panelHeight:"auto",
	    	tabLocation:'inline',
	    	onLoadShowTab:2,
	    	expandedBg:"#f6f6f6",
	    	collapsedBg:"#f6f6f6",
	    	hoverBg:"#f0f0f0",
	    	hoverTextColor:"#222",
	    	collapsedTextColor:"#666",
	    	borderColor:"#ccc",
	    	expandedTextColor:"#666",
	    	fixborders:true,			//look at this whe you apply padding
              	duration:200

	    };
	    var auto_retract_normal_accordion_options={
	    	panelWidth:"auto",
	    	panelHeight:"auto",
	    	tabLocation:'inline',
	    	onLoadShowTab:-2,
	    	expandedBg:"#C3DFFF",
	    	collapsedBg:"#E2EBF3",
	    	hoverBg:"#AEC7DD",
	    	hoverTextColor:"#222",
	    	collapsedTextColor:"#000000",
	    	borderColor:"#ccc",
	    	expandedTextColor:"#666",
                transitionColor: "gray",
              	roundCorners: true,
	    	fixborders:true,		//look at this whe you apply padding
              	duration:200

	    };
		//Ajax modificado
		new Rico.Accordion($('auto_normal_accordion'), auto_normal_accordion_options);
		new Rico.Accordion($('auto_retract_normal_accordion'),auto_retract_normal_accordion_options);
	   }
           window.onload=function(){
		iniciarAccordion();
           }
</script>
<br>


<html:form action="cPrestadorDetalleAction.do" method="POST">
<h1 align="center" class="titulo">Detalle del Prestador</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Entidad</td>
  </tr>
  <logic:equal value="E" property="estado" name="cPrestadorDetalleActionForm">
    <tr>
      <td align="center">
        <b class="CformDetalleRojo">&nbsp;&nbsp;Este Prestador se encuentra Eliminado</b>
      </td>
    </tr>
  </logic:equal>

  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td>
	      	<jsp:include flush="false" page="/jsp/entidadFicha.jsp" />
          </td>
          <td width="10" rowspan="100"></td>
        </tr>
      </table>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td>
            <table align="center" class="tablaMin">
              <tr>
                <td>
                  <div id="auto_retract_normal_accordion" class="accContainer" >
                    <div id="overviewPane2" class="accordion-pane">
                      <div id="overviewHeader" class="menuTitle">
                        Ofertas
                      </div>
                      <div id="panel1Content" class="accordion-cont">
                        <div class="content">
                          <table align="center" class="CformTable">
                            <tr>
                              <td>
                                <table align="center" width="100%">
                                  <tr>
                                    <td><!--ot habilitadas son las aprobadas o autorizadas o presentadas-->
                                      <display:table style="width: 100%" id="otHabilitadas" name="sessionScope.cPrestadorDetalleActionForm.ofertas" requestURI="cPrestadorDetalleAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper">
                                        <display:column property="indiceListado" title="#" headerClass="tableCellHeader"/>
                                        <display:column property="tipoOferta" title="Oferta"  headerClass="tableCellHeader"/>
                                        <display:column property="descripcion" title="Descripción"  headerClass="tableCellHeader" />
                                        <display:column property="tipoEstado" title="Estado" headerClass="tableCellHeader"  />
                                      </display:table>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                    	</div>
                      </div>
                    </div>
                    <div id="overviewPane2" class="accordion-pane">
                      <div id="overviewHeader" class="menuTitle">
                        Equipamientos
                      </div>
                      <div id="panel1Content" class="accordion-cont" >
                        <div class="content">
                          <table align="center" class="CformTable">
                            <tr>
                              <td>
                                <table align="center" width="100%">
                                  <tr>
                                    <td>
                                      <display:table requestURI="cPrestadorDetalleAction.do" name="sessionScope.cPrestadorDetalleActionForm.equipos" style="width: 100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper" >
                                        <display:column property="indiceListado" title="#" headerClass="tableCellHeader" />
                                        <display:column property="descripcion" title="Descripción"   headerClass="tableCellHeader" />
                                        <display:column property="marca" title="Marca" headerClass="tableCellHeader" />
                                        <display:column property="propietario" title="Propietario"  headerClass="tableCellHeader" />
                                      </display:table>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                    	</div>
                      </div>
                    </div>
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
    <td class="CformAreaBotones" height="35">
      <div align="right">
    	  <jsp:include page="/jsp/layout/botones.jsp">
          <jsp:param name="formulario" value="cPrestadorDetalleActionForm" />
          <jsp:param name="entidad" value="prestador" />
        </jsp:include> 
      </div>
    </td>
  </tr>
</table>
</html:form>
