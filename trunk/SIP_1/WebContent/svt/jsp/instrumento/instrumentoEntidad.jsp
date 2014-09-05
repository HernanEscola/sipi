<%@page import="conicet.apps.svt.object.instrumentoParte.EFuncionParteInstrumento"%>
<%@page import="conicet.apps.svt.object.instrumento.EEstadoInstrumento"%>
<%@page import="conicet.apps.svt.object.convenio.ETipoConvenio"%>
<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/generalScript.js"></script>


<bean:define id="tipoPantalla" value='<%= request.getParameter("tipoPantalla") %>' />
<bean:define id="form" name='<%= request.getParameter("instrumentoForm") %>' />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<bean:define id="actionPage" name="form" property="actionName" />

<logic:empty name="form" property="instrumento" >
	<bean:define id="codigo" value="" />
</logic:empty>
<logic:notEmpty name="form" property="instrumento" >
	<bean:define id="instrumento" name="form" property="instrumento" />
	<bean:define id="codigo" name="instrumento" property="codigo" />
</logic:notEmpty>

<script>

	$(document).ready(function() {
		mostrarPatente();
		$( "#tabs" ).tabs({
	    	active: getCurrentTab(),
		    activate: function (event, ui) {
		        var active = $("#tabs").tabs("option", "active");
			    var name = ($("#tabs ul>li a").eq(active).attr('href'));
	            $("#currentTab").attr('value', name.substring(1, name.length));
			} 
	    });
		ocultarBtnSgteLastTab();
	});
	
	  function quitar(tipo ,index)
		{
		  submitAction("?method=remove "+tipo+"&removeIndex="+index);
		}
	  
	  function detalle(tipo, index){
		  submitAction("?method=detalle "+tipo+"&index="+index);
	  }
	  
	  function getSelectedTabIndex() { 
		  var name = ($("#tabs ul>li a").eq($("#tabs").tabs('option', 'active')).attr('href'));
		    return $("#tabs").tabs('option', 'active');
		}
	  
	  function irTabSiguiente(){
		  $( "#tabs" ).tabs({active:getSelectedTabIndex()+1});
	 }
	
	function irTabAnterior(){
		$( "#tabs" ).tabs({active:getSelectedTabIndex()-1});
	}
	
	function ocultarBtnSgteLastTab(){
		var lastTabName = $(".ui-tabs-nav li:last").find("a").attr("href").substring(1);
		$("#"+lastTabName).find(":button[value='Siguiente']").hide();
	}
	
	function getCurrentTab() {
		  if ($("#currentTab").attr('value').length == 0)
			  return 0;
		  var tabName = $("#currentTab").attr('value');
		  return $('#tabs a[href="#'+tabName+'"]').parent().index();
	}
	
</script>

<html:hidden property="tab" styleId="currentTab"/>
<div id="tabs">

	<ul>
		<li><a href="#datos">Convenio</a></li>
		<li><a href="#partes">Intervinientes</a></li>
		<logic:equal value="true" property="mostrarPantallaCompleta" name="form">
			<li><a href="#contacto">Contacto</a></li>
			<li><a href="#participacion">Participación</a></li>
			<li><a href="#condiciones">Condiciones</a></li>
			<li><a href="#distribucion">Distribución</a></li>
			<li><a href="#pdt">PDT</a></li>
			<logic:equal value="view" name="tipoPantalla">
				<logic:notEqual value="alta" name="form" property="valueEAccion">
					<li><a href="#tramite">Tr&aacute;mite</a></li>
			    	<li><a href="#tabHojaRuta">Hoja de Ruta</a></li>
			    	<li><a href="#tabHitos">Hitos</a></li>
				</logic:notEqual>
			</logic:equal>
		</logic:equal>
	</ul>

	<logic:equal value="input" name="tipoPantalla">
	<script>
  $(document).ready(function() {

			var input = new CInputNumero(true);
			input.bind("input[id='id_monto']");//selector de jquery
			input.bind("input[id='id_monto_otra_moneda']");//selector de jquery 
			//input.bind("input[id^='porcentaje_']");
			
			var input2 = new CInputNumero(false);
			input2.bind("#id_duracion");//selector de jquery
			input2.bind("#id_numeroResolucion");//selector de jquery
			input2.bind("#numeroExpediente_id");//selector de jquery	
			input2.bind("#pctiNro_id");//selector de jquery	
			//calcularDistribucion();
		  
		  	prepararBusqueda("Prestador");
			prepararBusqueda("Contraparte");
		  	prepararBusqueda("Contratante");
		  	prepararBusqueda("Uvt");
			prepararBusqueda("Promotor");
			prepararBusqueda("ContratantePromotor");
			prepararBusqueda("Participante");
			prepararBusqueda("ContactoContratante");
		  	
		  	cambiarTipoParte();
		  	cambiarTipoAdm();
		  	cambiarTipoContacto();
		  	
		  	prepararDistribucion();
		  	mostrarPublicarWeb();
		  	mostrarObjetoDivulgacionObligatorio();
		  	mostrarFechasEjecucionObligatorio();
		  	mostrarCampoNumeroResolucionObligatorio();
		  	habilitarCamposPDT();
		  	
		  	
	
			//deshabilita el enter, y quita el foco al presionarlo
			$("input[type=text]").keypress(function(e) {
				if (e.which == 13) {
					this.blur();
					return false;
				}
			});
			
			$("#id_es_pdt").change(function(e) {
			//	mostrarObjetoDivulgacionObligatorio();
				mostrarFechasEjecucionObligatorio();
				habilitarCamposPDT();
			});
			$("#id_publicar_web").change(function(e) {
				mostrarObjetoDivulgacionObligatorio();
			});
			$("#estado_id").change(function(e) {
				
				mostrarFechasEjecucionObligatorio();
				mostrarCampoNumeroResolucionObligatorio();
				mostrarCampoParticipanteObligatorio();
			});
			$("#id_inicio_fecha").change(function(e) {
				calcularMesesDuracion();
			});
			$("#id_fin_fecha").change(function(e) {
				calcularMesesDuracion();
			});
	  });
 
  function calcularMesesDuracion(){
	  var splitDateInicio = $("#id_inicio_fecha").val().split("-");
	  var splitDateFin = $("#id_fin_fecha").val().split("-");
	  dateInicio = new Date(splitDateInicio[2],new Number(splitDateInicio[1])-1,splitDateInicio[0]);
	  dateFin = new Date(splitDateFin[2],new Number(splitDateFin[1])-1,splitDateFin[0]);
	  var months;
	  months = (dateFin.getFullYear() - dateInicio.getFullYear()) * 12;
	  months -= dateInicio.getMonth();
	  months += dateFin.getMonth()+1;
	  if (months){
		  $("#id_duracion").val(months);
	  }
  }
  
  function mostrarPatente(){
		var tipoConv = $("#tipoConvenio").val();
	
		  if(tipoConv != null  &&(  tipoConv == <%=ETipoConvenio.CONFIDENCIALIDAD.getId()%> ||  tipoConv == <%=ETipoConvenio.I_Y_D_LICENCIA.getId()%> || tipoConv == <%=ETipoConvenio.LICENCIA.getId()%> || tipoConv == <%=ETipoConvenio.CONVENIO_PARA_SOLICITUD_DE_PATENTE.getId()%>        )){
			  $("[id^=id_patente]").show();
		  }else{
			  $("[id^=id_patente]").hide().val("");
		  }
		  mostrarCampoParticipanteObligatorio();
	}
  
  function mostrarPublicarWeb(){
		var publicarWeb = $("#estado_id").val();
		  
		  if(publicarWeb != null  && publicarWeb == "<%=EEstadoInstrumento.EJE%>"){
			  $("[id^=id_publicarWeb]").show();
		  }else{
			  $("[id^=id_publicarWeb]").hide().attr('checked', false);
		  }
	}

 function mostrarObjetoDivulgacionObligatorio(){
	  //var esPdtChecked = $("#id_es_pdt").is(':checked');
	  var publicarWebChecked = $("#id_publicar_web").is(':checked');  
	  //if(esPdtChecked || publicarWebChecked){
	  if(publicarWebChecked){
		  $("[id^=id_objeto_divulgacion_obl]").show();
	  }else{
		  $("[id^=id_objeto_divulgacion_obl]").hide();
	  }
  }
  
  function mostrarCampoNumeroResolucionObligatorio(){
	  var enEjecucion = $("#estado_id").val();
	  if(enEjecucion != null  && enEjecucion == "<%=EEstadoInstrumento.EJE%>"){
		  $("[id^=id_numero_resolucion_obl]").show();
	  }else{
		  $("[id^=id_numero_resolucion_obl]").hide();
	  }
  }
  
  function mostrarFechasEjecucionObligatorio(){
	  var esPdtChecked = $("#id_es_pdt").is(':checked');
	  var enEjecucion = $("#estado_id").val();
	  if(esPdtChecked || (enEjecucion != null  && enEjecucion == "<%=EEstadoInstrumento.EJE%>")){
		  $("[id^=id_fecha_inicio_obl]").show();
		  $("[id^=id_fecha_fin_obl]").show();
	  }else{
		  $("[id^=id_fecha_inicio_obl]").hide();
		  $("[id^=id_fecha_fin_obl]").hide();
	  }
  }
  function habilitarCamposPDT(){
	  var esPdtChecked = $("#id_es_pdt").is(':checked') || $("#id_es_pdt").val() == "true" ;
	  
	  if(esPdtChecked) {
	      $('#pctiNro_id').removeAttr('disabled');
	      $('#tituloPdts').removeAttr('disabled');
	      $('#clasificacionPDT').removeAttr('disabled');
	      $('#categoriaPDT').removeAttr('disabled');
	      
	  }
	  else{
		  $("#pctiNro_id").attr('disabled', true);  
		  $("#tituloPdts").attr('disabled', true);  
		  $('#clasificacionPDT').attr('disabled', true);  
	      $('#categoriaPDT').attr('disabled', true);
	      
	  } 
	}  
  
  
  function mostrarCampoParticipanteObligatorio(){
	// llamado en el load dentro de mostrarPatente. en cambio de estado y cambo de tipo convenio
	  var enEjecucion = $("#estado_id").val();
	  var tipoConv = $("#tipoConvenio").val();
	  if(enEjecucion != null  && enEjecucion == "<%=EEstadoInstrumento.EJE%>" && 
		  tipoConv != null  && ( tipoConv == <%=ETipoConvenio.I_Y_D.getId()%> 
		  || tipoConv == <%=ETipoConvenio.I_Y_D_LICENCIA.getId()%> 
		  || tipoConv == <%=ETipoConvenio.SERVICIOS.getId()%> 
		  || tipoConv == <%=ETipoConvenio.CAPP.getId()%> 
		  || tipoConv == <%=ETipoConvenio.ASISTENCIA_TECNICA.getId()%> 
		  || tipoConv == <%=ETipoConvenio.PLATAFORMA_TECNOLOGICA.getId()%>  )){
		  $("[id^=id_participante_obl]").show();
	  }else {
		  $("[id^=id_participante_obl]").hide();
	  }
  }
  
  
  
  function prepararDistribucion(){
	  var input = new CInputNumero(true);
	   input.bind("input[id^='porcentajeComision_']");
		input.bind("input[id^='porcentajeDistribucion']");//selector de jquery
		input.bind("input[id^='importeDistribucion']");//selector de jquery
	   
	   //var saldoAD = Number($('#saldoADistribuir').val());
	   
	   /*if(saldoAD == Number(0))
		{
		   deshabilitarDistribucion(saldoAD);
		}*/
  }
  
  function redondear(number, digits)
  {
  	var x = 1;
  	for(var i=0; i<digits;i++)
  	{
  		x*=10;
  	}
  	return Math.round(number*x)/x;
  }
  
  function reCalculoComisiones() {
  	  var i = Number(0);
  	  var importe=0;
  	  var totalParcial=0;
  	  var totalComisiones=0;
  	  var totalSaldoAD=0;
  	  var precioFinal=eval($('#id_monto').attr('value'));
  	  if (precioFinal>0){
  		  var i = Number(0);
  		  $("[id^='porcentajeDistribucionComision_']").each(function() {
  		       if ($(this).attr('value') != "" ) {
  		          formatImporte($(this)[0]);
  		      
  				   if (Number($(this).attr('value'))>0){
  				       importe=Number($(this).attr('value'))*Number(precioFinal)/Number(100);
  				       $('#importeDistribucionComision_'+i).attr('value', Number(importe).toFixed(2));
  		    	  	   totalComisiones=Number(totalComisiones)+Number(importe);
  		      		   totalParcial=Number(totalParcial)+Number(importe);
  		      	   	   totalSaldoAD=Number(totalSaldoAD)+Number(importe.toFixed(2));
  				   }
  			   }
  		       i= Number(i)+Number(1); 
  		  });
  		  
  		  $("[id^='porcentajeDistribucionRetencion_']").each(function() {
  		       if ($(this).attr('value') != "" ) {
  		          formatImporte($(this)[0]);
  		       	   
  				   if (Number($(this).attr('value'))>0){
  				       importe=Number($(this).attr('value'))*Number(precioFinal)/Number(100);
  				       $('#importeDistribucionRetencion_'+i).attr('value', Number(importe).toFixed(2));
  			      	   totalComisiones=Number(totalComisiones)+Number(importe);
  			      	   totalSaldoAD=Number(totalSaldoAD)+Number(importe.toFixed(2));
  				   }
  			   }
  		       i= Number(i)+Number(1); 
  		  });
  		  $("[id^='porcentajeDistribucionRecupero_']").each(function() {
  		       if ($(this).attr('value') != "" ) {
  		          formatImporte($(this)[0]);
  		       
  				   if (Number($(this).attr('value'))>0){
  				       importe=Number($(this).attr('value'))*Number(precioFinal)/Number(100);
  				       $('#importeDistribucionRecupero_'+i).attr('value', Number(importe).toFixed(2));
  			      	   totalComisiones=Number(totalComisiones)+Number(importe);
  			      	   totalSaldoAD=Number(totalSaldoAD)+Number(importe.toFixed(2));
  				   }
  			   }
  		       i= Number(i)+Number(1); 
  		  });
  		  
  		  $("[id^='porcentajeDistribucion_']").each(function() {
  		    	      	  
  		       i= Number(i)+Number(1); 
  		  });

  		  totalSaldoAD=Number(precioFinal)-Number(totalSaldoAD.toFixed(2));
  	  }
  	
  	  var controlSaldoAD=0;
  	  if (precioFinal>0){
  		  i = Number(0);
  		   var i = Number(0);
  		  $("[id^='porcentajeDistribucionComision_']").each(function() {
  		       i= Number(i)+Number(1); 
  		  });
  		  $("[id^='porcentajeDistribucionRecupero_']").each(function() {
  		       i= Number(i)+Number(1); 
  		  });
  		  $("[id^='porcentajeDistribucionRetencion_']").each(function() {
  		       i= Number(i)+Number(1); 
  		  });
  		  
  		  totalSaldoAD = redondear(totalSaldoAD,2);
  	
  		  
  		  $("[id^='porcentajeDistribucion_']").each(function() {
  			      if ($(this).attr('value') != "" ) {
  			          formatImporte($(this)[0]);
  					  if (Number($(this).attr('value'))>0){
  						   importe=Number($(this).attr('value'))*Number(totalSaldoAD)/Number(100);
  					
  						   controlSaldoAD=Number(controlSaldoAD.toFixed(2))+Number(importe.toFixed(2));
  						   var diferencia =Number(totalSaldoAD.toFixed(2))-Number(controlSaldoAD);
  						   if (diferencia<0.01 && diferencia >(-0.01) && diferencia !=0 ){
  							   importe = Number(importe)+diferencia;
  						   }
  					       
  						   $('#importeDistribucion_'+i).attr('value', Number(importe).toFixed(2));
  				      	   totalComisiones=Number(totalComisiones)+Number(importe);
  					  }
  				   }	      	  
  			       i= Number(i)+Number(1); 
  		  });
  	  }
  	  
  	  // calculo el saldo a distribuir y luego distribuyo segun los porcentajes en pantalla
  	  $('#saldoADistribuir').attr('value', totalSaldoAD.toFixed(2));
  	  $('#totalParcialComisiones').attr('value', totalParcial.toFixed(2));
  	  $('#totalComisiones').attr('value', totalComisiones.toFixed(2));
  	  
  	  totalSaldoAD = deshabilitarDistribucion(totalSaldoAD, totalComisiones);

  	  
  	  

  	  $('#importeId').attr('value', precioFinal.toFixed(2));

  }

  function deshabilitarDistribucion(total, totalDistribuido)
  {
  	if(Number(total.toFixed(2)) <= 0)
  	{
  		var diferenciaTotalDistribuido = Number(0);
  	  
  	  $("[id^='porcentajeDistribucion_']").each(function() {
  		  	$(this).attr('readonly', 'true');
  		  	
  			 $(this).val("0.00");
  			 $(this).addClass('CformTextDisabled');
  		 });
  	  
  	  $("[id^='importeDistribucion_']").each(function() {
  		  $(this).attr('readonly', 'true');
  		  diferenciaTotalDistribuido += Number($(this).val());
  		  $(this).addClass('CformTextDisabled');
  			$(this).val("0.00");
  		 });
  	  
  	  if(diferenciaTotalDistribuido > 0)
  		{
  	 	 totalDistribuido-= diferenciaTotalDistribuido;
  	 	$('#totalComisiones').attr('value', totalDistribuido.toFixed(2));
  		}
  	  
  	  return Number (0);
  	}else{
  		// si tipo servicio es ases indiv. o iNV.en empr. debe estar bloqueado u.divisional, solo puede desbloquear productividad
  		if ($('#tipoServicio').attr('value')=="4" || $('#tipoServicio').attr('value')=="6"){
  			
  			
  			$('#porcentajeDistribucion_6').removeClass('CformTextDisabled');
  			$('#porcentajeDistribucion_6').removeClass('readonly');
  			$('#importeDistribucion_6').removeClass('CformTextDisabled');
  			$('#importeDistribucion_6').removeAttr('readonly');
  		}else{
  				$("[id^='porcentajeDistribucion_']").each(function() {
  					$(this).removeClass('CformTextDisabled');
  					$(this).removeAttr('readonly');
  					
  				 });
  				
  				$("[id^='importeDistribucion_']").each(function() {
  					
  						$(this).removeClass('CformTextDisabled');
  						$(this).removeAttr('readonly');
  					
  				 }) ;

  		}
  		return total;
  	}
  	  
  }

  /**
   * MODIFICACIONES DE IMPORTES Y PORCENTAJES EN LA PANTALLA
   */
  //recalculan importe o porcentaje desde la distribucion 
  function calcularPorcentajeDesdeImporte(obj,pos){
  	var importe=0;
  	var saldoADistribuir=eval($('#saldoADistribuir').attr('value'));
  	if (saldoADistribuir!=0){
  		formatImporte($(obj)[0]);
  		importe =obj.value;
  		importe=Number(importe)/Number(saldoADistribuir)*Number(100);
  	}

  	$('#porcentajeDistribucion_'+pos).attr('value', redondear(importe,2).toFixed(2));
  	calcularComisiones();
  	
  	//corregirPorcentaje($('#porcentajeDistribucion_'+pos));
  }
  
  
  function calcularImporteDesdePorcentaje(obj,pos){
		var importe=0;
		
		var saldoADistribuir=eval($('#saldoADistribuir').attr('value'));
		if (saldoADistribuir!=0){
			formatImporte($(obj)[0]);
			importe =obj.value;
			importe=Number(importe)*Number(saldoADistribuir)/Number(100);
		}
		$('#importeDistribucion_'+pos).attr('value', Number(importe).toFixed(2));
		calcularComisiones();
		
		//corregirImporte($('#importeDistribucion_'+pos));
	}

	// recalculan importe o porcentaje de comision de la distribucion
	function calcularPorcentajeComisionDesdeImporte(obj,pos){
		var importe=0;
		var precioFinal=eval($('#id_monto').attr('value'));
		if (precioFinal!=0){
			formatImporte($(obj)[0]);
			importe =obj.value;
			importe=Number(importe)/Number(precioFinal)*Number(100);
		}
		$('#porcentajeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
		calcularComisiones();
		//corregirPorcentaje($('#porcentajeDistribucionComision_'+pos));
		
	}

	function calcularImporteComisionDesdePorcentaje(obj,pos){
		var importe=0;
		var precioFinal=eval($('#id_monto').attr('value'));
		if (precioFinal!=0){
			formatImporte($(obj)[0]);
			importe =obj.value;
			importe=Number(importe)*Number(precioFinal)/Number(100);
		}
		$('#importeDistribucionComision_'+pos).attr('value', redondear(importe,2).toFixed(2));
		calcularComisiones();
		//corregirImporte($('#importeDistribucionComision_'+pos));
	}
	// recalculan imoprte o porcentaje recupero de la distribucion
	function calcularPorcentajeRecuperoDesdeImporte(obj,pos){
		var importe=0;
		var precioFinal=eval($('#id_monto').attr('value'));
		if (precioFinal!=0){
			formatImporte($(obj)[0]);
			importe =obj.value;
			importe=Number(importe)/Number(precioFinal)*Number(100);
		}
		$('#porcentajeDistribucionRecupero_'+pos).attr('value',redondear(importe,2).toFixed(2));
		calcularComisiones();
		
	}

	function calcularImporteRecuperoDesdePorcentaje(obj,pos){
		var importe=0;
		var precioFinal=eval($('#id_monto').attr('value'));
		if (precioFinal!=0){
			formatImporte($(obj)[0]);
			importe =obj.value;
			importe=Number(importe)*Number(precioFinal)/Number(100);
		}
		$('#importeDistribucionRecupero_'+pos).attr('value', redondear(importe,2).toFixed(2));
		calcularComisiones();
		
	}

	//recalculan imoprte o porcentaje retencion de la distribucion
	function calcularPorcentajeRetencionDesdeImporte(obj,pos){
		var importe=0;
		var precioFinal=eval($('#id_monto').attr('value'));
		if (precioFinal!=0){
			formatImporte($(obj)[0]);
			importe =obj.value;
			importe=Number(importe)/Number(precioFinal)*Number(100);
		}
		$('#porcentajeDistribucionRetencion_'+pos).attr('value',redondear(importe,2).toFixed(2));
		calcularComisiones();
		
	}

	function calcularImporteRetencionDesdePorcentaje(obj,pos){
		var importe=0;
		var precioFinal=eval($('#id_monto').attr('value'));
		if (precioFinal!=0){
			formatImporte($(obj)[0]);
			importe =obj.value;
			importe=Number(importe)*Number(precioFinal)/Number(100);
		}
		$('#importeDistribucionRetencion_'+pos).attr('value', redondear(importe,2).toFixed(2));
		calcularComisiones();
		
	}
  
 
  
  function calcularDistribucion(){
	  	reCalculoComisiones();
  }
  


  
  function cambiarTipoParte()
	{
	  var tipo = $("#tipoParte").val();
	  
	  
	  $("#btnAgregarParte").attr("disabled",true);
	  $("#"+ tipo + "Seleccionado").val("");
	  
	  if(tipo!= "-1" && tipo!= "-2"){
		  $("#btnAgregarParte").removeAttr("disabled");
	  }
	  if (tipo == 'CONI')  {
			$("#ConicetSeleccionado").attr("value", "CONICET");
			$('#autoCompleteConicet').attr("value", "CONICET");
	  }
	  
	  <%for(EFuncionParteInstrumento f: EFuncionParteInstrumento.getValuesTipoPartes()){%> 
	  if(tipo == '<%= f.getId()%>'){
		  $('#autoComplete<%= f.getDescripcionCorta().replace(" ", "")%>').show();
	  }else{
		  ocultarAutoComplete('<%= f.getDescripcionCorta().replace(" ", "")%>');
	  }
	  <%}%>
	}
  
  
  function ocultarAutoComplete(tipo){
	  $('#autoComplete'+ tipo +'').hide().val("");
	  $('#autoComplete'+ tipo + 'Descripcion').hide().val("");
  }
  
  function prepararBusqueda(tipo){

  var conicetGeneral = new ConicetGeneral();

	conicetGeneral.autocomplete({
		idInput : "autoComplete"+ tipo,
		url : '<%=actionPage%>.do?method=auto Complete '+ tipo ,
				onSelectFunction : function(item) {
					$("#"+ tipo + "Seleccionado").attr("value", item.data.id);
					$("#autoComplete"+ tipo + "Texto").text(item.data.nombre);
					intercambiar(tipo);
				},
				valueDefault : "",
				formatItem : function(item) {
					if (item.denominacion != null) {
						return item.nombre + "//" + item.denominacion;
					} else if (item.sigla != null) {
						return item.nombre + "//" + item.sigla;
					} else if (item.categoria != null && item.escalafon != null) {
						return item.nombre + " - " + item.categoria + " - " + item.escalafon;
					}
					return item.nombre;
				}

			});

			$('#autoComplete' + tipo).show().css("width", "200px")
					.autocomplete("option", "position", {
						my : "right top",
						at : "right bottom"
					});
			$('#autoComplete' + tipo + 'Descripcion').hide();
			intercambiar(tipo);

		}

		function mostrar(i, tipo) {
			$("[id^=autoComplete" + tipo + "]").hide();
		}

		function removeBy(tipo) {
			$('#' + tipo + 'Seleccionado').attr("value", "");
			$('#autoComplete' + tipo).attr("value", "");
			intercambiar(tipo);
		}

		function intercambiar(tipo) {
			var select = $('#' + tipo + 'Seleccionado').val();
			if (select != "" && select != null) {
				$('#autoComplete' + tipo).hide();
				$('#autoComplete' + tipo + 'Descripcion').show();
			} else {
				$('#autoComplete' + tipo + 'Descripcion').hide();
				$('#autoComplete' + tipo).show();
			}
		}

		function mostrarPanel(obj1, obj2) {
			document.forms[0].tab.value = obj2.id;
		return showPane(obj1, obj2);
	
	}

		
		function setearNroTramite() {
			var val = $("#añoId").val();
			if (val != "-1" && val != "-2"){
				$
						.ajax({
							url : document.forms[0].action + "?method=setear Nro Tramite",
							type : 'POST',
							dataType : "json",
							data : {
								match : val
							},
							success : function(data) {
								$("#nroTramite").text(data.value);
							}
						});
			}else{
				$("#nroTramite").text("");
			}
		}
		
		function removeArchivo()
		{
			submitAction("?method=removearchivo");
		}
		
		function subirArchivo()
		{
			submitAction("?method=uploadarchivo");
		}
		
		function cambiarTipoAdm()
		{
			var tipo = $("#tipoAdm").val(); 
			if(tipo!= "-1" && tipo!= "-2"){
				  $("#btnAgregarAdm").removeAttr("disabled");
			  }else{
				  $("#btnAgregarAdm").attr("disabled",true);
			  }
			<%for(EFuncionParteInstrumento f: EFuncionParteInstrumento.getValuesAdministradores()){%> 
			  if(tipo == '<%= f.getId()%>'){
				  $('#autoComplete<%= f.getDescripcionCorta().replace(" ", "")%>Div').show();
			  }else{
				  $('#autoComplete<%= f.getDescripcionCorta().replace(" ", "")%>Div').hide();
			  }
			  <%}%>
		}
		
		
		function cambiarTipoContacto()
		{
			var tipo = $("#tipoContacto").val(); 
			if(tipo!= "-1" && tipo!= "-2"){
				  $("#btnAgregarContacto").removeAttr("disabled");
			  }else{
				  $("#btnAgregarContacto").attr("disabled",true);
			  }
			<%for(EFuncionParteInstrumento f: EFuncionParteInstrumento.getValuesContactos()){%> 
			  if(tipo == '<%= f.getId()%>'){
				  $('#autoComplete<%= f.getDescripcionCorta().replace(" ", "")%>Div').show();
			  }else{
				  $('#autoComplete<%= f.getDescripcionCorta().replace(" ", "")%>Div').hide();
			  }
			  <%}%>
		}
		
		
	</script>

	<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_ingreso_fecha,id_inicio_fecha,id_fin_fecha" />
	
</logic:equal> 
					
<logic:equal value="view" name="tipoPantalla">
<html:hidden property="esModificable" styleId="esModificable" />

	<script>
		function descargarFile(index) {
			var accion = document.
	<%=request.getParameter("instrumentoForm")%>
		.action;
			document.
	<%=request.getParameter("instrumentoForm")%>
		.action = "cConvenioDetalleAction.do?method=descargar&descargarArchivoEvento="
					+ index;
			document.
	<%=request.getParameter("instrumentoForm")%>
		.submit();
			document.
	<%=request.getParameter("instrumentoForm")%>
		.action = accion;
		}

		function confirmarEliminarItemTramite(index) {
			msg = '¿Está seguro que desea eliminar el ítem?';
			if (window.confirm(msg)) {
				document.
	<%=request.getParameter("instrumentoForm")%>
		.action = "cConvenioDetalleAction.do?method=eliminaritemtramite&itemTramiteEliminar="
						+ index;
				document.
	<%=request.getParameter("instrumentoForm")%>
		.submit();
			}
		}

		function mostrarPatente() {
			var tienePatente = $("#tienePatente").val();
			if (tienePatente != null && tienePatente == "true") {
				$("[id^=id_patente]").show();
			} else {
				$("[id^=id_patente]").hide().val("");
			}
		}
		
	</script>
</logic:equal>

<div id="datos">
		<jsp:include page="./instrumentoDatosGeneralesTab.jsp"/>
</div>
<div id="partes">
	<jsp:include page="./instrumentoIntervinienteTab.jsp"/>
</div>
<logic:equal value="true" property="mostrarPantallaCompleta" name="form">
	<div id="participacion">
		<jsp:include page="./instrumentoParticipacionTab.jsp"></jsp:include>
	</div>
	<div id="contacto">
		<jsp:include page="./instrumentoContactoTab.jsp"/>
	</div>
	<div id="condiciones">
		<jsp:include page="./instrumentoCondicionesTab.jsp"/>
	</div>
	<div id="distribucion">
		<jsp:include page="./instrumentoDistribucionTab.jsp"/>
	</div>
	<div id="pdt">
		<jsp:include page="./instrumentoPDTTab.jsp"/>
	</div>
	<logic:equal value="view" name="tipoPantalla">
		<logic:notEqual value="alta" name="form" property="valueEAccion">
			<div id="tramite">
				<jsp:include page="./instrumentoTramiteTab.jsp"></jsp:include>
			</div>
			<div id="#tabHojaRuta">
				<jsp:include page="./instrumentoHojaRutaTab.jsp"></jsp:include>
			</div>
			<div id="#tabHitos">
				<jsp:include page="./instrumentoHitosTab.jsp"></jsp:include>
			</div>
		</logic:notEqual>
	</logic:equal>
</logic:equal>

<div align="right">
	<jsp:include page="/jsp/layout/botones.jsp">
		<jsp:param name="formulario" value='<%= request.getParameter("instrumentoForm") %>' />
		<jsp:param name="entidad" value="instrumento" />
	</jsp:include>
</div>

</div>