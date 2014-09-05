<%@include file="layout/include.jsp"%>
<br>

<logic:equal property="estado" value="N" name="cEntidadActivarActionForm">
  <h1 align="center" class="titulo">
    Deshabilitación de Entidad
  </h1>
</logic:equal>

<logic:equal property="estado" value="I" name="cEntidadActivarActionForm">
  <h1 align="center" class="titulo">
    Habilitación de Entidad
  </h1>
</logic:equal>

<html:form action="cEntidadActivarAction.do" method="POST">
  <html:hidden property="entidadTipo" />
  <html:hidden property="estado" />

  <logic:equal property="entidadTipo" value="grupo" name="cEntidadActivarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
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
                      <bean:write name="cEntidadActivarActionForm" property="descripcionSigla" />
                      <html:hidden property="descripcionSigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="paisDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="provinciaDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="partidoDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="localidadDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="mail" />
                      <html:hidden property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="100">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="telefono" />
                      <html:hidden property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="observaciones" />
                    </td>
                  </tr>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Integrantes:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="personasDelGrupo" name="cEntidadActivarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cEntidadActivarActionForm.personasDelGrupo" style="width:100%" decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                          <display:column property="indice" title="#" headerClass="tableCellHeader" />
                          <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="150" style="width: 230px;" />
                          <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                          <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
                          <display:column property="esJefeActivar" title="Responsable" headerClass="tableCellHeader" />
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="personasDelGrupo" name="cEntidadActivarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionaron Integrantes.&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
                <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        UVT:&nbsp;
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
                  <logic:notEmpty property="colConvenioMarco" name="cEntidadActivarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadActivarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
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
                  <logic:empty property="colConvenioMarco" name="cEntidadActivarActionForm">
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
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </logic:equal>

  <logic:equal property="entidadTipo" value="persona" name="cEntidadActivarActionForm">
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
                    <td class="CformNombre" width="150">
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
                      Apellido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="apellido" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Nombre:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="nombre" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Documento tipo:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="documentoTipo">
                        <html:options collection="comboTipoDoc" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Documento Nro.:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="documentoNro" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Cuit:
                    </td>
                    <td class="CformDato">
                      <!--  <html:text property="cuit"/></td-->
                      <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                      <bean:write name="cEntidadActivarActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo" />
                      -
                      <bean:write name="cEntidadActivarActionForm" property="cuitNumero" />
                      <html:hidden property="cuitNumero" />
                      -
                      <bean:write name="cEntidadActivarActionForm" property="cuitSufijo" />
                      <html:hidden property="cuitSufijo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="paisParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="provinciaParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="partidoParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="localidadParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Código Postal:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="codigoPostal" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Lugar de Trabajo:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="lugarTrabajoDescrip" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="paisDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="provinciaDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="partidoDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="localidadDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Escalafón:
                    </td>
                    <td class="CformDato">
                      <html:select disabled="true" property="escalafon">
                        <html:options collection="comboEscalafon" property="value" labelProperty="label" />
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Categoría:
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
                      <bean:write name="cEntidadActivarActionForm" property="observaciones" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>
  <logic:equal property="entidadTipo" value="organismo" name="cEntidadActivarActionForm">
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0">
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
              <td width="40" rowspan="100"></td>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre">
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
                      <bean:write name="cEntidadActivarActionForm" property="descripcionSigla" />
                      <html:hidden property="descripcionSigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Denominación:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="denominacion" />
                      <html:hidden property="denominacion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Cuit:
                    </td>
                    <td class="CformDato">
                      <!--  <html:text property="cuit"/></td-->
                      <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                      <bean:write name="cEntidadActivarActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo" />
                      -
                      <bean:write name="cEntidadActivarActionForm" property="cuitNumero" />
                      <html:hidden property="cuitNumero" />
                      -
                      <bean:write name="cEntidadActivarActionForm" property="cuitSufijo" />
                      <html:hidden property="cuitSufijo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="paisDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="provinciaDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="partidoDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="localidadDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="mail" />
                      <html:hidden property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="telefono" />
                      <html:hidden property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadActivarActionForm" property="observaciones" />
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
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>
</html:form>
