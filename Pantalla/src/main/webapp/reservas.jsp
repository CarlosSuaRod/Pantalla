<%-- 
    Document   : reservas
    Created on : 9 mar 2023, 10:46:21
    Author     : suare
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="Datos.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Datos.GestionReservas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <%
                GestionReservas gr = new GestionReservas();
                ArrayList<Reservation> reservas = gr.listReservations();%>
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Reservas aula G101 - IES El Rincón</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <table class="table table-striped">
                        <thead>
                        <th>ID Reserva</th>
                        <th>ID Profesor</th>
                        <th>Nombre</th>
                        <th>Fecha inicio</th>
                        <th>Fecha fin</th>
                        <th></th>
                        <th></th>
                        </thead>
                        <tbody>
                            <%
                                for (Reservation cada : reservas) {
                            %>
                            <tr>
                                <td><%=cada.getId_booking()%></td>
                                <td><%=cada.getId_User()%></td>
                                <td><%=cada.getName()%></td>
                                <% String fechaIn = ""+cada.getDateIn();
                                   //String[] dateIn = fechaIn.split(".");
                                   String fechaOut = ""+cada.getDateOut();
                                   //String[] dateOut = fechaOut.split(".");
                                %><td><%=fechaIn%></td>
                                <td><%=fechaOut%></td>
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
                    <form action="principal.jsp" method="GET">
                        <div class="d-grid gap-2">
                            <input type="submit" value="Volver al menú" class="btn btn-success">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
