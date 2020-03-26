package com.entity;
// default package



/**
 * City entity. @author MyEclipse Persistence Tools
 */

public class City  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private String city;


    // Constructors

    /** default constructor */
    public City() {
    }

    
    /** full constructor */
    public City(String city) {
        this.city = city;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
   








}