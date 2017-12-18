/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Rudy
 */
@Entity
@Table(name = "PRODUCT")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String productName;
    private double productPrice;
    private int productQuantity;
    private String productDescription;
    private String productImg;
    private String productKategori;
    @OneToMany(mappedBy = "product")
    private List<Orders> orderproduct;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.rudy.model.Product[ id=" + id + " ]";
    }

    /**
     * @return the orderproduct
     */
    public List<Orders> getOrderproduct() {
        return orderproduct;
    }

    /**
     * @param orderproduct the orderproduct to set
     */
    public void setOrderproduct(List<Orders> orderproduct) {
        this.orderproduct = orderproduct;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the productPrice
     */
    public double getProductPrice() {
        return productPrice;
    }

    /**
     * @param productPrice the productPrice to set
     */
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    /**
     * @return the productQuantity
     */
    public int getProductQuantity() {
        return productQuantity;
    }

    /**
     * @param productQuantity the productQuantity to set
     */
    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    /**
     * @return the productDescription
     */
    public String getProductDescription() {
        return productDescription;
    }

    /**
     * @param productDescription the productDescription to set
     */
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    /**
     * @return the productImg
     */
    public String getProductImg() {
        return productImg;
    }

    /**
     * @param productImg the productImg to set
     */
    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    /**
     * @return the productKategori
     */
    public String getProductKategori() {
        return productKategori;
    }

    /**
     * @param productKategori the productKategori to set
     */
    public void setProductKategori(String productKategori) {
        this.productKategori = productKategori;
    }
    
}
