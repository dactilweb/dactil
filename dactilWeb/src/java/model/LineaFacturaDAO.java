/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Manu
 */
public class LineaFacturaDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    private String sql;
    private String data;
    public void insertarLineaFactura(LineaFactura lineafactura){
       sql = "INSERT INTO `tbl_lineafactura` (`id_factura`,`id_producto`,`cantidad_compra`) VALUES (?,?,?)";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, lineafactura.getId_factura());
            pst.setInt(2,lineafactura.getId_producto());
            pst.setInt(3,lineafactura.getCantidad_compra());
            int n = pst.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);

        }  
    }
    public void getCarrito (int id,ArrayList<ProductoLinea> listaCarrito){
        sql= "SELECT tbl_lineafactura.id_lineafactura, tbl_productos.id_producto,tbl_productos.nombre_producto, tbl_productos.descripcion_producto, tbl_productos.precio_producto, tbl_productos.referencia_producto, tbl_productos.foto_producto, tbl_lineafactura.cantidad_compra\n" +
"FROM tbl_clientes INNER JOIN tbl_facturas ON tbl_clientes.id_cliente=tbl_facturas.id_cliente INNER JOIN tbl_lineafactura ON tbl_lineafactura.id_factura=tbl_facturas.id_factura INNER JOIN tbl_productos ON tbl_lineafactura.id_producto=tbl_productos.id_producto\n" +
"WHERE tbl_facturas.id_cliente="+id+" AND tbl_facturas.estado_factura='activo'";
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            listaCarrito.clear();
            while(rs.next()){
                ProductoLinea productolinea=new ProductoLinea();
               /* usuario.setId_cliente(rs.getInt("id_cliente"));
                usuario.setNombre_cliente(rs.getString("nombre_cliente"));
                */
               productolinea.setNombre_producto(rs.getString("nombre_producto"));
               productolinea.setId_producto(rs.getInt("id_producto"));
               productolinea.setId_lineafactura(rs.getInt("id_lineafactura"));
               productolinea.setCantidad_compra(rs.getInt("cantidad_compra"));
               productolinea.setPrecio_producto(rs.getInt("precio_producto"));
               productolinea.setDescripcion_producto(rs.getString("descripcion_producto"));
               //añadir al arraylit 
               listaCarrito.add(productolinea);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    }
