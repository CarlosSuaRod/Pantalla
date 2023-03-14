<%-- 
    Document   : formulario
    Created on : 10 mar 2023, 13:10:20
    Author     : suare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            *, body {
                color: white;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link href="css/css.css" rel="stylesheet" contentType="text/css" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            String accion = request.getParameter("accion");
                        
            if(accion != null && accion.equals("editar")){
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String dni = request.getParameter("dni");
                String password = request.getParameter("password");
                boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));
        %>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Editar profesor</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <form action="profesores.jsp" method="GET">
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="name" value="<%=name%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="text" class="form-control" name="email" value="<%=email%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DNI</label>
                            <input type="text" class="form-control" name="dni" value="<%=dni%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <input type="text" class="form-control" name="password" value="<%=password%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Es administrador</label>
                            <%if(isAdmin){%><input type="checkbox" name="isAdmin" value="" checked><%}else{%>
                            <input type="checkbox" name="isAdmin" value=""><%}%>
                        </div>
                        
                        <input type="hidden" name="accion" value="editar">
                        
                        <div class="d-grid gap-2">
                            <input type="submit" value="Editar" class="btn btn-warning">
                            <input type="hidden" name="id" value="<%=id%>">
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
        <%} else {%>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Insertar profesor</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <form action="profesores.jsp" method="GET">
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="name">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="text" class="form-control" name="email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DNI</label>
                            <input type="text" class="form-control" name="dni">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <input type="text" class="form-control" name="password">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Es administrador</label>
                            <input type="checkbox" name="isAdmin">
                        </div>
                        
                        <input type="hidden" name="accion" value="insertar">
                        
                        <div class="d-grid gap-2">
                            <input type="submit" value="Insertar" class="btn btn-primary">
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
        <%}%>
    </body>
</html>
