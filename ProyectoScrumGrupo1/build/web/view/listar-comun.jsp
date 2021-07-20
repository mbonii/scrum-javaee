<%-- 
    Document   : listar-comun
    Created on : 06-oct-2020, 15:35:49
    Author     : Asus
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Página Web Listar - Usuario Comun</title>
    </head>
    <body>
        <body style="background-color: #e1e1e1;">
        
        <div class="container">
            <div class="jumbotron jumbotron-fluid text-center bg-light rounded border" style="padding: 2rem;">
                <h1 class="display-4 text-uppercase"> <strong>Bievenido a la pagina de listar COMUN</strong></h1>
                <p class="lead text-muted">Aquí podras encontrar los datos ingresados.</p>
                <hr class="my-1">
                
                <div class="d-flex flex-row justify-content-end align-items-center mt-2">
                    <p class="text-warning m-2 text-right">Usuario: <span class="font-weight-bolder"><%= request.getAttribute("user") %> | SALIR</span></p>
                    <a href="Controlador?accion=regresar">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-square-fill text-danger text-right m-0" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 40px; cursor: pointer;">
                            <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm9.5 8.5a.5.5 0 0 0 0-1H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5z"/>
                        </svg>
                    </a> 
                </div>
            </div>
            <div class="border">
                <table class="table table-bordered bg-light">
                    <thead>
                        <tr>

                            <td class=" btn-primary btn-lg text-center "><Strong>CODIGO PERSONA</Strong></td>
                            <td class="btn-primary btn-lg text-center"><Strong>DPI</Strong></td>
                            <td class="btn-primary btn-lg text-center"><Strong>NOMBRES</Strong></td>

                        </tr>
                    </thead>
                    <% 
                        PersonaDAO dao = new PersonaDAO();
                        List<Persona> listaPersona = dao.listar();
                        Iterator<Persona> iterator = listaPersona.iterator();
                        Persona per = null;
                        while (iterator.hasNext()){
                            per = iterator.next();

                    %>
                    <tbody>
                        <tr>
                            <td class="text-center "><%=per.getCodigoPersona()  %></td>
                            <td class="text-center"><%=per.getDPI()  %></td>
                            <td class="text-center "><%=per.getNombrePersona()  %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>   
            </div>
        </div>
    </body>
    </body>
</html>
