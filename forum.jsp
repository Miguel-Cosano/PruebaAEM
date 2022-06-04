<%@ page import="es.uma.eam.entities.ForumEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="es.uma.eam.entities.UserEntity" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Collections" %>
<html lang="es">
<%@ page pageEncoding="UTF-8" %>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/forum.css" />
    <title>EAMforum</title>
</head>

<body>
<!-- Button trigger modal -->



    <%

    List<ForumEntity> temas = (List)request.getAttribute("temas");
    UserEntity usuario = (UserEntity)session.getAttribute("usuario");
    Integer alerta = (Integer)session.getAttribute("alertaTema");
    session.removeAttribute("alertaTema");



    %>

    <div class="mainForo">
        <div class="container">



            <!--Header-->
            <header>
                <div class="container-fluid">
                    <nav class="navbar  navbar-expand-lg navbar-dark p-md-3">
                        <div class="container" style="padding-top: 20px">
                            <a class="navbar-brand" href="/">EAM</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarNav">
                                <div class="mx-auto"></div>
                                <ul class="navbar-nav" style="display: flex;align-items: center">
                                    <li class="nav-item">
                                        <a class="nav-link text-white" href="/news/noticias">Noticias</a>
                                    </li>
                                    <li class="nav-item">
                                        <div class="dropdown">
                                            <a class="nav-link text-white dropdown-toggle " href="#" role="button"
                                               id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Historia Espacial
                                            </a>

                                            <div class="dropdown-menu drop" aria-labelledby="dropdownMenuLink">
                                                <a class="dropdown-item nav-link-2" href="/history/universe">Universo</a>
                                                <a class="dropdown-item nav-link-2" href="/history/space-race">Historia espacial 2</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white marcar" href="/foro/">Foro</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white" href="/curiosities">Curiosidades</a>
                                    </li>
                                    <li class="nav-item">
                                        <%if (usuario == null) {  %>
                                        <a class="nav-link text-white" href="/login">Iniciar Sesion</a>
                                        <%}else{%>

                                        <div class="dropdown">
                                            <a class="nav-link text-white dropdown-toggle " href="#" role="button"
                                               id="dropdownMenuLink-2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <%if(usuario.getFotoPerfil() == null){ %>
                                                <img src="img/avatar.png" width="30x">
                                                <%}else{%>
                                                <img src="<%= usuario.getFotoPerfil() %>" width="30x" style="border-radius: 20px;">
                                                <%}%>
                                            </a>
                                            <div class="dropdown-menu drop" aria-labelledby="dropdownMenuLink-2">
                                                <a class="dropdown-item nav-link-2 nav-link text-white" href="#">Perfil</a>
                                                <a class="dropdown-item nav-link-2 nav-link text-white" href="/logout">Cerrar Sesión</a>
                                            </div>
                                        </div>
                                        <%}%>

                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!--Header end-->->






            <div class="row" style="padding-bottom: 15px;align-items: center;display: flex">
                <div class="col-auto">
                    <button  class="botonPublicar animarBoton"data-bs-toggle="modal" data-bs-target="#exampleModal">Publicar</button>

                </div>
                <div class="col-auto">
                    <div class="dropdown">
                        <button class="botonFiltrar dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="color: rgba(248, 203, 138, 1);
    border-color: rgba(248, 203, 138, 1);">
                            Seleccione un filtro
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="/foro/">Mas antiguos primero</a></li>
                            <li><a class="dropdown-item" href="/foro/1">Mas recientes primero</a></li>

                        </ul>
                    </div>


                </div>
            </div>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content aemStyle">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Crear tema</h5>
                                <button type="button" class="btn-close btn-close-white"  data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <%

                                if(usuario==null){




                            %>
                            <div class="m-3">
                            <h1 class="fuenteAmarilla">Para crear un tema debes  <a href="/login" class="fuenteAmarilla">Iniciar sesion</a> </h1>

                            </div>
                            <%}else{%>
                            <div class="m-3">
                            <form method="post" action="/foro/<%=usuario.getId()%>/crearTema/">

                                <div class="row mb-3">
                                    <label for="tituloTema" class="fuenteAmarillaPequeña">Titulo</label>
                                    <input type="text" id="tituloTema" name="tituloTema" maxlength="60" style="border-radius: 5px;background-color: #6f6b8488;color: white"  required>
                                </div>

                                <div class="row mb-3">
                                    <label for="descripcionTema" class="fuenteAmarillaPequeña">Descripcion</label>
                                    <textarea class="form-control " id="descripcionTema" maxlength="400" name="descripcionTema"style="background-color: #6f6b8488;color: white;" required></textarea>

                                </div>

                                <div class="row">
                                    <input type="submit" id="Publicar" class="botonPublicar mt-2" value="Crear"></input>
                                </div>
                            </form>
                            </div>
                            <%}%>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
















            <div class="row align-items-center">
                <div class="pb-3 pt-3"
                    style="border-radius: 10px;background-color: #2c283d;border-radius: 10px; margin-bottom: 10px;">
                    <table>
                        <div class="row">
                            <div class="col-1 fuenteAmarillaPequeña  d-none d-lg-block">
                                TEMAS
                            </div>
                            <div class="col offset-md-5 fuenteAmarillaPequeña  d-none d-lg-block text-center ">
                                AUTOR
                            </div>
                            <div class="col blanco  d-none d-lg-block text-center fuenteAmarillaPequeña">
                                RESPUESTAS
                            </div>
                            <div class="col">
                                <a style="display:none ;" href="/iu.aem/foro/temaForo.html"><button class="botonAccederTema">Acceder
                                    tema</button></a>
                            </div>



                        </div>
                        <script>
                            var e = document.getElementById("ddlViewBy");
                            var strUser = e.value;


                        </script>

                        <%


                        for (ForumEntity f : temas){
                        %>



                        <div class="row align-items-center recuadro ">
                            <div class="col col-md-5 colTexto mr-auto blanco">
                                <!--Titulo-->
                                <a href="/foro/<%=f.getId()%>/tema/" style="color: white;text-decoration: none; "><%=f.getTitle()%></a>


                            </div>
                            <div class="col offset-md-1 blanco  d-none d-lg-block text-center">
                                <!--Autor-->
                                <%
                                if(usuario!=null && usuario.getId()==f.getCreator().getId()){

                                %>
                                Tú
                                <%}else{%>
                                <%=f.getCreator().getUsername()%>
                                <%}%>
                            </div>
                            <div class="col blanco  d-none d-lg-block text-center">
                                <!--Respuestas-->
                                <%=f.getMessages().size()%>
                            </div>
                            <div class="col-auto col-md  blanco ">
                                <div class="col">
                                    <a href="/foro/<%=f.getId()%>/tema/"><button class="botonAccederTema animarBoton">Acceder
                                        tema</button></a>
                                </div>
                                <%

                                if(usuario!=null&&usuario.getId()==f.getCreator().getId()){
                                %>
                                <div class="col">
                                    <a  data-bs-toggle="modal" data-bs-target="#myModal<%=f.getId()%>"><button style="background-color: #ad3a3a;color: white; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;" class="botonAccederTema animarBoton">Borrar
                                        tema</button></a>
                                </div>
                                <div class="modal fade" id="myModal<%=f.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered"style="pointer-events: all;">
                                        <div class="modal-content aemStyle">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabelBorrarTema">Borrar mensaje</h5>
                                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <span>¿Está seguro de que quiere borrar el tema?</span>
                                                </div>
                                                <div class="row">
                                                    <a type="button" class="btn  ms-3 mt-3 "onclick="confirmarBorrado()" href="/foro/<%=f.getId()%>/borrarTema/" style="width: auto;background-color: red;color: white">Borrar</a>

                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
<%}%>


                            </div>


                        </div>



                        <%}
                        %>










                    </table>

                </div>
            </div>







        </div>
        </div>


<div class="modal fade" id="temaOK" tabindex="-1" aria-labelledby="temaOK" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-dialog modal-dialog-centered" >
                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16" style="width: auto;">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <span style="font-size: 25px;margin-left: 8px;">El tema se ha creado correctamente</span>
            </div>

            <div class="modal-footer" >
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="borradoTemaOK" tabindex="-1" aria-labelledby="borradoTemaOK" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-dialog modal-dialog-centered" >
                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16" style="width: auto;">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
                <span style="font-size: 25px;margin-left: 8px;">El tema se ha borrado correctamente</span>
            </div>

            <div class="modal-footer" >
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
















        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

        <script>

            window.onload = function (){



                var alerta = <%=alerta%>;
                if(alerta==1){
                    var myModal = new bootstrap.Modal(document.getElementById('temaOK'))
                    myModal.show();
                }

                if(alerta==2){
                    var myModal = new bootstrap.Modal(document.getElementById('borradoTemaOK'))
                    myModal.show();
                }


            };







        </script>

<footer class="py-3  bg-dark">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Grupo Q, Inc</p>
</footer>
</body>

</html>