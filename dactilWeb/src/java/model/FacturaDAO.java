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
public class FacturaDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    private String sql;

    public FacturaDAO() {
    }
    public void getListaPedidos (ArrayList<Factura> listaFactura){
        sql= "SELECT * FROM tbl_facturas";
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            listaFactura.clear();
            
            while(rs.next()){
                Factura factura = new Factura();
                factura.setId_factura(rs.getInt(""));
                producto.setProd_id(rs.getInt("prod_id"));
                int id = rs.getInt("prod_id");
                producto.setProd_nom(rs.getString("prod_nom"));
                producto.setProd_foto(rs.getString("prod_foto"));
                producto.setSerie_id(rs.getInt("serie_id"));
                 int id_serie = rs.getInt("serie_id");
                producto.setProd_descripcio(rs.getString("prod_descripcio"));
                producto.setProd_descompte(rs.getInt("prod_descompte"));
                producto.setProd_preu(rs.getInt("prod_preu"));
                 
                calculo= rs.getInt("prod_preu")*rs.getInt("prod_descompte");
                precio= calculo/100;
                tot= rs.getInt("prod_preu")-precio;
                producto.setProd_preu_final(tot);
              //query stock
                String sql2 = "SELECT * FROM tbl_estoc WHERE prod_id="+id;
                try {
                     Statement sta=cn.createStatement();
                    ResultSet rsa=sta.executeQuery(sql2);
                    while(rsa.next()){
                        id_lugar=rsa.getInt("lloc_id");
                    producto.setProd_stock(rsa.getInt("cantidad"));
                          }
                     rsa.close();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(null, ex);
                    }
                //query ver la serie de productos
                String sql3 = "SELECT * FROM tbl_serie WHERE serie_id="+id_serie;
                try {
                     Statement stb=cn.createStatement();
                    ResultSet rsb=stb.executeQuery(sql3);
                    while(rsb.next()){
                    producto.setProd_serie(rsb.getString("serie_nom"));
                    producto.setCat_id(rsb.getInt("categoria_id"));
                    id_cat = rsb.getInt("categoria_id");
                          }
                     rsb.close();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(null, ex);
                    }
                //query ver la categoria de productos
                String sql4 = "SELECT * FROM tbl_categoria WHERE categoria_id="+id_cat;
               
                try {
                     Statement stc=cn.createStatement();
                    ResultSet rsc=stc.executeQuery(sql4);
                    while(rsc.next()){
                    producto.setProd_categoria(rsc.getString("categoria_nom"));
                   
                          }
                     rsc.close();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(null, ex);
                    }
                 //query ver lugar de productos
                String sql5 = "SELECT * FROM tbl_lloc WHERE lloc_id="+id_lugar;
                
                try {
                    Statement std=cn.createStatement();
                    ResultSet rsd=std.executeQuery(sql5);
                    while(rsd.next()){
                        String lugar=rsd.getString("num_bloc")+" , "+rsd.getString("num_passadis")+" , "+rsd.getString("num_lleixa");
                    producto.setProd_ubicacion(lugar);
                   
                          }
                     rsd.close();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(null, ex);
                    }
               listaProducto.add(producto);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }
 

}
