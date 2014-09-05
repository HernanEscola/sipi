

// se debe declarar un div con id: dialogDetalleComisionContraparte donde se pone el contenido, y un boton o texto q llame al diaglo con id:verDetalleComisionContraparte
	function initDialogDetalleComisionContraparte(){
		// increase the default animation speed to exaggerate the effect
		$.fx.speeds._default = 1000;
		$(function() {
			$( "#dialogDetalleComisionContraparte" ).dialog({
				autoOpen: false,
				show: "blind",
				hide: "fold",
				width: "420"
			});

		/*	$( "#verDetalleComisionContraparte" ).click(function() {
				$( "#dialogDetalleComisionContraparte" ).dialog( "open" );
				return false;
			});*/
		});
	}
