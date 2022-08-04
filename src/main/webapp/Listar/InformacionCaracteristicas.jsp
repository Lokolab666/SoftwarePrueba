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

<title>Aspectos evaluados mecanismos de ingres</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../Estilos/estilos.css" rel="stylesheet">
<link href="../assets/dist/css/bootstrap.rtl.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<!-- BOOTSTRAP -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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



					
				</header>

				<div class="container" style="margin-top: 10px; padding: 5px">
					<table id="tablax" class="table table-striped " style="width: 100%">


						<thead>
							<tr>

								<th scope="col">Nombre</th>
								<th scope="col">Ponderación</th>
								<th scope="col">Nivel caracteristica</th>
								<th scope="col">Calificacion caracteristica</th>
								<th scope="col">Grado cumplimiento caracteristica</th>
								<th scope="col">Agregar ponderación</th>
							</tr>
						</thead>
						<tbody>

							<%
							listaCaracteristica = daos_Caracterisitica.informacionMostrar();
							for (int i = 0; i < listaCaracteristica.size(); i++) {
								claseCaracteristica = (Caracteristica) listaCaracteristica.get(i);
								nombreCaracteristica = claseCaracteristica.getNombre_Caracteristica();
								
								ponderacion = claseCaracteristica.getPonderacion_Caracteristica();
								nivelCaracteristica = claseCaracteristica.getNivel_Caracteristica();
								calificacionCaracteristica = claseCaracteristica.getCalificacion_Caracteristica();
								gradoCaracteristica = claseCaracteristica.getGrado_Cumplimiento_Caracteristica();
								int idCaracteristica = claseCaracteristica.getId_caracteristica();
								
								if(nivelCaracteristica==null){
									nivelCaracteristica="No asiganado";
								}
								if(gradoCaracteristica==null){
									gradoCaracteristica="No asiganado";
								}
								
								out.println("<tr>");
								out.println("<td>" + nombreCaracteristica);
								out.println("<td>" + ponderacion);
								out.println("<td>" + nivelCaracteristica);
								out.println("<td>" + calificacionCaracteristica);
								out.println("<td>" + gradoCaracteristica + "</td>");
							%>

							<td><a href="../Administrador/AgregarPonderacion.jsp?Id_Caracteristica=<%=idCaracteristica%>">
							<button type='button' class='btn btn-outline-warning'
									data-bs-toggle='modal' data-bs-target='#exampleModal'
									data-bs-whatever='@mdo'>
									<i class='fa fa-pencil-square-o'></i>
								</button>
							</a>

								
							</td>
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


</html>
