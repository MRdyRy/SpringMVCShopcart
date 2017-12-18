/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rudy.dao;

import com.rudy.model.UserOnCube;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import javax.transaction.Transactional;
import static org.hibernate.annotations.common.util.impl.LoggerFactory.logger;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Rudy
 */
@Repository
@Transactional
public class UserService {
    
    static final Logger logger = Logger.getLogger(UserService.class.getName());
    
    @PersistenceUnit
    EntityManagerFactory emf;
    private EntityManager em;
    
    public void addUser(UserOnCube users)
    {
        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(users);
        em.getTransaction().commit();
        em.close();
    }
    
    public UserOnCube findUserByName(String username)
    {
        UserOnCube usroc = new UserOnCube();
        try{
        em = emf.createEntityManager();
        Query findUserName = em.createQuery("select uoc from UserOnCube uoc where uoc.userName = :usrname ");
        findUserName.setParameter("usrname",username);
        usroc = (UserOnCube) findUserName.getSingleResult();
        } catch (NoResultException nre) {
            logger.severe("Username tidak ada");
        }
        return usroc;
    }
    
    public UserOnCube findUserById(int id)
    {
        em = emf.createEntityManager();
        UserOnCube uoc = em.find(UserOnCube.class, id);
        return uoc;
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
