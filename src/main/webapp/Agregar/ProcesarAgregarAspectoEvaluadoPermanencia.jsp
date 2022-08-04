<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.*"%>
<%@page import="Daos.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar aspecto</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%
	
	
	Daos_AspectoEvaluado daos_AspectoEvaluado = new Daos_AspectoEvaluado();
	Aspecto_Evaluado aspecto_Evaluado = new Aspecto_Evaluado();

	String titulo, concepto, evidencia;
	double calificacion;

	titulo = request.getParameter("titulo");
	concepto = request.getParameter("concepto");
	evidencia = request.getParameter("evidencia");
	calificacion = Double.parseDouble(request.getParameter("calificacion"));

	if (daos_AspectoEvaluado.agregarAspectoPermanencia(titulo, concepto, evidencia, calificacion)) {
	%>

	<script lang="javascript">
		Swal.fire({
			icon : 'success',
			title : 'Correcto',
			text : 'Datos registrados con exito',

			showConfirmButton : false,
			timer : 1500,

		}).then(function() {
			location.href = "../Listar/AspectoEvaluadoPermanencia.jsp";
		});
	</script>
	<%
	} else {
	%>

	<script lang="javascript">
		Swal.fire({
			icon : 'error',
			title : 'Error!!',
			text : 'Error al insertar datos',

			showConfirmButton : true,

		}).then(function() {
			location.href = "../AspectosEvaluados/AspectoEvaluadoPermanencia.jsp";
		});
	</script>
	<%
	}
	%>
</body>
</html>