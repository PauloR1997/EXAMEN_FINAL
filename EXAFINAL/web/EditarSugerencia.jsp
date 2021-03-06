
<%@page import="Modelo.Sugerencia"%>
<%@page import="ModeloDAO.SugerenciaDAO"%>
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
            <h2 class="text-center"><font color="white">EDITAR SUGERENCIA</font></h2>
            <%
                SugerenciaDAO sugerenciaDAO = new SugerenciaDAO();
                int s_idsugerencia = Integer.valueOf(request.getParameter("f_idsugerencia"));
                Sugerencia sugerencia = (Sugerencia)sugerenciaDAO.buscarsugerencia(s_idsugerencia);                
            %>
            <form name="EditarSugerenciaForm" action="Controlador" method="get">
                <table  class="table">
                    <tbody>
                        <tr>
                            <td class="text-right"><font color="white">Fecha: </font></td>
                            <td><input type="text" name="f_fecha" value="<% out.print(sugerencia.getFecha()); %>" maxlength="30" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">Descripcion: </font></td>
                            <td><input type="text" name="f_descripcion" value="<% out.print(sugerencia.getDescripcion()); %>" maxlength="300" size="300" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">IDPersona: </font></td>
                            <td><input type="text" name="f_idpersona" value="<% out.print(sugerencia.getIdpersona()); %>" maxlength="2" size="2" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">IDRol: </font></td>
                            <td><input type="text" name="f_idrol" value="<% out.print(sugerencia.getIdrol()); %>" maxlength="2" size="2" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">IDArea: </font></td>
                            <td><input type="text" name="f_idarea" value="<% out.print(sugerencia.getIdarea()); %>" maxlength="2" size="2" /></td>
                        </tr>
         
                        <tr>
                            <td class="text-center" colspan="2">
                                <input class="btn-primary" type="submit" name="editar" value="Editar Sugerencia" />
                                <input type="hidden" name="f_accion" value="editarsugerencia02" />
                                <input type="hidden" name="f_idsugerencia" value="<% out.print(sugerencia.getIdsugerencia()); %>" />
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
