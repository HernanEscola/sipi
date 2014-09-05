

function documentReady(url) {
	
	$("#nacionalidadPJId").change(function() {
		nacionalidadOnChange();
	});
	
	$("#clasificacionPJId").change(function() {
		clasificacionOnChange(url);
	});
	
	$("#tipoPJId").change(function() {
		tipoPJOnChange();
	});
	
	if ($("#nacionalidadPJId").val() > 0) {
		$("#nacionalidadPJId").change();
		
		if ($("#clasificacionPJId").val() > 0) {
			
			var pj = $("#clasificacionPJId").val();
			if ((pj < 0) || (esPersonaJuridicaComitentesMultiples(pj))) {
				$("#tipoPJId").val("-1");
				$("#tipoPJId").change();
				$("#tipoPJId").hide();
			}
			
			var tipoPJ = $("#tipoPJId").val();
			if (tipoPJ > 0) {
				$("#tipoPJId").change();
			} else {
				$("#denominacionRow").hide();
				$("#denominacion").val("");
			}
		} else {
			$("#tipoPJId").hide();
			$("#denominacionRow").hide();
			$("#denominacion").val("");
		}
	} else {
		$("#clasificacionPJId").hide();
		$("#tipoPJId").hide();
		$("#denominacionRow").hide();
		$("#denominacion").val("");
	}
}

function nacionalidadOnChange() {
	var pj = $("#nacionalidadPJId").val();
	if (esPersonaJuridicaNacional(pj)) {
		$("#clasificacionPJId").show();
	} else {
		$("#clasificacionPJId").val("-1");
		$("#clasificacionPJId").change();
		$("#clasificacionPJId").hide();
	}
}

function clasificacionOnChange(url) {
	var pj = $("#clasificacionPJId").val();
	if ((pj > 0) && (!esPersonaJuridicaComitentesMultiples(pj))) {
		cargarComboAjax("tipoPJId",
				url + '&tipoPersonaId=' + pj,
				function() {return;}
				);

		$("#denominacionRow").hide();
		$("#denominacion").val("");
	} else {
		$("#tipoPJId").val("-1");
		$("#tipoPJId").change();
		$("#tipoPJId").hide();
	}
}

function tipoPJOnChange() {
	var clasificacion = $("#clasificacionPJId").val();
	var pj = $("#tipoPJId").val();
	if ((pj > 0) && (esPersonaJuridicaEstatal(clasificacion))) {

		$("#denominacionRow").show();
	} else {
		$("#denominacionRow").hide();
		$("#denominacion").val("");
	}
}