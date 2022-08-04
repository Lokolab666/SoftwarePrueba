<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.*"%>
<%@page import="Daos.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar PAFI</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%
		Daos_actividadpoliticasocial daos_actividadpoliticasocial = new Daos_actividadpoliticasocial();
		Actividad_Politica_Social claseActividad_Politica_Social = new Actividad_Politica_Social();
		
		int lineaAccion, motivoLineaAccion, usuarios, servicios, periodo_idperiodo;
		
		
		motivoLineaAccion = Integer.parseInt(request.getParameter("motivo"));
		usuarios= Integer.parseInt(request.getParameter("usuarios"));
		servicios =Integer.parseInt(request.getParameter("servicios"));
		periodo_idperiodo =Integer.parseInt(request.getParameter("periodo"));
		lineaAccion = Integer.parseInt(request.getParameter("linea"));
		
		if(daos_actividadpoliticasocial.validarlinea(motivoLineaAccion)==false){
	%>
	<script lang="javascript">
		Swal.fire({
			icon : 'error',
			title : 'Error!!',
			text : 'Ya se insertaron datos para el periodo seleccionado',

			showConfirmButton : true,

		}).then(function() {
			location.href = "../Administrador/Caracteristicas.jsp";
		});
	</script>
	
	<%
		} else if( daos_actividadpoliticasocial.agregarActividadPolitica(lineaAccion, motivoLineaAccion, usuarios, servicios, periodo_idperiodo)){
	%>
	<script lang="javascript">
		Swal.fire({
			icon : 'success',
			title : 'Correcto',
			text : 'Datos registrados con exito',

			showConfirmButton : false,
			timer : 1500,

		}).then(function() {
			location.href = "../Listar/InformacionActividadSocial.jsp";
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
			location.href = "../AspectosEvaluados/AspectoEvaluadoMecanismos.jsp";
		});
	</script>
	<%
	}
	%>
</body>
</html>