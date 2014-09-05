<%@include file="layout/include.jsp"%>

<script>
function setFoco(){
x=event.keyCode
//alert(x)
if((x==13)){ // enter
window.event.returnValue = false
}

}
</script>


<br>
<h1 align="center" class="titulo">
  Habilitación / Suspensión de Ofertas Tecnológicas
</h1>
<html:form action="cPrestadorYOTSuspenderAction.do" method="POST">
  <html:hidden property="accion" />
  <logic:equal property="accion" value="suspender"
    name="cPrestadorYOTSuspenderActionForm">
    <table class="CformTable" align="center" cellpadding="0"
      cellspacing="0" width="600">
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td colspan="10" height="30">
                <table align="center" width="100%">
                  <tr>
                    <td colspan="10" height="30">
                      <jsp:include flush="false" page="/jsp/entidadFichaCompacta.jsp" />
                    </td>
                  </tr>
                </table>
                <table align="center" width="100%">
                  <tr>
                    <logic:equal value="S" property="estadoPrestador" name="cPrestadorYOTSuspenderActionForm">
                      <td class="CformNombre" width="134">
                        Habilitar:
                      </td>
                      <td class="CformDato">
                        <html:checkbox property="habilitar" name="cPrestadorYOTSuspenderActionForm" />
                      </td>
                    </logic:equal>
                    <logic:equal value="N" property="estadoPrestador" name="cPrestadorYOTSuspenderActionForm">
                      <td class="CformNombre" width="134" align="center">
                        Suspender:
                      </td>
                      <td class="CformDato">
                        <html:checkbox property="habilitar" name="cPrestadorYOTSuspenderActionForm" />
                      </td>
                    </logic:equal>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Ofertas Tecnológicas Habilitadas:
              </td>
            </tr>
            <tr>
              <td colspan="10">
                <display:table style="width:100%" id="otHabilitadas" name="sessionScope.cPrestadorYOTSuspenderActionForm.ofertasHabilitadas" requestURI="cPrestadorYOTSuspenderAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper">
                  <display:column property="indiceListadoHabilitacion" title="#" headerClass="tableCellHeader" />
                  <display:column property="tipoOferta" title="Oferta" headerClass="tableCellHeader" />
                  <display:column property="descripcion" title="Descripción" maxLength="40" headerClass="tableCellHeader" style="width:280px;" />
                  <display:column property="tipoEstado" title="Estado" headerClass="tableCellHeader" style="width:80px;" />
                  <display:column property="optionsHabilitadas" title="Selec" headerClass="tableCellHeader" maxLength="40" style="width:40px" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <img src="./imagenes/checkAll.png">
                  <a href="cPrestadorYOTSuspenderAction.do?accion=marcarTodoHabilitados">Marcar Todo</a>
                  <img src="./imagenes/unCheckAll.png">
                  <a href="cPrestadorYOTSuspenderAction.do?accion=desmarcarTodoHabilitados">Desmarcar Todo</a>
                  <html:submit property="btnSubmit" value="Suspender" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Ofertas Tecnológicas Suspendidas:
              </td>
            </tr>
            <tr>
              <td colspan="10">
                <display:table style="width: 100%" id="otSuspendidas" name="sessionScope.cPrestadorYOTSuspenderActionForm.ofertasSuspendidas" requestURI="cPrestadorYOTSuspenderAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper">
                  <display:column property="indiceListadoSuspencion" title="#" headerClass="tableCellHeader" />
                  <display:column property="tipoOferta" title="Oferta" headerClass="tableCellHeader" />
                  <display:column property="descripcion" title="Descripción" maxLength="40" headerClass="tableCellHeader" style="width:280px;" />
                  <display:column property="estadoSuspendidas" title="Estado" headerClass="tableCellHeader" style="width:80px;" />
                  <display:column property="optionsSuspendidas" title="Selec" headerClass="tableCellHeader" maxLength="40" style="width: 40px" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <img src="./imagenes/checkAll.png">
                  <a href="cPrestadorYOTSuspenderAction.do?accion=marcarTodoSuspendidos">Marcar Todo</a>
                  <img src="./imagenes/unCheckAll.png">
                  <a href="cPrestadorYOTSuspenderAction.do?accion=desmarcarTodoSuspendidos">Desmarcar Todo</a>
                  <html:submit property="btnSubmit" value="Habilitar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" bgcolor="efefef" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>

  <logic:equal property="accion" value="confirmar" name="cPrestadorYOTSuspenderActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td colspan="10" height="30">
                <table align="center" width="100%">
                  <tr>
                    <td colspan="10" height="30">
                      <jsp:include flush="false" page="/jsp/entidadFichaCompacta.jsp" />
                    </td>
                  </tr>
                </table>
                <table align="center" width="100%">
                  <tr>
                    <logic:equal value="S" property="estadoPrestador" name="cPrestadorYOTSuspenderActionForm">
                      <td class="CformNombre" width="134">
                        Habilitar:
                      </td>
                      <td class="CformDato">
                        <html:checkbox property="habilitar" disabled="true" name="cPrestadorYOTSuspenderActionForm" />
                      </td>
                    </logic:equal>
                    <logic:equal value="N" property="estadoPrestador" name="cPrestadorYOTSuspenderActionForm">
                      <td class="CformNombre" width="134" align="center">
                        Suspender:
                      </td>
                      <td class="CformDato">
                        <html:checkbox property="habilitar" disabled="true" name="cPrestadorYOTSuspenderActionForm" />
                      </td>
                    </logic:equal>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Ofertas Tecnológicas Habilitadas:
              </td>
            </tr>
            <tr>
              <td colspan="10">
                <display:table style="width:100%" id="otHabilitadas" name="sessionScope.cPrestadorYOTSuspenderActionForm.ofertasHabilitadas" requestURI="cPrestadorYOTSuspenderAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper">
                  <display:column property="indiceListadoHabilitacion" title="#" headerClass="tableCellHeader" />
                  <display:column property="tipoOferta" title="Oferta" headerClass="tableCellHeader" />
                  <display:column property="descripcion" title="Descripción" maxLength="40" headerClass="tableCellHeader" style="width:280px;" />
                  <display:column property="tipoEstado" title="Estado" headerClass="tableCellHeader" style="width:80px;" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Ofertas Tecnológicas Suspendidas:
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table style="width: 100%" id="otSuspendidas" name="sessionScope.cPrestadorYOTSuspenderActionForm.ofertasSuspendidas" requestURI="cPrestadorYOTSuspenderAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper">
                  <display:column property="indiceListadoSuspencion" title="#" headerClass="tableCellHeader" />
                  <display:column property="tipoOferta" title="Oferta" headerClass="tableCellHeader" />
                  <display:column property="descripcion" title="Descripción" maxLength="40" headerClass="tableCellHeader" style="width:280px;" />
                  <display:column property="tipoEstado" title="Estado" headerClass="tableCellHeader" style="width:80px;" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" bgcolor="efefef" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Grabar" styleClass="CformBoton" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>
</html:form>
