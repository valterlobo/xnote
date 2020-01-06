package com.imaginary.xnote;

import static org.junit.Assert.*;

import org.junit.jupiter.api.Test;

import com.imaginary.xnote.domain.model.NoteBook;



public class TesteArquitetura {
	
	@Test
	public void test() {
		
		
		NoteBook notebook = NoteBook.builder().title("Teste").color("#CCC").description("teste descrição").build(); 
		
		
		System.out.print(notebook);
		
		
	}

}
