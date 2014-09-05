<%@include file="layout/include.jsp"%>
  <!-- Cuando el Tipo es 3 es del Tipo Organismo -->
<logic:equal property="entidadTipo" value="organismo" name="cEntidadDetalleActionForm">
        <table>
          <tr>
            <td class="CformNombre">Sigla:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="descripcionSigla" />
              <html:hidden property="descripcionSigla" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Denominación:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="denominacion" /> 
              <html:hidden property="denominacion" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Cuit:</td>
            <td class="CformDato"><!--  <html:text property="cuit"/></td-->
            <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
              <bean:write name="cEntidadDetalleActionForm" property="cuitPrefijo" /> 
              <html:hidden property="cuitPrefijo" />
            - <bean:write name="cEntidadDetalleActionForm" property="cuitNumero" /> 
              <html:hidden property="cuitNumero" />
            - <bean:write name="cEntidadDetalleActionForm" property="cuitSufijo" /> 
              <html:hidden property="cuitSufijo" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Domicilio:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="domicilio" /> 
              <html:hidden  property="domicilio" /></td>
          </tr>
          <tr>
            <td class="CformNombre">País:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="paisDescripcion" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Provincia:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="provinciaDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Partido:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="partidoDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Localidad:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="localidadDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">E-Mail:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="mail" /> 
              <html:hidden property="mail" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Teléfono:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="telefono" /> 
              <html:hidden property="telefono" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Responsable:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="dirAcademico" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Observaciones:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="observaciones" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Administrado por:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="administrador" /></td>
          </tr>
         
          <tr>
            <td height="10" colspan="0"></td>
          </tr>
          </table>
          
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Convenios Marco:&nbsp;</td>
            </tr>
          </table>
          <logic:notEmpty property="colConvenioMarco" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td colspan="10">
                  <display:table  name="sessionScope.cEntidadDetalleActionForm.colConvenioMarco" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
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
          <logic:empty property="colConvenioMarco" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td>No se seleccionó convenio.&nbsp;</td>
              </tr>
            </table>
          </logic:empty>
          
          
          
          

          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Administradores Anteriores:&nbsp;</td>
            </tr>
          </table>
          
          <logic:notEmpty property="colOrganismosAdministradores" name="cEntidadDetalleActionForm">

            <table width="100%">
              <tr>
                <td colspan="10">
                  <display:table  name="sessionScope.cEntidadDetalleActionForm.colOrganismosAdministradores" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
                    <display:column property="descripcionAdministradorEntOrgAdm" title="Organismo" headerClass="tableCellHeader" style="width: 300px;" />
                    <display:column property="fechaDesdeEntOrgAdm" title="Desde" headerClass="tableCellHeader" style="width: 150px;" />
                    <display:column property="fechaHastaEntOrgAdm" title="Hasta" headerClass="tableCellHeader" style="width: 150px;" />
                  </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
          <logic:empty property="colOrganismosAdministradores" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td>No existen administradores anteriores.&nbsp;</td>
              </tr>
            </table>
          </logic:empty>
   
</logic:equal>

  
    <!-- Cuando el Tipo es 2 es del Tipo Grupo -->
<logic:equal property="entidadTipo" value="grupo" name="cEntidadDetalleActionForm">
        <table>
          <tr>
            <td class="CformNombre">Descripción:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="descripcionSigla" />
              <html:hidden property="descripcionSigla" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Domicilio:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="domicilio" /> 
                <html:hidden  property="domicilio" /></td>
          </tr>
          <tr>
            <td class="CformNombre">País:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="paisDescripcion" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Provincia:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="provinciaDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Partido:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="partidoDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Localidad:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="localidadDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">E-Mail:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="mail" /> 
              <html:hidden property="mail" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Teléfono:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="telefono" /> 
              <html:hidden property="telefono" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Observaciones:</td>
            <td class="CformDato"><bean:write name="cEntidadDetalleActionForm" property="observaciones" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Administrado por:</td>
            <td class="CformDato"><bean:write name="cEntidadDetalleActionForm" property="administrador" /></td>
          </tr>
          <tr>
            <td height="10" colspan="0"></td>
          </tr>
          
           </table>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Integrantes:&nbsp;</td>
            </tr>
          </table>
          <logic:notEmpty property="personasDelGrupo" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td colspan="10">
                  <display:table  name="sessionScope.cEntidadDetalleActionForm.personasDelGrupo" style="width: 100%" decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                    <display:column property="indice" title="#" headerClass="tableCellHeader" />
                    <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="140" style="width: 250px;" />
                    <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                    <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                    <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
                    <display:column property="esJefeDetalle" title="Responsable" headerClass="tableCellHeader" />
                  </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
          <logic:empty property="personasDelGrupo" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td>No se seleccionaron Integrantes.&nbsp;</td>
              </tr>
            </table>
          </logic:empty>
          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Convenio Marco:&nbsp;</td>
            </tr>
          </table>
          <logic:notEmpty property="colConvenioMarco" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td colspan="10">
                  <display:table  name="sessionScope.cEntidadDetalleActionForm.colConvenioMarco" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
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
          <logic:empty property="colConvenioMarco" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td>No se seleccionó Convenio Marco.&nbsp;</td>
              </tr>
            </table>
          </logic:empty>

          <table width="100%">
            <tr bgcolor="#DDEEFF">
              <td>Administradores Anteriores:&nbsp;</td>
            </tr>
          </table>
          
          <logic:notEmpty property="colOrganismosAdministradores" name="cEntidadDetalleActionForm">

            <table width="100%">
              <tr>
                <td colspan="10">
                  <display:table  name="sessionScope.cEntidadDetalleActionForm.colOrganismosAdministradores" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
                    <display:column property="descripcionAdministradorEntOrgAdm" title="Organismo" headerClass="tableCellHeader" style="width: 300px;" />
                    <display:column property="fechaDesdeEntOrgAdm" title="Desde" headerClass="tableCellHeader" style="width: 150px;" />
                    <display:column property="fechaHastaEntOrgAdm" title="Hasta" headerClass="tableCellHeader" style="width: 150px;" />
                  </display:table>
                </td>
              </tr>
            </table>
          </logic:notEmpty>
          <logic:empty property="colOrganismosAdministradores" name="cEntidadDetalleActionForm">
            <table width="100%">
              <tr>
                <td>No existen administradores anteriores.&nbsp;</td>
              </tr>
            </table>
          </logic:empty>
           
           
           
       

</logic:equal>
  
  
    <!-- Cuando el Tipo es 1 es del Tipo Persona -->
<logic:equal property="entidadTipo" value="persona" name="cEntidadDetalleActionForm">
       <table>
          
          <tr>
            <td class="CformNombre" width="150" >Apellido:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="apellido" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Nombre:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="nombre" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Lugar de trabajo:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="lugarTrabajoDescrip" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">País:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="paisDescripcion" /></td>
          </tr>
          <tr>
            <td class="CformNombre">Provincia:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="provinciaDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Partido:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="partidoDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Localidad:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="localidadDescripcion" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Administrado por:</td>
            <td class="CformDato">
              <bean:write name="cEntidadDetalleActionForm" property="administrador" /></td>
          </tr>
          </table>
           
</logic:equal>
