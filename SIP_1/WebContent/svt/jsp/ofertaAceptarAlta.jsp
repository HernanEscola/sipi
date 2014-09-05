<%@include file="layout/include.jsp"%>

<html:form action="cOfertaAceptarAltaAction.do" method="POST">
  <logic:equal value="aceptar" name="cOfertaAceptarAltaActionForm" property="accion">
    <h1 align="center" class="titulo">
      Procesamiento de Registro de Oferta Tecnológica
    </h1>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <logic:equal value="3" name="cOfertaAceptarAltaActionForm" property="tipoOferta">
            <jsp:include page="/jsp/entidades/stan.jsp">
              <jsp:param name="formulario" value="cOfertaAceptarAltaActionForm"/>
            </jsp:include>
          </logic:equal>
          <logic:equal value="1" name="cOfertaAceptarAltaActionForm" property="tipoOferta">
            <jsp:include page="/jsp/entidades/conocimiento.jsp">
              <jsp:param name="formulario" value="cOfertaAceptarAltaActionForm"/>
            </jsp:include>
          </logic:equal>
        </td>
      </tr>
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#BFDFFF">
              <td><strong>Aceptación/Rechazo&nbsp;</strong></td>
            </tr>
          </table>
          <table cellpadding="0" cellspacing="0" width="100%"> 
            <tr>
              <td class="CformNombre" width="30%">
                Motivo:&nbsp;<span class="dato_obligatorio">(1)</span>
              </td>
              <td class="CformDato" width="70%">
                <html:textarea property="motivo" rows="3" />
              </td>
            </tr> 
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" class="headTabla" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Aceptar" styleClass="CformBoton"/>
            <html:submit property="btnSubmit" value="Rechazar" styleClass="CformBoton"/>
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
          </div>
        </td>
      </tr>
    </table>
    <table align="center" cellpadding="0" cellspacing="0"  class="100%">
      <tr>
        <td ><span class="dato_obligatorio">(1)</span>
          Si se desea "Rechazar" el motivo es necesario.
        </td>
      </tr>
   </table> 
  </logic:equal>
  <logic:equal value="aceptarCfm" name="cOfertaAceptarAltaActionForm" property="accion">
    <h1 align="center" class="titulo">
      <logic:equal value="A" name="cOfertaAceptarAltaActionForm" property="aceptado">
        Aceptación del Registro de Oferta Tecnológica
      </logic:equal>
      <logic:equal value="R" name="cOfertaAceptarAltaActionForm" property="aceptado">
        Rechazo del Registro de Oferta Tecnológica
      </logic:equal>
    </h1>
    
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <logic:equal value="3" name="cOfertaAceptarAltaActionForm" property="tipoOferta">
            <jsp:include page="/jsp/entidades/stan.jsp">
              <jsp:param name="formulario" value="cOfertaAceptarAltaActionForm"/>
            </jsp:include>
          </logic:equal>
          <logic:equal value="1" name="cOfertaAceptarAltaActionForm" property="tipoOferta">
            <jsp:include page="/jsp/entidades/conocimiento.jsp">
              <jsp:param name="formulario" value="cOfertaAceptarAltaActionForm"/>
            </jsp:include>
          </logic:equal>
        </td>
      </tr>
      <tr>
        <td>
          <table width="100%">
            <tr bgcolor="#BFDFFF">
              <td><strong>Aceptación/Rechazo&nbsp;</strong></td>
            </tr>
          </table>
          <table cellpadding="0" cellspacing="0" width="600"> 
            <tr>
              <td class="CformNombre" width="130">
                Motivo:&nbsp;
              </td>
              <td class="CformDato" width="400">
                <bean:write name="cOfertaAceptarAltaActionForm" property="motivo"/>
              </td>
            </tr> 
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" class="headTabla" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Grabar" styleClass="CformBoton"/>
            <html:submit property="btnSubmit" value="Modificar" styleClass="CformBoton"/>
          </div>
        </td>
      </tr>
    </table>  
  </logic:equal>
</html:form>
