
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Sugerencia</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center"><font color="white">AGREGAR Sugerencia</font></h2>
            <form name="AgregarSugerenciasForm" action="Controlador" method="get">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="text-right"><font color="white">Fecha </font></td>
                            <td><input  type="text" name="f_fecha" value="" maxlength="20" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">Descripcion: </font></td>
                            <td><input  type="text" name="f_descripcion" value="" maxlength="300" size="300" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">IDPersona: </font></td>
                            <td><input  type="text" name="f_idpersona" value="" maxlength="2" size="2" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">IDRol: </font></td>
                            <td><input  type="text" name="f_idrol" value="" maxlength="2" size="2" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">IDArea: </font></td>
                            <td><input  type="text" name="f_idarea" value="" maxlength="2" size="2" /></td>
                        </tr>
              
                        <tr>
                            <td class="text-center" colspan="2">
                                <input class="btn-primary" type="submit" name="agregar" value="Agregar Sugerencia" />
                                <input type="hidden" name="f_accion" value="agregarsugerencia02" />
                            </td>
                        </tr>
                        </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
