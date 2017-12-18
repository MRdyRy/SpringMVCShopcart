/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.controller;

import com.rudy.dao.OrdersService;
import com.rudy.model.Orders;
import com.rudy.model.Product;
import com.rudy.model.UserOnCube;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @RequestMapping("/check/${idUser}/${idProduct}/${qty}/${sumprice}")
    public String checkoutCart(Model model,@RequestParam("user")UserOnCube uoc,@RequestParam("product")Product product,
            @RequestParam("quantity")Integer quantity,@RequestParam("sumPrice")Double sumPrice)
    {
        Orders orders = new Orders();
        orders.setDatePurchase(new Date());
        orders.setProduct(product);
        orders.setUseroncube(uoc);
        os.saveCheckOut(orders);
        return "redirect:/welcome";
    }
    
    @RequestMapping(value="/history/{id}")
    public String showAllHistoryCheckout(List<Orders> orders,Model model, @PathVariable("id")Integer id)
    {
        orders.add((Orders) os.historyOrders(id));
        model.addAttribute("orders", orders);
        return "history";
    }
    
}
