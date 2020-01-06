package com.imaginary.xnote.presentation;

import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Component;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import com.imaginary.xnote.domain.model.Note;
import com.imaginary.xnote.domain.model.NoteBook;
import com.imaginary.xnote.domain.model.NoteType;
import com.imaginary.xnote.domain.repository.NoteBookRepository;
import com.imaginary.xnote.domain.repository.NoteRepository;
import com.imaginary.xnote.domain.repository.NoteTypeRepository;

@Component
public class Mutation  implements GraphQLMutationResolver {
	
	
	private NoteRepository noteRepository;
	private NoteBookRepository noteBookRepository;
	private NoteTypeRepository noteTypeRepository;
	
	
	public Mutation(NoteRepository noteRepository, NoteBookRepository noteBookRepository,
			NoteTypeRepository noteTypeRepository) {
		super();
		this.noteRepository = noteRepository;
		this.noteBookRepository = noteBookRepository;
		this.noteTypeRepository = noteTypeRepository;
	}


	public NoteBook createNoteBook(String title, String description, String color , String userUUID) {
      
		Date now = new Date();  
		NoteBook noteBook = NoteBook.builder()
				            .uuid(UUID.randomUUID())
							.title(title)
							.description(description)
							.color(color)
							.uac_uuid(UUID.fromString(userUUID))
						    .created(now)
						    .last_modified(now)
							.build();
		
        return noteBookRepository.save(noteBook);
    }
	
	
	public Note createNote(String title, String content, String color, String typeUUID , String noteBookUUID, String userUUID) {
	      
		Date now = new Date();  
		NoteBook noteBook = NoteBook.builder()
				            .uuid(UUID.fromString(noteBookUUID))
							.build();
		
		
		NoteType noteType = NoteType.builder()
				.uuid(UUID.fromString(typeUUID))
				.build(); 
		
		Note note = Note.builder()
				.uuid(UUID.randomUUID())
				.title(title)
				.content(content)
				.color(color)
				.notebook(noteBook)
				.noteType(noteType)
				.user_uuid(UUID.fromString(userUUID))
				.build(); 
		
        return noteRepository.save(note);
    }

}
