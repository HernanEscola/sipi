<%@page import="ar.gov.conicet.commons.users.models.interfaces.IUsuarioObject"%>
<%@ page import= "java.util.*"%>
<%

//Obtiene la fecha actual del servidor
	 GregorianCalendar calen =  new GregorianCalendar();
   String hoy= String.valueOf(calen.get(Calendar.DATE)) + "/" +
                String.valueOf(calen.get(Calendar.MONTH)+1) + "/" +
                String.valueOf(calen.get(Calendar.YEAR)) + " " +
                String.valueOf(calen.get(Calendar.HOUR_OF_DAY)) + ":" +
		    String.valueOf(calen.get(Calendar.MINUTE)+100).substring(1);
	HttpSession sesion = request.getSession(true);
	IUsuarioObject usuario = (IUsuarioObject) sesion.getAttribute("iUsuario");
%>			
<table width="100%"  cellspacing="1" cellpadding="10" bordercolor="#FFFFFF" >
  <tr height="5">
<td></td>  </tr>
<tr>
<td>

	<table width="100%" bgcolor="#d7e2f7" border="1"  cellspacing="0" bordercolor="#d7e2f7">
	  <tr >
	<td> <%=hoy%></td>
	<td >	<div align="right">
	<%=usuario.getLastName()%>, <%=usuario.getFirstName()%>
	[<a href="./salir.jsp">Salir</a>]
	</div>
	</td></tr></table>
</td></tr></table>