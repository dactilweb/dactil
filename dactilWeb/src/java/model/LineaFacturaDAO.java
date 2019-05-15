/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
    }
