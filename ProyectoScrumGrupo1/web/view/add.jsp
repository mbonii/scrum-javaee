<%-- 
    Document   : add
    Created on : 15-sep-2020, 12:46:37
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Página Web - Agregar</title>
    </head>
    <body style="background-color: #e1e1e1">
        <div class="container">
            <div class="col-lg-7 bg-light rounded mt-3" style="padding: 1rem">
                <div class="alert alert-success text-center" role="alert">
                    <strong>Agregar Nueva Persona</strong>
                </div>
                <form action="Controlador">
                    <label for="exampleInputEmail1"><i>DPI</i></label>
                    <input class="form-control" type="text" name="txtDPI" required><br>
                    <label for="exampleInputEmail1"><i>Nombres</i></label>
                    <input class="form-control" type="text" name="txtNombre" required><br><br>
                    <input class="btn btn-primary btn-lg btn-block font-weight-bold" type="submit" name="accion" value="Agregar"><br>
                </form>
            </div>
        </div>
    </body>
</html>
