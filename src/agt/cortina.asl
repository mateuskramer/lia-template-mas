+condicoes_inicias(fora)
  	<- 	+nivel_abertura(0).

+condicoes_inicias(dentro)
  	<- 	+nivel_abertura(50).


!inicializar_cortina.

abertura_preferencia(jonas,50).

+proprietario_chegou <- !ajustar_cortina.
+proprietario_saiu <- !fechar_cortina.
+!invasao <- !fechar_cortina.

+!inicializar_cortina
  <- 	makeArtifact("cortina_quarto","artifacts.Cortina",[],D);
  	   	focus(D).
  	   	  
+closed  <-  .print("Close event from GUIInterface").
   
+!ajustar_cortina: abertura_preferencia(_, NP)
	<-	.print("Abri a cortina. Nível de abertura: ", NP);
		-+nivel_abertura(NP).

+!fechar_cortina: nivel_abertura(N)
	<-	-+nivel_abertura(0);
		.print("Fechei a cortina. Nível de abartura: 0").
		
 	
 +!abrir_cortina: nivel_abertura(N) 
 	<-  .print("Nível de abertura ANTES: ", N);
 		.print("Nível de abertura DEPOIS: ", ND).

