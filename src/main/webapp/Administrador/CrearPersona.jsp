<%@page import="Daos.Daos_Usuario"%>
<%@page import="Clases.Rol"%>
<%@page import="java.util.ArrayList"%>

<!doctype html>
<html lang="en">
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
<meta charset="utf-8">

<title>Crear Usuario</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../Estilos/estilos.css" rel="stylesheet">
<link href="../assets/dist/css/bootstrap.rtl.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
</head>


<style>
body {
	background-color: #FFE700;
	background-image: url('../imagenes/fondo.png');
	background-repeat: no-repeat;
}
</style>
<body>

<%!
	int idRol;
	String nombreRol;
	
	Daos_Usuario daosUsuario = new Daos_Usuario();
	Rol rol = new Rol();
	
	ArrayList<Rol> listarol = new ArrayList<Rol>();
%>
	
	<div class="album py-lg-5 ">
		<div class="container">
			<div class="col-xl-12">
				<nav aria-label="breadcrumb" id="migadepan"
					style="-bs-breadcrumb-divider: '&gt;';">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="../Administrador/PaginaPrincipal.jsp">Inicio</a></li>
						<li class="breadcrumb-item active" aria-current="page">Crear
							Usuario</li>
					</ol>
				</nav>

				<header class="py-3 mb-4 border-bottom">
					<div class="container d-flex flex-wrap justify-items-center">
						<div class="col-12">
							<a>
								<button type="button" class="btn btn-outline-warning" disabled>
									<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
										fill="currentColor" class="bi bi-person-plus"
										viewBox="0 0 16 16"> <path
											d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
  										<path fill-rule="evenodd"
											d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
  									</svg>
									Añadir persona
								</button>
							</a> <a href="../Administrador/ListaPersonas.jsp">
								<button type="button" class="btn btn-secondary">
									<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
										fill="currentColor" class="bi bi-person-lines-fill"
										viewBox="0 0 16 16"> <path
											d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
									</svg>
									Lista de personas
								</button>
							</a> <a href="../Administrador/ListaUsuarios.jsp"><button type="button" class="btn btn-secondary">
									<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
										fill="currentColor" class="bi bi-list-stars"
										viewBox="0 0 16 16"> <path fill-rule="evenodd"
											d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
  										<path
											d="M2.242 2.194a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.277.277 0 0 0-.094.3l.173.569c.078.256-.213.462-.423.3l-.417-.324a.267.267 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.277.277 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.271.271 0 0 0 .259-.194l.162-.53zm0 4a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.277.277 0 0 0-.094.3l.173.569c.078.255-.213.462-.423.3l-.417-.324a.267.267 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.277.277 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.271.271 0 0 0 .259-.194l.162-.53zm0 4a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.277.277 0 0 0-.094.3l.173.569c.078.255-.213.462-.423.3l-.417-.324a.267.267 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.277.277 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.271.271 0 0 0 .259-.194l.162-.53z" />
									</svg>
									Lista de usuarios
								</button> </a>
						</div>
					</div>
				</header>

				<form class="needs-validation" novalidate method="post" action="../Agregar/ProcesarAgregarUsuario.jsp">
					<div class="row g-4">
						<div class="col-sm-4">
							<label for="firstName" class="form-label">Nombre</label> <input
								type="text" class="form-control" id="firstName" name="firstName"
								placeholder="Nombres" value="" required>
							<div class="invalid-feedback">¡Debe escribir el nombre!</div>
						</div>

						<div class="col-sm-4">
							<label for="lastName" class="form-label">Apellido</label> <input
								type="text" class="form-control" id="lastName" name="lastName"
								placeholder="Apellidos" value="" required>
							<div class="invalid-feedback">¡Debe escribir el apellido!</div>
						</div>

						<div class="col-sm-4">
							<label for="username" class="form-label">Correo electronico</label>
							<div class="input-group has-validation">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="Correo" value="" required>
								<div class="invalid-feedback">¡Debe ingresar un
									correo!</div>
							</div>
						</div>
						
						
						<div class="col-sm-4">
							<label for="username" class="form-label">Usuario</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="username"
									placeholder="Usuario" name="username" value="" required><span
									class="input-group-text">@uptc.edu.co</span>
								<div class="invalid-feedback">¡Debe asignar un usuario!</div>
							</div>
						</div>

						<div class="col-sm-4">
							<label for="username" class="form-label">Contraseña</label> <input
								type="password" class="form-control" id="inputPassword2"
								placeholder="Contraseña" value="" name="password" required>
							<div class="invalid-feedback">¡Debe escribir la contraseña!</div>
						</div>


						<div class="col-sm-4">
							<label for="state" class="form-label">Rol</label> <select
								class="form-select" name="rol" required>
								<option value="" id="rol" name="rol">--Rol--</option>
								<%
								
								listarol = daosUsuario.mostrarRol();
								for (Object listar : listarol) {
									rol = (Rol) listar;
								
									idRol = rol.getId_Rol();
									nombreRol = rol.getNombre_Rol();

									out.print("<option value=" + idRol + ">" + nombreRol + "</option>");
								}
								%>
							</select>
							<div class="invalid-feedback">¡Debe seleccionar un rol!</div>
						</div>

						<div class="col-8" id="botones">
							<button type="submit" class="btn btn-warning"
								style="color: #ffffff">Añadir Persona</button>
						</div>

						<div class="col-1" id="botones">
							<button type="submit" class="btn btn-danger" id="botonCancelar">Cancelar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<footer id="footer">
	<img src="../imagenes/footer.png" width="100%">
</footer>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="../js/form-validation.js"></script>


</html>
