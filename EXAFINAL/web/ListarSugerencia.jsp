<%@page import="Config.bd.ConectaBd"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Sugerencia"%>
<%@page import="ModeloDAO.SugerenciaDAO"%>
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
        <title>Listar Sugerencias</title>
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
            <h2 class="text-center"><font color="white">LISTA DE SUGERENCIAS</font></h2>
            <a class="btn btn-success" href="Controlador?f_accion=agregarsugerencia01">Agregar Sugerencia</a>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Nro</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Persona</th>
                        <th class="text-center">Rol</th>
                        <th class="text-center">Area</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            SugerenciaDAO SugerenciaDAO = new SugerenciaDAO();
                        List<Sugerencia> sugerencias = SugerenciaDAO.listasugerencia();
                        Iterator<Sugerencia> iterator = sugerencias.iterator();
                        
                        Sugerencia sugerencia = null;
                        
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        int num=1;  
                        while (iterator.hasNext()) {
                            sugerencia = iterator.next();
                            
                    consulta = " select fecha,  "
                                + " from sugerencia "
                                + " where"
                                + " idrol = " + ide + "; ";
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                           
                      
                    
                    %>
                    
                    
                     <tr>
                        <td><% out.print(sugerencia.getIdsugerencia()); %></td>
                        <td><% out.print(sugerencia.getFecha()); %></td>
                        <td><% out.print(sugerencia.getDescripcion()); %></td>
                        <td><% out.print(sugerencia.getIdpersona()); %></td>
                        <td><% out.print(sugerencia.getIdrol()); %></td>
                        <td><% out.print(sugerencia.getIdarea()); %></td>
                        <td>
                            <a class="btn btn-warning" href="ControladorSugerencia?f_accion=editarsugerencia01&f_idsugerencia=<% out.print(sugerencia.getIdsugerencia()); %>">
                                Editar
                            </a>
                            <a class="btn btn-danger" href="ControladorSugerencia?f_accion=eliminarsugerencia&f_idsugerencia=<% out.print(sugerencia.getIdsugerencia()); %>">
                                Eliminar
                            </a>
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
