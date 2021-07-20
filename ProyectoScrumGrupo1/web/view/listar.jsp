<%-- 
    Document   : listar
    Created on : 15-sep-2020, 12:47:00
    Author     : Asus
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Persona"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Página Web Listar - Admin</title>
    </head>
    <body>
        <div class="d-flex" style="height: 100vh;">
            <div class="bg-dark p-4 d-flex flex-column justify-content-between align-items-center" style="max-height: 100vh; flex-basis: 20%">
                <img src="img/duke.png" class="img-fluid" alt="Responsive image">
                <h2 class="text-center text-light m-0"><strong>Java EE <br> <span class="text-primary">Fundación Kinal</span> </strong></h2>
                <br>
                <br>
                <br>
                <a class="btn btn-lg btn-block text-secondary a-hover" id="a-hover" href="Controlador?accion=add"> <strong>Agregar Nuevo</strong></a>
                <br>
                <div class="m-0 d-flex align-items-center">
                    <p class="text-warning m-2">Usuario: <span class="font-weight-bolder"><%= request.getAttribute("user") %> | SALIR</span></p>
                    <a href="Controlador?accion=regresar">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-square-fill text-light m-0" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 40px; cursor: pointer;">
                            <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm9.5 8.5a.5.5 0 0 0 0-1H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5z"/>
                        </svg>
                    </a> 
                </div>
                <p class="text-light text-left m-0" style="font-size: 10px;">Marcos Bonifasi - Copy Right &copy; 2020</p>
            </div>

            <div class="d-flex flex-column text-center px-5" style="flex-basis: 80%; max-height: 100vh;" >
                <div class="jumbotron jumbotron-fluid text-center bg-light rounded border" style="padding: 2rem;">
                    <h1 class="display-4 text-uppercase"> <strong>Bievenido a la pagina de listar</strong></h1>
                    <p class="lead text-muted">Aquí podras encontrar los datos ingresados.</p>
                    <hr class="my-1">
                </div>
                <div style="overflow-y: scroll;" class="border" >
                    <table class="table table-bordered bg-light">
                        <thead>
                            <tr>
                                <td class=" btn-primary btn-lg text-center "><Strong>CODIGO PERSONA</Strong></td>
                                <td class="btn-primary btn-lg text-center"><Strong>DPI</Strong></td>
                                <td class="btn-primary btn-lg text-center"><Strong>NOMBRES</Strong></td>
                                <td class="btn-primary btn-lg text-center"><Strong>ACCIONES</Strong></td>
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

                                <td class="text-center">
                                <a  class=" btn btn-primary "  href="Controlador?accion=editar&codigoPersona=<%= per.getCodigoPersona()%>"> Editar </a>
                                <a   class="btn btn-danger" href= "Controlador?accion=eliminar&codigoPersona=<%= per.getCodigoPersona()%>"> Eliminar </a>        
                                </td>

                            </tr>
                        <% } %>
                        </tbody>
                    </table>    
                </div>
            </div>
        </div>
                        
        <script>
            let aHover = document.getElementsByClassName("a-hover");
                            
            aHover[0].onmouseover  = () => {

                    aHover[0].style.backgroundColor = "#28a745";
                    aHover[0].style.borderRadius = "20px 5px 5px 20px";
                    aHover[0].style.color = "red";
                    aHover[0].style.transition = "all 0.5s ease";

            }
            
            aHover[0].onmouseout = () => {

                    aHover[0].style.backgroundColor = "#343a40";

            }
            
        </script>
    </body>
</html>
