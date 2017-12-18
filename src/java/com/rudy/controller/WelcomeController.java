/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.ProductService;
import com.rudy.dao.UserService;
import com.rudy.model.LoginBean;
import com.rudy.model.Product;
import com.rudy.model.RegisterFormBean;
import com.rudy.model.UserOnCube;
import com.rudy.utils.PasswordDigest;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Rudy
 */
@Controller
@RequestMapping("/welcome")
public class WelcomeController {

    @Autowired
    UserService us;
    @Autowired
    ProductService ps;
    
    
    @RequestMapping()
    public String welcomepage(Model model,ModelMap models) {
        LoginBean loginBean = new LoginBean();
        model.addAttribute("loginBean", loginBean);
        RegisterFormBean registerBean = new RegisterFormBean();
        model.addAttribute("registerBean", registerBean);
        model.addAttribute("welcomeMessage", "Wonderfull things is in the cube");
        models.put("listproduct",ps.showAllProduct());
        return "welcome";
    }

    @RequestMapping("/validation")
    public String cekLogin(HttpSession session, @ModelAttribute("loginBean") LoginBean loginBean, Model model) {

        UserOnCube uoc = us.findUserByName(loginBean.getUsername());
        if (uoc == null) {
            model.addAttribute("loginMessage", "Username Salah");
            return "redirect:/welcome";
        }

        if (!uoc.getPassword().equals(PasswordDigest.createEncryptedPassword(loginBean.getPassword()))) {
            model.addAttribute("loginMessage", "Password salah");
            return "redirect:/welcome";
        }
        
        if(uoc.getLevelUser()==1)
        {
            session.setAttribute("user", uoc);
            return "redirect:/admin";
        }
        
        session.setAttribute("user", uoc);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/save")
    public String saveRegistration(@ModelAttribute("registerBean") RegisterFormBean registerBean, Model model) {
        UserOnCube user = new UserOnCube();
        String encrypPass = PasswordDigest.createEncryptedPassword(registerBean.getPassword());
        user.setFirstName(registerBean.getFirstName());
        user.setLastName(registerBean.getLastName());
        user.setUserName(registerBean.getUserName());
        user.setPassword(encrypPass);
        user.setLevelUser(registerBean.getLevelUser());
        us.addUser(user);
        model.addAttribute("data", registerBean);
        return "redirect:/welcome";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, Model mode) {
        session.invalidate();
        return "redirect:/welcome";
    }

    
    @RequestMapping(value = "/search")
    public String searchProduct(@RequestParam("keyword")String keyword,Model model)
    {
        List<Product> products = ps.findProductByKategori(keyword);
        model.addAttribute("listproduct",products);
        return "search";
    }
    
}
