package Interfaces;

import Modelo.Rol;
import java.util.List;



public interface CRUDRol {
    public List listarol();
    public Rol buscarol(int idarol);
    public boolean agregarrol(Rol rol);
    public boolean editarrol(Rol rol);
    public boolean eliminarrol(int idrol);
    
}
