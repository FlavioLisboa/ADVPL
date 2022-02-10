#INCLUDE 'Protheus.ch'
#INCLUDE 'Totvs.ch'


/*Pessoal, bom dia! Para transmitir, monitorar e impressão do danfe no pedido de vendas.. acabou de sair do forno.. precisa testar bem, mas aqui já está rolando..*/

User Function MA410MNU
Public bFiltraBrw
Public aFilBrw     := {'SC5','.T.'}

	bFiltraBrw := {|| .T. }

	aAdd(aRotina,{'@ Nf-e Sefaz','SpedNFeRemessa'  , 0 , 2,0,NIL})
	aAdd(aRotina,{'@ Monitor'   ,'SpedNFe1Mnt'     , 0 , 2,0,NIL})
	aAdd(aRotina,{'@ DANFE'     ,'SpedDanfe'       , 0 , 2,0,NIL})

Return(Nil)
