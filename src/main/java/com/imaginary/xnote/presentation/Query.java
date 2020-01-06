package com.imaginary.xnote.presentation;


import java.util.UUID;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import com.imaginary.xnote.domain.model.Note;
import com.imaginary.xnote.domain.model.NoteBook;
import com.imaginary.xnote.domain.repository.NoteBookRepository;
import com.imaginary.xnote.domain.repository.NoteRepository;
import com.imaginary.xnote.domain.repository.NoteTypeRepository;

@Component
public class Query implements GraphQLQueryResolver {

	private NoteRepository noteRepository;
	private NoteBookRepository noteBookRepository;
	private NoteTypeRepository noteTypeRepository;

	public Query(NoteRepository noteRepository, NoteBookRepository noteBookRepository,
			NoteTypeRepository noteTypeRepository) {

		super();
		this.noteRepository = noteRepository;
		this.noteBookRepository = noteBookRepository;
		this.noteTypeRepository = noteTypeRepository;
	}

	public Iterable<NoteBook> findNoteBooksByUser() {

		return noteBookRepository.findAll();
	}

	public Iterable<Note> findNoteByNoteBook(String notebookUUID , Integer pageNum, Integer pageSize ) {
		
		Pageable page = PageRequest.of(pageNum.intValue(), pageSize.intValue(), Sort.by("title"));
		return noteRepository.findByNotebook(NoteBook.builder().uuid(UUID.fromString(notebookUUID)).build(), page);
	}

}
