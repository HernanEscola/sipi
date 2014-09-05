<%@include file="layout/include.jsp"%>

<br>
<logic:equal property="estado" value="N" name="cConvenioMarcoHabilitarActionForm">
<h1 align=" center" class="titulo">Deshabilitación de Convenio Marco</h1>
</logic:equal>

<logic:equal property="estado" value="I" name="cConvenioMarcoHabilitarActionForm">
<h1 align=" center" class="titulo">Habilitación de Convenio Marco</h1>
</logic:equal>


<html:form action="cConvenioMarcoHabilitarAction.do" method="POST">

<div id="convenio">
 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
   <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Convenio Marco&nbsp;</td>
  </tr>
 
  <tr>
    <td>
 
      <table width="100%" cellpadding="0" cellspacing="0"  >
        <tr>
          <td class="CformNombre" width="150">Denominación:&nbsp;</td>
          <td class="CformDato"><html:text property="denominacion"  size="55" onkeydown="setFoco()" disabled="true" /></td>
        </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Servicio:&nbsp;</td>
          <td class="CformDato"><html:text property="tipoServicio"  onkeydown="setFoco()" disabled="true" /></td>
         </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Convenio:&nbsp;</td>
          <td class="CformDato">
            <html:select disabled="true" property="tipoConvenioSelected">
              <html:options collection="comboTipoConvenio"  property="value" labelProperty="label"/>
            </html:select>
         </td>
         </tr>
       </table>
    </td>
  </tr>

  <tr>
    <td>
      <table width="100%">
       <tr bgcolor="#BFDFFF">
         <td>Intervinientes:&nbsp;</td>
       </tr>
      </table>

       <table width="100%" >
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cConvenioMarcoHabilitarActionForm.organismoLote" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <!-- COMENTADO POR PETICION SVT 794 -->
                          <!-- display:column property="indiceParaIntegrantesPorConvenioMarco" title="#" style="width:10px" headerClass="tableCellHeader" -->
                          <display:column property="descripcionOSigla" title="Descripción" headerClass="tableCellHeader" style="width: 300px;" />
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 330px;" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="rolHabilitar" title="Rol" headerClass="tableCellHeader" style="width:150px;" media="html" />
                        </display:table>
                      </td>
                    </tr>
       </table>
    </td>
  </tr>
  
            <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>UVT:&nbsp;</td>
             </tr>
            </table>

           <logic:notEmpty property="uvtLote" name="cConvenioMarcoHabilitarActionForm">
            <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
		       	      <display:table name="sessionScope.cConvenioMarcoHabilitarActionForm.uvtLote" style="width: 100%" decorator="conicet.apps.svt.web.gestor.decorator.CUvtDisplayWrapper">
		                <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
		                <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="sigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 100px;"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="central" title="Central" maxLength="16" headerClass="tableCellHeader" style="width: 100px"/>
		              </display:table>
		            </td>
        		  </tr>
	    	</table>
          	</logic:notEmpty>
           <logic:empty property="uvtLote" name="cConvenioMarcoHabilitarActionForm">
            <table width="100%" >
       	     <tr >
               <td>No se seleccionó UVTs&nbsp;</td>
       	     </tr>
	    	</table>
          </logic:empty>
	   	</td>
       </tr>
  
  
  
  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#BFDFFF">
          <td>Distribución Servicio:&nbsp;</td>
        </tr>
      </table>
      <table width="100%" >
        <tr>
          <td colspan="10">
                  <display:table name="sessionScope.cConvenioMarcoHabilitarActionForm.colDistribucion" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                    <display:column property="parte" title="Partes" style="width:300px" headerClass="tableCellHeader"/>
                    <display:column property="comparador" title="Comparadores" style="width:150px" headerClass="tableCellHeader"/>
                    <display:column property="porcentajeDetalle" title="Porcentaje" style="width:150px" headerClass="tableCellHeader"/>
                  </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>

 <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#BFDFFF">
          <td>Distribución Asesoramiento:&nbsp;</td>
        </tr>
      </table>
      <table width="100%" >
        <tr>
          <td colspan="10">
                  <display:table name="sessionScope.cConvenioMarcoHabilitarActionForm.colDistribucionAI" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                    <display:column property="parte" title="Partes" style="width:300px" headerClass="tableCellHeader"/>
                    <display:column property="comparador" title="Comparadores" style="width:150px" headerClass="tableCellHeader"/>
                    <display:column property="porcentajeDetalle" title="Porcentaje" style="width:150px" headerClass="tableCellHeader"/>
                  </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>


  <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#BFDFFF">
          <td>Entidades Relacionadas: *&nbsp;</td>
        </tr>
      </table>
      <logic:notEmpty property="entidadesRelacionadas" name="cConvenioMarcoHabilitarActionForm">
      	<table width="100%" >
        	<tr>
          		<td width="100%">
                  <display:table name="sessionScope.cConvenioMarcoHabilitarActionForm.entidadesRelacionadas" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                  	<display:column property="indiceParaEntidadesPorConvenioMarco" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
                  	<display:column property="descripcion" sortName="srt_descripcion" title="Descripción"  headerClass="tableCellHeader"  sortable="true"  style="width: 300px;"/>
                  	<display:column property="tipo" sortName="srt_tipo" title="Tipo"  headerClass="tableCellHeader" sortable="true" style="width: 160px;" />
                  	<display:column property="provincia" sortName="srt_provincia" title="Provincia" headerClass="tableCellHeader"  sortable="true" style="width: 160px;"/>
                  	<display:column property="estado" sortName="estado" title="Estado" headerClass="tableCellHeader"  sortable="true" style="width: 160px;"/>
                  </display:table>
          		</td>
        	</tr>
      	</table>
      </logic:notEmpty>
      <logic:empty property="entidadesRelacionadas" name="cConvenioMarcoHabilitarActionForm">
         <table width="100%">
         	  <tr>
	             <td>No existen entidades relacionadas&nbsp;</td>
       	      </tr>
		  </table>
      </logic:empty>
      
      
    </td>
  </tr>



  <tr>
    <td class="CformAreaBotones" height="35">
	  	<div align="right">
        	<html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        	<html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
       	</div>
    </td>
  </tr>
 </table>
</div>




</html:form>
