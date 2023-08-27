package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	@Column(length = 100)
	private String userName;
	@Column(length = 100,unique = true)
	private String userEmail;
	private String userPasswords;
	private String userPhones;
	private String userPic;
	@Column(length = 1500)
	private String userAddress;
	private String userType;

	public UserEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserEntity(int userId, String userName, String userEmail, String userPasswords, String userPhones,
			String userPic, String userAddress, String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPasswords = userPasswords;
		this.userPhones = userPhones;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
	}
	

	public UserEntity(int userId, String userName, String userEmail, String userPasswords, String userPhones,
			String userPic, String userAddress) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPasswords = userPasswords;
		this.userPhones = userPhones;
		this.userPic = userPic;
		this.userAddress = userAddress;
	}

	public UserEntity(String userName, String userEmail, String userPasswords, String userPhones, String userPic,
			String userAddress, String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPasswords = userPasswords;
		this.userPhones = userPhones;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPasswords() {
		return userPasswords;
	}

	public void setUserPasswords(String userPasswords) {
		this.userPasswords = userPasswords;
	}

	public String getUserPhones() {
		return userPhones;
	}

	public void setUserPhones(String userPhones) {
		this.userPhones = userPhones;
	}

	public String getUserPic() {
		return userPic;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "UserEntity [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail
				+ ", userPasswords=" + userPasswords + ", userPhones=" + userPhones + ", userPic=" + userPic
				+ ", userAddress=" + userAddress + ", userType=" + userType + "]";
	}

}
