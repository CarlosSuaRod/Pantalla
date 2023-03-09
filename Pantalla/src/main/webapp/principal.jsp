<%-- 
    Document   : principal
    Created on : Mar 2, 2023, 1:08:09 PM
    Author     : ymir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservas</title>
    </head>
    <body>
        <div class="form-body">
            <div class="row">
                <div class="form-holder">
                    <div class="form-content">
                        <div class="form-items">
                            <h2>IES El Rincón</h2>
                            <form action="reservas.jsp">
                                <div class="form-button mt-3">
                                    <button id="reservas" type="submit" class="btn button-37">Reservar aula 101</button>
                                </div>
                            </form>
                            <form action="profesores.jsp">
                                <div class="form-button mt-3">
                                    <button id="profesores" type="submit" class="btn button-37">Gestionar profesores</button>
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
