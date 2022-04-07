#INCLUDE 'Protheus.ch'
#INCLUDE 'APWEBSRV.ch'
#INCLUDE 'TopConn.ch'

WSSTRUCT STProduto
    WSDATA produtoB1COD     AS STRING OPTIONAL
    WSDATA produtoB1DESC    AS STRING OPTIONAL
    WSDATA produtoB1UM      AS STRING OPTIONAL
    WSDATA produtoB1TIPO    AS STRING OPTIONAL
    WSDATA produtoB1POSIPI  AS STRING OPTIONAL
    WSDATA produtoB1GRUPO   AS STRING OPTIONAL
ENDWSSTRUCT

//Estrutura de retorno sucesso/sem sucesso
WSSTRUCT STRetMsgProd
    WSDATA cRet            AS STRING OPTIONAL
    WSDATA cMessage        AS STRING OPTIONAL
ENDWSSTRUCT

//REtorno do WebService
WSSTRUCT STRetGeralProd
    WSDATA WSBuscaProd     AS STProduto
    WSDATA WsSTRetMsg      AS STRetMsgProd
ENDWSSTRUCT

WSSERVICE WSPRODSB1 DESCRIPTION "Servico para retornar os dados de Produtos especifico para Protheuzeiro Strong"

        //Código que será requisitado pelo método de Busca do Cliente
        WSDATA _cCodProduto AS STRING

        //Chamada da estrutura de retorno que será retornada pelo médoto
        WSDATA WSRetGeralProd AS STRetGeralProd

        WSMETHOD BuscaProduto  DESCRIPTION "Busca Produto da tabela SB1 através do Codigo" 
ENDWSSERVICE

//          Método             Parâmetro de entrada     Retorno do WS          WS a qual percence
WSMETHOD BuscaProduto WSRECEIVE _cCodProduto WSSEND WSRetGeralProd WSSERVICE WSPRODSB1

Local cCodProduto := ::_cCodProduto


DbSelectArea("SB1")
SB1->(DbSetOrder(1))

IF SB1->(DbSeek(xFilial("SB1")+cCodProduto))
    ::WsRetGeralProd:WsSTRetMsg:cRet              := "[T]"
    ::WsRetGeralProd:WsSTRetMsg:cMessage          := "Sucesso! Registro encontrado, dados listados."
    ::WSRetGeralProd:WSBuscaProd:produtoB1COD     := SB1->B1_COD
    ::WSRetGeralProd:WSBuscaProd:produtoB1DESC    := SB1->B1_DESC
    ::WSRetGeralProd:WSBuscaProd:produtoB1UM      := SB1->B1_UM
    ::WSRetGeralProd:WSBuscaProd:produtoB1TIPO    := SB1->B1_TIPO
    ::WSRetGeralProd:WSBuscaProd:produtoB1POSIPI  := SB1->B1_POSIPI
    ::WSRetGeralProd:WSBuscaProd:produtoB1GRUPO   := Posicione("SBM",1,xFilial("SBM")+SB1->B1_GRUPO,"BM_DESC")
ELSE
    ::WsRetGeralProd:WsSTRetMsg:cRet              := "[F]"
    ::WsRetGeralProd:WsSTRetMsg:cMessage          := "Falha! Não existe registro relacionado à esta entrada(Código)"
ENDIF

SB1->(DbCloseArea())

RETURN .T.
