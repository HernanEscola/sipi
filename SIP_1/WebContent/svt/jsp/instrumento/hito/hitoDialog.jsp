<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/conicet-application-tags.tld" prefix="capplication" %>
<%@ taglib uri="/WEB-INF/conicet-applicationNew-tags.tld" prefix="capplicationNew" %>
<%@ taglib uri="http://www.conicet.gov.ar/tags/resources" prefix="resourceVersion" %>
<script type="text/javascript" src="./js/hitoDialog.js?<resourceVersion:version virtualPath='/js/hitoDialog.js'/>"></script>
<script type="text/javascript" src="./js/seguimiento.js?<resourceVersion:version
virtualPath='/js/seguimiento.js'/>"></script>

  <style>    
    .hitoDialog body { font-size: 62.5%; }
    .hitodialog hr { width:100%; margin:10px 0 10px 0; }
    .hitoDialog label, .hitoDialog input { display:block; margin-top: 5px; }
    .hitoDialog div.row_div { display:block; }
    .row_div .label { display:inline; float:left; font-weight: bold; padding-right: 0.4em;}
    .hitoDialog input.text { margin-bottom:12px; width:95%; padding: .4em; }
    .hitoDialog  fieldset { padding:0; border:0; margin-top:25px; }
    .hitoDialog h1 { font-size: 1.2em; margin: .6em 0; }
    .hitoDialog  div#users-contain { width: 350px; margin: 20px 0; }
    .hitoDialog  div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    .hitoDialog  div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }  
    .ui-state-success{border: 1px solid green; background: #E5FCED 50% 50% repeat-x;color: green;padding: .3em;}
    #hito_realizado_message, #hito_baja_message { font-weight:bold;}
    .hitoDialog .ui-widget-header {border: 1px solid #4297d7!important;background-color: #4297d7!important;}
    *.ui-dialog *.ui-dialog-title {*float:none; *margin-left:10px;}         
    .formularioAlta{ height:282px; overflow: auto;}
    #datos_convenio{margin-top: 12px;margin-bottom: 20px; font-size:11px}
    .hito_data {font-size: 11px;}
	div.loadingDiv {
	    display: none;
	    width:100px;
	    height: 100px;
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    background:url(images/loading.gif) no-repeat center ;
	    text-align:center;
	    padding:10px;
	    font:normal 16px Tahoma, Geneva, sans-serif;
	    margin-left: -50px;
	    margin-top: -50px;
	    z-index:2;
	    overflow: auto;
	}    
  </style>

<!--[if IE  ]> <input type="hidden" id="ie" value="true"> <![endif]-->
<div id="hitoDialog" class="hitoDialog">
 <div class="formularioAlta">
 <div class="loadingDiv"></div> 
 <p id="hito_realizado_message" class="limpiable"></p>   
<html:form action="cHitoAction.do" method="POST">
   <div class="hito_data">
   		<div class="row_div">
			<div class="label">N° Proyecto: </div>
			<div class="hito_dialog_codigo_instrumento"></div>
		</div>
		<div class="row_div">
			<div class="label">Fecha: </div>
			<div class="hito_dialog_fecha"></div>
		</div>
		<div class="row_div">
			<div class="label">Descripción: </div>
			<div class="hito_dialog_descripcionCorta"></div>
		</div>
	</div>  
   <hr>
  
    <label for="fechaCumplimientoHito">Fecha de cumplimiento: <span class="dato_obligatorio">*</span></label>
    <html:text property="fecha" maxlength="20" styleClass="limpiable" styleId="fechaCumplimientoHito" size="20" tabindex="-1"/>
    <label for="observacionRealizacion">Observación: <span class="dato_obligatorio">*</span></label>    
    <html:textarea styleId="observacionRealizacion" styleClass="limpiable"  property="observacionRealizacion" />
    <label for="impactaHojaRuta" style="display:inline; float:left;">Impacta en Hoja de Ruta:</label>
 	<html:checkbox styleId="impactaHojaRuta" styleClass="limpiable" property="impactaHojaRuta" style="display:inline; float:left;" />
</html:form>
</div>
<div class="leyenda"><span class="dato_obligatorio">* Datos obligatorios</span></div>

</div>


<div id="deleteHitoConfirm"  class="hitoDialog" title="Eliminar hito?">
	<div class="hito_data">
		<div class="row_div">
			<div class="label">N° Proyecto: </div>
			<div class="hito_dialog_codigo_instrumento"></div>
		</div>
		<div class="row_div">
			<div class="label">Fecha: </div>
			<div class="hito_dialog_fecha"></div>
		</div>
		<div class="row_div">
			<div class="label">Descripción: </div>
			<div class="hito_dialog_descripcionCorta"></div>
		</div>
		<div class="row_div">
			<div class="label">Actor: </div>
			<div class="hito_dialog_actor"></div>
		</div>
	</div>
	<hr>
	<p id="hito_baja_message" class="limpiable"></p> 	
</div>


<div id="marcarVisto" class="hitoDialog">
 <div class="formularioAlta">
 <div class="loadingDiv"></div> 
 <p id="hito_visto_message" class="limpiable"></p>   
<html:form action="cHitoAction.do" method="POST">
   <div id="hito_data">
   		<div class="row_div">
			<div class="label">N° Proyecto: </div>
			<div class="hito_dialog_codigo_instrumento"></div>
		</div>
		<div class="row_div">
			<div class="label">Fecha: </div>
			<div class="hito_dialog_fecha"></div>
		</div>
		<div class="row_div">
			<div class="label">Descripción: </div>
			<div class="hito_dialog_descripcionCorta"></div>
		</div>
	</div>  
   <hr>
          
    <label for="observacionVisto">Observación:</label>    
    <html:textarea styleId="observacionVisto"  styleClass="limpiable" rows="5" property="observacionVisto" />
    <label for="impactaHojaRuta" style="display:inline; float:left;">Impacta en Hoja de Ruta:</label>
 	<html:checkbox styleId="impactaHojaRutaVisto" styleClass="limpiable" property="impactaHojaRutaVisto" style="display:inline; float:left;" />
</html:form>
</div>
<div class="leyenda"><span class="dato_obligatorio">* Datos obligatorios</span></div>

</div>
