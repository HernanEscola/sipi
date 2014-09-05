<%@include file="/jsp/layout/include.jsp"%>

<bean:define id="formulario" name='<%= request.getParameter("formulario") %>' />
<bean:define id="confirmacion" name="formulario" property="confirmacion"/>
<bean:define id="form" name="formulario" property="oferta" />
<bean:define id="prestador" name="form" property="titularLote" />
<bean:define id="costos" name="form" property="stanCostos" />
<bean:define id="equipos" name="form" property="equiposLote" />
<bean:define id="collectionDP" name="form" property="comboDP" />
<bean:define id="collectionDD" name="form" property="comboDD" />
<bean:define id="collectionCA" name="form" property="comboCA" />
<bean:define id="collectionCO" name="form" property="comboCO" />
<bean:define id="collectionEstado" name="form" property="comboEstado" />
<bean:define id="collectionEstadoResolucion" name="form" property="comboEstadoResolucion" />
<bean:define id="collectionTipoResolucion" name="form" property="comboTipoResolucion" />
<bean:define id="responsablesTecnicos" property="responsablesTecnicos" name="form" />

<table align="center" width="100%">
  <tr>
    <td>
    <table width="100%">
      <tr bgcolor="#BFDFFF">
        <td>
          <strong>
            <bean:write name="form" property="tipoOfertaDescripcion" />&nbsp;
          </strong>
        </td>
      </tr>
    </table>
    
    <table width="100%" cellpadding="0" cellspacing="0">
      <logic:notEmpty property="codigoId" name="form">
        <tr>
          <td class="CformNombre" width="130">Código:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="form" property="codigoId" />
          </td>
        </tr>
      </logic:notEmpty>
      
      <tr>
         <td class="CformNombre" width="130">
           Es Servicio:&nbsp;
         </td>
         <td class="CformDato" width="50">
           <html:radio name="form" property="tipo" value="ST" disabled="true" />
         </td>
         <td class="CformNombre" width="200">
           Es Asesoramiento:&nbsp;
         </td>
         <td class="CformDato">
           <html:radio name="form" property="tipo" value="AINS" disabled="true" />
         </td>
      </tr>
      
      <tr>
        <td class="CformNombre" width="130">Título:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="descripcion" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="130">Prestación:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="prestacionDescripcion" />
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
          <display:table name='<%= prestador %>' id="ofertaTecnologicaDetalle" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CPropiedadDisplayWrapper">
            <logic:equal value="N" name="confirmacion">
              <display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" />
            </logic:equal>
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
          <strong>Especificación&nbsp;</strong>
        </td>
      </tr>
    </table>
    <table width="100%">
      <tr>
        <td class="CformNombre" width="130">Detalle STAN:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="detalle" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="130">Detalle Prestación:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="prestacionDetalle" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="130">Metodología:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="especificacionMetodologia" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="130">Unidad de Prestación:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="unidadPrestacion" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="130">Capacidad Operativa:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="capacidadOperativa" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="130">Cantidad Mínima:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="cantidadMinima" />
        </td>
      </tr>
	  <logic:notEmpty property="responsablesTecnicos" name="form">
	  	<tr>
	  	  <td colspan="2">
	  		<table width="100%">
		      <tr bgcolor="#BFDFFF">
		        <td><strong>Responsables Técnicos&nbsp;</strong></td>
		      </tr>
		    </table>
	      	<table width="100%">
		        <tr>
		          <td colspan="10">
		            <display:table name='<%= responsablesTecnicos %>' style="width: 100%" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.CStanResponsableTecnicoDisplayWrapper">
		            
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
	  </logic:notEmpty>
            
	  <logic:empty property="responsablesTecnicos" name="form">
	 	<tr>
	    	<td class="CformNombre" width="130">Responsable Técnico:&nbsp;</td>
	    	<td class="CformDato">
	      		<bean:write name="form" property="responsable"/></td>
	 	</tr>
	  </logic:empty>
    </table>
        
    <table width="100%">
      <tr bgcolor="#BFDFFF">
        <td><strong>Equipamientos&nbsp;</strong></td>
      </tr>
    </table>
    <logic:notEmpty property="equiposLote" name="form">
      <table width="100%">
        <tr>
          <td colspan="10">
            <display:table name='<%= equipos %>' style="width: 100%" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
              <logic:equal value="N" name="confirmacion">
                <display:column property="indiceListado" title="#" headerClass="tableCellHeader" style="width: 10px;" />
              </logic:equal>
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
    <logic:empty property="equiposLote" name="form">
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
          <bean:write name="form" property="principalDPDescripcion" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">Otras:&nbsp;</td>
        <logic:notEmpty property="loteDP" name="form">
          <td class="CformDato">
            <html:select disabled="false" name="form" property="loteDP" multiple="true" size="3">
              <html:options collection="collectionDP" property="value" labelProperty="label" />
            </html:select>
          </td>
        </logic:notEmpty>
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
          <bean:write name="form" property="principalDDDescripcion" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">Otras:&nbsp;</td>
        <logic:notEmpty property="loteDD" name="form">
          <td class="CformDato">
            <html:select disabled="false" name="form" property="loteDD" multiple="true" size="3">
              <html:options collection="collectionDD" property="value" labelProperty="label" />
            </html:select>
          </td>
        </logic:notEmpty>
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
          <bean:write name="form" property="principalCADescripcion" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">Otras:&nbsp;</td>
        <logic:notEmpty property="loteCA" name="form">
          <td class="CformDato">
            <html:select disabled="false" name="form" property="loteCA" multiple="true" size="3">
              <html:options collection="collectionCA" property="value" labelProperty="label" />
            </html:select>
          </td>
        </logic:notEmpty>
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
          <bean:write name="form" property="principalCODescripcion" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">Otros:&nbsp;</td>
        <logic:notEmpty property="loteCO" name="form">
          <td class="CformDato">
            <html:select disabled="false" name="form" property="loteCO" multiple="true" size="3">
              <html:options collection="collectionCO" property="value" labelProperty="label" />
            </html:select>
          </td>
        </logic:notEmpty>
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
          <bean:write name="form" property="palabraClave1" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">2ª:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="palabraClave2" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">3ª:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="palabraClave3" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">4ª:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="palabraClave4" />
        </td>
      </tr>
      <tr>
        <td class="CformNombre" width="100">5ª:&nbsp;</td>
        <td class="CformDato">
          <bean:write name="form" property="palabraClave5" />
        </td>
      </tr>
    </table>
    <table width="100%">
      <tr bgcolor="#BFDFFF">
        <td><strong>Costos&nbsp;</strong></td>
      </tr>
    </table>
    <logic:notEmpty property="stanCostos" name="form">
      <table width="100%">
        <tr>
          <td colspan="10">
            <display:table name='<%= costos %>' id="detalleOferta" style="width: 100%;" requestURI="cOfertaTecnologicaDetalleAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
              <logic:equal value="N" name="confirmacion">
                <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
              </logic:equal>
              <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;" />
              <display:column property="costoConsolidado" title=" Costo $ Mínimo" maxLength="20" headerClass="tableCellHeader" style="text-align:right;width: 80px;" />
              <display:column property="fechaDesde" title="Vigencia Desde" headerClass="tableCellHeader" style="align:right; width: 150px;" />
              <display:column property="fechaHasta" title="Vigencia Hasta" headerClass="tableCellHeader" style="align:right; width: 150px;" />
              <display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 150px;" />
            </display:table>
          </td>
        </tr>
      </table>
    </logic:notEmpty>
    <logic:empty property="stanCostos" name="form">
      <table width="100%">
        <tr>
          <td>No se informaron costos&nbsp;</td>
        </tr>
      </table>
    </logic:empty>
    <table width="100%">
      <tr bgcolor="#BFDFFF">
        <td><strong>Seguimiento&nbsp;</strong></td>
      </tr>
    </table>
    <capplication:isApplication application="SVT">
      <table width="100%">
        <tr>
          <td class="CformNombre" width="130" align="left">
            Expediente Nro:&nbsp;
          </td>
          <td class="CformDato">
            <logic:notEmpty property="nroExpediente" name="form">
              <bean:write name="form" property="nroExpediente" /> /
              <bean:write name="form" property="anioExpediente" />
            </logic:notEmpty>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="130">
            Fecha Autorización:&nbsp;
          </td>
          <td class="CformDato">
            <bean:write name="form" property="fechaAutorizacion" />
          </td>
        <tr>
        <tr>
          <td class="CformNombre" width="130">Resolución:&nbsp;</td>
          <td class="CformDato">
            <logic:notEmpty property="nroResolucion" name="form">
              Tipo:&nbsp;
              <html:select disabled="true" name="form" property="tipoResolucion">
                <html:options collection="collectionTipoResolucion" property="value" labelProperty="label" />
              </html:select>
              Nro: 
              <bean:write name="form" property="nroResolucion" />
              &nbsp;&nbsp;Fecha:&nbsp;
              <bean:write name="form" property="fechaResolucion" />
            </logic:notEmpty>
            <logic:greaterThan value="-1" property="estadoResolucion" name="form">
            <html:select disabled="true" property="estadoResolucion" name="form">
              <html:options collection="collectionEstadoResolucion" property="value" labelProperty="label" />
            </html:select>
          </logic:greaterThan>
         </td>
        </tr>
      </table>
    </capplication:isApplication>
    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="CformNombre" width="130">Estado:&nbsp;</td>
        <td class="CformDato">
          <html:select disabled="true" name="form" property="tipoEstado">
            <html:options collection="collectionEstado" property="value" labelProperty="label" />
          </html:select>
        </td>
      </tr>
    </table>
    <capplication:isApplication application="SVT">
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td class="CformNombre" width="130">Publicar:&nbsp;</td>
          <td class="CformDato">
            Sí <html:radio name="form" property="publica" value="S" disabled="true" /> 
            No <html:radio name="form" property="publica" value="N" disabled="true" />
          </td>
        </tr>
      </table>
    </capplication:isApplication>
   </td>
  </tr>
</table>
