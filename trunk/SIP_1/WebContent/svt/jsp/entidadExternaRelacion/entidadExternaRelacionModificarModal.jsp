<script type="text/javascript" src="./js/entidadExternaRelacion.js?<resourceVersion:version
virtualPath='/js/entidadExternaRelacion.js'/>"></script>


	<style>
	div#loadingDiv {
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
	.formularioMod{ height:250px; overflow: auto;}
  </style>

<div id="modificacionEntidadRelacion">
	<div >
		<div id="loadingDiv"></div>
		<p id="stateMsg" class="limpiable"></p>
		<html:form action="cEntidadExternaRelacionBuscarAction" method="POST"
			enctype="multipart/form-data">
			
    		<input type="hidden" name="entidadRelacionId" id="entidadRelacionId">
    		<input type="hidden" name="entidadRelacionadaId" id="entidadRelacionadaId">
    		<input type="hidden" name="tipoEntidad" id="tipoEntidad">
    		
			<div id="datos_convenio">
				<div>
					<span style="font-weight: bold;"></span> <span id="tipo"></span>
				</div>
				<div>
					<span style="font-weight: bold;"></span> <span id="uvt"></span>
				</div>
				<div>
					<span style="font-weight: bold;"></span> <span id="descripcion"></span>
				</div>
			</div>
			<hr style="width: 100%">&nbsp;
					
						<div id="autoCompletePrestadorDiv">&nbsp;
							<label for="prestador">Prestador: </label> &nbsp;<span class="dato_obligatorio">*</span>
							<span id="prestador"></span>&nbsp;
							<capplication:autoComplete tipoAutocomplete="prestador" />
						</div>
						<div id="autoCompleteBeneficiarioDiv">
							<label for="beneficiario">Beneficiario: </label> &nbsp; <span class="dato_obligatorio">*</span>
							<span id="beneficiario"></span>&nbsp;
							<capplication:autoComplete tipoAutocomplete="beneficiario" />
						</div>
						<div id="autoCompleteContraparteDiv">
							<label for="contraparte">Contraparte: </label> &nbsp;<span class="dato_obligatorio">*</span>
							<span id="contraparte"></span>&nbsp;
							<capplication:autoComplete tipoAutocomplete="contraparte" />
						</div>
			

		</html:form>
	</div>
	<div class="leyenda">
		<span class="dato_obligatorio">* Datos obligatorios</span>
	</div>

</div>