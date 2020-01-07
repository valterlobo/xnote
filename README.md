# xnote
XNOTE SPRING  BOOT / JPA / GRAPHQL 

## URL LOCAL GRAPHQL TESTE 
  
   http://localhost:8080/graphiql/

## QUERY 


query {
  findNoteByNoteBook(notebookUUID:"f0e81682-14fe-43cd-9700-d02158b4b573",
                     pageNum:1, pageSize:2) {
    
      uuid,title , content , notebook { uuid , title , description } , 
      noteType { uuid , name , schema}
      
    }  
}

## Mutation 

mutation {
  
  createNoteBook(title:"spring" , description:"spring boot anotações ",
           color:"#COCOCO", userUUID: "b506053d-08ae-45bc-99a3-5e935a8d2e16")
    {
       uuid, title , description,color
    }
}
