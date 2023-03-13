<%-- 
    Document   : principal
    Created on : Mar 2, 2023, 1:08:09 PM
    Author     : ymir
--%>

<%@page import="Datos.Teacher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%if (Boolean.parseBoolean("" + session.getAttribute("miSesion"))) {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú pantalla</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>Menú pantalla - IES El Rincón</h2>
                </div>
            </div>
            <%int id = Integer.parseInt("" + session.getAttribute("id_user"));
                String name = "" + session.getAttribute("name");
                String email = "" + session.getAttribute("email");
                String dni = "" + session.getAttribute("dni");
                String password = "" + session.getAttribute("password");
                boolean isAdmin = Boolean.parseBoolean("" + session.getAttribute("isAdmin"));
                System.out.println(isAdmin);
                Teacher teacher = new Teacher(id, name, email, dni, password, isAdmin);

                if (teacher.isAdmin()) {%>

            <div class="row">
                <div class="col-4">
                    <form action="reservas.jsp">
                        <div class="form-button mt-3">
                            <button id="reservas" type="submit" class="btn button-37">Listado de reservas del aula G101</button>
                        </div>
                    </form>
                </div>
                <div class="col-4">
                    <form action="tusreservas.jsp">
                        <div class="form-button mt-3">
                            <button id="tusreservas" type="submit" class="btn button-37">Tus reservas del aula G101</button>
                        </div>
                    </form>
                </div>
                <div class="col-4">
                    <form action="profesores.jsp">
                        <div class="form-button mt-3">
                            <button id="profesores" type="submit" class="btn button-37">Gestionar profesores</button>
                        </div>
                    </form>
                </div>
            </div>    
            <%} else {%>
            <div class="row">
                <div class="col-6">
                    <form action="reservas.jsp">
                        <div class="form-button mt-3">
                            <button id="reservas" type="submit" class="btn button-37">Listado de reservas del aula G101</button>
                        </div>
                    </form>
                </div>
                <div class="col-6">
                    <form action="tusreservas.jsp">
                        <div class="form-button mt-3">
                            <button id="tusreservas" type="submit" class="btn button-37">Tus reservas del aula G101</button>
                        </div>
                    </form>
                </div><%}%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html><%} else {
        response.sendRedirect("index.jsp");
    }%>
