package com.entity;
// default package



/**
 * Skill entity. @author MyEclipse Persistence Tools
 */

public class Skill  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private String skill;


    // Constructors

    /** default constructor */
    public Skill() {
    }

    
    /** full constructor */
    public Skill(String skill) {
        this.skill = skill;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getSkill() {
        return this.skill;
    }
    
    public void setSkill(String skill) {
        this.skill = skill;
    }
   








}