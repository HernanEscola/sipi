<%@include file="layout/include.jsp"%>
<br>
<h1 align=" center" class="titulo">
  Eliminaci&oacute;n de Entidad
</h1>
<html:form action="cEntidadEliminarAction.do" method="POST">
  <html:hidden property="entidadTipo" />

  <logic:equal property="existeInfoRelacionada" value="N" name="cEntidadEliminarActionForm">
    <h2 class="mensajeSuperior">
      Está a punto de eliminar, presione 'Grabar' para confirmar
    </h2>
  </logic:equal>

  <logic:equal property="entidadTipo" value="grupo" name="cEntidadEliminarActionForm">
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
                    <td class="CformNombre">
                      Descripción:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="descripcionSigla" />
                      <html:hidden property="descripcionSigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="paisDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="provinciaDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="partidoDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="localidadDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="mail" />
                      <html:hidden property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="telefono" />
                      <html:hidden property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="observaciones" />
                    </td>
                  </tr>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Integrantes:&nbsp;
                      </td>
                    </tr>
                  </table>
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadEliminarActionForm.personasDelGrupo" style="width:100%"  decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                            <display:column property="indice" title="#" headerClass="tableCellHeader" />
                            <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="140" style="width: 250px;" />
                            <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                            <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                            <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
                            <display:column property="esJefeEliminar" title="Responsable" headerClass="tableCellHeader"/>
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        UVT:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colGestor" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadEliminarActionForm.colGestor" style="width:100%"  decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                            <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 150px;" />
                            <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 100px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colGestor" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td>
                          No se seleccionó UVT.&nbsp;
                        </td>
                      </tr>
                    </table>
                  </logic:empty>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Convenio Marco:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colConvenioMarco" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadEliminarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                            <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="universidad" title="Universidad" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 50px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colConvenioMarco" name="cEntidadEliminarActionForm">
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
                  <logic:equal property="existeInfoRelacionada" value="N" name="cEntidadEliminarActionForm">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
                  </logic:equal>
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                </div>
              </td>
            </tr>
          </table>
       </table>
  </logic:equal>

  <logic:equal property="entidadTipo" value="persona" name="cEntidadEliminarActionForm">
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
                      <bean:write name="cEntidadEliminarActionForm" property="apellido" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Nombre:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="nombre" />
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
                      <bean:write name="cEntidadEliminarActionForm" property="documentoNro" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Cuit:
                    </td>
                    <td class="CformDato">
                      <!--  <html:text property="cuit"/></td-->
                      <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                      <bean:write name="cEntidadEliminarActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo" />
                      -
                      <bean:write name="cEntidadEliminarActionForm" property="cuitNumero" />
                      <html:hidden property="cuitNumero" />
                      -
                      <bean:write name="cEntidadEliminarActionForm" property="cuitSufijo" />
                      <html:hidden property="cuitSufijo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="paisParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="provinciaParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="partidoParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="localidadParticularDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Código Postal:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="codigoPostal" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Lugar de Trabajo:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="lugarTrabajoDescrip" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="paisDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="provinciaDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="partidoDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="localidadDescripcion" />
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
                      <bean:write name="cEntidadEliminarActionForm" property="observaciones" />
                    </td>
                  </tr>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        UVT:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colGestor" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadEliminarActionForm.colGestor" style="width:100%"  decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                            <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 150px;" />
                            <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 100px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colGestor" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td>
                          No se seleccionó UVT.&nbsp;
                        </td>
                      </tr>
                    </table>
                  </logic:empty>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Convenios Marco:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colConvenioMarco" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadEliminarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                            <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="universidad" title="Universidad" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 50px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colConvenioMarco" name="cEntidadEliminarActionForm">
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
                  <logic:equal property="existeInfoRelacionada" value="N" name="cEntidadEliminarActionForm">
                    <html:submit property="btnSubmit"styleClass="CformBoton" value="Grabar" />
                  </logic:equal>
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                </div>
              </td>
            </tr>
          </table>
    </table>
  </logic:equal>
  <logic:equal property="entidadTipo" value="organismo" name="cEntidadEliminarActionForm">
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
              <td width="40" rowspan="100"></td>
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
                    <td class="CformNombre">
                      Sigla:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="descripcionSigla" />
                      <html:hidden property="descripcionSigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Denominación:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="denominacion" />
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
                      <bean:write name="cEntidadEliminarActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo" />
                      -
                      <bean:write name="cEntidadEliminarActionForm" property="cuitNumero" />
                      <html:hidden property="cuitNumero" />
                      -
                      <bean:write name="cEntidadEliminarActionForm" property="cuitSufijo" />
                      <html:hidden property="cuitSufijo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Domicilio:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="domicilio" />
                      <html:hidden property="domicilio" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      País:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="paisDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Provincia:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="provinciaDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Partido:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="partidoDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Localidad:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="localidadDescripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="mail" />
                      <html:hidden property="mail" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Teléfono:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="telefono" />
                      <html:hidden property="telefono" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Observaciones:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cEntidadEliminarActionForm" property="observaciones" />
                    </td>
                  </tr>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        UVT:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colGestor" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadEliminarActionForm.colGestor" style="width:100%"  decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
                            <display:column property="indiceGestor" title="#" style="width:10px" headerClass="tableCellHeader" />
                            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;" />
                            <display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="width: 150px;" />
                            <display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 100px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colGestor" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td>
                          No se seleccionó UVT.&nbsp;
                        </td>
                      </tr>
                    </table>
                  </logic:empty>
                  <table width="100%">
                    <tr bgcolor="#DDEEFF">
                      <td>
                        Convenios Marco:&nbsp;
                      </td>
                    </tr>
                  </table>
                  <logic:notEmpty property="colConvenioMarco" name="cEntidadEliminarActionForm">
                    <table width="100%">
                      <tr>
                        <td colspan="10">
                          <display:table name="sessionScope.cEntidadEliminarActionForm.colConvenioMarco" style="width:100%"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                            <display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="universidad" title="Universidad" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 100px;" />
                            <display:column property="tipoOfertaContratacion" title="Tipo" headerClass="tableCellHeader" style="width: 50px;" />
                          </display:table>
                        </td>
                      </tr>
                    </table>
                  </logic:notEmpty>
                  <logic:empty property="colConvenioMarco" name="cEntidadEliminarActionForm">
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
                  <logic:equal property="existeInfoRelacionada" value="N" name="cEntidadEliminarActionForm">
                    <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
                  </logic:equal>
                  <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
                </div>
              </td>
            </tr>
          </table>
    </table>
  </logic:equal>
  <logic:equal property="existeInfoRelacionada" value="S" name="cEntidadEliminarActionForm">
    <table align="center">
      <tr>
        <td>
          Atención: No podrá eliminar porque tiene información relacionada
        </td>
      </tr>
    </table>
  </logic:equal>
</html:form>
