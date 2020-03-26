package com.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Administrator entity. @author MyEclipse Persistence Tools
 */

public class Administrator implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String administrator;
	private String password;
	private String name;
	private String role;	// 角色，代表用户的职责
	private String telephone;
	private String email;
	private String duty;
	private Date gmtCreate;
	private Date gmtModified;

	// Constructors

	/** default constructor */
	public Administrator() {
	}

	/** full constructor */
	public Administrator(String administrator, String password, String name,
			String role, String status, String telephone, String email,
			String duty, Timestamp gmtCreate, Timestamp gmtModified) {
		this.administrator = administrator;
		this.password = password;
		this.name = name;
		this.role = role;
		this.telephone = telephone;
		this.email = email;
		this.duty = duty;
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

	public String getAdministrator() {
		return this.administrator;
	}

	public void setAdministrator(String administrator) {
		this.administrator = administrator;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getDuty() {
		return duty;
	}

}