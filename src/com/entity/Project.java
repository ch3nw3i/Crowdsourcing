package com.entity;
// default package

import java.sql.Timestamp;
import java.util.Date;


/**
 * Project entity. @author MyEclipse Persistence Tools
 */

public class Project {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private String title;
     private Integer money;
     private String type;
     private String cycle;
     private String summary;
     private String reference;
     private String skill;
     private String requirement;
     private String city;
     private String isSettled;
     private String requirementDoc;
     private Integer requestorId;
     private Integer developerId;
     private String status;
     private Integer viewNumber;
     private Integer enlistNumber;
     private Date gmtCreate;
     private Date gmtModified;


    // Constructors

    /** default constructor */
    public Project() {
    }

    
    /** full constructor */
    public Project(String title, Integer money, String type, String cycle, String summary, String reference, String skill, String requirement, String city, String isSettled, String requirementDoc, Integer requestorId, Integer developerId, String status, Integer viewNumber, Integer enlistNumber, Timestamp gmtCreate, Timestamp gmtModified) {
        this.title = title;
        this.money = money;
        this.type = type;
        this.cycle = cycle;
        this.summary = summary;
        this.reference = reference;
        this.skill = skill;
        this.requirement = requirement;
        this.city = city;
        this.isSettled = isSettled;
        this.requirementDoc = requirementDoc;
        this.requestorId = requestorId;
        this.developerId = developerId;
        this.status = status;
        this.viewNumber = viewNumber;
        this.enlistNumber = enlistNumber;
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

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getMoney() {
        return this.money;
    }
    
    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public String getCycle() {
        return this.cycle;
    }
    
    public void setCycle(String cycle) {
        this.cycle = cycle;
    }

    public String getSummary() {
        return this.summary;
    }
    
    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getReference() {
        return this.reference;
    }
    
    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getSkill() {
        return this.skill;
    }
    
    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getRequirement() {
        return this.requirement;
    }
    
    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }

    public String getIsSettled() {
        return this.isSettled;
    }
    
    public void setIsSettled(String isSettled) {
        this.isSettled = isSettled;
    }

    public String getRequirementDoc() {
        return this.requirementDoc;
    }
    
    public void setRequirementDoc(String requirementDoc) {
        this.requirementDoc = requirementDoc;
    }

    public Integer getRequestorId() {
        return this.requestorId;
    }
    
    public void setRequestorId(Integer requestorId) {
        this.requestorId = requestorId;
    }

    public Integer getDeveloperId() {
        return this.developerId;
    }
    
    public void setDeveloperId(Integer developerId) {
        this.developerId = developerId;
    }

    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getViewNumber() {
        return this.viewNumber;
    }
    
    public void setViewNumber(Integer viewNumber) {
        this.viewNumber = viewNumber;
    }

    public Integer getEnlistNumber() {
        return this.enlistNumber;
    }
    
    public void setEnlistNumber(Integer enlistNumber) {
        this.enlistNumber = enlistNumber;
    }

    public Date getGmtCreate() {
        return this.gmtCreate;
    }
    
    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return this.gmtModified;
    }
    
    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }
   








}