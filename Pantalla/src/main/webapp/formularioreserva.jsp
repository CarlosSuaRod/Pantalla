<%-- 
    Document   : formularioreserva
    Created on : 13 mar 2023, 8:01:24
    Author     : suare
--%>

<%@page import="java.time.LocalDate"%>
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

            if (accion != null && accion.equals("editar")) {
                int id_booking = Integer.parseInt(request.getParameter("id_booking"));
                int id_user = Integer.parseInt(request.getParameter("id_user"));
                String name = request.getParameter("name");
                String dateIn = request.getParameter("dateIn");
                String dateOut = request.getParameter("dateOut");
        %>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Editar reserva</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <form action="tusreservas.jsp" method="GET">
                        <div class="mb-3">
                            <label class="form-label">Fecha de inicio</label>
                            <input type="text" class="form-control" name="dateIn" placeholder="YYYY-MM-DD hh:mm:ss" value="<%=dateIn.substring(0, dateIn.length()-5)%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Fecha fin</label>
                            <input type="text" class="form-control" name="dateOut" placeholder="YYYY-MM-DD hh:mm:ss" value="<%=dateOut.substring(0, dateOut.length()-5)%>">
                        </div>
                        <input type="hidden" name="accion" value="editar">

                        <div class="d-grid gap-2">
                            <input type="submit" value="Editar" class="btn btn-warning">
                            <input type="hidden" name="id_user" value="<%=id_user%>">
                            <input type="hidden" name="id_booking" value="<%=id_booking%>">
                            <input type="hidden" name="name" value="<%=name%>">
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
        <%} else {
            int id = Integer.parseInt("" + session.getAttribute("id_user"));
            String name = "" + session.getAttribute("name");%>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Hacer reserva</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <form action="tusreservas.jsp" method="GET">
                        <div class="mb-3">
                            <label class="form-label">Fecha de inicio</label>
                            <input type="text" class="form-control" name="dateIn" placeholder="YYYY-MM-DD hh:mm:ss" value="<%=LocalDate.now()+" 08:00"%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Fecha fin</label>
                            <input type="text" class="form-control" name="dateOut" placeholder="YYYY-MM-DD hh:mm:ss" value="<%=LocalDate.now()+" 23:00"%>">
                        </div>

                        <input type="hidden" name="accion" value="insertar">
                        

                        <div class="d-grid gap-2">
                            <input type="submit" value="Insertar" class="btn btn-primary">
                            <input type="hidden" name="id_user" value="<%=id%>">
                            <input type="hidden" name="name" value="<%=name%>">
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
        <%}%>
    </body>
</html>
