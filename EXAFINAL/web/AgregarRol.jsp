
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Rol</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center"><font color="white">AGREGAR ROL</font></h2>
            <form name="AgregarRolesForm" action="Controlador" method="get">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="text-right"><font color="white">Nombre: </font></td>
                            <td><input  type="text" name="f_nombre" value="" maxlength="20" size="20" /></td>
                        </tr>
                        <tr>
                    
                            <td class="text-right"><font color="white">Estado: </font></td>
                            <td><select name="f_estado">
                                <option>A</option>
                                <option>D</option>
                             </select></td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">
                                <input class="btn-primary" type="submit" name="agregar" value="Agregar Rol" />
                                <input type="hidden" name="f_accion" value="agregarrol02" />
                            </td>
                        </tr>
                        </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
