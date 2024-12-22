//Condições iniciais


+condicoes_inicias(fora) 
  	<- 	+fechada(true);
     	+trancada(true).

+condicoes_inicias(dentro)
  	<- 	+fechada(false);
     	+trancada(false). 

!inicializar_fechadura.

+!inicializar_fechadura
  <- 	makeArtifact("fechadura_quarto","artifacts.Fechadura",[],D);
  	   	focus(D).
  	   	
  	   	
+movimento_macaneta <- !verificar_fechada.

+!verificar_fechada: trancada(true) 
  <-  .print("Alguém mexeu na MAÇANETA, porém a porta está trancada!").
+!verificar_fechada: fechada(true)
  <-  .print("Alguém mexeu na MAÇANETA e FECHOU a porta!").
+!verificar_fechada: fechada(false)
  <-  .print("Alguém mexeu na MAÇANETA e ABRIU a porta!").
  
+movimento_fechadura <- !verificar_trancada.

+!verificar_trancada: trancada(true)
  <-  .print("Alguém mexeu na FECHADURA e TRANCOU a porta!").
+!verificar_trancada: trancada(false)
  <-  .print("Alguém mexeu na FECHADURA e DESTRANCOU a porta!").
      
+closed  <-  .print("Close event from GUIInterface").


+proprietario_chegou <- !abrir_porta.
+proprietario_saiu <- !trancar_porta.
+!invasao <- !trancar_porta.


+!abrir_porta: fechada(true) & trancada(false)
	<- .print("ABRI a porta");
		-+fechada(false).

+!abrir_porta: fechada(true) & trancada(true)
	<- !destrancar_porta.

+!abrir_porta: fechada(false) 
	<- .print("Porta aberta!").

+!destrancar_porta: trancada(true)
	<-	.print("Porta destracada");
		-+trancada(false);
		!abrir_porta.


+!fechar_porta: fechada(true)
 	<-  .print("Porta Fechada!");
 		!trancar_porta.
 	
+!fechar_porta: fechada(false)
 	<-  .print("FECHEI a porta");
		-+fechada(true);
 		!fechar_porta.
 		
+!trancar_porta: trancada(true)
 	<- .print("Porta Trancada!").
 	
+!trancar_porta: trancada(false) & fechada(true)
 	<- 	.print("TRANQUEI a porta!");
		-+trancada(true).

+!trancar_porta: trancada(false) & fechada(false)
	<-	!fechar_porta.


	
