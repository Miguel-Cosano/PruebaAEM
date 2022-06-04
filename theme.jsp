<%@ page import="es.uma.eam.entities.ForumEntity" %>
<%@ page import="org.aspectj.bridge.Message" %>
<%@ page import="es.uma.eam.entities.MessageEntity" %>
<%@ page import="es.uma.eam.entities.UserEntity" %>
<%@ page import="org.apache.catalina.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<!doctype html>

<%@ page pageEncoding="UTF-8" %>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/forum.css" />
    <title>EAM--TEMA</title>
</head>

<body>

        <%
            ForumEntity foro = (ForumEntity)request.getAttribute("tema");
            UserEntity user = (UserEntity)session.getAttribute("usuario");
            Integer notifiacion = (Integer)session.getAttribute("alerta");
            session.removeAttribute("alerta");
            List<MessageEntity> mensajes = (List<MessageEntity>) request.getAttribute("mensajes");

        %>

        <!-- Button trigger modal -->






    <!--Main-->

    <div class="mainForo">
        <div class="container pb-3">
            <!-- Button trigger modal -->


            <div>
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
                                            <%if (user == null) {  %>
                                            <a class="nav-link text-white" href="/login">Iniciar Sesion</a>
                                            <%}else{%>

                                            <div class="dropdown">
                                                <a class="nav-link text-white dropdown-toggle"  role="button"
                                                   id="dropdownMenuLink-2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <%if(user.getFotoPerfil() == null){ %>
                                                    <img src="img/avatar.png" width="30x">
                                                    <%}else{%>
                                                    <img src="<%= user.getFotoPerfil() %>" width="30x" style="border-radius: 20px;">
                                                    <%}%>
                                                </a>
                                                <div class="dropdown-menu " aria-labelledby="dropdownMenuLink-2">
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

            </div>
            <!--Boton vuelta-->
            <div class="row" style="display: flex;align-items: center">
                <a href="/foro/" style="width: auto"><button class="botonVolverForo animarBoton">Volver al foro</button></a>

                <%
                if(user != null && user.getId()==foro.getCreator().getId()){
                %>
                <a style="width: auto" data-bs-toggle="modal" data-bs-target="#myModalBorrarTema"><button style="background-color: #ad3a3a;color: white; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;" class="botonAccederTema animarBoton">Borrar
                    tema</button></a>
                <%}%>
            </div>
            <!--Fin boton vuelta-->
            <div class="cajaTemaInicial container-fluid h-100">
                <div class="row">
                    <div class="col-auto d-none d-lg-block">
                        <div class=" centrar mt-2">
                            <img src="<%=foro.getCreator().getFotoPerfil()%>" alt="Avatar" width="100" height="100" style="border-radius: 50%">
                        </div>
                        <div class="row ">
                            <span class="fuenteBlanca centrar "><%=foro.getCreator().getUsername()%></span>

                        </div>
                    </div>
                    <div class="col-10">
                        <div class="row-auto" style="margin-right: 0px;">

                                <label class="fuenteAmarilla fuente mt-3" for="descTemaIni"><%=foro.getTitle()%></label>








                        </div>
                        <div class="row center-block ">
                            <p id="textoTema" style="word-break: break-all" - readonly class=" areaTexto" id="descTemaIni"><%=foro.getDescription()%></p>
                        </div>


                    </div>


                </div>


            </div>
            <!--Tema inicial y primer comentario-->

            <div class="cajaResponder">







                        <%
                        if(user==null){
                        %>

                        <h1 class="fuenteAmarilla m-5">Para responder en el foro debes <a href="/login" class="fuenteAmarilla">Iniciar sesion</a></h1>

                        <%}else{%>
                        <form method="post" action="/foro/<%=user.getId()%>/<%=foro.getId()%>/crearMensaje/">
                        <label style="font-size: 25px" for="respuesta" class="labelComentario fuenteAmarilla"> Escriba su
                        respuesta</label>
                        <textarea style="font-size: 25px" id="respuesta" name="respuesta" class="escribirRespuesta" required></textarea>
                        <div class="row">
                        <div class="col-12">

                        </div>
                        <div class="col"></div>
                        <input type="submit" value="Responder" style="font-size: 20px;" class="botonResponder animarBoton" required>

                    </div>







                </form>
                <%}%>


                <div class=" borderBotton">

                    <div class="row" style="align-items: center;display: flex">
                        <div class="col-auto">
                            <span class="navbar-brand">Respuestas</span>

                        </div>
                        <div class="col-auto">
                            <div class="dropdown">
                                <button class="botonFiltrar dropdown-toggle" type="button" id="filtrar" data-bs-toggle="dropdown" aria-expanded="false">
                                    Seleccione un filtro
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="/foro/<%=foro.getId()%>/tema/">Mas antiguos primero</a></li>
                                    <li><a class="dropdown-item" href="/foro/<%=foro.getId()%>/tema/1">Mas recientes primero</a></li>

                                </ul>
                            </div>



                        </div>
                    </div>


                </div>



                <%
                    if(foro.getMessages().isEmpty()){




                %>

                <h1 class="fuenteAmarilla m-4">Vaya! Parece que nadie ha respondido</h1>
                <%
                }else{

                for(MessageEntity m : mensajes){

                %>
                <!--RESPUESTA EN EL FORO-->
                <div style="border-style: solid;
    border-width: 0.00001cm;background-color: #7272a924;border-radius: 25px;margin: 10px;">

                    <div class="row">
                        <div class="col-1" style="    min-width: fit-content;">
                            <img src="<%=m.getAuthor().getFotoPerfil()%>" alt="Avatar" width="80" height="80" style="border-radius: 50%" class="ms-4 mt-2">

                        </div>
                        <div class="col align-items-center ps-4" style="display:flex ;">
                            <%if(user != null && user.getId()==m.getAuthor().getId()){%>

                            <span class="p-lg-2 fuente fuenteAmarillaNormal"><%=m.getAuthor().getUsername()+"(Tú)"%></span>
                            <%}else{%>
                            <span class="p-lg-2 fuente fuenteBlanca"><%=m.getAuthor().getUsername()%></span>
                            <%}%>
                        </div>





                    </div>



                    <div class="row p-3">

                        <p readonly class=" areaTexto"style="word-break: break-all" id="descripcionTema"><%=m.getContent()%></p>

                    </div>


                    <div class="row ms-1">
                        <%
                            if(user!=null && user.getId()==m.getAuthor().getId()){
                        %>

                        <div class="dropdown"style="width: auto;display: flex;align-items: center;">
                            <button class="btn " type="button"  id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" data-bs-display="static" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="29.5" height="29.5" fill="#AAB8C2" class="bi bi-gear-fill" viewBox="0 0 16 16">
                                    <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
                                </svg>

                            </button>

                            <ul class="dropdown-menu " aria-labelledby="dropdownMenuButton1"  >
                                <li><a class="dropdown-item myBtn"  style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#myModal<%=m.getId()%>">Editar respuesta</a></li>

                                <li><a class="dropdown-item" style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#myModal<%=m.getId()%>2">Borrar respuesta</a></li>
                            </ul>
                        </div>


                        <div class="modal fade" id="myModal<%=m.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content aemStyle">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabelMoficar">Editar respuesta</h5>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="/foro/<%=m.getId()%>/modificarMensaje">
                                            <label style="font-size: 25px" for="respuestaModificar" class="labelComentario fuenteAmarilla"> </label>
                                            <textarea style="font-size: 25px" id="respuestaModificar"  name="respuesta" class="escribirRespuesta" required><%=m.getContent()%></textarea>
                                            <div class="row">
                                                <div class="col-12">

                                                </div>
                                                <div class="col"></div>
                                                <input type="submit" value="Modificar" style="font-size: 20px;" class="botonResponder" required>

                                            </div>

                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="myModal<%=m.getId()%>2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered"style="pointer-events: all;">
                                <div class="modal-content aemStyle">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Borrar mensaje</h5>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <span>¿Está seguro de que quiere borrar el mensaje?</span>
                                        </div>
                                        <div class="row">
                                            <a type="button" class="btn  ms-3 mt-3 "onclick="confirmarBorrado()" href="/foro/<%=foro.getId()%>/<%=m.getId()%>/borrarMensaje/" style="width: auto;background-color: red;color: white">Borrar</a>

                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>







                        <%}%>

                        <input type="checkbox" class="checkbox" id="checkbox<%=m.getId()%>" />
                        <label for="checkbox<%=m.getId()%>" style="width: fit-content">
                            <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                                <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                                    <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" fill="#AAB8C2"/>
                                    <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5"/>

                                    <g id="heartgroup7" opacity="0" transform="translate(7 6)">
                                        <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2"/>
                                        <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2"/>
                                    </g>

                                    <g id="heartgroup6" opacity="0" transform="translate(0 28)">
                                        <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2"/>
                                        <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2"/>
                                    </g>

                                    <g id="heartgroup3" opacity="0" transform="translate(52 28)">
                                        <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2"/>
                                        <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2"/>
                                    </g>

                                    <g id="heartgroup2" opacity="0" transform="translate(44 6)">
                                        <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2"/>
                                        <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2"/>
                                    </g>

                                    <g id="heartgroup5" opacity="0" transform="translate(14 50)">
                                        <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2"/>
                                        <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2"/>
                                    </g>

                                    <g id="heartgroup4" opacity="0" transform="translate(35 50)">
                                        <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2"/>
                                        <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2"/>
                                    </g>

                                    <g id="heartgroup1" opacity="0" transform="translate(24)">
                                        <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2"/>
                                        <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2"/>
                                    </g>
                                </g>
                            </svg>
                        </label>












                    </div>

                </div>
                <!--FIN RESPUESTA EN EL FORO-->

                <%}}%>












                <!--Fin tema incial y primer comentario-->
            </div>
        </div>


        <div class="modal fade" id="borradoOK" tabindex="-1" aria-labelledby="borradoOK" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-dialog modal-dialog-centered" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16" style="width: auto;">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </svg>
                        <span style="font-size: 25px;margin-left: 8px;">El mensaje se ha borrado corractamente</span>
                    </div>

                    <div class="modal-footer" >
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modificarOK" tabindex="-1" aria-labelledby="modificarOK" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-dialog modal-dialog-centered" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16" style="width: auto;">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </svg>
                        <span style="font-size: 25px;margin-left: 8px;">El mensaje se ha modificado corractamente</span>
                    </div>

                    <div class="modal-footer" >
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="crearOK" tabindex="-1" aria-labelledby="crearOK" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-dialog modal-dialog-centered" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16" style="width: auto;">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </svg>
                        <span style="font-size: 25px;margin-left: 8px;">El mensaje se ha creado corractamente</span>
                    </div>

                    <div class="modal-footer" >
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModalBorrarTema" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <a type="button" class="btn  ms-3 mt-3 "onclick="confirmarBorrado()" href="/foro/<%=foro.getId()%>/borrarTema/" style="width: auto;background-color: red;color: white">Borrar</a>

                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>



















    </div>

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





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<script>


    window.onload = function (){
        var alerta = <%=notifiacion%>;
      if(alerta==1){
          alertaBorrado();
      }

      if(alerta==2){
          alertaModificacion();
      }
      if(alerta==3){
          alertaCreacion();
      }

    };
    function alertaBorrado(){
        var myModal = new bootstrap.Modal(document.getElementById('borradoOK'))
        myModal.show();
    }

    function alertaModificacion(){
        var myModal = new bootstrap.Modal(document.getElementById('modificarOK'))
        myModal.show();
    }

    function alertaCreacion(){
        var myModal = new bootstrap.Modal(document.getElementById('crearOK'))
        myModal.show();
    }







</script>


</body>


</html>