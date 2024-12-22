
//As crenças criadas foram o nome do proprietário, a pessoa que a câmera detecta, o local em que a câmera detecta
//e por último se a pessoa está presente ou não em casa, para saber se está entrando ou saindo

proprietario(jonas).
pessoa_presente(jonas).
local(porta).
presenca_casa(fora). 

//definindo condições iniciais dos agentes:
//estava dando um erro "No fail event was generated for" para os agentes 
//que pelo que pesquisei, tinha que colocar condiçoes inicias

!iniciar.
+!iniciar: presenca_casa(E)
  <- .broadcast(tell, condicoes_inicias(E)).

!inicializar_camera.

+!inicializar_camera
  <- 	makeArtifact("camera_quarto","artifacts.Camera",[],D);
  	   	focus(D).
      !verificar_pessoa.
      
  	   	
+movimento 
  <-  !!verificar_pessoa.
      
+closed  <-  .print("Close event from GUIInterface").



   
+!verificar_pessoa: pessoa_presente(P) & local(L) & proprietario(PO) & presenca_casa(PC)  
      &  P == PO & L == porta & PC == fora
 	<-  .print("Pessoa: ", P, " reconhecida no local ", L, " da casa. Ele está chegando.");
      -+presenca_casa(dentro); //entrou em casa, logo a crença da presença muda para dentro
      .broadcast(tell, proprietario_chegou).
  
+!verificar_pessoa: pessoa_presente(P) & local(L) & proprietario(PO) & presenca_casa(PC)  
      &  P == PO & L == porta & PC == dentro
    <-  .print("Pessoa: ", P, " reconhecida no local ", L, " da casa. Ele está saindo.");
        -+presenca_casa(fora); //saiu de casa,  logo a crença da presença muda para fora
        .broadcast(tell, proprietario_saiu).

+!verificar_pessoa: pessoa_presente(P) & proprietario(PO) & P \== PO 
  <-  .print("Desconhecido entrou em casa");
      .broadcast(achieve, invasao).
      
     

