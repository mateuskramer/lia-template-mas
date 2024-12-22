+condicoes_inicias(dentro) <- +ligada(true).
+condicoes_inicias(fora) <- +ligada(false). 

!inicializar_lampada.

+!inicializar_lampada
  <- 	makeArtifact("lampada_quarto","artifacts.Lampada",[],D);
  	   	focus(D).
  	   	
+interuptor 
  <-  !!verificar_lampada.
      
+closed  <-  .print("Close event from GUIInterface").
   
 +!verificar_lampada: ligada(false)  
 	<-  .print("Alguém DESLIGOU a Lâmpada").
 	
 +!verificar_lampada: ligada(true)  
 	<-  .print("Alguém LIGOU a Lâmpada").



//Planos para as diferentes situações: 	
+proprietario_chegou <- !ligar_lampada.
+proprietario_saiu <- !desligar_lampada.
+!invasao <- !desligar_lampada.
 
 
 +!ligar_lampada: ligada(false)
 	<-  .print("LIGUEI a Lâmpada!");
		-+ligada(true).
 
 +!ligar_lampada: ligada(true)
	<-	.print("Lâmpada ligada").

 +!desligar_lampada: ligada(true)
	<- 	.print("DESLIGUEI a lâmpada");
		-+ligada(false).

 +!desligar_lampada: ligada(false)
	<-	.print("Lampâda desligada").


+invasao
	<- .print("invasão informada por ").
