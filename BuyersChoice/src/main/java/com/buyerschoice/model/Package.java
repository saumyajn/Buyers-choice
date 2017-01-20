package com.buyerschoice.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Package {

		
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int packageid;

	@Column
	private String packagename;
	@Column
	private String packagedescription;
	
	

	public Package()
	{
	}



	public int getPackageid() {
		return packageid;
	}



	public void setPackageid(int packageid) {
		this.packageid = packageid;
	}



	public String getPackagename() {
		return packagename;
	}



	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}



	public String getPackagedescription() {
		return packagedescription;
	}



	public void setPackagedescription(String packagedescription) {
		this.packagedescription = packagedescription;
	}

	
	
	}

