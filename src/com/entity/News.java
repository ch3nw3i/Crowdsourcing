package com.entity;


import java.util.Date;


/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class News implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String content;
	private String status;
    private String type;
    private Integer fromUserId;
    private Integer toUserId;
    private Date gmtCreate;
    private Date gmtModified;


    // Constructors

    /** default constructor */
    public News() {
    }
   
    // Property accessors

    public News(Integer id, String content, String status, String type,
			Integer fromUserId, Integer toUserId, Date gmtCreate,
			Date gmtModified) {
		this.id = id;
		this.content = content;
		this.status = status;
		this.type = type;
		this.fromUserId = fromUserId;
		this.toUserId = toUserId;
		this.gmtCreate = gmtCreate;
		this.gmtModified = gmtModified;
	}


	public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public Integer getFromUserId() {
        return this.fromUserId;
    }
    
    public void setFromUserId(Integer fromUserId) {
        this.fromUserId = fromUserId;
    }

    public Integer getToUserId() {
        return this.toUserId;
    }
    
    public void setToUserId(Integer toUserId) {
        this.toUserId = toUserId;
    }

    public Date getGmtCreate() {
        return this.gmtCreate;
    }
    
    public void setGmtCreate(Date date) {
        this.gmtCreate = date;
    }

    public Date getGmtModified() {
        return this.gmtModified;
    }
    
    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }


	public void setContent(String content) {
		this.content = content;
	}


	public String getContent() {
		return content;
	}
   








}