

<%@page import="Daos.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.function.Function"%>
<%@page import="Clases.*"%>

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
<%--Validar Menu --%>

<%
if (SessionActiva.getAttribute("Usuario") == null) {
%>
<script type="text/javascript">
	alert("Por Favor Iniciar Sesión");
	location.href = "../index.jsp";
</script>

<%
} else {

Daos_Usuario DP = new Daos_Usuario();
int Rol = DP.Rol(Usuario);
System.out.print(Rol);

if (Rol == 1) {
%>
<jsp:include page="../Menu/MenuAdministrador.jsp" />

<%
} else if (Rol == 2) {
%>
<jsp:include page="../Menu/MenuProfesor.jsp" />


<%
}
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
	String nivelCaracteristica, gradoCumplimientoCaracteristica;

	int id, ponderacion;
	double calificacionCaracteristica;
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
	ArrayList<Caracteristica> listaCaracteristica = new ArrayList<>();
	ArrayList<Caracteristica> informacionDesrcion = new ArrayList<Caracteristica>();
	Caracteristica claseCaracteristica = new Caracteristica();
	Caracteristica claseCaracteristica1 = new Caracteristica();%>

	

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
								<kbd>Característica 4: Mecanismos de ingreso</kbd>
							</h3>
							<br> <br>
						</div>
					</div>
				</div>
				<div id="cara1">
					<div class="containerEstadistica">
						<div class="container">
							<h2>Aspirantes inscritos y aspirantes admitidos</h2>
							<div>
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>

					<%
					informacionDesrcion = daosCaracterisitica.informacionDesercion(1);
					
					for (Object listaDesercion : informacionDesrcion) {
						claseCaracteristica1 = (Caracteristica) listaDesercion;

						ponderacion = claseCaracteristica1.getPonderacion_Caracteristica();
						nivelCaracteristica = claseCaracteristica1.getNivel_Caracteristica();
						calificacionCaracteristica = claseCaracteristica1.getCalificacion_Caracteristica();
						gradoCumplimientoCaracteristica = claseCaracteristica1.getGrado_Cumplimiento_Caracteristica();

					}
					%>

					<div class="containerInforme">
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputTipo" class="form-label">Ponderación</label> <input
									class="form-control" aria-label="Numero"
									aria-describedby="basic-addon1"
									value="<%=ponderacion%>" disabled="disabled"
									readonly />

							</div>
							<div class="col-4">
								<label for="inputTipo" class="form-label">Nivel</label> <input
									class="form-control" aria-label="Numero" aria-describedby="basic-addon1"
									value="<%=nivelCaracteristica%>" disabled="disabled"
									readonly />

							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Calificación</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=calificacionCaracteristica%>" readonly />
								</div>
							</div>
							
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Grado cumplimiento</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=gradoCumplimientoCaracteristica%>" readonly />
								</div>
							</div>

						</div>
					</div>

					<div class="row justify-content-center" style="margin-top: 10px">
						<div class="col-0">
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<a href="../GeneratePDF/Caracteristica4.pdf"
									download="Caracteristica4.pdf">
									<button class="btn btn-warning" type="button">Exportar
										Archivo</button>
								</a>


							</div>
						</div>
					</div>

					<%
					Daos_EstudiantesInscritos daosEstudiantesIns = new Daos_EstudiantesInscritos();
					ArrayList cantidadAspirantes = daosEstudiantesIns.cantidadAspirantes();
					ArrayList cantidadAdmitidos = daosEstudiantesIns.cantidadAdmitidos();
					ArrayList cantidadMatriculados = daosEstudiantesIns.cantidadMatriculados();
					ArrayList cantidadOpcionales = daosEstudiantesIns.cantidadOpcionales();
					ArrayList cantidadOpcionales2 = daosEstudiantesIns.cantidadOpcionales2();

					ArrayList cantidadTotal = daosEstudiantesIns.cantidadTotal();
					ArrayList cantidadNuevosMat = daosEstudiantesIns.cantidadNuevosMat();
					ArrayList label = daosEstudiantesIns.ArregloLabel();
					%>

					<script lang="javascript">
		datosAspirantes = <%=cantidadAspirantes%>;
		datosAdmitidos = <%=cantidadAdmitidos%>;
		datosMatriculados = <%=cantidadMatriculados%>;
		datosOpcionales = <%=cantidadOpcionales%>;
		datosOpcionales2 = <%=cantidadOpcionales2%>;
		datosTotal = <%=cantidadTotal%>;
		datosNuevosMat = <%=cantidadNuevosMat%>;
		
		label = <%=label%>
		
		console.log(datosTotal + " Prueba");
		
		ctx = document.getElementById("myChart").getContext("2d");
		label = label;
		 myChart = new Chart(ctx, {
			type : "bar",
			data : {
				labels : label,
				datasets : [ {
					label : "Aspirantes",
					data : datosAspirantes,
					backgroundColor : "rgba(1,52,240,94)",
				}, {
					label : "Admitidos",
					data : datosAdmitidos,
					backgroundColor : "rgba(91,240,103,94)",
				}, {
					label : "Matriculados",
					data : datosMatriculados,
					backgroundColor : "rgba(240, 226, 58, 94)",
				}, {
					label : "Opcionales",
					data : datosOpcionales,
					backgroundColor : "rgba(51, 255, 172, 94)",
				}, {
					label : "Opcionales Matriculados",
					data : datosOpcionales2,
					backgroundColor : "rgba(51, 230, 255, 94)",
				}, {
					label : "Total admitidos",
					data : datosTotal,
					backgroundColor : "rgba(131, 51, 255, 94)",
				}, {
					label : "Nuevos matriculados",
					data : datosNuevosMat,
					backgroundColor : "rgba(240, 51, 255, 94)",
				},
				
				
				],
			},
		});
	</script>

				</div>
			</form>



			<form class="needs-validation" novalidate id="Informe2" method="post">
				<div class="container">
					<div class="col-xl-16">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica 5: Número y Calidad Estudiantes
									Admitidos</kbd>
							</h3>
							<br> <br>
						</div>
					</div>
				</div>
				<%
					informacionDesrcion = daosCaracterisitica.informacionDesercion(2);
					
					for (Object listaDesercion : informacionDesrcion) {
						claseCaracteristica1 = (Caracteristica) listaDesercion;

						ponderacion = claseCaracteristica1.getPonderacion_Caracteristica();
						nivelCaracteristica = claseCaracteristica1.getNivel_Caracteristica();
						calificacionCaracteristica = claseCaracteristica1.getCalificacion_Caracteristica();
						gradoCumplimientoCaracteristica = claseCaracteristica1.getGrado_Cumplimiento_Caracteristica();

					}
					%>
				<div id="cara2">
					<div class="containerInforme">
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputTipo" class="form-label">Ponderación</label> <input
									class="form-control" aria-label="Numero"
									aria-describedby="basic-addon1"
									value="<%=ponderacion%>" disabled="disabled"
									readonly />

							</div>
							<div class="col-4">
								<label for="inputTipo" class="form-label">Nivel</label> <input
									class="form-control" aria-label="Numero" aria-describedby="basic-addon1"
									value="<%=nivelCaracteristica%>" disabled="disabled"
									readonly />

							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Calificación</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=calificacionCaracteristica%>" readonly />
								</div>
							</div>
							
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Grado cumplimiento</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=gradoCumplimientoCaracteristica%>" readonly />
								</div>
							</div>

						</div>
					</div>

					<div class="row justify-content-center" style="margin-top: 10px">
						<div class="col-0">
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<a href="../GeneratePDF/Caracteristica5.pdf"
									download="Caracteristica5.pdf">
									<button class="btn btn-warning" type="button">Exportar
										Archivo</button>
								</a>


							</div>
						</div>
					</div>

				</div>
			</form>



			<form class="needs-validation" novalidate id="Informe3" method="post">
				<div class="container">
					<div class="col-xl-16">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica 6: Permanencia y Deserción Estudiantil</kbd>
							</h3>
							<br> <br>
						</div>
					</div>
				</div>
				<%
					informacionDesrcion = daosCaracterisitica.informacionDesercion(3);
					
					for (Object listaDesercion : informacionDesrcion) {
						claseCaracteristica1 = (Caracteristica) listaDesercion;

						ponderacion = claseCaracteristica1.getPonderacion_Caracteristica();
						nivelCaracteristica = claseCaracteristica1.getNivel_Caracteristica();
						calificacionCaracteristica = claseCaracteristica1.getCalificacion_Caracteristica();
						gradoCumplimientoCaracteristica = claseCaracteristica1.getGrado_Cumplimiento_Caracteristica();

					}
					%>
				<div id="cara3">
					<div class="containerEstadistica">
						<div class="container">
							<h2>Deserciones</h2>
							<div>
								<canvas id="myChart2"></canvas>
							</div>
						</div>
					</div>

					<div class="containerEstadistica">
						<div class="container">
							<h2>Línea de Tiempo</h2>
							<div>
								<canvas id="myChartTiempo"></canvas>
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
							<div class="col-4">
								<label for="inputTipo" class="form-label">Ponderación</label> <input
									class="form-control" aria-label="Numero"
									aria-describedby="basic-addon1"
									value="<%=ponderacion%>" disabled="disabled"
									readonly />

							</div>
							<div class="col-4">
								<label for="inputTipo" class="form-label">Nivel</label> <input
									class="form-control" aria-label="Numero" aria-describedby="basic-addon1"
									value="<%=nivelCaracteristica%>" disabled="disabled"
									readonly />

							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Calificación</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=calificacionCaracteristica%>" readonly />
								</div>
							</div>
							
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Grado cumplimiento</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=gradoCumplimientoCaracteristica%>" readonly />
								</div>
							</div>

						</div>
					</div>

					<div class="row justify-content-center" style="margin-top: 10px">
						<div class="col-0">
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<a href="../GeneratePDF/Caracteristica6.pdf"
									download="Caracteristica6.pdf">
									<button class="btn btn-warning" type="button">Exportar
										Archivo</button>
								</a>


							</div>
						</div>
					</div>

					<%
					Daos_Desercion daosDesercion = new Daos_Desercion();
					ArrayList cantidadHombres = daosDesercion.cantidadDesercionesHombres();
					ArrayList cantidadMujeres = daosDesercion.cantidadDesercionesMujeres();
					ArrayList label2 = daosDesercion.ArregloLabel2();
					%>

					<script lang="javascript">
		datosHombres = <%=cantidadHombres%>;
		datosMujeres = <%=cantidadMujeres%>;
		datosTotal = datosHombres.map( (item, ix) => item + datosMujeres[ix] );
		label = <%=label2%>
		
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
		datosHombres = <%=cantidadHombres%>;
		datosMujeres = <%=cantidadMujeres%>;
		datosTotal = datosHombres.map( (item, ix) => item + datosMujeres[ix] );
		label = <%=label2%>
		
		console.log(datosTotal + " Prueba");
		
		ctx = document.getElementById("myChartTiempo").getContext("2d");
		label = label;
		 myChart = new Chart(ctx, {
			type : "line",
			data : {
				labels : label,
				datasets : [ {
					label : "Total",
					data : datosTotal,
					backgroundColor : "rgba(240, 226, 58, 94)",
				}, {
					label : "Hombres",
					data : datosHombres,
					backgroundColor : "rgba(1,52,240,94)",
				}, {
					label : "Mujeres",
					data : datosMujeres,
					backgroundColor : "rgba(91,240,103,94)",
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


			<form class="needs-validation" novalidate id="Informe4" method="post">
				<div class="container">
					<div class="col-xl-16">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica 7: Participación en Actividades de
									Formación Integral</kbd>
							</h3>
							<br> <br>
						</div>
					</div>
				</div>
				<%
					informacionDesrcion = daosCaracterisitica.informacionDesercion(4);
					
					for (Object listaDesercion : informacionDesrcion) {
						claseCaracteristica1 = (Caracteristica) listaDesercion;

						ponderacion = claseCaracteristica1.getPonderacion_Caracteristica();
						nivelCaracteristica = claseCaracteristica1.getNivel_Caracteristica();
						calificacionCaracteristica = claseCaracteristica1.getCalificacion_Caracteristica();
						gradoCumplimientoCaracteristica = claseCaracteristica1.getGrado_Cumplimiento_Caracteristica();

					}
					%>
				<div id="cara4">
					<div class="containerEstadistica">
						<div class="container">
							<h2>Actividad Politica Social con participación estudiantil</h2>
							<div>
								<canvas id="myChart4"></canvas>
							</div>
						</div>
					</div>

					<div class="containerInforme">
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputTipo" class="form-label">Ponderación</label> <input
									class="form-control" aria-label="Numero"
									aria-describedby="basic-addon1"
									value="<%=ponderacion%>" disabled="disabled"
									readonly />

							</div>
							<div class="col-4">
								<label for="inputTipo" class="form-label">Nivel</label> <input
									class="form-control" aria-label="Numero" aria-describedby="basic-addon1"
									value="<%=nivelCaracteristica%>" disabled="disabled"
									readonly />

							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Calificación</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=calificacionCaracteristica%>" readonly />
								</div>
							</div>
							
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Grado cumplimiento</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=gradoCumplimientoCaracteristica%>" readonly />
								</div>
							</div>

						</div>
					</div>

					<div class="row justify-content-center" style="margin-top: 10px">
						<div class="col-0">
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<a href="../GeneratePDF/Caracteristica7.pdf"
									download="Caracteristica7.pdf">
									<button class="btn btn-warning" type="button">Exportar
										Archivo</button>
								</a>


							</div>
						</div>
					</div>

					<%
					Daos_Desercion daosDesercion4 = new Daos_Desercion();
					ArrayList cantidadHombres4 = daosDesercion4.cantidadDesercionesHombres();
					ArrayList cantidadMujeres4 = daosDesercion4.cantidadDesercionesMujeres();
					ArrayList label4 = daosDesercion4.ArregloLabel2();
					%>

					<script lang="javascript">
		datosHombres = <%=cantidadHombres4%>;
		datosMujeres = <%=cantidadMujeres4%>;
		datosTotal = datosHombres.map( (item, ix) => item + datosMujeres[ix] );
		label = <%=label4%>
		
		console.log(datosTotal + " Prueba");
		
		ctx = document.getElementById("myChart4").getContext("2d");
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

					
				</div>
			</form>


			<form class="needs-validation" novalidate id="Informe5" method="post">
				<div class="container">
					<div class="col-xl-16">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica 8: Reglamento Estudiantil</kbd>
							</h3>
							<br> <br>
						</div>
					</div>
				</div>
				
				<%
					informacionDesrcion = daosCaracterisitica.informacionDesercion(5);
					
					for (Object listaDesercion : informacionDesrcion) {
						claseCaracteristica1 = (Caracteristica) listaDesercion;

						ponderacion = claseCaracteristica1.getPonderacion_Caracteristica();
						nivelCaracteristica = claseCaracteristica1.getNivel_Caracteristica();
						calificacionCaracteristica = claseCaracteristica1.getCalificacion_Caracteristica();
						gradoCumplimientoCaracteristica = claseCaracteristica1.getGrado_Cumplimiento_Caracteristica();

					}
					%>
					
				<div id="cara5">

					<div class="containerInforme">
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputTipo" class="form-label">Ponderación</label> <input
									class="form-control" aria-label="Numero"
									aria-describedby="basic-addon1"
									value="<%=ponderacion%>" disabled="disabled"
									readonly />

							</div>
							<div class="col-4">
								<label for="inputTipo" class="form-label">Nivel</label> <input
									class="form-control" aria-label="Numero" aria-describedby="basic-addon1"
									value="<%=nivelCaracteristica%>" disabled="disabled"
									readonly />

							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Calificación</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=calificacionCaracteristica%>" readonly />
								</div>
							</div>
							
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Grado cumplimiento</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=gradoCumplimientoCaracteristica%>" readonly />
								</div>
							</div>

						</div>
					</div>

					<div class="row justify-content-center" style="margin-top: 10px">
						<div class="col-0">
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<a href="../GeneratePDF/Caracteristica8.pdf"
									download="Caracteristica8.pdf">
									<button class="btn btn-warning" type="button">Exportar
										Archivo</button>
								</a>


							</div>
						</div>
					</div>

					<%
					Daos_Desercion daosDesercion5 = new Daos_Desercion();
					ArrayList cantidadHombres5 = daosDesercion5.cantidadDesercionesHombres();
					ArrayList cantidadMujeres5 = daosDesercion5.cantidadDesercionesMujeres();
					ArrayList label5 = daosDesercion5.ArregloLabel2();
					%>

					<script lang="javascript">
		datosHombres = <%=cantidadHombres5%>;
		datosMujeres = <%=cantidadMujeres5%>;
		datosTotal = datosHombres.map( (item, ix) => item + datosMujeres[ix] );
		label = <%=label5%>
		
		console.log(datosTotal + " Prueba");
		
		ctx = document.getElementById("myChart5").getContext("2d");
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

				</div>
			</form>


			<form class="needs-validation" novalidate id="Informe6" method="post">
				<div class="container">
					<div class="col-xl-16">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica 9: Sistema de Evaluación de
									Estudiantes</kbd>
							</h3>
							<br> <br>
						</div>
					</div>
				</div>
				
				<%
					informacionDesrcion = daosCaracterisitica.informacionDesercion(6);
					
					for (Object listaDesercion : informacionDesrcion) {
						claseCaracteristica1 = (Caracteristica) listaDesercion;

						ponderacion = claseCaracteristica1.getPonderacion_Caracteristica();
						nivelCaracteristica = claseCaracteristica1.getNivel_Caracteristica();
						calificacionCaracteristica = claseCaracteristica1.getCalificacion_Caracteristica();
						gradoCumplimientoCaracteristica = claseCaracteristica1.getGrado_Cumplimiento_Caracteristica();

					}
					%>
				<div id="cara6">

					<div class="containerInforme">
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputTipo" class="form-label">Ponderación</label> <input
									class="form-control" aria-label="Numero"
									aria-describedby="basic-addon1"
									value="<%=ponderacion%>" disabled="disabled"
									readonly />

							</div>
							<div class="col-4">
								<label for="inputTipo" class="form-label">Nivel</label> <input
									class="form-control" aria-label="Numero" aria-describedby="basic-addon1"
									value="<%=nivelCaracteristica%>" disabled="disabled"
									readonly />

							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Calificación</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=calificacionCaracteristica%>" readonly />
								</div>
							</div>
							
							<div class="col-4">
								<label for="inputCalificacion" class="form-label">Grado cumplimiento</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										aria-describedby="basic-addon1" disabled="disabled" value="<%=gradoCumplimientoCaracteristica%>" readonly />
								</div>
							</div>

						</div>
					</div>

					<div class="row justify-content-center" style="margin-top: 10px">
						<div class="col-0">
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<a href="../GeneratePDF/Caracteristica9.pdf"
									download="Caracteristica9.pdf">
									<button class="btn btn-warning" type="button">Exportar
										Archivo</button>
								</a>


							</div>
						</div>
					</div>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="../js/cambioFinal.js"></script>
</html>