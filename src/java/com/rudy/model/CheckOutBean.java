/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.model;

import java.util.Date;

/**
 *
 * @author user
 */
public class CheckOutBean {
    private int id;
    private int idUser;
    private int idProduct;
    private int quantity;
    private double sumPrice;
    private Date tanggal;
    private Product product;
    private UserOnCube useroncube;

    /**
     * @return the idUser
     */
    public int getIdUser() {
        return idUser;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @param idUser the idUser to set
     */
    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    /**
     * @return the idProduct
     */
    public int getIdProduct() {
        return idProduct;
    }

    /**
     * @param idProduct the idProduct to set
     */
    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the sumPrice
     */
    public double getSumPrice() {
        return sumPrice;
    }

    /**
     * @param sumPrice the sumPrice to set
     */
    public void setSumPrice(double sumPrice) {
        this.sumPrice = sumPrice;
    }

    /**
     * @return the tanggal
     */
    public Date getTanggal() {
        return tanggal;
    }

    /**
     * @param tanggal the tanggal to set
     */
    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }

    /**
     * @return the product
     */
    public Product getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * @return the useroncube
     */
    public UserOnCube getUseroncube() {
        return useroncube;
    }

    /**
     * @param useroncube the useroncube to set
     */
    public void setUseroncube(UserOnCube useroncube) {
        this.useroncube = useroncube;
    }
}
