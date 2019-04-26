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

}
