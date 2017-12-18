/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.UserService;
import com.rudy.model.UserOnCube;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author user
 */
@Controller
@RequestMapping("/profile")
public class profileController {
    
    @Autowired
    UserService us;
    
    @RequestMapping()
    public String goToProfilePage(Model model)
    {
        model.addAttribute("p", "Profile");
        return "profile";
    }
    
    @RequestMapping(value = "/{id}")
    public String Profile(@PathVariable(value = "id") Integer id,Model model)
    {
        UserOnCube uoc = us.findUserById(id);
        model.addAttribute("user", uoc);
        return "redirect:/profile";
    }
    
    @RequestMapping(value = "/edit/{id}")
    public String editProfile(@PathVariable(value = "id") Integer id,Model model)
    {
        UserOnCube uoc = us.findUserById(id);
        model.addAttribute("user", uoc);
        return "redirect:/profile";
    }
}
