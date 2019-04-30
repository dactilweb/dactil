/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
}


