package com.skilldistillery.beerhound.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Beer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name = "alcohol_content")
	private Double alcoholContent;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	// TODO: Add relationship with beer rating
	// TODO: Add relationship with beer price
	// TODO: Add relationship with beer type
	

	@Override
	public String toString() {
		return "Beer [id=" + id + ", name=" + name + ", alcoholContent=" + alcoholContent + ", imageUrl=" + imageUrl
				+ "]";
	}

	public Beer() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getAlcoholContent() {
		return alcoholContent;
	}

	public void setAlcoholContent(Double alcoholContent) {
		this.alcoholContent = alcoholContent;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Beer other = (Beer) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
}