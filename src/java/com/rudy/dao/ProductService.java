/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.dao;

import com.rudy.model.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rudy
 */
@Repository
@Transactional
public class ProductService {
    
    @PersistenceUnit
    EntityManagerFactory emf;
    EntityManager em;
    
    public List<Product> showAllProduct()
    {
        em = emf.createEntityManager();
        List<Product> katalog = em.createQuery("select p from Product p").getResultList();
        return katalog;
    }
    
    public Product findProductbyId(int id)
    {
        em = emf.createEntityManager();
        Product product = em.find(Product.class, id);
        return product;
    }
    
    public List<Product> findAllProductByName(String pName)
    {
        em = emf.createEntityManager();
        Query query = em.createQuery("select p from Product p where UPPER(p.productName) LIKE CONCAT('%' || UPPER(:pName) || '%')");
        query.setParameter("pName", pName);
        List<Product> prods = query.getResultList();
        return prods;
    }
}
