package com.entity;
// default package



/**
 * AppType entity. @author MyEclipse Persistence Tools
 */

public class AppType  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private String appType;


    // Constructors

    /** default constructor */
    public AppType() {
    }

    
    /** full constructor */
    public AppType(String appType) {
        this.appType = appType;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getAppType() {
        return this.appType;
    }
    
    public void setAppType(String appType) {
        this.appType = appType;
    }
   








}