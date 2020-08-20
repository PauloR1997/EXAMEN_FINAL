
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Persona</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center"><font color="white">EDITAR PERSONA</font></h2>
            <%
                PersonaDAO personaDAO = new PersonaDAO();
                int s_idpersona = Integer.valueOf(request.getParameter("f_idpersona"));
                Persona persona = (Persona)personaDAO.buscarpersona(s_idpersona);                
            %>
            <form name="EditarPersonasForm" action="Controlador" method="get">
                <table  class="table">
                    <tbody>
                        <tr>
                            <td class="text-right"><font color="white">Nombre: </font></td>
                            <td><input type="text" name="f_nombre" value="<% out.print(persona.getNombre()); %>" maxlength="30" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">Apellidos: </font></td>
                            <td><input type="text" name="f_apellidos" value="<% out.print(persona.getApellidos()); %>" maxlength="40" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">DNI: </font> </td>
                            <td><input type="text" name="f_dni" value="<% out.print(persona.getDni()); %>" maxlength="8" size="8" /></td>
                        </tr>
                        <tr>
                            <td class="text-right"><font color="white">Dirección: </font></td>
                            <td><input type="text" name="f_direccion" value="<% out.print(persona.getDireccion()); %>" maxlength="12" size="12" /></td>
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
                                <input class="btn-primary" type="submit" name="editar" value="Editar Persona" />
                                <input type="hidden" name="f_accion" value="editarpersona02" />
                                <input type="hidden" name="f_idpersona" value="<% out.print(persona.getIdpersona()); %>" />
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
            
        </div>
    </body>
</html>
