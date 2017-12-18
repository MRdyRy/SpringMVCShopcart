/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.ProductService;
import com.rudy.model.Product;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Rudy
 */
@Controller
@RequestMapping("/Product")
public class ProductController {
     static final Logger logger = Logger.getLogger(ProductController.class.getName());
    
    @Autowired
    ProductService ps;
    
    @RequestMapping(value = "")
    public String index(ModelMap model)
    {
        model.put("listproduct",ps.showAllProduct());
        return "index";
    }
    
    
    @RequestMapping(value = "/showAll/{brand}")
    public String showAllByBrand(@PathVariable("brand")String brand,ModelMap model)
    {
        model.put("listproduct",ps.findAllProductByName(brand));
        return "FilterByBrand";
        
    }
    
    @RequestMapping(value = "/{id}")
    public String detailProduct(@PathVariable("id")Integer id,Model model)
    {
        Product pd = ps.findProductbyId(id);
        model.addAttribute("product", pd);
        return "detailProduct";
    }
    
    
}
