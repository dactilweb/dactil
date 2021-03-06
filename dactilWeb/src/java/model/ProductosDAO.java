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
         
        if(productos.getCantidad_producto()>0){
            productos.setDisponibilidad_producto(1);
        }else{
            productos.setDisponibilidad_producto(2);
        }
        // Administrador administrador =new Administrador();
        sql = "INSERT INTO `tbl_productos` (`nombre_producto`,`descripcion_producto`,`cantidad_producto`,`precio_producto`,`foto_producto`,`referencia_producto`,`disponibilidad_producto`,`id_subcategoria`) VALUES (?,?,?,?,?,?,?,?)";
        try {
            cn.setAutoCommit(false);
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, productos.getNombre_producto());
            pst.setString(2, productos.getDescripcion_producto());
            pst.setInt(3, productos.getCantidad_producto());
            pst.setDouble(4, productos.getPrecio_producto());
            pst.setString(5, productos.getFoto_producto());
            pst.setString(6, productos.getReferencia_producto());
            pst.setInt(7, productos.getDisponibilidad_producto());
            pst.setInt(8, productos.getId_subcategoria());
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
         public void getListaProductos (ArrayList<Productos> listaProductos,String apartado){
        
        if(apartado.equals("interior")){
              sql= "SELECT * FROM tbl_productos INNER JOIN tbl_subcategoria ON tbl_productos.id_subcategoria=tbl_subcategoria.id_subcategoria INNER JOIN tbl_categoria ON tbl_subcategoria.id_categoria=tbl_categoria.id_categoria WHERE tbl_categoria.id_categoria=1 AND `disponibilidad_producto`=1";

        }
        if(apartado.equals("exterior")){
              sql= "SELECT * FROM tbl_productos INNER JOIN tbl_subcategoria ON tbl_productos.id_subcategoria=tbl_subcategoria.id_subcategoria INNER JOIN tbl_categoria ON tbl_subcategoria.id_categoria=tbl_categoria.id_categoria WHERE tbl_categoria.id_categoria=2  AND `disponibilidad_producto`=1";

        }
        if(apartado.equals("inicio")){
            sql= "SELECT * FROM tbl_productos WHERE `disponibilidad_producto`=1";
        }
        if(apartado.equals("piscinas")){
              sql= "SELECT * FROM tbl_productos INNER JOIN tbl_subcategoria ON tbl_productos.id_subcategoria=tbl_subcategoria.id_subcategoria INNER JOIN tbl_categoria ON tbl_subcategoria.id_categoria=tbl_categoria.id_categoria WHERE tbl_categoria.id_categoria=3  AND `disponibilidad_producto`=1";

        }
        if(apartado.equals("bombillasled")){
            sql= "SELECT * FROM tbl_productos WHERE `id_subcategoria`=1  AND `disponibilidad_producto`=1";

        }
        if(apartado.equals("lamparas")){
            sql= "SELECT * FROM tbl_productos WHERE `id_subcategoria`=2  AND `disponibilidad_producto`=1";

        }
        if(apartado.equals("tirasled")){
            sql= "SELECT * FROM tbl_productos WHERE `id_subcategoria`=3  AND `disponibilidad_producto`=1";

        }
        if(apartado.equals("exteriorLed")){
            sql= "SELECT * FROM tbl_productos WHERE `id_subcategoria`=4  AND `disponibilidad_producto`=1";

        }if(apartado.equals("exteriorFocos")){
            sql= "SELECT * FROM tbl_productos WHERE `id_subcategoria`=5  AND `disponibilidad_producto`=1";

        }if(apartado.equals("exteriorApliques")){
            sql= "SELECT * FROM tbl_productos WHERE `id_subcategoria`=6  AND `disponibilidad_producto`=1";

        }
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
                producto.setPrecio_producto(rs.getDouble("precio_producto"));
                producto.setDisponibilidad_producto(rs.getInt("disponibilidad_producto"));
                if(rs.getInt("disponibilidad_producto")==1){
                producto.setDisp_prod("Si");
                }else{
                    producto.setDisp_prod("No");
                }
              
                producto.setReferencia_producto(rs.getString("referencia_producto"));
                
                producto.setFoto_producto(rs.getString("foto_producto"));
                producto.setId_subcategoria(rs.getInt("id_subcategoria"));
               listaProductos.add(producto);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }   
         
          public void getListaProductosAll (ArrayList<Productos> listaProductos){
        sql= "SELECT * FROM tbl_productos WHERE disponibilidad_producto=1 OR disponibilidad_producto=2";
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
                producto.setPrecio_producto(rs.getDouble("precio_producto"));
                producto.setDisponibilidad_producto(rs.getInt("disponibilidad_producto"));
                if(rs.getInt("disponibilidad_producto")==1){
                producto.setDisp_prod("Si");
                }else{
                    producto.setDisp_prod("No");
                }
              
                producto.setReferencia_producto(rs.getString("referencia_producto"));
                producto.setId_subcategoria(rs.getInt("id_subcategoria"));
                producto.setFoto_producto(rs.getString("foto_producto"));
               listaProductos.add(producto);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }   
        public Productos getProducto (int id){
        Productos productos=new Productos();
        sql="SELECT * FROM tbl_productos WHERE id_producto="+id;
            try {
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){
                    productos.setId_producto(rs.getInt("id_producto"));
                    productos.setNombre_producto(rs.getString("nombre_producto"));
                    productos.setDescripcion_producto(rs.getString("descripcion_producto"));
                    productos.setCantidad_producto(rs.getInt("cantidad_producto"));
                    productos.setPrecio_producto(rs.getDouble("precio_producto"));
                    productos.setFoto_producto(rs.getString("foto_producto"));
                    productos.setReferencia_producto(rs.getString("referencia_producto"));
                    productos.setDisponibilidad_producto(rs.getInt("disponibilidad_producto"));
                    productos.setId_subcategoria(rs.getInt("id_subcategoria"));
                    if(rs.getInt("disponibilidad_producto")==1){
                productos.setDisp_prod("Si");
                }else{
                    productos.setDisp_prod("No");
                }
                }
            } catch (Exception e) {
            }
        return productos;
    }
        
          public void modificarProductos(Productos productos) throws SQLException{
            if(productos.getCantidad_producto()>0){
                productos.setDisponibilidad_producto(1);
            }else{
                productos.setDisponibilidad_producto(2);
            }
            sql="UPDATE `tbl_productos` SET `nombre_producto`='"+productos.getNombre_producto()+"',`descripcion_producto`='"+productos.getDescripcion_producto()+"' ,`cantidad_producto`='"+productos.getCantidad_producto()+"',`precio_producto`='"+productos.getPrecio_producto()+"',`referencia_producto`='"+productos.getReferencia_producto()+"' , `disponibilidad_producto`='"+productos.getDisponibilidad_producto()+"' , `id_subcategoria`='"+productos.getId_subcategoria()+"' WHERE id_producto="+productos.getId_producto();
            try {
                PreparedStatement modificar=cn.prepareStatement(sql);
                int n=modificar.executeUpdate();
            } catch (Exception e) {
            }
        }
          public void eliminarProductoDef(int id) throws SQLException {
             
        sql="UPDATE `tbl_productos` SET `disponibilidad_producto`= 3 WHERE id_producto="+id;
            try {
                PreparedStatement eliminar=cn.prepareStatement(sql);
                int n=eliminar.executeUpdate();
            } catch (Exception e) {
            }

    }
          public void getListaSimilares (ArrayList<Productos> listaSimilares,int id){
        sql= "SELECT * FROM tbl_productos WHERE tbl_productos.id_subcategoria=(SELECT tbl_subcategoria.id_subcategoria FROM tbl_subcategoria INNER JOIN tbl_productos ON tbl_productos.id_subcategoria=tbl_subcategoria.id_subcategoria WHERE tbl_productos.id_producto="+id+") AND id_producto<>"+id;
        
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            listaSimilares.clear();
           
            while(rs.next()){
                Productos productos=new Productos();
                productos.setId_producto(rs.getInt("id_producto"));
                productos.setNombre_producto(rs.getString("nombre_producto"));
                productos.setDescripcion_producto(rs.getString("descripcion_producto"));
                productos.setCantidad_producto(rs.getInt("cantidad_producto"));
                productos.setPrecio_producto(rs.getDouble("precio_producto"));
                productos.setFoto_producto(rs.getString("foto_producto"));
                productos.setReferencia_producto(rs.getString("referencia_producto"));
                productos.setDisponibilidad_producto(rs.getInt("disponibilidad_producto"));
                productos.setId_subcategoria(rs.getInt("id_subcategoria"));
               listaSimilares.add(productos);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    } 
          public void gestionStock (Productos pro){
              if(pro.getCantidad_producto()>0){
                  sql="UPDATE `tbl_productos` SET `cantidad_producto`= "+pro.getCantidad_producto()+" WHERE id_producto="+pro.getId_producto();
              }else{
                  sql="UPDATE `tbl_productos` SET `cantidad_producto`= "+pro.getCantidad_producto()+",`disponibilidad_producto`= 2 WHERE id_producto="+pro.getId_producto();
              }
                
            try {
                PreparedStatement eliminar=cn.prepareStatement(sql);
                int n=eliminar.executeUpdate();
            } catch (Exception e) {
            }
          }
}


