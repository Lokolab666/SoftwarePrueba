<%@page import="Daos.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	background-image: url('../imagenes/fondo.png');
	background-repeat: no-repeat;
}
</style>
<body>
	
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

				
					<div class="col-12">
	
						<a href="../Administrador/Caracteristicas.jsp"><button type="button" class="btn btn-primary"
								>
								<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
									fill="currentColor" class="bi bi-person-plus-fill"
									viewBox="0 0 16 16">
	  <path
										d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
	  <path fill-rule="evenodd"
										d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
	</svg>
								Añadir característica
							</button></a> <a href="../Administrador/ListaCaracteristicas.jsp"><button type="button" class="btn btn-danger" >
								<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
									fill="currentColor" class="bi bi-person-lines-fill"
									viewBox="0 0 16 16">
	  <path
										d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
	</svg>
								Ver lista de características
							</button></a>
	
	
					</div>
				<form class="needs-validation" novalidate id="caracteristica1"
					method="post"
					action="../Agregar/ProcesarAgregarCaracteristica1.jsp">
					<div class="container">

						<div class="row justify-content-center" style="margin-top: 30px">
						<h3 style="align-content: center;">Número y calidad estudiantes admitidos</h3>
							<div class="col-6">
								<label for="floatingTextarea2">Concepto</label>
								<textarea class="form-control" placeholder="Escriba el concepto"
									id="concepto" name="concepto" style="height: 200px"></textarea>

							</div>

							<div class="col-6">
								<label for="floatingTextarea2">Evidencias</label>
								<textarea class="form-control"
									placeholder="Escriba las evidencias" id="evidencias"
									name="evidencias" style="height: 200px"></textarea>

							</div>


						</div>
						<div  style="margin-top: 30px">
							<div class="col-4">
								<label for="inputPeriodo" class="form-label">Calificación</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Calificación" aria-label="Numero"
										aria-describedby="basic-addon1" value="" required="required" min="0.0" max="5.0">
									<div class="invalid-feedback">¡Debe escribir la cantidad
										de estudiantes matriculados!</div>
								</div>
							</div>
						</div>

						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-2">
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="../Administrador/Caracteristicas.jsp"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="page-item "><a class="page-link"
											href="../Administrador/Caracteristicas.jsp">1</a></li>
										<li class="page-item active"><a class="page-link" href="#">2</a></li>
										
									</ul>
								</nav>
							</div>
						</div>

						<br>
						<br>

						<div class="row justify-content-center">
							<div class="col-2">
								<button type="submit" class="btn btn-warning"
									style="color: #ffffff">Guardar</button>
							</div>

							<div class="col-1">

								<button type="button" class="btn btn-danger" id="botonCancelar">Cancelar</button>
							</div>

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
<script src="../js/Caracteristica1.js"></script>
</html>