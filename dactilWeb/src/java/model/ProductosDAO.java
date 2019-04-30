/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Manu
 */
public class ProductosDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    private String sql;

    public ProductosDAO() {
    }
    
     public void nuevoProducto(Productos productos) throws SQLException {

        // Administrador administrador =new Administrador();
        sql = "INSERT INTO `tbl_productos` (`nombre_producto`,`descripcion_producto`,`cantidad_producto`,`precio_producto`,`foto_producto`) VALUES (?,?,?,?,?)";
        try {
            cn.setAutoCommit(false);
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, productos.getNombre_producto());
            pst.setString(2, productos.getDescripcion_producto());
            pst.setInt(3, productos.getCantidad_producto());
            pst.setInt(4, productos.getPrecio_producto());
            pst.setString(5, productos.getFoto_producto());
            int n = pst.executeUpdate();
            cn.commit();
        } catch (Exception e) {
            cn.rollback();
            JOptionPane.showMessageDialog(null, e);

        }

    }
         public void eliminarProducto(int id) throws SQLException {

        sql="UPDATE `tbl_productos` SET `disponibilidad_producto`= 2 WHERE id_producto="+id;
            try {
                PreparedStatement eliminar=cn.prepareStatement(sql);
                int n=eliminar.executeUpdate();
            } catch (Exception e) {
            }

    }
         public void getListaProductos (ArrayList<Productos> listaProductos){
        sql= "SELECT * FROM tbl_productos";
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            listaProductos.clear();
           
            while(rs.next()){
                Productos producto = new Productos();
                producto.setId_producto(rs.getInt("id_producto"));
                producto.setNombre_producto(rs.getString("nombre_producto"));
                producto.setDescripcion_producto(rs.getString("descripcion_producto"));
                producto.setCantidad_producto(rs.getInt("cantidad_producto"));
                producto.setPrecio_producto(rs.getInt("precio_producto"));
                producto.setDisponibilidad_producto(rs.getInt("disponibilidad_producto"));
                if(rs.getInt("disponibilidad_producto")==1){
                producto.setDisp_prod("Si");
                }else{
                    producto.setDisp_prod("No");
                }
              
                producto.setReferencia_producto(rs.getString("referencia_producto"));
                
                producto.setFoto_producto(rs.getString("foto_producto"));
               listaProductos.add(producto);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
}


