/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.dao;

import com.rudy.model.Orders;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author user
 */
@Repository
@Transactional
public class OrdersService {
    
    @Autowired
    EntityManagerFactory emf;
    private EntityManager em;
    
    public void saveCheckOut(Orders orders)
    {
        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(orders);
        em.getTransaction().commit();
        em.close();
    }
    
    public List<Orders> historyOrders(int idUser)
    {
        em = emf.createEntityManager();
        Query qeyr = em.createQuery("select o from Orders o where o.useroncube.id=:id");
        qeyr.setParameter("id", idUser);
        List<Orders> history =  qeyr.getResultList();
        return history;
    }

    /**
     * @return the em
     */
    public EntityManager getEm() {
        return em;
    }

    /**
     * @param em the em to set
     */
    public void setEm(EntityManager em) {
        this.em = em;
    }
    
}
