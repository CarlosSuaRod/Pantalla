<%-- 
    Document   : tusreservas
    Created on : 10 mar 2023, 11:31:16
    Author     : suare
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
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
                    Timestamp dateIn = Timestamp.valueOf(request.getParameter("dateIn").trim());
                    Timestamp dateOut = Timestamp.valueOf(request.getParameter("dateOut").trim());
                    int idUser = Integer.parseInt(request.getParameter("id_user"));
                    String name = request.getParameter("name");

                    if (!gr.insertReservation(dateIn, dateOut, name, idUser)) {%>
            <div class="row">   
                <div class="col-12">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Problema al reservar
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <%} else {%>
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Reserva guardada correctamente
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div><%}
            } else if (accion != null && accion.equals("eliminar")) {
                Timestamp dateIn = Timestamp.valueOf(request.getParameter("dateIn"));
                Timestamp dateOut = Timestamp.valueOf(request.getParameter("dateOut"));

                if (!gr.deleteReservation(dateIn, dateOut)) {%>
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
                        Reserva eliminada correctamente
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div><%}
            } else if (accion != null && accion.equals("editar")) {
                Timestamp dateIn = Timestamp.valueOf(request.getParameter("dateIn"));
                Timestamp dateOut = Timestamp.valueOf(request.getParameter("dateOut"));
                int idUser = Integer.parseInt(request.getParameter("id_user"));
                String name = request.getParameter("name");

                Reservation reservation = new Reservation(dateIn, dateOut, name, idUser);

                if (!gr.modifyReservation(reservation)) {%>
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
                        Reserva modificada correctamente
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <%}
                }
                int id = Integer.parseInt("" + session.getAttribute("id_user"));
                ArrayList<Reservation> reservations = gr.listOwnReservations(id);%>
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Gestión de tus reservas - IES El Rincón</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <table class="table table-striped">
                        <thead>
                        <th>ID reserva</th>
                        <th>ID Profesor</th>
                        <th>Nombre</th>
                        <th>Fecha inicio</th>
                        <th>Fecha fin</th>
                        <th></th>
                        <th></th>
                        </thead>
                        <tbody>
                            <%
                                for (Reservation cada : reservations) {
                            %>
                            <tr>
                                <td><%=cada.getId_booking()%></td>
                                <td><%=cada.getId_User()%></td>
                                <td><%=cada.getName()%></td>
                                <% String fechaIn = ""+cada.getDateIn();
                                   fechaIn = fechaIn.substring(0, fechaIn.length()-2);
                                   String fechaOut = ""+cada.getDateOut();
                                   fechaOut = fechaOut.substring(0, fechaOut.length()-2);
                                %><td><%=fechaIn%></td>
                                <td><%=fechaOut%></td>
                                <td>
                                    <form action="formularioreserva.jsp" method="GET">
                                        <input type="hidden" name="id_booking" value="<%=cada.getId_booking()%>">
                                        <input type="hidden" name="id_user" value="<%=cada.getId_User()%>">
                                        <input type="hidden" name="name" value="<%=cada.getName()%>">
                                        <input type="hidden" name="dateIn" value="<%=cada.getDateIn()%>">
                                        <input type="hidden" name="dateOut" value="<%=cada.getDateOut()%>">
                                        <input type="hidden" name="accion" value="editar">
                                        <input type="submit" value="Editar" class="btn btn-warning">
                                    </form>
                                </td>
                                <td>
                                    <form action="tusreservas.jsp" method="GET">
                                        <input type="hidden" name="id_user" value="<%=cada.getId_User()%>">
                                        <input type="hidden" name="name" value="<%=cada.getName()%>">
                                        <input type="hidden" name="dateIn" value="<%=cada.getDateIn()%>">
                                        <input type="hidden" name="dateOut" value="<%=cada.getDateOut()%>">
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
                    <form action="formularioreserva.jsp" method="GET">
                        <div class="d-grid gap-2">
                            <input type="hidden" name="accion" value="insertar">
                            <input type="submit" value="Hacer reserva" class="btn btn-success">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
