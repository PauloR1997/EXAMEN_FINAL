
<%@page import="Modelo.Area"%>
<%@page import="ModeloDAO.AreaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Area</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center"><font color="white">EDITAR ÁREA</font></h2>
            <%
                AreaDAO areaDAO = new AreaDAO();
                int s_idarea = Integer.valueOf(request.getParameter("f_idarea"));
                Area area = (Area)areaDAO.buscararea(s_idarea);                
            %>
            <form name="EditarAreasForm" action="Controlador" method="get">
                <table  class="table">
                    <tbody>
                        <tr>
                            <td class="text-right"><font color="white">Nombre: </font></td>
                            <td><input type="text" name="f_nombre" value="<% out.print(area.getNombre()); %>" maxlength="30" size="20" /></td>
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
                                <input class="btn-primary" type="submit" name="editar" value="Editar Area" />
                                <input type="hidden" name="f_accion" value="editararea02" />
                                <input type="hidden" name="f_idarea" value="<% out.print(area.getIdarea()); %>" />
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
