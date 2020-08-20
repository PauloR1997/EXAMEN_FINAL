package Interfaces;

import Modelo.Persona;

import java.util.List;



public interface CRUD {
    public List listapersona();
    public Persona buscarpersona(int idpersona);
    public boolean agregarpersona(Persona persona);
    public boolean editarpersona(Persona persona);
    public boolean eliminarpersona(int idpersona);
    
 
}
