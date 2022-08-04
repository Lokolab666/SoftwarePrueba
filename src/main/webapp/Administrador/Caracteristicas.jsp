<%@page import="java.io.Console"%>
<%@page import="java.util.function.Function"%>
<%@page import="Daos.*"%>
<%@page import="Clases.*"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%!String Usuario = "";
	String Nombres = "";%>
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
<meta charset="ISO-8859-1">
<title>Caracterisitcas</title>
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
<body onload="cambio()">
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
		ArrayList<Linea_Accion> listaLineaAccion = new ArrayList<Linea_Accion>();%>



	<div class="album py-lg-5 ">
		<div class="container">
			<div class="col-xl-16">
				<nav style="-bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
					<ol class="breadcrumb" style="margin-top: 50px">
						<li class="breadcrumb-item"><a
							href="../Administrador/PaginaPrincipal.jsp">Inicio</a></li>
						<li class="breadcrumb-item active" aria-current="page">Característica</li>
					</ol>
				</nav>

				<div class="row justify-content-center">
					<div class="col-4">
						<label for="inputCaracteristica" class="col-form-label">Característica</label>

					</div>
					<div class="col-4">
						<select class="form-select" aria-label="Seleccione"
							required="required" id="CaracteristicaSelccionada"
							onchange="cambio()">
							<option selected value=0>--Seleccione--</option>
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
				</div>


				<!-- FORM CHARACTERISTIC MECANISMOS DE INGRESO -->
				<form class="needs-validation" novalidate
					id="CaracteristicaMecanismosIngreso" method="post"
					action="../Agregar/ProcesarAgregarCaracteristicaEstudiantes.jsp">
					<div class="container">
						<div class="col-xl-16">
							<div class="row justify-content-center" style="margin-top: 30px">
								<h3 style="align-items: center;">
									<kbd>Característica: Mecanismos de ingreso</kbd>
								</h3>
								<br> <br>

								<div class="col-16" style="align-content: center;">

									<a href="../Listar/ListaAspectosMecanismos.jsp"><button
											type="button" class="btn btn-warning">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-list-ol"
												viewBox="0 0 16 16">
                                                <path
													fill-rule="evenodd"
													d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                                <path
													d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                                </svg>
											Lista aspectos evaluados para Mecanismos de ingreso
										</button></a> <a href="../Listar/InformacionMecanismosIngreso.jsp"><button
											type="button" class="btn btn-warning">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-list-ol"
												viewBox="0 0 16 16">
                                                <path
													fill-rule="evenodd"
													d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                                <path
													d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                                </svg>
											Lista información registrada
										</button></a> <a href="../AspectosEvaluados/AspectoEvaluadoMecanismos.jsp"><button
											type="button" class="btn btn-warning">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor"
												class="bi bi-plus-circle-dotted" viewBox="0 0 16 16">
                                                <path
													d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                                                </svg>
											Añadir aspectos evaluados
										</button></a>

								</div>
								<br> <br>
								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Periodo</label>
									<div class="input-group mb-3">
										<select class="form-select" aria-label="Seleccione" required
											id="Periodo" name="periodoMecanismos">

											<option selected value="">Seleccione</option>
											<%
											listaperiodo = daosPeriodo.mostrarPeriodo();
											for (Object lista : listaperiodo) {
												claseperiodo = (Periodo) lista;
												idPeriodo = claseperiodo.getId_Periodo();
												periodo = claseperiodo.getPeriodo();
												out.print("<option value=" + idPeriodo + ">" + periodo + "</option>");
											}
											%>

										</select>
										<div class="invalid-feedback">¡Debe seleccionar un
											periodo!</div>
									</div>
								</div>

								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Cantidad
										de aspirantes</label>
									<div class="input-group ms-2">
										<input type="number" class="form-control" type="number"
											placeholder="Número" aria-label="Numero"
											aria-describedby="basic-addon1" value="" required min="0"
											name="aspirantesMecanismos">
										<div class="invalid-feedback">¡Debe escribir la cantidad
											de aspirantes!</div>
									</div>

								</div>

								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Cantidad
										de admitidos</label>
									<div class="input-group mb-3">
										<input type="number" class="form-control" type="number"
											placeholder="Número" aria-label="Numero"
											aria-describedby="basic-addon1" value="" required min="0"
											name="admitidosMecanismos">
										<div class="invalid-feedback">¡Debe escribir la cantidad
											de admitidos!</div>
									</div>

								</div>

							</div>
							<div class="row justify-content-center" style="margin-top: 30px">
								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Cantidad
										de matriculados</label>
									<div class="input-group mb-3">
										<input type="number" class="form-control" type="number"
											placeholder="Número" aria-label="Numero"
											aria-describedby="basic-addon1" value="" required min="0"
											name="matriculadosMecanismos">
										<div class="invalid-feedback">¡Debe escribir la cantidad
											de matriculados!</div>
									</div>

								</div>

								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Cantidad
										de estudiantes opcionales</label>
									<div class="input-group mb-3">
										<input type="number" class="form-control" type="number"
											placeholder="Número" aria-label="Numero"
											aria-describedby="basic-addon1" value="" required="required"
											id="cantidad" min="0" name="opcionalesMecanismos">
										<div class="invalid-feedback">¡Debe escribir la cantidad
											de estudiantes opcionales!</div>
									</div>
								</div>

								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Cantidad
										de opcionales matriculados</label>
									<div class="input-group mb-3">
										<input type="number" class="form-control" type="number"
											placeholder="Número" aria-label="Numero"
											aria-describedby="basic-addon1" value="" required="required"
											id="cantidad" min="0" name="opcionalesMatriculadosMecanismos">
										<div class="invalid-feedback">¡Debe escribir la cantidad
											de estudiantes opcionales matriculados!</div>
									</div>
								</div>

							</div>


							<div class="row justify-content-center" style="margin-top: 30px">
								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Cantidad
										de total admitidos</label>
									<div class="input-group mb-3">
										<input type="number" class="form-control" type="number"
											placeholder="Número" aria-label="Numero"
											aria-describedby="basic-addon1" value="" required min="0"
											name="totalAdmitidosMecanismos">
										<div class="invalid-feedback">¡Debe escribir la cantidad
											de total admitidos!</div>
									</div>

								</div>

								<div class="col-4">
									<label for="inputPeriodo" class="form-label">Nuevos
										matriculados</label>
									<div class="input-group mb-3">
										<input type="number" class="form-control" type="number"
											placeholder="Número" aria-label="Numero"
											aria-describedby="basic-addon1" value="" required="required"
											id="cantidad" min="0" name="nuevosMatriculadosMecanismos">
										<div class="invalid-feedback">¡Debe escribir la cantidad
											de estudiantes nuevos matriculados!</div>
									</div>
								</div>
							</div>

							<div class="col-4"></div>
							<br> <br> <label for="inputAnio" class="form-label">Observaciones</label>
							<div class="form-floating">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="observaciones"
									name="observacionesMecanismos" style="height: 100px"></textarea>
								<label for="floatingTextarea2">Observaciones</label>
							</div>

							<div class="row justify-content-center" style="margin-top: 30px">
								<div class="col-2">
									<nav aria-label="Page navigation">
										<ul class="pagination">

											<li class="page-item active"><a class="page-link"
												onselect="">1</a></li>
											<li class="page-item"><a class="page-link"
												href="../AspectosEvaluados/AspectoEvaluadoMecanismos.jsp">2</a></li>
											<li class="page-item"><a class="page-link"
												href="../AspectosEvaluados/AspectoEvaluadoMecanismos.jsp"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
									</nav>
								</div>
							</div>

							<br> <br>

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
					</div>
				</form>


				<!-- FORM CHARACTERISTIC NÚMERO Y CALIDAD DE ESTUDIANTES ADMITIDOS -->
				<form class="needs-validation" novalidate id="caracteristica1"
					method="post"
					action="../Agregar/ProcesarAgregarCaracteristica1.jsp">
					<div class="container">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica: Número y calidad de estudiantes
									admitidos</kbd>
							</h3>
							<div class="col-4">
								<label for="inputTipo" class="form-label">Tipo</label>
								<div class="input-group mb-3">
									<select class="form-select" aria-label="Seleccione" required
										name="tipoCalidad">
										<option selected value="">Seleccione</option>
										<option value="Academica">Académica</option>
										<option value="No academica">No académica</option>
									</select>
									<div class="invalid-feedback">¡Debe seleccionar una de
										las opciones!</div>
								</div>
							</div>
							<div class="col-4">
								<label for="inputPeriodo" class="form-label">Periodo</label>
								<div class="input-group mb-3">
									<select class="form-select" aria-label="Seleccione" required
										id="Periodo" name="periodoCalidad">

										<option selected value="">Seleccione</option>
										<%
										listaperiodo = daosPeriodo.mostrarPeriodo();
										for (Object lista : listaperiodo) {
											claseperiodo = (Periodo) lista;
											idPeriodo = claseperiodo.getId_Periodo();
											periodo = claseperiodo.getPeriodo();
											out.print("<option value=" + idPeriodo + ">" + periodo + "</option>");
										}
										%>

									</select>
									<div class="invalid-feedback">¡Debe seleccionar un
										periodo!</div>
								</div>
							</div>

							<div class="col-4">
								<label for="inputPeriodo" class="form-label">Cantidad de
									estudiantes</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Número" aria-label="Numero"
										aria-describedby="basic-addon1" value="" required>
									<div class="invalid-feedback">¡Debe escribir la cantidad
										de estudiantes!</div>
								</div>

							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputSexo" class="form-label">Sexo</label>


								<div class="form-check">
									<input class="form-check-input" type="radio" value="Masculino"
										id="flexCheckDefault" name="inlineRadioOptions"
										checked="checked"> <label class="form-check-label"
										for="inlineRadio1"> Masculino </label>
								</div>
								<div class="form-check ">
									<input class="form-check-input" type="radio" value="Masculino"
										id="flexCheckDefault" name="inlineRadioOptions"> <label
										class="form-check-label" for="inlineRadio1"> Femenino
									</label>
								</div>
							</div>

							<div class="col-4">
								<label for="inputPeriodo" class="form-label">Número de
									matriculados</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Número" aria-label="Numero"
										aria-describedby="basic-addon1" value="" required="required"
										id="cantidad">
									<div class="invalid-feedback">¡Debe escribir la cantidad
										de estudiantes matriculados!</div>
								</div>
							</div>




							<div class="col-4"></div>
							<br> <br> <label for="inputAnio" class="form-label">Observaciones</label>
							<div class="form-floating">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="observaciones"
									name="observaciones" style="height: 100px"></textarea>
								<label for="floatingTextarea2">Observaciones</label>
							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-2">
								<nav aria-label="Page navigation">
									<ul class="pagination">

										<li class="page-item active"><a class="page-link"
											onselect="">1</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoPermanencia.jsp">2</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoPermanencia.jsp"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>

						<br> <br>

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



				<!--  FORM CHARACTERISTIC PERMANENCIA Y DESERCION -->
				<form class="needs-validation" novalidate id="caracteristica2"
					action="../Agregar/ProcesarAgregarCaracteristicaPermanencia.jsp"
					method="post">
					<div class="containerCaracterCalidadPage1">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica: Permanencia y deserción estudiantil</kbd>
							</h3>
							<div class="col-16" style="align-content: center;">
								<a href="../Listar/ListaPermanenciaDesercion.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
												d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                            <path
												d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                            </svg>
										Lista información registrada
									</button></a> <a href="../Listar/AspectoEvaluadoPermanencia.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
												d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                            <path
												d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                            </svg>
										Lista aspectos evaluados caracteristica
									</button></a> <a href="../AspectosEvaluados/AspectoEvaluadoPermanencia.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-plus-circle-dotted"
											viewBox="0 0 16 16">
                                            <path
												d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                                            </svg>
										Añadir aspectos evaluados
									</button></a>
							</div>
							<div class="col-4">
								<label for="inputPeriodo" class="form-label">Periodo</label>
								<div class="input-group mb-3">
									<select class="form-select" aria-label="Seleccione" required
										id="Periodo" name="periodo">

										<option selected value="">Seleccione</option>
										<%
										listaperiodo = daosPeriodo.mostrarPeriodo();
										for (Object lista : listaperiodo) {
											claseperiodo = (Periodo) lista;
											idPeriodo = claseperiodo.getId_Periodo();
											periodo = claseperiodo.getPeriodo();
											out.print("<option value=" + idPeriodo + ">" + periodo + "</option>");
										}
										%>

									</select>
									<div class="invalid-feedback">¡Debe seleccionar un
										periodo!</div>
								</div>
							</div>

							<div class="col-4">
								<label for="inputInscritosCalidad" class="form-label">Cantidad
									hombres</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Número" aria-label="Numero"
										aria-describedby="basic-addon1" value="" required="required"
										id="hombres" name="cantidadHombres">
									<div class="invalid-feedback">¡Debe escribir la cantidad
										de hombres desertores!</div>
								</div>
							</div>

							<div class="col-4">
								<label for="inputInscritosCalidad" class="form-label">Cantidad
									mujeres</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Número" aria-label="Numero"
										aria-describedby="basic-addon1" value="" required="required"
										id="mujeres" name="cantidadMujeres">
									<div class="invalid-feedback">¡Debe escribir la cantidad
										de mujeres desertoras!</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputAdmitidosCalidad" class="form-label">Cantidad
									matriculados</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Número" aria-label="Numero"
										aria-describedby="basic-addon1" value="" required="required"
										id="matriculados" onchange="calcular()">
									<div class="invalid-feedback">¡Debe escribir la cantidad
										de estudiantes matriculados!</div>
								</div>
							</div>

							<div class="col-4">
								<label for="inputAdmitidosCalidad" class="form-label">Total
									desertores</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Numero"
										type="text" aria-describedby="basic-addon1" value=""
										required="required" id="total" disabled="disabled">
									<div class="invalid-feedback">¡Debe escribir la cantidad
										de estudiantes matriculados!</div>
								</div>
							</div>

							<div class="col-4">
								<label for="inputMatriculadosCalidad" class="form-label">Tasa
									de deserción</label>
								<div class="input-group mb-3">
									<input class="form-control" type="text" placeholder="Número"
										aria-label="Numero" aria-describedby="basic-addon1" value=""
										required="required" id="tasa" name="tasadesercion">
									<div class="invalid-feedback">¡Debe escribir la tasa de
										deserción!</div>
								</div>
							</div>

							<script type="text/javascript">
								function calcular() {
									const hombres = document
											.getElementById("hombres").value
									const mujeres = document
											.getElementById("mujeres").value
									const tasa = document
											.getElementById("tasa");
									const total = document
											.getElementById("total");
									const matriculado = document
											.getElementById("matriculados").value;
									total.value = parseFloat(hombres)
											+ parseFloat(mujeres);
									const valor = document
											.getElementById("total").value;
									tasa.value = (((parseFloat(hombres) + parseFloat(mujeres)) * 100) / matriculado)
											.toFixed(1);
								}
							</script>


							<label for="inputAnio" class="form-label">Observaciones</label>
							<div class="form-floating">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="observaciones"
									name="observaciones" style="height: 100px"></textarea>
								<label for="floatingTextarea2">Observaciones</label>
							</div>
						</div>


						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-2">
								<nav aria-label="Page navigation">
									<ul class="pagination">

										<li class="page-item active"><a class="page-link"
											onselect="">1</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoPermanencia.jsp">2</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoPermanencia.jsp"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<br> <br>
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


				<!-- FORM CHARACTERISTIC PARTICIPACION EN ACTIVIDADES DE FORMACIÓN INTEGRAL -->
				<form class="needs-validation" novalidate id="caracteristica3"
					action="../Agregar/ProcesarAgregarCaracteristica3.jsp">
					<div class="containerCaracterActividadesPage1">
						<div class="row justify-content-center" style="margin-top: 30px">
							<h3 style="align-items: center;">
								<kbd>Característica: Participación en actividades de
									formación integral</kbd>
							</h3>

							<div class="col-16" style="align-content: center;">

								<a href="../Listar/ListaAspectosActividadPoliticaSocial.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
                                                <path
												fill-rule="evenodd"
												d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                                <path
												d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                                </svg>
										Lista aspectos evaluados para actividad política social
									</button></a> <a href="../Listar/InformacionActividadSocial.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
                                                <path
												fill-rule="evenodd"
												d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                                <path
												d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                                </svg>
										Lista información registrada
									</button></a> <a
									href="../AspectosEvaluados/AspectoEvaluadoActividadPoliticaSocial.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-plus-circle-dotted"
											viewBox="0 0 16 16">
                                                <path
												d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                                                </svg>
										Añadir aspectos evaluados
									</button></a>

							</div>


							<div class="col-4">
								<label for="inputAccionActividad" class="form-label">
									Linea de Acción</label>
								<div class="input-group mb-3">
									<select name="linea" id="linea" onchange="comboDepto()"
										class="form-select">
										<%
										Linea_Accion lineaAccion = new Linea_Accion();
										DaosLineasAccion daosLineasAccion = new DaosLineasAccion();
										ArrayList ListarLinea = new ArrayList();
										ListarLinea = daosLineasAccion.mostrarLineasAccion();
										int id;
										%>

										<option value="">-Seleccione linea de accion-</option>


										<%
										for (Object listar1 : ListarLinea) {
											lineaAccion = (Linea_Accion) listar1;
											id = lineaAccion.getIdLineaAccion();
										%>
										<option value="<%=id%>"><%=lineaAccion.getNombreLineaAccion()%>
										</option>

										<%
										}
										%>
									</select>
									<div class="invalid-feedback">¡Debe seleccionar uno de
										las lineas de acción!</div>
								</div>
							</div>

							<script type="text/javascript">
								function comboDepto() {
									$.post("comboCiudad.jsp", $(
											"#caracteristica3").serialize(),
											function(data) {
												$("#Motivo").html(data);
											});
								}
							</script>


							<div class="col-4">

								<label for="inputLineaActividad" class="form-label">Motivo
									línea de acción</label>
								<div class="input-group mb-3">

									<select id="Motivo" name="motivo" class="form-select"
										aria-label="Seleccione">
										<option value="">--Seleccione-</option>


									</select>

									<div class="invalid-feedback">¡Debe seleccionar uno de
										los motivos por lineas de acción!</div>
								</div>
							</div>
							<div class="col-4">
								<label for="inputAnioActividad" class="form-label">Año</label>
								<div class="input-group mb-3">
									<select class="form-select" aria-label="Seleccione"
										required="required" name="periodo">
										<option selected value="">Periodo</option>
										<%
										listaperiodo = daosPeriodo.mostrarPeriodo();
										for (Object lista : listaperiodo) {
											claseperiodo = (Periodo) lista;
											idPeriodo = claseperiodo.getId_Periodo();
											periodo = claseperiodo.getPeriodo();
											out.print("<option value=" + idPeriodo + ">" + periodo + "</option>");
										}
										%>
									</select>
									<div class="invalid-feedback">¡Debe seleccionar uno de
										los años!</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-4">
								<label for="inputUsuariosActividad" class="form-label">Usuarios</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Número" aria-label="Numero"
										aria-describedby="basic-addon1" value="" name="usuarios"
										required="required">
									<div class="invalid-feedback">¡Debe escribir el número de
										usuarios!</div>
								</div>
							</div>
							<div class="col-4">
								<label for="inputServiciosActividad" class="form-label">Servicios</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control" type="number"
										placeholder="Número" aria-label="Numero"
										aria-describedby="basic-addon1" value="" name="servicios"
										required="required">
									<div class="invalid-feedback">¡Debe escribir el número de
										servicios!</div>
								</div>
							</div>

							<label for="inputAnio" class="form-label">Observaciones</label>
							<div class="form-floating">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="observaciones"
									name="observaciones" style="height: 100px"></textarea>
								<label for="floatingTextarea2">Observaciones</label>
							</div>
						</div>
						<br> <br>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-2">
								<nav aria-label="Page navigation">
									<ul class="pagination">

										<li class="page-item active"><a class="page-link"
											onselect="">1</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoActividadesFormacion.jsp">2</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoActividadesFormacion.jsp"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
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


				<form class="needs-validation" id="caracteristica4">
					<div class="containerReglamentoPage1">
						<div class="col-16" style="align-content: center;">
							<br>
							<header>
								<h3>Reglamento estudiantil</h3>
								<a href="../Listar/ListaAspectoReglamentoEstudiantil.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
                                                <path
												fill-rule="evenodd"
												d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                                <path
												d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                                </svg>
										Lista aspectos evaluados para reglamento estudiantil
									</button></a> <a
									href="../AspectosEvaluados/AspectoEvaluadoReglamentoEstudiantil.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-plus-circle-dotted"
											viewBox="0 0 16 16">
                                                <path
												d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                                                </svg>
										Añadir aspectos evaluadosa
									</button></a>
							</header>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-2">
								<nav aria-label="Page navigation">
									<ul class="pagination">

										<li class="page-item active"><a class="page-link"
											onselect="">1</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoReglamentoEstudiantil.jsp">2</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoReglamentoEstudiantil.jsp"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>

					</div>
				</form>

				<form class="needs-validation" id="caracteristica5"
					style="display: none">
					<div class="containerReglamentoPage1">
						<div class="col-16" style="align-content: center;">
							<br>
							<header>
								<h3>Sistema de evaluación de estudiantes</h3>
								<a href="../Listar/AspectoEvaluadoEvaluacionEstudiantil.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
                                                <path
												fill-rule="evenodd"
												d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z" />
                                                <path
												d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z" />
                                                </svg>
										Lista aspectos evaluados para evaluacion de estudiantes
									</button></a> <a
									href="../AspectosEvaluados/AspectoEvaluadoEvaluacionEstudiantil.jsp"><button
										type="button" class="btn btn-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-plus-circle-dotted"
											viewBox="0 0 16 16">
                                                <path
												d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                                                </svg>
										Añadir aspectos evaluados
									</button></a>
							</header>
						</div>
						<div class="row justify-content-center" style="margin-top: 30px">
							<div class="col-2">
								<nav aria-label="Page navigation">
									<ul class="pagination">

										<li class="page-item active"><a class="page-link"
											onselect="">1</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoReglamentoEstudiantil.jsp">2</a></li>
										<li class="page-item"><a class="page-link"
											href="../AspectosEvaluados/AspectoEvaluadoReglamentoEstudiantil.jsp"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
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
<script src="../js/form-validation.js"></script>
<script src="../js/CambioCaracteristica.js"></script>
</html>