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

import org.apache.catalina.User;
import org.springframework.stereotype.Controller;

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
   
   @RequestMapping(value="index",method=RequestMethod.GET)
    public String indexController(Model model){
        
        return "index";
    }
    
}