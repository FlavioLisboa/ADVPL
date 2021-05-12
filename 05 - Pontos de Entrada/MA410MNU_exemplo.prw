f#Include 'Protheus.ch'
#Include  'Totvs.ch'

User Function MA410MNU()
    
Return

Sintaxe
MA410MNU ( ) --> Nil

Retorno
Nil(nulo)
Nil
Observações
Exemplos
aadd(aRotina,{'TEXTO DO BOTÃO','NOME DA FUNÇÃO' , 0 , 3,0,NIL})  
ONDE:Parametros do array a Rotina:
1. Nome a aparecer no cabecalho
2. Nome da Rotina associada    
3. Reservado                        
4. Tipo de Transação a ser efetuada:     
1 - Pesquisa e Posiciona em um Banco de Dados      
2 - Simplesmente Mostra os Campos                  
3 - Inclui registros no Bancos de Dados            
4 - Altera o registro corrente                     
5 - Remove o registro corrente do Banco de Dados 
5. Nivel de acesso                                   
6. Habilita Menu Funcional



User Function MA410MNU()

	aadd(aRotina, {"Imprimir Pre-Nota Html","U_VIT344"	 ,0,2,0 ,NIL})

	IF RetCodUsr() $(GETMV("MV_CUPOMC5"))
		aadd(aRotina, {"ADC/ALT Cupons","U_PVITFT01"	 ,0,2,0 ,NIL})

	ENDIF

	IF RetCodUsr() $(GETMV("MV_IMPC5")) 
		aadd(aRotina, {"Imprimir ETIQUETA","U_ImpPFT01"	 ,0,2,0 ,NIL})
	ENDIF
		
		
Return
