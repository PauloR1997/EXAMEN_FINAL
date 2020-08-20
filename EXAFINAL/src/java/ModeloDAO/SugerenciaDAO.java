
package ModeloDAO;


import Config.bd.ConectaBd;
import Interfaces.CRUDSugerencia;
import Modelo.Sugerencia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SugerenciaDAO implements CRUDSugerencia{
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Sugerencia p = new Sugerencia();

    @Override
    public List listasugerencia() {
        ArrayList<Sugerencia> sugerencias = new ArrayList<>();
        String consulta = " select * "
                        + " from sugerencia ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                Sugerencia sugerencia = new Sugerencia();
               
                sugerencia.setIdsugerencia(rs.getInt("idsugerencia"));
                sugerencia.setFecha(rs.getString("fecha"));
                sugerencia.setDescripcion(rs.getString("descripcion"));
                sugerencia.setIdpersona(rs.getInt("idpersona"));
                sugerencia.setIdrol(rs.getInt("idrol"));
                sugerencia.setIdarea(rs.getInt("idarea"));
                
                sugerencias.add(sugerencia);
            }
        } catch (Exception e) {
        }
        return sugerencias;
    }

    @Override
    public Sugerencia buscarsugerencia(int idSugerencia) {
        String consulta = " Select * "
                        + " from sugerencia  "
                        + " where idsugerencia = "+idSugerencia+" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                p.setIdsugerencia(rs.getInt("idsugerencia"));
                p.setFecha(rs.getString("fecha"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setIdpersona(rs.getInt("idpersona"));
                p.setIdrol(rs.getInt("idrol"));
                p.setIdarea(rs.getInt("idarea"));               
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean agregarsugerencia(Sugerencia sugerencia) {
        String consulta = " insert into sugerencia(fecha, descripcion, idpersona, idrol, idarea) "
                        + " values(  "
                        + "'"+ sugerencia.getFecha() +"',  "
                        + "'"+ sugerencia.getDescripcion()+"',  "
                        + "'"+ sugerencia.getIdpersona()+"',  "
                        + "'"+ sugerencia.getIdrol()+"',  "
                        + "'"+ sugerencia.getIdsugerencia() +"'); ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editarsugerencia(Sugerencia sugerencia) {
         String consulta =   " update sugerencia  "
                        +   " set "
                        +   " fecha = '"+ sugerencia.getFecha() +"',"
                        +   " descripcion = '"+ sugerencia.getDescripcion() +"',"
                        +   " idpersona = '"+ sugerencia.getIdpersona() +"',"
                        +   " idrol = '"+ sugerencia.getIdrol() +"',"
                        +   " idarea = '"+ sugerencia.getIdarea() +"'  "
                        +   " where "
                        +   " idsugerencia = "+ sugerencia.getIdsugerencia() +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarsugerencia(int idsugerencia) {
        String consulta =   " delete from sugerencia "
                        +   " where " 
                        +   " idsugerencia = "+ idsugerencia +" ; ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
        
    }
}
