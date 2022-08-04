function cambio() {
	
	var caracteristica = document.getElementById("CaracteristicaSelccionada").value;
	if (caracteristica == 1) {
		document.getElementById("CaracteristicaMecanismosIngreso").setAttribute('style', " visibility: visible ");
		document.getElementById("caracteristica2").setAttribute('style', " display: none ");
		document.getElementById("caracteristica3").setAttribute('style', " display: none ");
		document.getElementById("caracteristica4").setAttribute('style', " display: none ");
		document.getElementById("caracteristica1").setAttribute('style', " display: none ");
		document.getElementById("caracteristica5").setAttribute('style', " display: none ");
		
	} 
	else if (caracteristica == 2) {
		document.getElementById("caracteristica1").setAttribute('style', " visibility: visible ");
		document.getElementById("caracteristica2").setAttribute('style', " display: none ");
		document.getElementById("caracteristica3").setAttribute('style', " display: none ");
		document.getElementById("caracteristica4").setAttribute('style', " display: none ");
		document.getElementById("caracteristica5").setAttribute('style', " display: none ");
		document.getElementById("CaracteristicaMecanismosIngreso").setAttribute('style', " display: none");
		
	} else if (caracteristica == 3) {
		document.getElementById("caracteristica2").setAttribute('style', " visibility: visible ");
		document.getElementById("caracteristica1").setAttribute('style', " display: none ");
		document.getElementById("caracteristica3").setAttribute('style', " display: none ");
		document.getElementById("caracteristica4").setAttribute('style', " display: none ");
		document.getElementById("caracteristica5").setAttribute('style', " display: none ");
		document.getElementById("CaracteristicaMecanismosIngreso").setAttribute('style', " display: none");

	} else if (caracteristica == 4) {
		document.getElementById("caracteristica3").setAttribute('style', " visibility: visible ");
		document.getElementById("caracteristica1").setAttribute('style', " display: none ");
		document.getElementById("caracteristica2").setAttribute('style', " display: none ");
		document.getElementById("caracteristica4").setAttribute('style', " display: none ");
		document.getElementById("caracteristica5").setAttribute('style', " display: none ");
		document.getElementById("CaracteristicaMecanismosIngreso").setAttribute('style', " display: none");
		
	}else if (caracteristica == 5) {
		document.getElementById("caracteristica4").setAttribute('style', " visibility: visible ");
		document.getElementById("caracteristica1").setAttribute('style', " display: none ");
		document.getElementById("caracteristica3").setAttribute('style', " display: none ");
		document.getElementById("caracteristica2").setAttribute('style', " display: none ");
		document.getElementById("caracteristica5").setAttribute('style', " display: none ");
		document.getElementById("CaracteristicaMecanismosIngreso").setAttribute('style', " display: none");

	}else if (caracteristica = 6) {
		document.getElementById("caracteristica5").setAttribute('style', " visibility: visible ");
		document.getElementById("caracteristica1").setAttribute('style', " display: none ");
		document.getElementById("caracteristica2").setAttribute('style', " display: none ");
		document.getElementById("caracteristica3").setAttribute('style', " display: none ");
		document.getElementById("caracteristica4").setAttribute('style', " display: none ");
		document.getElementById("CaracteristicaMecanismosIngreso").setAttribute('style', " display: none");
	}

}

