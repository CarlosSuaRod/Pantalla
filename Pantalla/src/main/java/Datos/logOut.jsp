<%-- 
    Document   : logOut
    Created on : Jan 27, 2023, 5:34:30 PM
    Author     : ymir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        session.invalidate();
        response.sendRedirect("index.jsp");
    %>
</html>
