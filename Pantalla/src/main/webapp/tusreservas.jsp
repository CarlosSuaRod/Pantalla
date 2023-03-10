<%-- 
    Document   : tusreservas
    Created on : 10 mar 2023, 11:31:16
    Author     : suare
--%>

<%@page import="Datos.Reservation"%>
<%@page import="Datos.GestionReservas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <%
                GestionReservas gr = new GestionReservas();

                String accion = request.getParameter("accion");

                if (accion != null && accion.equals("insertar")) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String dni = request.getParameter("dni");
                    String password = request.getParameter("password");
                    boolean isAdmin = false;
                    if (request.getParameter("isAdmin") != null) {
                        isAdmin = true;
                    }

                    Reservation reserva = new Reservation(name, email, dni, password, isAdmin);

                    if (!gp.insertTeacher(teacher)) {%>
            <div class="row">   
                <div class="col-12">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Problema al insertar
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <%} else {%>
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Profesor insertado correctamente
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div><%}
            } else if (accion != null && accion.equals("eliminar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String dni = request.getParameter("dni");
                String password = request.getParameter("password");
                boolean isAdmin = false;
                if (request.getParameter("isAdmin") != null) {
                    isAdmin = true;
                }

                Teacher teacher = new Teacher(id, name, email, dni, password, isAdmin);
                if (!gp.deleteTeacher(teacher)) {%>
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Problema al eliminar
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <%} else {%>
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Profesor eliminado correctamente
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div><%}
            } else if (accion != null && accion.equals("editar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String dni = request.getParameter("dni");
                String password = request.getParameter("password");
                boolean isAdmin = false;
                if (request.getParameter("isAdmin") != null) {
                    isAdmin = true;
                }

                Teacher teacher = new Teacher(id, name, email, dni, password, isAdmin);

                if (!gp.modifyTeacher(teacher)) {%>
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Problema al modificar
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <%} else {%>
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Profesor modificado correctamente
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <%}
                }
                ArrayList<Teacher> teachers = gp.listTeachers();%>
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Gestión de profesores - IES El Rincón</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <table class="table table-striped">
                        <thead>
                        <th>ID profesor</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>DNI</th>
                        <th>Contraseña</th>
                        <th>Administrador</th>
                        <th></th>
                        <th></th>
                        </thead>
                        <tbody>
                            <%
                                for (Teacher cada : teachers) {
                            %>
                            <tr>
                                <td><%=cada.getId()%></td>
                                <td><%=cada.getName()%></td>
                                <td><%=cada.getEmail()%></td>
                                <td><%=cada.getDni()%></td>
                                <td><%=cada.getPassword()%></td>
                                <%if (cada.isAdmin()) {%><td>Sí</td>
                                <%} else {%><td>No</td><%}%>
                                <td>
                                    <form action="formulario.jsp" method="GET">
                                        <input type="hidden" name="id" value="<%=cada.getId()%>">
                                        <input type="hidden" name="name" value="<%=cada.getName()%>">
                                        <input type="hidden" name="email" value="<%=cada.getEmail()%>">
                                        <input type="hidden" name="dni" value="<%=cada.getDni()%>">
                                        <input type="hidden" name="password" value="<%=cada.getPassword()%>">
                                        <input type="hidden" name="isAdmin" value="<%=cada.isAdmin()%>">
                                        <input type="hidden" name="accion" value="editar">
                                        <input type="submit" value="Editar" class="btn btn-warning">
                                    </form>
                                </td>
                                <td>
                                    <form action="index.jsp" method="GET">
                                        <input type="hidden" name="id" value="<%=cada.getId()%>">
                                        <input type="hidden" name="id" value="<%=cada.getName()%>">
                                        <input type="hidden" name="id" value="<%=cada.getEmail()%>">
                                        <input type="hidden" name="id" value="<%=cada.getDni()%>">
                                        <input type="hidden" name="id" value="<%=cada.getPassword()%>">
                                        <input type="hidden" name="id" value="<%=cada.isAdmin()%>">
                                        <input type="hidden" name="accion" value="eliminar">
                                        <input type="submit" value="Eliminar" class="btn btn-danger">
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Botón insertar -->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <form action="formulario.jsp" method="GET">
                        <div class="d-grid gap-2">
                            <input type="hidden" name="accion" value="insertar">
                            <input type="submit" value="Insertar alumno" class="btn btn-success">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
