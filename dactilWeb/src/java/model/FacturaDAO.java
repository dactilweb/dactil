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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Manu
 */
public class FacturaDAO {

    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    private String sql;
    private String data;
    public FacturaDAO() {
    }

    public void getListaPedidos(ArrayList<Factura> listaFactura) {
        sql = "SELECT tbl_productos.nombre_producto,tbl_facturas.id_cliente,tbl_facturas.estado_factura,tbl_productos.precio_producto, tbl_facturas.fecha_factura,tbl_facturas.id_factura, tbl_lineafactura.cantidad_compra, tbl_clientes.nombre_cliente, tbl_clientes.apellido_cliente\n"
                + "FROM tbl_clientes INNER JOIN tbl_facturas ON tbl_clientes.id_cliente=tbl_facturas.id_cliente INNER JOIN tbl_lineafactura ON tbl_facturas.id_factura=tbl_lineafactura.id_factura INNER JOIN tbl_productos ON tbl_lineafactura.id_producto=tbl_productos.id_producto\n"
                + "WHERE tbl_facturas.estado_factura='en proceso' OR tbl_facturas.estado_factura='completado y enviado' ORDER BY tbl_facturas.id_factura";
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaFactura.clear();
            
            while (rs.next()) {
                Factura factura = new Factura();
                factura.setNombre_producto(rs.getString("nombre_producto"));
                factura.setPrecio_producto(rs.getFloat("precio_producto"));
                factura.setFecha_factura(rs.getString("fecha_factura"));
                factura.setCantidad_compra(rs.getInt("cantidad_compra"));
                factura.setNombre_cliente(rs.getString("nombre_cliente"));
                factura.setApellido_cliente(rs.getString("apellido_cliente"));
                factura.setId_factura(rs.getInt("id_factura"));
                factura.setEstado_factura(rs.getString("estado_factura"));
                factura.setId_cliente(rs.getInt("id_cliente"));
                listaFactura.add(factura);
            }
                rs.close();
        }catch(Exception e){
            
        }
    }
    
public int  crearFactura(int id_cliente) {
     sql = "INSERT INTO `tbl_facturas` (`id_cliente`,`estado_factura`) VALUES (?,?)";
        try {
            Factura factura = new Factura();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id_cliente);
            pst.setString(2, "activo");
            int n = pst.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);

        }
         int id_factura=0;
     sql="select id_factura from tbl_facturas order by id_factura desc limit 1";
   try {
           Statement st = cn.createStatement();
           ResultSet rsz= st.executeQuery(sql);
      rsz.next();
      id_factura= rsz.getInt("id_factura");
      return id_factura;
        } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, ex);
           return 0;
        }
}
public int recuperarIdFactura(int id_cliente){
    sql="SELECT tbl_facturas.id_factura FROM tbl_facturas WHERE tbl_facturas.id_cliente="+id_cliente+" AND estado_factura='activo'";
    try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            int id_facturactual=0;
            while(rs.next()){
               Factura fact=new Factura();
              id_facturactual = rs.getInt("id_factura");
            
            }
              rs.close();
              return id_facturactual;
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        return 0;
        }
   
}
    public void actualizarFactura(int id_cliente, String fechabd) throws SQLException{
            
            sql=" UPDATE tbl_facturas SET fecha_factura='"+fechabd+"', estado_factura=\"en proceso\" WHERE tbl_facturas.id_cliente="+id_cliente+" AND tbl_facturas.estado_factura='activo'";
            try {
                PreparedStatement modificar=cn.prepareStatement(sql);
                int n=modificar.executeUpdate();
            } catch (Exception e) {
            }
        }
    
    public void modificarFactura (Factura factura){
        sql="UPDATE tbl_facturas SET estado_factura='"+factura.getEstado_factura()+"'WHERE id_factura="+factura.getId_factura()+"";
        try {
                PreparedStatement modificar=cn.prepareStatement(sql);
                int n=modificar.executeUpdate();
            } catch (Exception e) {
            }
    }
}

