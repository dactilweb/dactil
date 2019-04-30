/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.validation.Valid;
import model.Productos;
import model.ProductosDAO;

import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import model.Usuarios;
import model.UsuariosDAO;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


/**
 *
 * @author Manu
 */
@Controller
@RequestMapping("/")
@SessionAttributes({"nombre"})
public class DactilController {
    ArrayList<Usuarios> listaUsuarios = new ArrayList<Usuarios>();
   @RequestMapping(value="index",method=RequestMethod.GET)
    public String indexController(Model model){
        
        return "index";
    }
    @RequestMapping(value="login",method=RequestMethod.GET)
    public String loginController(Model model){
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "login";
    }
    @RequestMapping(value="login",method=RequestMethod.POST)
    public String recuperarpersona (@ModelAttribute("usuarios") Usuarios usuarios, Model model){
        UsuariosDAO UsuariosDAO= new UsuariosDAO();
        boolean pasar= UsuariosDAO.recuperarpersona(usuarios);
        String nombre =usuarios.getEmail_cliente();
        String password = usuarios.getContrasena_cliente();
        //for(Producte p:listaProducto){
          //  JOptionPane.showMessageDialog(null, p.getProd_nom());
        //}
        if(pasar){
            //entrar como admin
           if(1==usuarios.getNivel()){
               return "panelcontrol";
           }
            return "index";
        }else{
            return "login";
        }
       
    }
    //Acceso a panel de control si eres usuario administrador (1)
    @RequestMapping(value="panelcontrol",method=RequestMethod.GET)
    public String PanelController(Model model){
        
        return "panelcontrol";
    }

    
    @RequestMapping(value="crearUsuario",method=RequestMethod.GET)
    public String crearUsuarioController(Model model){
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "crearUsuario";
    }
@RequestMapping(value="nuevoUsuario",method=RequestMethod.POST)
    public String nuevoUsuario (@Valid @ModelAttribute("usuarios") Usuarios usuarios,BindingResult resultado, Model model) throws SQLException{
        if(resultado.hasErrors()){
            model.addAttribute("usuarios",usuarios);
             return "crearUsuario";
        }else{
             UsuariosDAO usuariosDAO= new UsuariosDAO();
        usuariosDAO.nuevoUsuario(usuarios);
       return "login";
        }
    }
    
     @RequestMapping("logout")
    public String logoutController(SessionStatus cerrarSesion,Model model){
        cerrarSesion.setComplete();
        Usuarios usuarios= new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "index";
    }
       @RequestMapping(value="verUsers",method=RequestMethod.GET)
    public String recuperarUsuarios (Model model){
        UsuariosDAO udao = new UsuariosDAO();
        udao.getListaUsuarios(listaUsuarios);
        model.addAttribute("listaUsuarios",listaUsuarios);
        return "verUsers";
    }
    @RequestMapping(value = "eliminar", method = RequestMethod.GET)
    public RedirectView eliminarUsuarioController(@RequestParam("id") int id) throws SQLException {   
        UsuariosDAO udao = new UsuariosDAO();
        RedirectView respuesta = new RedirectView("verUsers");
        udao.eliminarPersona(id);
        return respuesta;
    }
    
      @RequestMapping(value = "modificar", method = RequestMethod.GET)
    public String modificarUsuarioController(@RequestParam("id") int id, Model model) {   
        UsuariosDAO udao = new UsuariosDAO();
       Usuarios usuarios = udao.getUsuario(id);
        model.addAttribute("usuarios", usuarios);
        return "modificarUsuario";
    }
     @RequestMapping(value="modificarUsuario",method = RequestMethod.POST)
    public RedirectView modificarUsuarioController(@ModelAttribute("usuarios") Usuarios usuarios) throws SQLException {
        RedirectView respuesta = new RedirectView("verUsers");
        UsuariosDAO udao = new UsuariosDAO();
        udao.modificarUsuarios(usuarios);
        return respuesta;
    }
    
        @RequestMapping(value="crearProducto",method=RequestMethod.GET)
    public String crearProductoController(Model model){
        Productos productos = new Productos();
        model.addAttribute("productos",productos);
        return "crearUsuario";
    }
@RequestMapping(value="nuevoUsuario",method=RequestMethod.POST)
    public String nuevoProductoController (@Valid @ModelAttribute("productos") Productos productos,BindingResult resultado, Model model) throws SQLException{
        if(resultado.hasErrors()){
            model.addAttribute("productos",productos);
             return "crearProducto";
        }else{
             ProductosDAO pdao= new ProductosDAO();
             pdao.nuevoProducto(productos);
       return "verproductos";
        }
    }
}