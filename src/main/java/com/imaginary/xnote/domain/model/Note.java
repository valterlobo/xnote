package com.imaginary.xnote.domain.model;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
@Entity
@Table(name = "note")
public class Note {

	@Id
	@Column(name = "not_uuid")
	private UUID uuid;
	@Column(name = "uac_uuid")
	private UUID user_uuid;

	@ManyToOne
	@JoinColumn(name = "ntb_uuid")
	private NoteBook notebook;

	@ManyToOne
	@JoinColumn(name = "ntp_uuid")
	private NoteType noteType;

	@Column(name = "not_title")
	private String title;

	@Type(type = "jsonb")
	@Column(name = "not_content", columnDefinition = "jsonb")
	private String content;
	
	 @Column(name = "not_color") 
	 private String color;
	
	/*
	 *
	 * 
	 * @Column(name = "not_created") private String created;
	 * 
	 * @Column(name = "not_last_modified") private String last_modified;
	 * 
	 * @Column(name = "not_tags") private String tags;
	 * 
	 * @Column(name = "not_archived") private Boolean archived;
	 * 
	 * @Column(name = "not_favorite") private Boolean favorite;
	 * 
	 * @Column(name = "not_attachment") private String attachment;
	 */

	public Note() {

	}
}
