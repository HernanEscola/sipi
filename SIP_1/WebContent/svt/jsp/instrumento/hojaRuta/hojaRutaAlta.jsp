<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/conicet-application-tags.tld" prefix="capplication" %>
<%@ taglib uri="/WEB-INF/conicet-applicationNew-tags.tld" prefix="capplicationNew" %>
<%@ taglib uri="http://www.conicet.gov.ar/tags/resources" prefix="resourceVersion" %>
<script type="text/javascript" src="./js/hojaRuta.js?<resourceVersion:version
virtualPath='/js/hojaRuta.js'/>"></script>
<script type="text/javascript" src="./js/seguimiento.js?<resourceVersion:version
virtualPath='/js/seguimiento.js'/>"></script>
<script type="text/javascript" src="./js/autoresize/jquery.autosize.min.js?<resourceVersion:version
virtualPath='/js/autoresize/jquery.autosize.min.js'/>"></script>


  <style>    
    #altaHojaRuta body { font-size: 62.5%; }
    #altaHojaRuta label, #altaHojaRuta input { display:block; }
    #altaHojaRuta input.text { margin-bottom:12px; width:95%; padding: .4em; }
    #altaHojaRuta  fieldset { padding:0; border:0; margin-top:25px; }
    #altaHojaRuta h1 { font-size: 1.2em; margin: .6em 0; }
    #altaHojaRuta  div#users-contain { width: 350px; margin: 20px 0; }
    #altaHojaRuta  div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    #altaHojaRuta  div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }  
    .ui-state-success{border: 1px solid green; background: #E5FCED 50% 50% repeat-x;color: green;padding: .3em;}
    #alta_message, #baja_message { font-weight:bold;}
    #altaHojaRuta .ui-widget-header {border: 1px solid #4297d7!important;background-color: #4297d7!important;}
    *.ui-dialog *.ui-dialog-title {*float:none; *margin-left:10px;}         
    .formularioAlta{ height:282px; overflow: auto;}
    #datos_convenio{margin-top: 12px;margin-bottom: 20px; font-size:11px}    
    
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
<div id="altaHojaRuta">
 <div class="formularioAlta" style="height:330px;">
 <div class="loadingDiv"></div>
 <p id="alta_message" class="limpiable"></p>   
<html:form action="cHojaRutaAltaAction.do" method="POST" enctype="multipart/form-data">
   <div id="datos_convenio">    
   	   <div><span style="font-weight:bold;"></span> <span id="codigoProyecto"></span></div>	
	   <div><span style="font-weight:bold;"></span> <span id="expedienteNumero"></span></div>
	   <div><span style="font-weight:bold;"></span> <span id="resoluciones"></span> </div>
	   <div> <span style="font-weight:bold;"></span> <span id="contratante"></span> </div> 
   </div>   
   <hr style="width:100%">
  
    <label for="fecha">Fecha: <span class="dato_obligatorio">*</span></label>
    <input type="hidden" name="convenioId" id="convenioId">    
    <html:text property="fecha" maxlength="20" styleClass="limpiable" styleId="fechaHojaRuta" size="20" tabindex="-1"/>
    <label for="descripcionCorta">Descripción Corta: <span class="dato_obligatorio">*</span></label>    
    <html:text styleId="descripcionCorta" styleClass="limpiable"  property="descripcionCorta" maxlength="50" size="50"/>
    <label for="descripcion">Descripción:</label>
 	 <html:textarea styleId="descripcion" styleClass="limpiable"  property="descripcion" />
    <label for="file">Archivo: </label>
	<div id="fileUpload"><html:file property="file" styleClass="limpiable" styleId="file" size="40" /></div>
	<div id="fileNameDiv"><html:text styleId="fileName" disabled="true" styleClass="limpiable"  property="fileName"  size="30"/>  <a style="color:red;" class="el-icon-remove" id="quitarFile" href="#"></a></div>
</html:form>
</div>
<div class="leyenda"><span class="dato_obligatorio">* Datos obligatorios.</span></div>

</div>


<div id="deleteHojaRutaConfirm" title="Eliminar hoja de ruta?" style="display: none;">
	<div id="hoja_ruta_data" style="font-size: 11px;" > 
	</div>
	<hr style="width:100%">
	<p id="baja_message"></p> 	  
</div>


     
 
     

  
     
    
 
    