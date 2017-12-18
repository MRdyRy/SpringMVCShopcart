/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author user
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @RequestMapping()
    public String goToAdmin(Model model)
    {
        model.addAttribute("adm","Hello Admin Page");
        return "admin";
    }
}
