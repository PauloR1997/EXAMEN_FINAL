/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import Modelo.Persona;
import Modelo.Area;
import Modelo.Rol;
import Modelo.Sugerencia;
import ModeloDAO.PersonaDAO;
import ModeloDAO.AreaDAO;
import ModeloDAO.RolDAO;
import ModeloDAO.SugerenciaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tomy_
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    
    String listarpersona = "ListarPersona.jsp";
    String agregarpersona = "AgregarPersona.jsp";
    String editarpersona = "EditarPersona.jsp";
    
    String listararea = "ListarArea.jsp";
    String agregararea = "AgregarArea.jsp";
    String editararea = "EditarArea.jsp";
    
    String listarrol = "ListarRol.jsp";
    String agregarrol = "AgregarRol.jsp";
    String editarrol = "EditarRol.jsp";
    
    String listarsugerencia = "ListarSugerencia.jsp";
    String agregarsugerencia = "AgregarSugerencia.jsp";
    String editarsugerencia = "EditarSugerencia.jsp";
    
    Persona persona = new Persona();
    PersonaDAO personaDAO = new PersonaDAO();
    
    Area area = new Area();
    AreaDAO areaDAO = new AreaDAO();
    
    Rol rol = new Rol();
    RolDAO rolDAO = new RolDAO();
    
    Sugerencia sugerencia = new Sugerencia();
    SugerenciaDAO sugerenciaDAO = new SugerenciaDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso="";
        //********************************************************************
        String s_accion = request.getParameter("f_accion");
        if (s_accion.equalsIgnoreCase("listarpersona")) {
            acceso = listarpersona;
        }else if (s_accion.equalsIgnoreCase("agregarpersona01")) {
            acceso = agregarpersona;
        }else if(s_accion.equalsIgnoreCase("agregarpersona02")){
            String s_nombre = request.getParameter("f_nombre");
            String s_apellidos = request.getParameter("f_apellidos");
            String s_dni = request.getParameter("f_dni");
            String s_direccion = request.getParameter("f_direccion");
            String s_estado = request.getParameter("f_estado");
            persona.setNombre(s_nombre);
            persona.setApellidos(s_apellidos);
            persona.setDni(s_dni);
            persona.setDireccion(s_direccion);
            persona.setEstado(s_estado);
            personaDAO.agregarpersona(persona);
            acceso = listarpersona;
        }else if (s_accion.equalsIgnoreCase("editarpersona01")) {
            request.setAttribute("f_idpersona", request.getParameter("f_idpersona"));
            acceso = editarpersona;
        }else if (s_accion.equalsIgnoreCase("editarpersona02")) {
            int s_idpersona = Integer.valueOf(request.getParameter("f_idpersona"));
            String s_nombre = request.getParameter("f_nombre");
            String s_apellidos = request.getParameter("f_apellidos");
            String s_dni = request.getParameter("f_dni");
            String s_direccion = request.getParameter("f_direccion");
            String s_estado = request.getParameter("f_estado");
            persona.setIdpersona(s_idpersona);
            persona.setNombre(s_nombre);
            persona.setApellidos(s_apellidos);
            persona.setDni(s_dni);
            persona.setDireccion(s_direccion);
            persona.setEstado(s_estado);
            personaDAO.editarpersona(persona);
            
            acceso = listarpersona;
        }else if (s_accion.equalsIgnoreCase("eliminarpersona")) {
            int s_idpersona = Integer.valueOf(request.getParameter("f_idpersona"));
            personaDAO.eliminarpersona(s_idpersona);
            acceso = listarpersona;
        }
            
        
       //********************************************************************
          
        
        if (s_accion.equalsIgnoreCase("listararea")) {
            acceso = listararea;
        }else if (s_accion.equalsIgnoreCase("agregararea01")) {
            acceso = agregararea;
        }else if(s_accion.equalsIgnoreCase("agregararea02")){
            String s_nombre = request.getParameter("f_nombre");
            String s_estado = request.getParameter("f_estado");
            area.setNombre(s_nombre);
            area.setEstado(s_estado);
            areaDAO.agregararea(area);
            acceso = listararea;
        }else if (s_accion.equalsIgnoreCase("editararea01")) {
            request.setAttribute("f_idarea", request.getParameter("f_idarea"));
            acceso = editararea;
        }else if (s_accion.equalsIgnoreCase("editararea02")) {
            int s_idarea = Integer.valueOf(request.getParameter("f_idarea"));
            String s_nombre = request.getParameter("f_nombre");
            String s_estado = request.getParameter("f_estado");
            area.setIdarea(s_idarea);
            area.setNombre(s_nombre);
            area.setEstado(s_estado);
            areaDAO.editararea(area);
            
            acceso = listararea;
        }else if (s_accion.equalsIgnoreCase("eliminararea")) {
            int s_idarea = Integer.valueOf(request.getParameter("f_idarea"));
            areaDAO.eliminararea(s_idarea);
            acceso = listararea;
        }
        
       //********************************************************************
           
        
        if (s_accion.equalsIgnoreCase("listarrol")) {
            acceso = listarrol;
        }else if (s_accion.equalsIgnoreCase("agregarrol01")) {
            acceso = agregarrol;
        }else if(s_accion.equalsIgnoreCase("agregarrol02")){
            String s_nombre = request.getParameter("f_nombre");
            String s_estado = request.getParameter("f_estado");
            rol.setNombre(s_nombre);
            rol.setEstado(s_estado);
            rolDAO.agregarrol(rol);
            acceso = listarrol;
        }else if (s_accion.equalsIgnoreCase("editarrol01")) {
            request.setAttribute("f_idrol", request.getParameter("f_idrol"));
            acceso = editarrol;
        }else if (s_accion.equalsIgnoreCase("editarrol02")) {
            int s_idrol = Integer.valueOf(request.getParameter("f_idrol"));
            String s_nombre = request.getParameter("f_nombre");
            String s_estado = request.getParameter("f_estado");
            rol.setIdrol(s_idrol);
            rol.setNombre(s_nombre);
            rol.setEstado(s_estado);
            rolDAO.editarrol(rol);
            
            acceso = listarrol;
        }else if (s_accion.equalsIgnoreCase("eliminarrol")) {
            int s_idrol = Integer.valueOf(request.getParameter("f_idrol"));
            rolDAO.eliminarrol(s_idrol);
            acceso = listarrol;
        }
        //********************************************************************
        
         
        if (s_accion.equalsIgnoreCase("listarsugerencia")) {
            acceso = listarsugerencia;
        }else if (s_accion.equalsIgnoreCase("agregarsugerencia01")) {
            acceso = agregarsugerencia;
        }else if(s_accion.equalsIgnoreCase("agregarsugerencia02")){
            String s_fecha = request.getParameter("f_fecha");
            String s_descripcion = request.getParameter("f_descripcion");
            String s_idpersona = request.getParameter("f_idpersona");
            String s_idrol = request.getParameter("f_idrol");
            String s_idarea = request.getParameter("f_idarea");
            sugerencia.setFecha(s_fecha);
            sugerencia.setDescripcion(s_descripcion);
            sugerencia.setIdpersona(s_idpersona);
            sugerencia.setIdrol(s_idrol);
            sugerencia.setIdarea(s_idarea);
            sugerenciaDAO.agregarsugerencia(sugerencia);
            acceso = listarsugerencia;
        }else if (s_accion.equalsIgnoreCase("editarsugerencia01")) {
            request.setAttribute("f_idsugerencia", request.getParameter("f_idsugerencia"));
            acceso = editarsugerencia;
        }else if (s_accion.equalsIgnoreCase("editarsugerencia02")) {
            int s_idsugerencia = Integer.valueOf(request.getParameter("f_idsugerencia"));
            String s_fecha = request.getParameter("f_fecha");
            String s_descripcion = request.getParameter("f_descripcion");
            String s_idpersona = request.getParameter("f_idpersona");
            String s_idrol = request.getParameter("f_idrol");
            String s_idarea = request.getParameter("f_idarea");
            
            sugerencia.setFecha(s_fecha);
            sugerencia.setDescripcion(s_descripcion);
            sugerencia.setIdpersona(s_idsugerencia);
            sugerencia.setIdrol(s_idsugerencia);
            sugerencia.setIdarea(s_idsugerencia);
            sugerenciaDAO.editarsugerencia(sugerencia);
            
            acceso = listarsugerencia;
        }else if (s_accion.equalsIgnoreCase("eliminarsugerencia")) {
            int s_idsugerencia = Integer.valueOf(request.getParameter("f_idsugerencia"));
            sugerenciaDAO.eliminarsugerencia(s_idsugerencia);
            acceso = listarsugerencia;
        }
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
