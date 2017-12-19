/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.OrdersService;
import com.rudy.model.Cart;
import com.rudy.model.Items;
import com.rudy.model.Orders;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author user
 */
@Controller
@RequestMapping("/checkout")
public class CheckOutController {
    
    @Autowired
    OrdersService os;
    
    @RequestMapping("")
    public String goToCheckOut()
    {
        return "checkout";
    }
    
    
    //bikin ini semalem klo error berarti ini ubah lagi
    @RequestMapping("/check")
    public String checkoutCart(HttpSession session,Model model,ModelMap mod)
    {
        Cart cartliast = (Cart) session.getAttribute("cart");
        double totalHarga =0.0;
        Map<Integer,Items> cartLast = new HashMap<>();
        for (Map.Entry<Integer, Items> entry : cartliast.getCartlist().entrySet()) {
            cartLast.put(Integer.valueOf(entry.getKey()),new Items(entry.getValue().getQuantity(),entry.getValue().getProduct()));
            totalHarga+= entry.getValue().getProduct().getProductPrice() * entry.getValue().getQuantity();
            mod.put("data",cartLast);
            System.out.println(cartLast.get(entry.getKey()).getProduct().getProductName());
        }
        
         session.setAttribute("cartssss", cartLast);
         session.setAttribute("cartlast",cartliast);
         session.setAttribute("total", totalHarga);
         session.removeAttribute("cart");

        return "redirect:/checkout";
    }
    
    @RequestMapping(value="/history/{id}")
    public String showAllHistoryCheckout(List<Orders> orders,Model model, @PathVariable("id")Integer id)
    {
        orders.add((Orders) os.historyOrders(id));
        model.addAttribute("orders", orders);
        return "history";
    }
    
}
