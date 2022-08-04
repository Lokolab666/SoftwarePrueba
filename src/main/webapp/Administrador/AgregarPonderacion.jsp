<%@page import="Daos.*"%>
<%@page import="Clases.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<meta charset="ISO-8859-1">
<title>Característica</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../Estilos/estilos.css" rel="stylesheet">
<link href="../assets/dist/css/bootstrap.rtl.min.css" rel="stylesheet">
</head>
<style>
body {
	background-color: #FFE700;
	background-image: url('../imagenes/fondo.png');
	background-repeat: no-repeat;
}
</style>
<body>
	<%!int idCaracteristica, ponderacion;
	String nombreCaracteristica, nivelCaracteristica, gradoCaracteristica;
	double calificacionCaracteristica;

	Daos_Caracterisitica daos_Caracterisitica = new Daos_Caracterisitica();
	Caracteristica claseCaracteristica = new Caracteristica();

	ArrayList<Caracteristica> listaCaracteristica = new ArrayList<Caracteristica>();%>
	
	<div class="album py-lg-5 ">
		<div class="container">
			<div class="col-xl-12">
				<nav style="-bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
					<ol class="breadcrumb" style="margin-top: 50px">
						<li class="breadcrumb-item"><a
							href="../Administrador/PaginaPrincipal.jsp">Inicio</a></li>
						<li class="breadcrumb-item active" aria-current="page">Característica</li>
					</ol>
				</nav>

				<form class="needs-validation" novalidate method="post" action="../Agregar/ProcesarPonderacionCaracteristica.jsp">
					<%
					listaCaracteristica = daos_Caracterisitica
							.informacionMostrarCaracteristica(Integer.parseInt(request.getParameter("Id_Caracteristica")));
					for (int i = 0; i < listaCaracteristica.size(); i++) {
						claseCaracteristica = (Caracteristica) listaCaracteristica.get(i);
						nombreCaracteristica = claseCaracteristica.getNombre_Caracteristica();

						ponderacion = claseCaracteristica.getPonderacion_Caracteristica();
						nivelCaracteristica = claseCaracteristica.getNivel_Caracteristica();
						calificacionCaracteristica = claseCaracteristica.getCalificacion_Caracteristica();
						gradoCaracteristica = claseCaracteristica.getGrado_Cumplimiento_Caracteristica();
						idCaracteristica = claseCaracteristica.getId_caracteristica();
					}
					%>

					<div class="row g-4">
						<h3>
							Ponderación y evaluación para
							<%=nombreCaracteristica%></h3>

						<div class="col-sm-4">
							<label for="inputPeriodo" class="form-label">Nombre</label>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-describedby="basic-addon1"
									value="<%=nombreCaracteristica%>" disabled="disabled">
								<div class="invalid-feedback">¡Debe escribir la cantidad
									de estudiantes!</div>
							</div>
						</div>


						<div class="col-sm-4">
							<label for="inputPeriodo" class="form-label">Ponderación</label>
							<div class="input-group mb-3">
								<select class="form-select" aria-label="Seleccione" required
									name="ponderacion" id="ponderacion" name="ponderacionCa" onchange="nivel()">
									<option selected value="">--Seleccione--</option>
									<option value="1">1</option>
									<option value="5">5</option>
									<option value="10">10</option>
								</select>
								<div class="invalid-feedback">¡Debe seleccionar una de las
									opciones!</div>
							</div>
						</div>

						<div class="col-sm-4">
							<label for="inputPeriodo" class="form-label">Nivel</label>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-describedby="basic-addon1" 
									id="nivelCaracteristica" name="nivelCa" disabled="disabled">
								<div class="invalid-feedback">¡Debe escribir la cantidad
									de estudiantes!</div>
							</div>
						</div>

						<script type="text/javascript">
							function nivel() {
								const ponderacion = document
										.getElementById("ponderacion").value
								const nivelCaracteristica = document
										.getElementById("nivelCaracteristica")
								if (ponderacion == 1) {
									nivelCaracteristica.value = 'Bajo';
								} else if (ponderacion == 5) {
									nivelCaracteristica.value = 'Medio';
								} else if (ponderacion == 10) {
									nivelCaracteristica.value = 'Alto';
								}

							}
						</script>
						<div class="col-sm-4">
							<label for="inputPeriodo" class="form-label">Calificación</label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" min="1.0" max="5.0"
									aria-describedby="basic-addon1" value="" id="calificacion"
									onchange="nivelCumplimiento()" name="calificacionCa">
								<div class="invalid-feedback">¡Debe escribir la
									calificación del factor!</div>
							</div>
						</div>

						<script type="text/javascript">
							function nivelCumplimiento() {
								const calificacion = document
										.getElementById("calificacion").value
								const gradoCumplimiento = document
										.getElementById("gradoCumplimiento")
								if (calificacion >= 1.0 && calificacion <= 2.9) {
									gradoCumplimiento.value = 'Deficiente'
								} else if (calificacion >= 3.0
										&& calificacion <= 3.9) {
									gradoCumplimiento.value = 'Aceptable'
								} else if (calificacion >= 4.0
										&& calificacion <= 4.7) {
									gradoCumplimiento.value = 'Alto'
								} else if (calificacion >= 4.8
										&& calificacion <= 5.0) {
									gradoCumplimiento.value = 'Pleno'
								}
							}
						</script>
						<div class="col-sm-4">
							<label for="inputPeriodo" class="form-label">Grado
								cumplimiento</label>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-describedby="basic-addon1" 
									id="gradoCumplimiento" name="gradoCumplimientoCa" disabled="disabled">
								<div class="invalid-feedback">¡Debe escribir la cantidad
									de estudiantes!</div>
							</div>
						</div>
						
						<div class="col-sm-4" style="display: none;">
							<label for="inputPeriodo" class="form-label">Id caracteristica</label>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-describedby="basic-addon1" value="<%=idCaracteristica%>" 
									id="idCaracteristica" name="idCaracteristicaCa">
							</div>
						</div>
						<div class="col-8" id="botones">
							<button type="submit" class="btn btn-warning"
								style="color: #ffffff">Agregar ponderación</button>
						</div>
					</div>

				</form>
			</div>
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
<script src="../js/form-validation.js"></script>
</html>