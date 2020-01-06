package com.imaginary.xnote.domain.model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
@Entity
@Table(name="notebook")
public class NoteBook {
	

	@Id
	@Column(name="ntb_uuid")
	private UUID uuid; 
	private UUID  uac_uuid;
	@Column(name="ntb_title")
	private String title; 
	@Column(name="ntb_description")
	private String description;
	@Column(name="ntb_color")
	private String color; 
	@Column(name="ntb_created")
	private Date created;
	@Column(name="ntb_last_modified")
	private Date last_modified;
	
	
	
	public  NoteBook() {
		
	}
	
	

}
