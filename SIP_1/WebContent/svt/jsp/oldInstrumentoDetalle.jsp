<%@include file="layout/include.jsp"%>

<br>
<h1 align=" center" class="titulo">Instrumento</h1>

<html:form action="cInstrumentoDetalleAction.do" method="POST">
<html:hidden property="accion"/>

<logic:equal property="accion" value="detalle" name="cInstrumentoDetalleActionForm">

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Instrumento</td>
  </tr>
    <tr>
      <td>
        <table width="100%">
          <tr bgcolor="#DDEEFF">
            <td>
              <strong>Oferta</strong>
            </td>
          </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
          
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="CformNombre" width="130">Descripción:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="ofertaDescripcion"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Estado:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="ofertaEstado"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Prestador;:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="ofertaPrestador"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Cantidad:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="ofertaCantidad"/>
                  </td>
                </tr>
              </table>
            </td>
            <td width="120"></td>
          </tr>
        </table>
        <table width="100%">
          <tr bgcolor="#DDEEFF">
            <td>
              <strong>Instrumento</strong>
            </td>
          </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
          
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="CformNombre"  width="130">UVT:</td>
                  <td class="CformDato" >
                    <html:select disabled="true" property="gestor" >
                      <html:options collection="comboGestor" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Fecha Inicio:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="diaInicio"/>-
                    <bean:write name="cInstrumentoDetalleActionForm" property="mesInicio"/>-
                    <bean:write name="cInstrumentoDetalleActionForm" property="anioInicio"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Fecha Fin:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="diaFin"/>-
                    <bean:write name="cInstrumentoDetalleActionForm" property="mesFin"/>-
                    <bean:write name="cInstrumentoDetalleActionForm" property="anioFin"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Fecha Pedido:;</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="diaPedido"/>-
                    <bean:write name="cInstrumentoDetalleActionForm" property="mesPedido"/>-
                    <bean:write name="cInstrumentoDetalleActionForm" property="anioPedido"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Responsable Técnico:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="responsableTecnico"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre" id="testid">Descripción Corta:</td>
                  <td class="CformDato">
                    <bean:write name="cInstrumentoDetalleActionForm" property="descripcionCorta"/>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">Descripción:</td>
                  <td class="CformDato">
                    <html:textarea property="descripcion" rows="3" disabled="true" />
                  </td>
                </tr>
              </table>
            </td>
          </tr>
           
        </table>

	
	        <table width="100%">
    	      <tr bgcolor="#DDEEFF">
        	    <td>
            	  <strong>Distribución de comisiones</strong>
            	</td>
          		</tr>
        	</table>
			<logic:notEmpty property="distribucion" name="cInstrumentoDetalleActionForm">

		      <table align="center" width="100%">
		        <tr>
		          <td colspan="10">
		            <display:table name="sessionScope.cInstrumentoDetalleActionForm.distribucion" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDistribucionDetalleDisplayWrapper" style="width: 100%">
		              <display:column property="egreso" title="Comisión" headerClass="tableCellHeader" />
		              <display:column property="porcentaje" title="Porcentaje" headerClass="tableCellHeader"/>
		              <display:column property="importeParcial" title="Importe" headerClass="tableCellHeader"/>
		            </display:table>
		          </td>
		        </tr>
		      </table>
			</logic:notEmpty>
	        <logic:empty property="distribucion" name="cInstrumentoDetalleActionForm">
	           <table width="100%">
	            <tr >
	              <td>No se informó una distribución&nbsp;</td>
	            </tr>
	            </table>
      		</logic:empty>
			
	        <table width="100%">
    	      <tr bgcolor="#DDEEFF">
        	    <td>
            	  <strong>Obligaciones de Pago</strong>
            	</td>
          		</tr>
        	</table>
			<logic:notEmpty property="cuotas" name="cInstrumentoDetalleActionForm">
		      <table align="center" width="100%">
		        <tr>
		          <td colspan="10">
		            <display:table name="sessionScope.cInstrumentoDetalleActionForm.cuotas" decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoPagosDetalleDisplayWrapper" style="width: 100%">
		              <display:column property="indice" title="#" headerClass="tableCellHeader" />
		              <display:column property="detalle" title="Detalle" headerClass="tableCellHeader" />
		              <display:column property="fechaVto" title="Fecha Vencimiento" headerClass="tableCellHeader" />
		              <display:column property="importe" title="Importe (pesos)" headerClass="tableCellHeader" />
		            </display:table>
		          </td>
		        </tr>
		      </table>
			</logic:notEmpty>
	        <logic:empty property="cuotas" name="cInstrumentoDetalleActionForm">
	           <table width="100%">
	            <tr >
	              <td>No se informaron obligaciones de pago&nbsp;</td>
	            </tr>
	            </table>
      		</logic:empty>


      </td>
    </tr>
    <tr>
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
        </div>
      </td>
    </tr>
</table>

</logic:equal>
</html:form>
