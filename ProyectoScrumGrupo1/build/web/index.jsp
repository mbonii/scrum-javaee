<%-- 
    Document   : index
    Created on : 15-sep-2020, 12:46:23
    Author     : Asus
--%>

<%@page import="modelo.Rol"%>
<%@page import="modeloDAO.RolDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="./css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Examen Final 5to Java EE</title>
    </head>
    <body>
        <div class="position-relative d-flex" style="max-height: 100vh; max-width: 100vw">
            <img src="img/wallpaper.jpg" class="img-index" alt="Responsive image" style="width: 100%; height: 100vh;">
            <form action="Controlador" method="POST" class="col-4 text-left text-light border m-4 p-5 rounded" style="position: absolute; bottom: 100px;background-color:rgba(255, 255, 255, 0);">
                <div class="form-group">
                    <label for="username">Nombre Usuario</label>
                    <input type="text" class="form-control" id="username" name="txtUsername" required>
                </div>
                <div class="form-group">
                    <label for="password">Contrasena</label>
                    <input type="password" class="form-control" id="password" name="txtPassword" required>
                </div>
                <div class="form-group">
                    <label for="typeOfUser">Tipo de Usuario</label>
                    <select class="form-control" id="typeOfUser" name="sTypeOfUser" required>
                        <option disabled selected>Elija un tipo de usuario</option>
                        <% 
                            RolDAO rolDAO = new RolDAO();
                            List<Rol> listaUsuario = rolDAO.listar();
                            Iterator<Rol> iterator = listaUsuario.iterator();
                            Rol rol = null;
                            
                            while(iterator.hasNext()){
                                rol = iterator.next();
                        %>
                        <option value="<%=rol.getCodigoRol() %>"><%=rol.getNombre() %></option>
                        <% } %>
                    </select>   
                </div>
                <br>
                <br>
                <input class="btn btn-primary btn-lg btn-block" type="submit" name="accion" value="Ingresar">
            </form>
        </div>
    </body>
</html>

