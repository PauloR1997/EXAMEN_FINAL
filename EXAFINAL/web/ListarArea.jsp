
<%@page import="Config.bd.ConectaBd"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Area"%>
<%@page import="ModeloDAO.AreaDAO"%>
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
            <h2 class="text-center"><font color="white">LISTA DE ÁREAS</font></h2>
            <a class="btn btn-success" href="Controlador?f_accion=agregararea01">Agregar Area</a>
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
                            AreaDAO AreaDAO = new AreaDAO();
                        List<Area> areas = AreaDAO.listaarea();
                        Iterator<Area> iterator = areas.iterator();
                        
                        Area area = null;
                        
                                ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        int num=1;  
                        while (iterator.hasNext()) {
                            area = iterator.next();
                            
                           String ide =  String.valueOf(area.getIdarea());
                    consulta = " select idarea  "
                                + " from sugerencia "
                                + " where"
                                + " idarea = " + ide + "; ";
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                           
                      
                    
                    %>
                    <tr>
                        <td class="text-center"><% out.print(num); %></td>
                        <td><% out.print(area.getNombre()); %></td>
                        <td class="text-center"><% out.print(area.getEstado()); %></td>                        
                        <td class="text-center">
                            
                            <a class="btn btn-warning" href="Controlador?f_accion=editararea01&f_idarea=<% out.print(area.getIdarea()); %>">Editar</a>
                            <%
                            if (rs.next()) {
                                %>
                                <a class="btn btn-danger" disabled>Eliminar</a>
                                <%
                            }
                        else{                           
                                %>
                                 <a class="btn btn-danger" href="Controlador?f_accion=eliminararea&f_idarea=<% out.print(area.getIdarea()); %>">Eliminar</a>
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
