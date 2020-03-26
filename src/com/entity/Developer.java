package com.entity;
// default package

import java.sql.Timestamp;
import java.util.Date;


/**
 * Developer entity. @author MyEclipse Persistence Tools
 */

public class Developer implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String realName;
    private Integer userId;
    private String gender;
    private String city;
    private String summary;
    private String workingExperience;
    private String projectExperience;
    private String expectionWork;
    private String skill;
    private String status;
    private Date gmtCreate;
    private Date gmtModified;


    // Constructors

    /** default constructor */
    public Developer() {
    }

    
    /** full constructor */
    public Developer(Integer userId, String gender, String city, String summary, String workingExperience, String projectExperience, String expectionWork, String skill, String status, Timestamp gmtCreate, Timestamp gmtModified) {
        this.userId = userId;
        this.gender = gender;
        this.city = city;
        this.summary = summary;
        this.workingExperience = workingExperience;
        this.projectExperience = projectExperience;
        this.expectionWork = expectionWork;
        this.skill = skill;
        this.status = status;
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

    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }

    public String getSummary() {
        return this.summary;
    }
    
    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getWorkingExperience() {
        return this.workingExperience;
    }
    
    public void setWorkingExperience(String workingExperience) {
        this.workingExperience = workingExperience;
    }

    public String getProjectExperience() {
        return this.projectExperience;
    }
    
    public void setProjectExperience(String projectExperience) {
        this.projectExperience = projectExperience;
    }

    public String getExpectionWork() {
        return this.expectionWork;
    }
    
    public void setExpectionWork(String expectionWork) {
        this.expectionWork = expectionWork;
    }

    public String getSkill() {
        return this.skill;
    }
    
    public void setSkill(String skill) {
        this.skill = skill;
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


	public void setRealName(String realName) {
		this.realName = realName;
	}


	public String getRealName() {
		return realName;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getStatus() {
		return status;
	}
   








}