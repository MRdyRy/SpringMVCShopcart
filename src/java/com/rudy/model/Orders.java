/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Rudy
 */
@Entity
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    int quantityBuy;
    double sumPrice;
    @OneToOne
    private UserOnCube useroncube;
    @ManyToOne
    private Product product;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date datePurchase;
    

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
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.rudy.model.Orders[ id=" + id + " ]";
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
     * @return the datePurchase
     */
    public Date getDatePurchase() {
        return datePurchase;
    }

    /**
     * @param datePurchase the datePurchase to set
     */
    public void setDatePurchase(Date datePurchase) {
        this.datePurchase = datePurchase;
    }
    
}
