

// se debe declarar un div con id: dialogManoDeObra donde se pone el contenido, y un boton o texto q llame al diaglo con id:verManoDeObra
	function initDialogManoObra(){
		// increase the default animation speed to exaggerate the effect
		$.fx.speeds._default = 1000;
		$(function() {
			$( "#dialogManoDeObra" ).dialog({
				autoOpen: false,
				show: "blind",
				hide: "fold",
				width: "420"
			});

			$( "#verManoDeObra" ).click(function() {
				$( "#dialogManoDeObra" ).dialog( "open" );
				return false;
			});
		});
	}
