<%@page import="Config.bd.ConectaBd"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Rol"%>
<%@page import="ModeloDAO.RolDAO"%>
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
        <title>Listar Areas</title>
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
            <h2 class="text-center"><font color="white">LISTA DE ROLES</font></h2>
            <a class="btn btn-success" href="Controlador?f_accion=agregarrol01">Agregar Rol</a>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Nro</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            RolDAO RolDAO = new RolDAO();
                        List<Rol> roles = RolDAO.listarol();
                        Iterator<Rol> iterator = roles.iterator();
                        
                        Rol rol = null;
                        
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        int num=1;  
                        while (iterator.hasNext()) {
                            rol = iterator.next();
                            
                           String ide =  String.valueOf(rol.getIdrol());
                    consulta = " select idrol  "
                                + " from sugerencia "
                                + " where"
                                + " idrol = " + ide + "; ";
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                           
                      
                    
                    %>
                    <tr>
                        <td class="text-center"><% out.print(num); %></td>
                        <td><% out.print(rol.getNombre()); %></td>
                        <td class="text-center"><% out.print(rol.getEstado()); %></td>                        
                        <td class="text-center">
                            
                            <a class="btn btn-warning" href="Controlador?f_accion=editarrol01&f_idrol=<% out.print(rol.getIdrol()); %>">Editar</a>
                            <%
                            if (rs.next()) {
                                %>
                                <a class="btn btn-danger" disabled>Eliminar</a>
                                <%
                            }
                        else{                           
                                %>
                                 <a class="btn btn-danger" href="Controlador?f_accion=eliminarrol&f_idrol=<% out.print(rol.getIdrol()); %>">Eliminar</a>
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
