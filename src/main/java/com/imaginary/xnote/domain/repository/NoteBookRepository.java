package com.imaginary.xnote.domain.repository;

import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

import com.imaginary.xnote.domain.model.NoteBook;

public interface NoteBookRepository  extends CrudRepository<NoteBook, UUID> 
{


}
