<%@include file="layout/include.jsp"%>
<br>
<h1 align=" center" class="titulo">
  Modificaci&oacute;n de Entidad
</h1>
<html:form action="cEntidadModificarAction.do" method="POST">
  <html:hidden property="tipoEntidad" />
  <logic:equal property="tipoEntidad" value="grupo" name="cEntidadModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr height="25">
        <td class="CformRowHeader" colspan="10">
          &nbsp; Entidad
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td height="10" colspan="10"></td>
            </tr>
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="100">
                      Tipo:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipo">
                        <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="tipo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Descripción:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="descripcionSigla" />
                      <html:hidden property="descripcionSigla" />
                    </td>
                  <tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                    <td width="20"></td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="pais">
                        <html:options collection="comboPais" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="provincia">
                        <html:options collection="comboProvincia" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="partido">
                        <html:options collection="comboPartido" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="localidad">
                        <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="mail" />
                      <html:hidden property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="observaciones" />
                    </td>
                  </tr>
                  </table>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Integrantes:&nbsp;
                      </td>
                    </tr>
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadModificarActionForm.integrantes" style="width:100%"  decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                          <display:column property="indice" title="#" headerClass="tableCellHeader" />
                          <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="140" style="width: 250px;" />
                          <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                          <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="esJefeModificarCfm" title="Responsable" headerClass="tableCellHeader" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Convenio Marco:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colConvenioMarco" name="cEntidadModificarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadModificarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                            <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="universidad" title="Inst. Contraparte" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="uvts" title="UVT" headerClass="tableCellHeader" style="width: 200px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colConvenioMarco" name="cEntidadModificarActionForm">
                    <table width="100%">
                      <tr>
                        <td>
                          No se seleccionó Convenio Marco.&nbsp;
                        </td>
                      </tr>
                    </table>
                  </logic:empty>
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
    </table>

  </logic:equal>

  <logic:equal property="tipoEntidad" value="persona" name="cEntidadModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr height="25">
        <td class="CformRowHeader" colspan="10">
          &nbsp; Entidad
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td height="10" colspan="10"></td>
            </tr>
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="140">
                      Tipo:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipo">
                        <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Apellido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="apellido" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Nombre:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="nombre" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Documento tipo:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="tipoDocumento">
                        <html:options collection="comboTipoDoc" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Documento Nro.:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="nroDocumento" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Cuit:
                    </td>
                    <td class="CformDato" colspan="3">
                      <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                      <bean:write name="cEntidadModificarActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo" />
                      -
                      <bean:write name="cEntidadModificarActionForm" property="cuitNumero" />
                      <html:hidden property="cuitNumero" />
                      -
                      <bean:write name="cEntidadModificarActionForm" property="cuitSufijo" />
                      <html:hidden property="cuitSufijo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="paisParticular">
                        <html:options collection="comboPaisParticular" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="provinciaParticular">
                        <html:options
                          collection="comboProvinciaParticular" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true"
                        property="partidoParticular">
                        <html:options collection="comboPartidoParticular" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true"
                        property="localidadParticular">
                        <html:options collection="comboLocalidadParticular" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Codigo Postal:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="codigoPostal" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Lugar de Trabajo:&nbsp;
                      <span class="dato_obligatorio">(1)</span>
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="lugarTrabajoDescrip" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="pais">
                        <html:options collection="comboPais" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="provincia">
                        <html:options collection="comboProvincia" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="partido">
                        <html:options collection="comboPartido" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="localidad">
                        <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Escalafón:&nbsp;
                      <span class="dato_obligatorio">(1)</span>
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="escalafon">
                        <html:options collection="comboEscalafon" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Categoría:&nbsp;
                      <span class="dato_obligatorio">(1)</span>
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="categoria">
                        <html:options collection="comboCategoria" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadModificarActionForm" property="observaciones" />
                    </td>
                  </tr>
                  </table>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Convenios Marco:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colConvenioMarco" name="cEntidadModificarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadModificarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                            <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="universidad" title="Inst. Contraparte" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="uvts" title="UVT" headerClass="tableCellHeader" style="width: 200px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colConvenioMarco" name="cEntidadModificarActionForm">
                    <table width="100%">
                      <tr>
                        <td>
                          No se seleccionó convenio.&nbsp;
                        </td>
                      </tr>
                    </table>
                  </logic:empty>
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
        </td>
      </tr>  
    </table>
    <table align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <span class="dato_obligatorio">(1)</span> No corresponde informar los campos si no es personal de CONICET.
        </td>
      </tr>
    </table>
  </logic:equal>

  <logic:equal property="tipoEntidad" value="organismo" name="cEntidadModificarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr height="25">
        <td class="CformRowHeader" colspan="10">
          &nbsp;Entidad
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td height="10" colspan="10"></td>
            </tr>
            <tr>
              <td width="40" rowspan="100"></td>
              <table width="100%" cellpadding="2" cellspacing="2">
                <tr>
                  <td class="CformNombre" width="100">
                    Tipo:
                  </td>
                  <td class="CformDato">
                    <html:select disabled="true" property="tipo">
                      <html:options collection="comboTipoEntidad" property="value" labelProperty="label" />
                    </html:select>
                    <html:hidden property="tipo" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Sigla:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cEntidadModificarActionForm" property="descripcionSigla" />
                    <html:hidden property="descripcionSigla" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Denominación:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cEntidadModificarActionForm" property="denominacion" />
                    <html:hidden property="denominacion" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Cuit:
                  </td>
                  <td class="CformDato" colspan="3">
                    <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                    <bean:write name="cEntidadModificarActionForm" property="cuitPrefijo" />
                    <html:hidden property="cuitPrefijo" />
                    -
                    <bean:write name="cEntidadModificarActionForm" property="cuitNumero" />
                    <html:hidden property="cuitNumero" />
                    -
                    <bean:write name="cEntidadModificarActionForm" property="cuitSufijo" />
                    <html:hidden property="cuitSufijo" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Domicilio:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cEntidadModificarActionForm" property="domicilio" />
                    <html:hidden property="domicilio" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    País:&nbsp;
                  </td>
                  <td class="CformDato">
                    <html:select disabled="true" property="pais">
                      <html:options collection="comboPais" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Provincia:&nbsp;
                  </td>
                  <td class="CformDato">
                    <html:select disabled="true" property="provincia">
                      <html:options collection="comboProvincia" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Partido:&nbsp;
                  </td>
                  <td class="CformDato">
                    <html:select disabled="true" property="partido">
                      <html:options collection="comboPartido" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Localidad:&nbsp;
                  </td>
                  <td class="CformDato">
                    <html:select disabled="true" property="localidad">
                      <html:options collection="comboLocalidad" property="value" labelProperty="label" />
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    E-Mail:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cEntidadModificarActionForm" property="mail" />
                    <html:hidden property="mail" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Teléfono:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cEntidadModificarActionForm" property="telefono" />
                  </td>
                </tr>
                <tr>
                  <td class="CformNombre">
                    Observaciones:
                  </td>
                  <td class="CformDato">
                    <bean:write name="cEntidadModificarActionForm" property="observaciones" />
                  </td>
                </tr>
                </table>
                <table width="100%">
                  <tr bgcolor="#DDEEFF">
                    <td>
                      Convenios Marco:&nbsp;
                    </td>
                  </tr>
                </table>
                <logic:notEmpty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadModificarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="universidad" title="Inst. Contraparte" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 200px;" />
                          <display:column property="uvts" title="UVT" headerClass="tableCellHeader" style="width: 200px;" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="colConvenioMarco" name="cEntidadModificarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionó convenio.&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
                <tr>
                  <td class="CformAreaBotones" height="35">
                    <div align="right">
                      <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
                      <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar" />
                    </div>
                  </td>
                </tr>
              </table>
          </table>
      </tr>
    </table>
  </logic:equal>
</html:form>
