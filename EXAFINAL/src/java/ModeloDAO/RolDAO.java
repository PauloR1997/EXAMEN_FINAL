
package ModeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUDRol;
import Modelo.Rol;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RolDAO implements CRUDRol{
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Rol p = new Rol();

    @Override
    public List listarol() {
        ArrayList<Rol> roles = new ArrayList<>();
        String consulta = " select * "
                        + " from rol ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                Rol rol = new Rol();
               
                rol.setIdrol(rs.getInt("idrol"));
                rol.setNombre(rs.getString("nombre"));
                rol.setEstado(rs.getString("estado"));
                
                roles.add(rol);
            }
        } catch (Exception e) {
        }
        return roles;
    }

    @Override
    public Rol buscarol(int idrol) {
        String consulta = " Select * "
                        + " from rol  "
                        + " where idrol = "+idrol+" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                p.setIdrol(rs.getInt("idrol"));
                p.setNombre(rs.getString("nombre"));
                p.setEstado(rs.getString("estado"));                
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean agregarrol(Rol rol) {
        String consulta = " insert into rol(nombre, estado) "
                        + " values(  "
                        + "'"+ rol.getNombre() +"',  "
                        + "'"+ rol.getEstado() +"'); ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editarrol(Rol rol) {
         String consulta =   " update rol  "
                        +   " set "
                        +   " nombre = '"+ rol.getNombre() +"',"
                        +   " estado = '"+ rol.getEstado() +"'  "
                        +   " where "
                        +   " idaol = "+ rol.getIdrol() +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarrol(int idrol) {
        String consulta =   " delete from rol "
                        +   " where " 
                        +   " idrol = "+ idrol +" ; ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
        
    }
}
