<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
  
<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script language="JavaScript1.2" src="./js/contratante.js"></script>

<script>
	$(document).ready(function() {

		setCombosPersonaJuridicaVisibilidadInicial();
		//prepararCombosPersonaJuridica();
		if ($("#personaJuridicaClasificacionCombo").val() < 0) {
			$("#personaJuridicaClasificacionCombo").hide();
		}
	});
</script>

<br>
<h1 align="center" class="titulo">Detalle de Contratante</h1>

<html:form action="cContratanteDetalleAction.do" method="POST" enctype="multipart/form-data">
<html:hidden property="rolUsrLoggeado" />
	<capplication:isApplication application="SVT"> 
		<logic:equal value="I" property="estado" name="cContratanteActionForm">
    		 <h2 class="mensajeSuperior">El contratante fue deshabilitado para su uso por la Direcci�n de Vinculaci�n Tecnol�gica</h2>
  		</logic:equal>
	</capplication:isApplication>
	<capplication:isApplication application="SVTP,SIUVT"> 
		<logic:equal value="I" property="estado" name="cContratanteActionForm">
    		 <h2 class="mensajeSuperior">El contratante fue deshabilitado para su uso por la Direcci�n de Vinculaci�n Tecnol�gica, en caso de necesitar utilizarlo por favor envi� un correo a svt-soporte@conicet.gov.ar</h2>
  		</logic:equal>
	</capplication:isApplication>
	<logic:equal value="M" property="estado" name="cContratanteActionForm">
    		 <h2 class="mensajeSuperior">Este contratante no est� disponible para el registro, debido a que el mismo tiene datos incompletos</h2>
  		</logic:equal>

    <jsp:include page="/jsp/entidades/contratanteView.jsp">
      <jsp:param name="contratanteForm" value="cContratanteActionForm" />
      <jsp:param name="pageName" value="contratanteDetalle" />
    </jsp:include>
    
  

</html:form>
