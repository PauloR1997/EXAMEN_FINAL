package Interfaces;

import Modelo.Area;
import java.util.List;



public interface CRUDArea {
    public List listaarea();
    public Area buscararea(int idarea);
    public boolean agregararea(Area area);
    public boolean editararea(Area area);
    public boolean eliminararea(int idarea);
    
}
