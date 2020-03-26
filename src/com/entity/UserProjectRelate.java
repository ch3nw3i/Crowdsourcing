package com.entity;

import java.sql.Timestamp;
import java.util.Date;


/**
 * UserProjectRelate entity. @author MyEclipse Persistence Tools
 */

public class UserProjectRelate implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private Integer userId;
     private Integer projectId;
     private Date gmtCreate;
     private Date gmtModified;


    // Constructors

    /** default constructor */
    public UserProjectRelate() {
    }

    
    /** full constructor */
    public UserProjectRelate(Integer userId, Integer projectId, Timestamp gmtCreate, Timestamp gmtModified) {
        this.userId = userId;
        this.projectId = projectId;
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

    public Integer getProjectId() {
        return this.projectId;
    }
    
    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
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