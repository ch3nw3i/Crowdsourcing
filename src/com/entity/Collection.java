package com.entity;

import java.sql.Timestamp;
import java.util.Date;


/**
 * Collection entity. @author MyEclipse Persistence Tools
 */

public class Collection implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private Integer userId;
     private String collectionType;
     private Integer collectionId;
     private Date gmtCreate;
     private Date gmtModified;


    // Constructors

    /** default constructor */
    public Collection() {
    }

    
    /** full constructor */
    public Collection(Integer userId, String collectionType, Integer collectionId, Timestamp gmtCreate, Timestamp gmtModified) {
        this.userId = userId;
        this.collectionType = collectionType;
        this.collectionId = collectionId;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCollectionType() {
        return this.collectionType;
    }
    
    public void setCollectionType(String collectionType) {
        this.collectionType = collectionType;
    }

    public Integer getCollectionId() {
        return this.collectionId;
    }
    
    public void setCollectionId(Integer collectionId) {
        this.collectionId = collectionId;
    }

    public Date getGmtCreate() {
        return this.gmtCreate;
    }
    
    public void setGmtCreate(Timestamp gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return this.gmtModified;
    }
    
    public void setGmtModified(Timestamp gmtModified) {
        this.gmtModified = gmtModified;
    }
   








}