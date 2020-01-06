package com.imaginary.xnote.domain.model;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import com.vladmihalcea.hibernate.type.json.JsonBinaryType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
@Entity
@Table(name = "note_type")
@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
public class NoteType {

	@Id
	@Column(name = "ntp_uuid")
	private UUID uuid;
	@Column(name = "ntp_name")
	private String name;
	 @Type(type = "jsonb")
	@Column(name = "ntp_schema", columnDefinition = "jsonb")
	private String schema;
	@Type(type = "jsonb")
	@Column(name = "ntp_example", columnDefinition = "jsonb")
	private String example;

	public NoteType() {
		super();

	}
}
