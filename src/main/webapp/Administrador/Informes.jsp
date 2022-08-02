
<%@page import="Daos.Daos_Desercion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Deserciones"%>

<%@page import="java.io.Console"%>
<%@page import="java.util.function.Function"%>
<%@page import="Daos.*"%>
<%@page import="Clases.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%!String Usuario = "";
	String Nombres = "";
	String Rol = "";%>
<%
HttpSession SessionActiva = request.getSession();
if (SessionActiva.getAttribute("Usuario") == null) {
%>
<script type="text/javascript">
	alert("Por Favor Iniciar Sesión");
	location.href = "../index.jsp";
</script>

<%
} else {
Usuario = (String) SessionActiva.getAttribute("Usuario");
}
%>
<head>
<meta charset="UTF-8">
<title>Informes y Estadisticas</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="../Estilos/estilos.css" rel="stylesheet">
<link href="../assets/dist/css/bootstrap.rtl.min.css" rel="stylesheet">
</head>

<link
	rel="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>

<script src="https://d3js.org/d3.v4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/billboard.js/dist/billboard.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/billboard.js/dist/billboard.min.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>



<style>
body {
	background-color: #FFE700;
	background-image: url('../imagenes/fondo.png');
	background-repeat: no-repeat;
}
.container {
	width: 70%;
	margin: 15px auto;
}
h2 {
	text-align: center;
	font-family: "Verdana", sans-serif;
	font-size: 30px;
}
.estadi {
	width: 30%;
	height: 30%;
}
</style>

<body onload="cambioInforme()">
<script type="text/javascript" src="../media/js/jquery-3.6.0.min.js"></script>
        <%!int idPeriodo, idCaracteristica, idLineaAccion;
        String periodo, nombreCaracteristica, nombreLineaAccion;
        int id;
        int cantidad_Periodo;

        Daos_Periodo daosPeriodo = new Daos_Periodo();
        Periodo claseperiodo = new Periodo();

        ArrayList<Periodo> listaperiodo = new ArrayList<Periodo>();

        Daos_Caracterisitica daosCaracterisitica = new Daos_Caracterisitica();
        Caracteristica clasecaracteristica = new Caracteristica();
        ArrayList<Caracteristica> listaCaracteristicas = new ArrayList<Caracteristica>();

        DaosLineasAccion daosLineasAccion = new DaosLineasAccion();
        Linea_Accion linea_Accion = new Linea_Accion();
        ArrayList<Linea_Accion> listaLineaAccion = new ArrayList<Linea_Accion>();
	
        %>

	<jsp:include page="../Menu/MenuAdministrador.jsp" />

	<div class="container" style="margin-top: 80px">
		<nav style="-bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="../Administrador/PaginaPrincipal.jsp">Inicio</a></li>
				<li class="breadcrumb-item active" aria-current="page">Informes
					y Estadisticas</li>
			</ol>
		</nav>
	</div>


	<div class="container">
		<div class="row justify-content-center">
					
			 <div class="col-4">
                            <select class="form-select" aria-label="Seleccione"
                                    required="required" id="caracteristicaInfo"
                                    onchange="cambioInforme()">
                                <option selected value="Seleccione">--Seleccione--</option>
                                <%
                                listaCaracteristicas = daosCaracterisitica.mostrarNombreCaracteristica();

                                for (Object lista : listaCaracteristicas) {
                                        clasecaracteristica = (Caracteristica) lista;

                                        idCaracteristica = clasecaracteristica.getId_caracteristica();
                                        nombreCaracteristica = clasecaracteristica.getNombre_Caracteristica();
                                        out.print("<option value=" + idCaracteristica + ">" + nombreCaracteristica + "</option>");
                                }
                                %>
                            </select>
                            <div class="invalid-feedback">¡Debe seleccionar una de las
                                opciones!</div>
              </div>
			
			
			
			
			
			
			
			<form class="needs-validation" novalidate id="Informe1" method="post">
			<div class="container">
                            <div class="col-xl-16">
                                <div class="row justify-content-center" style="margin-top: 30px">
                                    <h3 style="align-items: center;">
                                        <kbd>Característica: Mecanismos de ingreso</kbd>
                                    </h3>
                                    <br> <br>
                               </div>
                            </div>
            </div>
			<div id="cara1">
			<div class="containerEstadistica">
				<div class="container">
					<h2>Deserciones</h2>
					<div>
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="col-xs-12 text-center">
					<h2>Perdida Cupo</h2>
				</div>

				<div id="donut-chart"></div>
			</div>


			<div class="containerInforme">
				<div class="row justify-content-center" style="margin-top: 30px">
					<div class="col-6">
						<label for="inputTipo" class="form-label">Concepto</label>
						<textarea class="form-control"
							placeholder="Escriba lo relacionado con el concepto"
							id="TextareaLecturaConcepto" style="height: 200px" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</textarea>
					</div>
					<div class="col-6">
						<label for="inputTipo" class="form-label">Evidencia</label>
						<textarea class="form-control"
							placeholder="Escriba lo relacionado con la evidencia"
							id="TextareaLecturaEvidencia" style="height: 200px" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</textarea>
					</div>
				</div>
				<div class="row justify-content-center" style="margin-top: 30px">
					<div class="col-4">
						<label for="inputCalificacion" class="form-label">Calificación</label>
						<div class="input-group mb-3">
							<input type="number" class="form-control" type="number"
								placeholder="4.1" aria-label="Numero"
								aria-describedby="basic-addon1" readonly>
						</div>
					</div>

				</div>
			</div>

			<div class="row justify-content-center" style="margin-top: 10px">
				<div class="col-0">
					<div class="d-grid gap-2 d-md-flex justify-content-md-center">
					<a href="../GeneratePDF/Caracteristica4.pdf" download="Caracteristica4.pdf">
         				<button class="btn btn-warning" type="button">Exportar Archivo</button> 
         			</a> 
					
					
					</div>
				</div>
			</div>
		
	<%
	
		Daos_Desercion daosDesercion = new Daos_Desercion();
		ArrayList cantidadHombres = daosDesercion.cantidadDesercionesHombres();
		ArrayList cantidadMujeres = daosDesercion.cantidadDesercionesMujeres();
		ArrayList label = daosDesercion.ArregloLabel2();
				
	%>

	<script lang="javascript">
		datosHombres = <%=cantidadHombres%>;
		datosMujeres = <%=cantidadMujeres%>;
		datosTotal = datosHombres.map( (item, ix) => item + datosMujeres[ix] );
		label = <%=label%>
		
		console.log(datosTotal + " Prueba");
		
		ctx = document.getElementById("myChart").getContext("2d");
		label = label;
		 myChart = new Chart(ctx, {
			type : "bar",
			data : {
				labels : label,
				datasets : [ {
					label : "Hombres",
					data : datosHombres,
					backgroundColor : "rgba(1,52,240,94)",
				}, {
					label : "Mujeres",
					data : datosMujeres,
					backgroundColor : "rgba(91,240,103,94)",
				}, {
					label : "Total",
					data : datosTotal,
					backgroundColor : "rgba(240, 226, 58, 94)",
				},
				],
			},
		});
	</script>
	
	<script lang="javascript">
		var chart = bb.generate({
			data : {
				columns : [ [ "Literal B", 9 ], [ "Literal C", 22 ],
						[ "Literal D", 5 ], [ "Literal E", 8 ], ],
				type : "donut",
				onclick : function(d, i) {
					console.log("onclick", d, i);
				},
				onover : function(d, i) {
					console.log("onover", d, i);
				},
				onout : function(d, i) {
					console.log("onout", d, i);
				},
			},
			donut : {
				title : "44",
			},
			bindto : "#donut-chart",
		});
	</script>
	</div>
			</form>


				
			<form class="needs-validation" novalidate id="Informe2" method="post">
			<div class="container">
                            <div class="col-xl-16">
                                <div class="row justify-content-center" style="margin-top: 30px">
                                    <h3 style="align-items: center;">
                                        <kbd>Característica: Número y Calidad Estudiantes Admitidos</kbd>
                                    </h3>
                                    <br> <br>
                               </div>
                            </div>
            </div>
			<div id="cara2">
			<div class="containerEstadistica">
				<div class="container">
					<h2>Deserciones</h2>
					<div>
						<canvas id="myChart2"></canvas>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="col-xs-12 text-center">
					<h2>Perdida Cupo</h2>
				</div>

				<div id="donut-chart"></div>
			</div>


			<div class="containerInforme">
				<div class="row justify-content-center" style="margin-top: 30px">
					<div class="col-6">
						<label for="inputTipo" class="form-label">Concepto</label>
						<textarea class="form-control"
							placeholder="Escriba lo relacionado con el concepto"
							id="TextareaLecturaConcepto" style="height: 200px" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</textarea>
					</div>
					<div class="col-6">
						<label for="inputTipo" class="form-label">Evidencia</label>
						<textarea class="form-control"
							placeholder="Escriba lo relacionado con la evidencia"
							id="TextareaLecturaEvidencia" style="height: 200px" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</textarea>
					</div>
				</div>
				<div class="row justify-content-center" style="margin-top: 30px">
					<div class="col-4">
						<label for="inputCalificacion" class="form-label">Calificación</label>
						<div class="input-group mb-3">
							<input type="number" class="form-control" type="number"
								placeholder="4.1" aria-label="Numero"
								aria-describedby="basic-addon1" readonly>
						</div>
					</div>

				</div>
			</div>

			<div class="row justify-content-center" style="margin-top: 10px">
				<div class="col-0">
					<div class="d-grid gap-2 d-md-flex justify-content-md-center">
					<a href="../GeneratePDF/Caracteristica5.pdf" download="Caracteristica5.pdf">
         				<button class="btn btn-warning" type="button">Exportar Archivo</button> 
         			</a> 
					
					
					</div>
				</div>
			</div>
		
	<%
	
		Daos_Desercion daosDesercion2 = new Daos_Desercion();
		ArrayList cantidadHombres2 = daosDesercion2.cantidadDesercionesHombres();
		ArrayList cantidadMujeres2 = daosDesercion2.cantidadDesercionesMujeres();
		ArrayList label2 = daosDesercion.ArregloLabel2();
				
	%>

	<script lang="javascript">
		datosHombres = <%=cantidadHombres2%>;
		datosMujeres = <%=cantidadMujeres2%>;
		datosTotal = datosHombres.map( (item, ix) => item + datosMujeres[ix] );
		label = <%=label%>
		
		console.log(datosTotal + " Prueba");
		
		ctx = document.getElementById("myChart2").getContext("2d");
		label = label;
		 myChart = new Chart(ctx, {
			type : "bar",
			data : {
				labels : label,
				datasets : [ {
					label : "Hombres",
					data : datosHombres,
					backgroundColor : "rgba(1,52,240,94)",
				}, {
					label : "Mujeres",
					data : datosMujeres,
					backgroundColor : "rgba(91,240,103,94)",
				}, {
					label : "Total",
					data : datosTotal,
					backgroundColor : "rgba(240, 226, 58, 94)",
				},
				],
			},
		});
	</script>
	
	<script lang="javascript">
		var chart = bb.generate({
			data : {
				columns : [ [ "Literal B", 9 ], [ "Literal C", 22 ],
						[ "Literal D", 5 ], [ "Literal E", 8 ], ],
				type : "donut",
				onclick : function(d, i) {
					console.log("onclick", d, i);
				},
				onover : function(d, i) {
					console.log("onover", d, i);
				},
				onout : function(d, i) {
					console.log("onout", d, i);
				},
			},
			donut : {
				title : "44",
			},
			bindto : "#donut-chart",
		});
	</script>
	</div>
			</form>

			


</div>
</div>
			
	
</body>



<footer>
	<img src="../imagenes/footer.png" width="100%">
</footer>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<footer>
        <img src="../imagenes/footer.png" width="100%">
</footer>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="../js/cambioFinal.js"></script>
</html>