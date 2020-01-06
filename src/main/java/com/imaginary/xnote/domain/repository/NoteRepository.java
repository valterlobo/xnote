package com.imaginary.xnote.domain.repository;

import java.util.UUID;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.scheduling.annotation.Async;

import com.imaginary.xnote.domain.model.Note;
import com.imaginary.xnote.domain.model.NoteBook;

public interface NoteRepository extends CrudRepository<Note, UUID> {

	@Async
	Page<Note>  findByNotebook(NoteBook notebook , Pageable page);
	


}
