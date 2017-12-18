/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.UserService;
import com.rudy.model.RegisterFormBean;
import com.rudy.model.UserOnCube;
import com.rudy.utils.PasswordDigest;
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
@RequestMapping("/register")
public class RegisterController {
    
    @Autowired
    UserService us;
    
    @RequestMapping()
    public String registerForm(Model model)
    {
        RegisterFormBean registerBean = new RegisterFormBean();
        model.addAttribute("registerBean",registerBean);
        return "registeruser";
    }
    
    @RequestMapping(value = "/save")
    public String saveRegistration(@ModelAttribute("registerBean")RegisterFormBean registerBean,Model model)
    {
        UserOnCube user = new UserOnCube();
        String encrypPass = PasswordDigest.createEncryptedPassword(registerBean.getPassword());
        user.setFirstName(registerBean.getFirstName());
        user.setLastName(registerBean.getLastName());
        user.setUserName(registerBean.getUserName());
        user.setPassword(encrypPass);
        user.setLevelUser(registerBean.getLevelUser());
        us.addUser(user);
        model.addAttribute("data", registerBean);
        return "welcome";
    }
}
