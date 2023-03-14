<%@page import="Datos.Teacher"%>
<%@page import="Datos.Sesion"%>
<%@page session="true" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenid@</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link href="css/css.css" rel="stylesheet" contentType="text/css" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>


    </head>


    <body>
        <%
            String control = "";
            control = request.getParameter("accion");
            if (control != null && control.equals("login")) {
                Sesion sesion = new Sesion();

                String name = request.getParameter("name");
                String password = request.getParameter("password");

                boolean isConnected = sesion.connect(name, password);
                if(isConnected) {
                    Teacher teacher = sesion.retrieveInfo(name, password);
                    session.setAttribute("miSesion", isConnected);
                    session.setAttribute("id_user", teacher.getId());
                    session.setAttribute("name", teacher.getName());
                    session.setAttribute("email", teacher.getEmail());
                    session.setAttribute("dni", teacher.getDni());
                    session.setAttribute("password", teacher.getPassword());
                    session.setAttribute("isAdmin", teacher.isAdmin());
                    
                    if (session.getAttribute("miSesion") != null && (boolean) session.getAttribute("miSesion")) {
                        response.sendRedirect(getServletContext().getContextPath() + "/principal.jsp");

                        //System.out.println("Se ha redirigido a la pagina principal");
                    }
                } else {%>
        <div class="row">
            <div class="col-12">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Usuario y/o contraseña incorrecta.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
            <%
            }

            }
        %>

        <div class="form-body">
            <div class="row">
                <div class="form-holder">
                    <div class="form-content">
                        <div class="form-items">
                            <h2>IES El Rincón - Inicio de Sesión </h2>
                            <form action="index.jsp" method="POST" class="requires-validation" novalidate >

                                <div class="col-md-12   ">
                                    <input class="form-control" type="text" name="name" placeholder="Usuario" required>                               
                                </div>

                                <div class="col-md-12">
                                    <input class="form-control" type="password" name="password" placeholder="Contraseña" required>
                                </div>

                                <input name="accion" type="hidden" value="login"></input>

                                <div class="form-button mt-3">
                                    <button id="submit" type="submit" class="btn button-37">Iniciar Sesión</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>