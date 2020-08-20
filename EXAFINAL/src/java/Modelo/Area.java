
package Modelo;


public class Area {
    private int idarea;
    private String nombre;
    private String estado;

    public Area() {
    }

    public Area(int idarea, String nombre, String estado) {
        this.idarea = idarea;
        this.nombre = nombre;
        this.estado = estado;
    }

    public int getIdarea() {
        return idarea;
    }

    public void setIdarea(int idarea) {
        this.idarea = idarea;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    
    
}
