// Agent gui in project aula10

/* Initial beliefs and rules */

temperatura_de_preferencia(jonas,25).

+condicoes_inicias(fora)
  	<- 	+ligado(false);
     	+temperatura_ambiente(28);
     	+temperatura_ac(25);
		+temperatura_de_preferencia(jonas,25).

+condicoes_inicias(dentro)
  	<- 	+ligado(true);
     	+temperatura_ambiente(25);
     	+temperatura_ac(25);
		+temperatura_de_preferencia(jonas,25).

/* Initial goals */

!inicializar_AC.

+!inicializar_AC
  <- 	makeArtifact("ac_quarto","artifacts.ArCondicionado",[],D);
  	   	focus(D).

+proprietario_chegou 
	<-	.wait(1000);  
		!definir_temperatura.
		

+proprietario_saiu 
	<- 	!desligar.

+!invasao
	<- 	-+temperatura_ac(40); //supondo que seja o máximo.
		.print("Definindo temperatura máxima de 40 graus, protocolo de invasão.").


+alterado : temperatura_ambiente(TA) & temperatura_ac(TAC)
  <-  .drop_intention(climatizar);
  	  .print("Houve interação com o ar condicionado!");
  	  .print("Temperatura Ambiente: ", TA);
 	  .print("Temperatura Desejada: ", TAC);
  	  !!climatizar.
      
+closed  <-  .print("Close event from GUIInterface").
   
 +!definir_temperatura: temperatura_ambiente(TA) & temperatura_ac(TAC) 
 			& temperatura_de_preferencia(User,TP) & TP \== TD & ligado(false)
 	<-  definir_temperatura(TP);
 		.print("Definindo temperatura baseado na preferência do usuário ", User);
 		.print("Temperatura: ", TP).
 	
 +!definir_temperatura: temperatura_ambiente(TA) & temperatura_ac(TAC) & ligado(false)
 	<-  .print("Usando última temperatura");
 		.print("Temperatura: ", TAC).
 		
 		
 +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA \== TAC & ligado(false)
 	<-   ligar;
 		.print("Ligando ar condicionado...");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC);
 		.wait(1000);
 		!!climatizar.
 		
 +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA \== TAC & ligado(true) 
 	<-  .print("Aguardando regular a temperatura de ", TA, " para ", TAC, "...");
 		.wait(4000);
 		!!climatizar.
 		 	
  +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA == TAC & ligado(true) 
 	<-   desligar;
 		.print("Desligando ar condicionado...");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC).

 +!climatizar 
 	<- 	.print("Não foram implementadas outras opções.");
 		.print("Temperatura regulada.").


+!desligar: ligado(true)
	<-	.print("Desliguei o ar");
		-+ligado(false).

+!desligar: ligado(false)
	<-	.print("Ar deligado").


