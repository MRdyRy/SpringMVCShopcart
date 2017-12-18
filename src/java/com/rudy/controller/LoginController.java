/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.UserService;
import com.rudy.model.LoginBean;
import com.rudy.model.UserOnCube;
import com.rudy.utils.PasswordDigest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author user
 */
@Controller
@RequestMapping("/Login")
public class LoginController {

    @Autowired
    UserService us;

    @RequestMapping()
    public String loginPage(Model model)
    {
        LoginBean loginBean = new LoginBean();
        model.addAttribute("loginBean", loginBean);
        return "Login";
    }
    
    @RequestMapping("/validation")
    public String cekLogin(HttpSession session, @ModelAttribute("loginBean") LoginBean loginBean, Model model) {

        UserOnCube uoc = us.findUserByName(loginBean.getUsername());
        if (uoc == null) {
            model.addAttribute("loginMessage", "Username Salah");
            return "Login";
        }
        
        if(!uoc.getPassword().equals(PasswordDigest.createEncryptedPassword(loginBean.getPassword()))){
            model.addAttribute("loginMessage","Password salah");
            return "Login";
        }
        
        if(uoc.getLevelUser()==1)
        {
            session.setAttribute("user", uoc);
            return "admin";
        }
            
        session.setAttribute("user",uoc);
        return "beranda";
    }
}
