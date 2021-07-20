<%-- 
    Document   : editar
    Created on : 15-sep-2020, 12:46:47
    Author     : Asus
--%>

<%@page import="modelo.Persona"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Página Web - Editar</title>
    </head>
    <body style="background-color: #e1e1e1">
        <div class="container">
            <div class="col-lg-7 bg-light rounded mt-3" style="padding: 1rem">
                <div class="alert alert-success text-center" role="alert">
                    <strong>Editar Persona</strong>
                </div>
                <%
                    PersonaDAO nuevaPersonaDao =new PersonaDAO();
                    int codPersona = Integer.parseInt((String)request.getAttribute("codPer"));
                    Persona nuevaPersona = (Persona)nuevaPersonaDao.list(codPersona);
                %>
                <form action="Controlador">
                    <label for="exampleInputEmail1"><i>DPI</i></label>
                    <input class="form-control" type="text" name="txtDPI" value="<%= nuevaPersona.getDPI() %>" required><br>
                    <label for="exampleInputEmail1"><i>Nombres</i></label>
                    <input class="form-control" type="text" name="txtNombre" value="<%= nuevaPersona.getNombrePersona() %>" required><br><br>
                    <input type="hidden" name="txtCodigoPersona" value="<%= nuevaPersona.getCodigoPersona() %>">
                    <input class="btn btn-primary btn-lg btn-block" type="submit" name="accion" value="Actualizar"><br>
                </form>
            </div>
        </div>
    </body>
</html>
