<%@include file="layout/include.jsp"%>
<br>

<h1 align="center" class="titulo">Listado de Tipos de Egreso</h1>
<html:form action="cTipoEgresoBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="listado" name="cTipoEgresoBuscarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr><td>
	<table align="center">
          <thead align="center">
            <tr>
                <td class="CformNombre">Descripción&nbsp;:</td>
                <td class="CformDato"><html:text property="descripcion"/>&nbsp;
                <td class="CformNombre">Grupo Egreso&nbsp;:
                <td class="CformDato">
                <html:select disabled="false" property="grupoEgreso" >
                  <html:options collection="comboGrupoEgreso" property="value"  labelProperty="label"/>
                </html:select>&nbsp;&nbsp;
                </td>
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
           </tr>
         </thead>
         <thead>
           <tr>
  	    <td colspan="10"  align="center" class="headTabla">Resultados de la búsqueda</td>
             </tr>
              <tr>
               <td colspan="10">
                 <display:table class="" export="false" style="width:700;" name="sessionScope.cTipoEgresoBuscarActionForm.resultados" pagesize="20" requestURI="cTipoEgresoBuscarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
		   <display:column property="indice" title="#" headerClass="tableCellHeader"/>
		   <display:column property="descripcion" title="Descripción" headerClass="sortable" sortable="true" maxLength="120" style="width: 200px;"/>
                   <display:column property="grupoEgreso" title="Grupo de Egreso" headerClass="tableCellHeader" />
                  </display:table>
    		</td>
  		</tr>
               	</thead>
  		<thead><tr><td colspan="10" class="CformAreaBotones" height="30"><div align="right">
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
		<html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/>
              	</div></td></tr></thead>
         </table>
    </td></tr>
</table>
</logic:equal>
</html:form>

