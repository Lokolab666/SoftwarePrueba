<%@page import="Daos.*"%>
<!doctype html>
<html lang="en">
    <%!
      String Usuario = "";
      String Nombres = "";
      String Rol = "";
    %>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <title>Inicio</title>
        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="../Estilos/estilos.css" rel="stylesheet">
        <link href="../assets/dist/css/bootstrap.rtl.min.css" rel="stylesheet">
    </head>


    <style>
        body{
            background-color: #FFE700;
            background-image: url('../imagenes/fondo.png');
            background-repeat: no-repeat;
        }

    </style>
    <body>
      

        <main>

            <div class="album py-5 ">
                <div class="container" style="margin-top: 34px">

                    <br>
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="../imagenes/login_Permanencia.png">
                                <div>
                                    <h3>Características</h3>
                                    <small class="text-muted">Formularios</small>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">Diligenciar los respectivos formularios por estadísticas.</p>
                                    <a href="../Administrador/Caracteristicas.jsp"><button type="button" class="btn btn-secondary">Ingresar</button></a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="../imagenes/login_Calidad.png">
                                <h3>Informes y Estadísticas</h3>
                                <small class="text-muted">Reportes</small>
                                <div class="card-body">
                                    <p class="card-text">Generar informes o estadísticas en base a la característica.</p>          
                                    <a href="../Administrador/Informes.jsp"><button type="button" class="btn btn-secondary">Ver Informes</button></a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="../imagenes/login_Reglamento.png">
                                <h3>Gestión Usuarios</h3>
                                <small class="text-muted">Administrar usuarios</small>
                                <div class="card-body">
                                    <p class="card-text">Crear, visualizar, editar y/o eliminar usuarios del sistema</p>
                                    <a href="../Administrador/CrearUsuario.jsp"><button type="button" class="btn btn-secondary">Usuarios</button></a>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </main>


        <!-- JavaScript Bundle with Popper -->
    </body>
    <footer>
        <img src="../imagenes/footer.png" width="100%">
    </footer>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</html>
