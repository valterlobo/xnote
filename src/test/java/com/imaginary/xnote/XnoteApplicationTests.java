package com.imaginary.xnote;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.repository.CrudRepository;

import com.imaginary.xnote.domain.model.Note;
import com.imaginary.xnote.domain.model.NoteBook;
import com.imaginary.xnote.domain.model.NoteType;
import com.imaginary.xnote.domain.repository.NoteBookRepository;
import com.imaginary.xnote.domain.repository.NoteRepository;
import com.imaginary.xnote.domain.repository.NoteTypeRepository;

@SpringBootTest
class XnoteApplicationTests {

	@Autowired
	NoteBookRepository noteBookRepository;
	
	@Autowired
	NoteTypeRepository noteTypeRepository;

	@Autowired
	private NoteRepository noteRepository;

	@Test
	void contextLoads() {

	}

	@Test
	public void testeInsert() {

		NoteBook notebook = NoteBook.builder().title("Teste").color("#CCC").description("teste descrição")
				.created(new Date()).build();

		notebook.setUuid(UUID.randomUUID());
		notebook.setUac_uuid(UUID.fromString("b506053d-08ae-45bc-99a3-5e935a8d2e16"));
		System.out.println(noteBookRepository.save(notebook));

	}

	@Test
	public void testeFind() {

		// NoteBook notebook =
		// NoteBook.builder().title("Teste").color("#CCC").description("teste
		// descrição").build();

		System.out.println(noteBookRepository.findById(UUID.fromString("f0e81682-14fe-43cd-9700-d02158b4b573")));

	}
	

	@Test
	public void testeNoteTypeInsert()
	{

		 String strSchema = "{\n" + 
		 		"  \"$id\": \"https://example.com/person.schema.json\",\n" + 
		 		"  \"$schema\": \"http://json-schema.org/draft-07/schema#\",\n" + 
		 		"  \"title\": \"Person\",\n" + 
		 		"  \"type\": \"object\",\n" + 
		 		"  \"properties\": {\n" + 
		 		"    \"firstName\": {\n" + 
		 		"      \"type\": \"string\",\n" + 
		 		"      \"description\": \"The person's first name.\"\n" + 
		 		"    },\n" + 
		 		"    \"lastName\": {\n" + 
		 		"      \"type\": \"string\",\n" + 
		 		"      \"description\": \"The person's last name.\"\n" + 
		 		"    },\n" + 
		 		"    \"age\": {\n" + 
		 		"      \"description\": \"Age in years which must be equal to or greater than zero.\",\n" + 
		 		"      \"type\": \"integer\",\n" + 
		 		"      \"minimum\": 0\n" + 
		 		"    }\n" + 
		 		"  }\n" + 
		 		"}"; 
		 
		 String strData = "{\n" + 
		 		"  \"firstName\": \"Valter\",\n" + 
		 		"  \"lastName\": \"Lobo\",\n" + 
		 		"  \"age\": 40\n" + 
		 		"}"; 

		
		 
		 NoteType noteType = NoteType.builder().uuid(UUID.randomUUID()).name("person").schema(strSchema).example(strData).build();
		 
		 noteTypeRepository.save(noteType);
		 
		 

	}

	
	@Test
	public void testeNoteTypeFind()
	{

		 Optional<NoteType> noteType = noteTypeRepository.findById(UUID.fromString("62e48caf-b1ef-4afd-bf3f-bdea86b0043b"));
		 System.out.println(noteType);
	}
	
	@Test
	public void testeNoteInsert() {

		NoteBook notebook = NoteBook.builder().uuid(UUID.fromString("f0e81682-14fe-43cd-9700-d02158b4b573")).build();
		
		//notebook.setUac_uuid(UUID.fromString("\"f0e81682-14fe-43cd-9700-d02158b4b573\""));
		
		 NoteType noteType = NoteType.builder().uuid(UUID.fromString("62e48caf-b1ef-4afd-bf3f-bdea86b0043b")).build();
		
		 String strData = "{\n" + 
			 		"  \"firstName\": \"Ana\",\n" + 
			 		"  \"lastName\": \"Beatriz\",\n" + 
			 		"  \"age\": 10\n" + 
			 		"}"; 
		 
		Note note = Note.builder()
				.title("Teste")
				.content(strData)
				.notebook(notebook)
				.noteType(noteType)
				.user_uuid(UUID.fromString("b506053d-08ae-45bc-99a3-5e935a8d2e16"))
			
				.build(); 
		
		note.setUuid(UUID.randomUUID());
		
		System.out.println(noteRepository.save(note));

	}
	

}
