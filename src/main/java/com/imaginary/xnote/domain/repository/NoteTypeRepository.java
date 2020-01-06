package com.imaginary.xnote.domain.repository;

import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

import com.imaginary.xnote.domain.model.NoteType;

public interface NoteTypeRepository  extends CrudRepository<NoteType, UUID> {

	
}
