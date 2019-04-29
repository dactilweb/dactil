/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Manu
 */
public class UsuariosDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    private String sql;

    public UsuariosDAO() {
    }
 public boolean recuperarpersona(Usuarios usuarios){
       // Administrador administrador =new Administrador();
        String email = usuarios.getEmail_cliente();
        String password = usuarios.getContrasena_cliente();
        
        try {
    Statement st = cn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from tbl_clientes where email_cliente='" + email + "' and contrasena_cliente='" + password + "'");
    if (rs.next()) {
        usuarios.setNivel(rs.getInt("nivel"));
        usuarios.setNombre_cliente(rs.getString("nombre_cliente"));
        usuarios.setApellido_cliente(rs.getString("apellido_cliente"));
        usuarios.setApellido2_cliente(rs.getString("apellido2_cliente"));
        usuarios.setDireccion_cliente(rs.getString("direccion_cliente"));
         usuarios.setDireccion2_cliente(rs.getString("direccion2_cliente"));
          usuarios.setTelefono_cliente(rs.getInt("telefono_cliente"));
           usuarios.setEmail_cliente(rs.getString("email_cliente"));
      return true;
    } else {
       return false;
    }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return false;
        }
   
        
        
    }
 
  public void nuevoUsuario(Usuarios usuarios) throws SQLException{
     
       // Administrador administrador =new Administrador();
        sql= "INSERT INTO `tbl_clientes` (`nombre_cliente`,`apellido_cliente`,`apellido2_cliente`,`direccion_cliente`,`direccion2_cliente`,`telefono_cliente`,`email_cliente`,`contrasena_cliente`) VALUES (?,?,?,?,?,?,?,?)";
        try {
            cn.setAutoCommit(false);
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, usuarios.getNombre_cliente());
            pst.setString(2, usuarios.getApellido_cliente());
            pst.setString(3, usuarios.getApellido2_cliente());
            pst.setString(4, usuarios.getDireccion_cliente());
            pst.setString(5, usuarios.getDireccion2_cliente());
            pst.setInt(6, usuarios.getTelefono_cliente());
            pst.setString(7, usuarios.getEmail_cliente());
            pst.setString(8, usuarios.getContrasena_cliente());
            
           int n = pst.executeUpdate();
           cn.commit();
        } catch (Exception e) {
            cn.rollback();
            JOptionPane.showMessageDialog(null, e);
            
        }
   
        
        
    }

}
