<%@page import="Daos.*"%>
<%@page import="Clases.*"%>
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

<title>Lista Usuarios</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../Estilos/estilos.css" rel="stylesheet">
<link href="../assets/dist/css/bootstrap.rtl.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
</head>


<style>
body {
	background-color: #FFE700;
	background-image: url('../imagenes/fondo.png');
	background-repeat: no-repeat;
}
</style>
<body>

	<%!int idRol;
	String nombreRol, nombrePersona, apellidoPersona, emailPersona;

	Daos_Usuario daosUsuario = new Daos_Usuario();
	Rol rol = new Rol();
	Daos_Persona daosPersona = new Daos_Persona();
	Usuario usuario = new Usuario();

	ArrayList<Rol> listarol = new ArrayList<Rol>();
	ArrayList<Usuario> listausuarios = new ArrayList<Usuario>();%>

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
							<a href="../Administrador/CrearPersona.jsp">
								<button type="button" class="btn btn-warning">
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
							</a> <a href="../Administrador/ListaUsuarios.jsp"><button
									type="button" class="btn btn-secondary">
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

				<div class="container" style="margin-top: 10px; padding: 5px">
					<table id="tablax" class="table table-striped table-bordered"
						style="width: 100%">
						<thead>
							<tr>

								<th scope="col">Usuario</th>
								<th scope="col">Rol</th>
								<th scope="col">Nombres Usuario</th>
								<th scope="col">Modificar</th>

							</tr>
						</thead>
						<tbody>

							<%
							listausuarios = daosUsuario.mostrarUsuarios();
							for (int i = 0; i < listausuarios.size(); i++) {
								usuario = (Usuario) listausuarios.get(i);
								int id_usuario = usuario.getId_Usuario();
								String nombre_Usuario = usuario.getNombre_Usuario();
								String rol_persona = usuario.getRol();
								String nombre = usuario.getNombre_Persona();
								String apellido = usuario.getApellido_Persona();

								out.println("<tr>");
								out.println("<td>" + nombre_Usuario);
								out.println("<td>" + nombre + " " + apellido);
								out.println("<td>" + rol_persona + "</td>");
							%><td><a href="Mostrar_Modificar_Actividad.jsp?Id_Persona=<%=id_usuario%>"> <button type='button' class='btn btn-outline-warning'><i class='fa fa-pencil-square-o'></i></button></a></td>
							<%
							out.println("</tr>");
							}
							%>


						</tbody>
					</table>

				</div>

				<!-- JQUERY -->
				<script src="https://code.jquery.com/jquery-3.4.1.js"
					integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
					crossorigin="anonymous">
					
				</script>
				<!-- DATATABLES -->
				<script
					src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
					
				</script>
				<!-- BOOTSTRAP -->
				<script
					src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
					
				</script>
				<script>
					$(document)
							.ready(
									function() {
										$('#tablax')
												.DataTable(
														{
															language : {
																processing : "Tratamiento en curso...",
																search : "Ver&nbsp;:",
																lengthMenu : "Agrupar de _MENU_ items",
																info : "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
																infoEmpty : "No existen datos.",
																infoFiltered : "(filtrado de _MAX_ elementos en total)",
																infoPostFix : "",
																loadingRecords : "Cargando...",
																zeroRecords : "No se encontraron datos con tu busqueda",
																emptyTable : "No hay datos disponibles en la tabla.",
																paginate : {
																	first : "Primero",
																	previous : "Anterior",
																	next : "Siguiente",
																	last : "Ultimo"
																},
																aria : {
																	sortAscending : ": active para ordenar la columna en orden ascendente",
																	sortDescending : ": active para ordenar la columna en orden descendente"
																}
															},
															scrollY : 400,
															lengthMenu : [
																	[ 10, 30,
																			-1 ],
																	[ 10, 25,
																			"All" ] ],
														});
									});
				</script>
			</div>
		</div>
	</div>
</body>
<br>
<br>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="../js/form-validation.js"></script>


</html>
