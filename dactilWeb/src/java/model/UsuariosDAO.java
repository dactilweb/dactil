/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.DactilController;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public boolean recuperarpersona(Usuarios usuarios) {
        // Administrador administrador =new Administrador();
        String email = usuarios.getEmail_cliente();
        String password = usuarios.getContrasena_cliente();

        try {
            Statement st = cn.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from tbl_clientes where email_cliente='" + email + "' and contrasena_cliente='" + password + "' and nivel=1 OR nivel=2");
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

    public void nuevoUsuario(Usuarios usuarios) throws SQLException {

        // Administrador administrador =new Administrador();
        sql = "INSERT INTO `tbl_clientes` (`nombre_cliente`,`apellido_cliente`,`apellido2_cliente`,`direccion_cliente`,`direccion2_cliente`,`telefono_cliente`,`email_cliente`,`contrasena_cliente`) VALUES (?,?,?,?,?,?,?,?)";
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
    //prueba
    
    
    public void getListaUsuarios (ArrayList<Usuarios> listaUsuarios){
        sql= "SELECT * FROM tbl_clientes WHERE nivel=1 OR nivel=2";
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            listaUsuarios.clear();
            while(rs.next()){
                Usuarios usuario = new Usuarios();
                usuario.setId_cliente(rs.getInt("id_cliente"));
                usuario.setNombre_cliente(rs.getString("nombre_cliente"));
                usuario.setApellido_cliente(rs.getString("apellido_cliente"));
                usuario.setApellido2_cliente(rs.getString("apellido2_cliente"));
                usuario.setDireccion_cliente(rs.getString("direccion_cliente"));
                usuario.setDireccion2_cliente(rs.getString("direccion2_cliente"));
                usuario.setEmail_cliente(rs.getString("email_cliente"));
                usuario.setTelefono_cliente(rs.getInt("telefono_cliente"));             
                usuario.setNivel(rs.getInt("nivel"));
               listaUsuarios.add(usuario);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    

    public void eliminarPersona(int id) throws SQLException {

         sql="UPDATE `tbl_clientes` SET `nivel`=3 WHERE id_cliente="+id;
            try {
                PreparedStatement modificar=cn.prepareStatement(sql);
                int n=modificar.executeUpdate();
            } catch (Exception e) {
            }
        

    }
    
    
    public Usuarios getUsuario (int id){
        Usuarios usuario = new Usuarios();
        sql= "SELECT * FROM tbl_clientes WHERE id_cliente="+id;
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            while(rs.next()){
                usuario.setId_cliente(rs.getInt("id_cliente"));
                usuario.setNombre_cliente(rs.getString("nombre_cliente"));
                usuario.setApellido_cliente(rs.getString("apellido_cliente"));
                usuario.setApellido2_cliente(rs.getString("apellido2_cliente"));
                usuario.setDireccion_cliente(rs.getString("direccion_cliente"));
                usuario.setDireccion2_cliente(rs.getString("direccion2_cliente"));
                usuario.setEmail_cliente(rs.getString("email_cliente"));
                usuario.setTelefono_cliente(rs.getInt("telefono_cliente"));     
                usuario.setNivel(rs.getInt("nivel"));     
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return usuario;
    }
        public void modificarUsuarios(Usuarios usuarios) throws SQLException{
            
            sql="UPDATE `tbl_clientes` SET `nombre_cliente`='"+usuarios.getNombre_cliente()+"' ,`apellido_cliente`='"+usuarios.getApellido_cliente()+"' , `apellido2_cliente`='"+usuarios.getApellido2_cliente()+"' , `direccion_cliente`='"+usuarios.getDireccion_cliente()+"' , `direccion2_cliente`='"+usuarios.getDireccion2_cliente()+"' , `telefono_cliente`='"+usuarios.getTelefono_cliente()+"' , `email_cliente`='"+usuarios.getEmail_cliente()+"', `nivel`='"+usuarios.getNivel()+"' WHERE id_cliente="+usuarios.getId_cliente();
            try {
                PreparedStatement modificar=cn.prepareStatement(sql);
                int n=modificar.executeUpdate();
            } catch (Exception e) {
            }
        }
        public void getListaUsuariosAll (ArrayList<Usuarios> listaUsuarios){
        sql= "SELECT * FROM tbl_clientes WHERE nivel=3";
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            listaUsuarios.clear();
            while(rs.next()){
                Usuarios usuario = new Usuarios();
                usuario.setId_cliente(rs.getInt("id_cliente"));
                usuario.setNombre_cliente(rs.getString("nombre_cliente"));
                usuario.setApellido_cliente(rs.getString("apellido_cliente"));
                usuario.setApellido2_cliente(rs.getString("apellido2_cliente"));
                usuario.setDireccion_cliente(rs.getString("direccion_cliente"));
                usuario.setDireccion2_cliente(rs.getString("direccion2_cliente"));
                usuario.setEmail_cliente(rs.getString("email_cliente"));
                usuario.setTelefono_cliente(rs.getInt("telefono_cliente"));             
   
               listaUsuarios.add(usuario);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
            public void habilitarUser(int id) throws SQLException {

         sql="UPDATE `tbl_clientes` SET `nivel`=2 WHERE id_cliente="+id;
            try {
                PreparedStatement modificar=cn.prepareStatement(sql);
                int n=modificar.executeUpdate();
            } catch (Exception e) {
            }
        

    }
}
