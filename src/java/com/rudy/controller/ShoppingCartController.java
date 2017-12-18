/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.ProductService;
import com.rudy.model.Cart;
import com.rudy.model.Items;
import java.text.DecimalFormat;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Rudy
 */
@Controller
@RequestMapping("/shopcart")
public class ShoppingCartController {

    @Autowired
    ProductService ps;

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/orderproduct/{id}", method = RequestMethod.GET)
    public String orderProduct(@PathVariable Integer id, ModelMap katalogProduct, HttpSession session) {
        if (session.getAttribute("cart") == null) {
            Cart cart = new Cart();
            cart.getCartlist().put(id, new Items(1, ps.findProductbyId(id)));
            session.setAttribute("cart", cart);
        } else {
            Cart cart = (Cart) session.getAttribute("cart");
            //cek udah ada atau engga dikeranjang buat update quantity nya
            int ada = isExisting(id, session);
            if (ada == -1) {
                cart.getCartlist().put(id, new Items(1, ps.findProductbyId(id)));
            } else {
                int quantity = cart.getCartlist().get(id).getQuantity() + 1;
                cart.getCartlist().put(id, new Items(quantity, ps.findProductbyId(id)));
            }
            session.setAttribute("cart", cart);
            
        }
        
       

        return "redirect:/welcome";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteItemsCart(@PathVariable(value = "id") int id, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart.getCartlist().get(id).getQuantity() != 0) {
            int qtylama = cart.getCartlist().get(id).getQuantity();
            cart.getCartlist().put(id, new Items(qtylama - 1, ps.findProductbyId(id)));
        }
        if (cart.getCartlist().get(id).getQuantity() == 0) {
            cart.getCartlist().remove(id);
        }
        //cart.getCartlist().remove(id);
        session.setAttribute("cart", cart);
        return "redirect:/welcome";
    }

    @SuppressWarnings("unchecked")
    private int isExisting(int id, HttpSession session) {

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            if (cart.getCartlist().get(id) != null) {
                return cart.getCartlist().get(id).getQuantity();
            }
        }

        return -1;

    }

}
