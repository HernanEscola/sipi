<%@include file="layout/include.jsp"%>


<html:form action="cLogAction.do" method="POST" >
        <table class="CformTableLog" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td>
	        <display:table  name="sessionScope.cLogMostrarActionForm.resultados" decorator="conicet.apps.svt.web.log.decorator.CLogDisplayWrapper" style="text-align:center; width:100%">
	         <display:column property="fecha"  title="Fecha" headerClass="tableCellHeader"  style="width: 100px;"  />
	         <display:column property="usuario"  title="Usuario" headerClass="tableCellHeader"   style="width: 300px;"  />
	         <display:column property="descripcionEstado" title="Estado" headerClass="tableCellHeader" maxLength="12" style="width: 80px;"  />
	        </display:table>
            </td>
          </tr>
        </table>

</html:form>

