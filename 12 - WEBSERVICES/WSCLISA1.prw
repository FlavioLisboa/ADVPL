#INCLUDE 'Protheus.ch'
#INCLUDE 'APWEBSRV.ch'
#INCLUDE 'TopConn.ch'

//CÓDIGO, NOME, CPF, ENDEREÇO, BAIRRO, ESTADO E CEP;

WSSTRUCT STCliente
    WSDATA clienteA1COD     AS STRING OPTIONAL
    WSDATA clienteA1LOJA    AS STRING OPTIONAL
    WSDATA clienteA1NOME    AS STRING OPTIONAL
    WSDATA clienteA1CPF     AS STRING OPTIONAL
    WSDATA clienteA1END     AS STRING OPTIONAL
    WSDATA clienteA1BAIRRO  AS STRING OPTIONAL
    WSDATA clienteA1MUNICIP AS STRING OPTIONAL
    WSDATA clienteA1ESTADO  AS STRING OPTIONAL
    WSDATA clienteA1CEP     AS STRING OPTIONAL
ENDWSSTRUCT

//Estrutura de retorno sucesso/sem sucesso
WSSTRUCT STRetMsg
    WSDATA cRet                 AS STRING OPTIONAL
    WSDATA cMessage             AS STRING OPTIONAL
ENDWSSTRUCT

//REtorno do WebService
WSSTRUCT STRetornoGeral
    WSDATA WSSTClient   AS STCliente
    WSDATA WsSTRetMsg   AS STRetMsg
ENDWSSTRUCT

WSSERVICE WSCLISA1 DESCRIPTION "Servico para retornar os dados de cliente especifico para Protheuzeiro Strong"

        //Código que será requisitado pelo método de Busca do Cliente
        WSDATA _cCodClienteLoja AS STRING

        //Chamada da estrutura de retorno que será retornada pelo médoto
        WSDATA WSRetornoGeral AS STRetornoGeral

        WSMETHOD BuscaCliente  DESCRIPTION "Busca clientes da tabela SA1 com base no Codigo e loja"
ENDWSSERVICE

//          Método             Parâmetro de entrada     Retorno do WS          WS a qual percence
WSMETHOD BuscaCliente WSRECEIVE _cCodClienteLoja WSSEND WSRetornoGeral WSSERVICE WSCLISA1

Local cCliCodLoja := ::_cCodClienteLoja


DbSelectArea("SA1")
SA1->(DbSetOrder(1))

IF SA1->(DbSeek(xFilial("SA1")+cCliCodLoja))
    ::WsRetornoGeral:WsSTRetMsg:cRet              := "[T]"
    ::WsRetornoGeral:WsSTRetMsg:cMessage          := "Sucesso! Registro encontrado, dados listados."
    ::WSRetornoGeral:WSSTClient:clienteA1COD      := SA1->A1_COD
    ::WSRetornoGeral:WSSTClient:clienteA1LOJA     := SA1->A1_LOJA
    ::WSRetornoGeral:WSSTClient:clienteA1NOME     := SA1->A1_NOME
    ::WSRetornoGeral:WSSTClient:clienteA1CPF      := SA1->A1_CGC
    ::WSRetornoGeral:WSSTClient:clienteA1END      := SA1->A1_END
    ::WSRetornoGeral:WSSTClient:clienteA1BAIRRO   := SA1->A1_BAIRRO
    ::WSRetornoGeral:WSSTClient:clienteA1MUNICIP  := SA1->A1_MUN
    ::WSRetornoGeral:WSSTClient:clienteA1ESTADO   := SA1->A1_EST
    ::WSRetornoGeral:WSSTClient:clienteA1CEP      := SA1->A1_CEP

ELSE
    ::WsRetornoGeral:WsSTRetMsg:cRet                := "[F]"
    ::WsRetornoGeral:WsSTRetMsg:cMessage            := "Falha! Não existe registro relacionado à esta entrada(Código + Loja)"
ENDIF

SA1->(DbCloseArea())

RETURN .T.
