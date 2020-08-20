
<%@page import="Config.bd.ConectaBd"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%!
         String ide;
         String consulta;
         PreparedStatement pst;
         ResultSet rs;
         Connection cn;
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Personas</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <div class="container">
            <table border="0" align="center">
                <thead>                    
                </thead>
                <tbody>
                    <tr>
                        <td> <a class="btn btn-success btn-lg" href="Controlador?f_accion=listarpersona">Listar Personas </a> </td>
                        <td> <a class="btn btn-success btn-lg" href="Controlador?f_accion=listarrol">Listar Roles </a> </td>
                        <td> <a class="btn btn-success btn-lg" href="Controlador?f_accion=listararea">Listar Áreas </a> </td>
                        <td> <a class="btn btn-success btn-lg" href="Controlador?f_accion=listarsugerencia">Listar Sugerencias </a> </td>
                    </tr>
                </tbody>
            </table>

                      
        </div>
    <body><font color="white">
        <div class="container">
            <h2 class="text-center"><font color="white">LISTA DE PERSONAS</font></h2>
            <a class="btn btn-success" href="Controlador?f_accion=agregarpersona01">Agregar Persona</a>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Nro</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Apellidos</th>
                        <th class="text-center">DNI</th>
                        <th class="text-center">Dirección</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            PersonaDAO personaDAO = new PersonaDAO();
                        List<Persona> personas = personaDAO.listapersona();
                        Iterator<Persona> iterator = personas.iterator();
                        
                        Persona persona = null;
                        
                                ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        int num=1;  
                        while (iterator.hasNext()) {
                            persona = iterator.next();
                            
                           String ide =  String.valueOf(persona.getIdpersona());
                    consulta = " select idpersona  "
                                + " from sugerencia "
                                + " where"
                                + " idpersona = " + ide + "; ";
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                           
                      
                    
                    %>
                    <tr>
                        <td class="text-center"><% out.print(num); %></td>
                        <td><% out.print(persona.getNombre()); %></td>
                        <td><% out.print(persona.getApellidos()); %></td>
                        <td class="text-center"><% out.print(persona.getDni()); %></td>
                        <td><% out.print(persona.getDireccion()); %></td>
                        <td class="text-center"><% out.print(persona.getEstado()); %></td>                        
                        <td class="text-center">
                            
                            <a class="btn btn-warning" href="Controlador?f_accion=editarpersona01&f_idpersona=<% out.print(persona.getIdpersona()); %>">Editar</a>
                            <%
                            if (rs.next()) {
                                %>
                                <a class="btn btn-danger" disabled>Eliminar</a>
                                <%
                            }
                        else{                           
                                %>
                                 <a class="btn btn-danger" href="Controlador?f_accion=eliminarpersona&f_idpersona=<% out.print(persona.getIdpersona()); %>">Eliminar</a>
                                <%
                                
                            }
                            %>     
                        </td>
                        </tr>
                    <%  num++;
                        }                      
                            } catch (Exception e) {
                                out.println("Error sql");
                            }
                    %>
                        
                </tbody>
            </table>

        </div></font>
    </body>
</html>
