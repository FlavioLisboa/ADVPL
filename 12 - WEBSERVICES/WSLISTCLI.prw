#INCLUDE 'Protheus.ch'
#INCLUDE 'APWEBSRV.ch'
#INCLUDE 'TopConn.ch'

WSSTRUCT StClientes

    WSDATA clienteA1CODIGO     AS STRING OPTIONAL
    WSDATA clienteA1NOME       AS STRING OPTIONAL
    WSDATA clienteA1ENDERECO   AS STRING OPTIONAL
    WSDATA clienteA1CEP        AS STRING OPTIONAL
    WSDATA clienteA1BAIRRO     AS STRING OPTIONAL
    WSDATA clienteA1CIDADE     AS STRING OPTIONAL
    WSDATA clienteA1ESTADO     AS STRING OPTIONAL
    
ENDWSSTRUCT

//Estrutura de dados no formato/tipo Array, para receber a lista de clientes com base na estrutura acima
WSSTRUCT StListClientes

    WSDATA aRegsClientes    AS ARRAY OF StClientes OPTIONAL

    WSDATA cRet             AS STRING OPTIONAL
    WSDATA cMessage         AS STRING OPTIONAL

ENDWSSTRUCT 


WSSERVICE WSLISTCLIENTES DESCRIPTION "Serviço para lista os dados de clientes dentro de um intervalo especificado"

    WSDATA cClienteDe        AS STRING
    WSDATA cClienteAte       AS STRING

    WSDATA cToken            AS STRING 

    WSDATA WsListaClientes   AS StListClientes

    WSMETHOD BuscaClientes DESCRIPTION "Lista os Clientes da SA1 conforme filtros/parâmetros especificados na entrada"

ENDWSSERVICE

WSMETHOD BuscaClientes WSRECEIVE cToken, cClienteDe, cClienteAte WSSEND WsListaClientes WSSERVICE WSLISTCLIENTES 

    Local cCodDe        := ::cClienteDe
    Local cCodAte       := ::cClienteAte
    Local cTokenDefault := "#souprotheuzeiro"
    Local nIndex        := 1

IF Empty(::cToken)
    SetSoapFault("Token não informado","Operação não permitida!")
        RETURN .F.
ELSEIF cTokenDefault <> ::cToken
    SetSoapFault("Token inválido, informe o Token correto","Operação não permitida!")
        RETURN .F.
ELSE

    //Invertendo parâmetros caso o De seja maior que o Até

    IF  cCodDe > cCodAte
        cCodDe  := ::cClienteAte
        cCodAte := ::cClienteDe
    ENDIF

    DbSelectArea("SA1")
    SA1->(DbSetOrder(1))
    SA1->(DbSeek(xFilial("SA1")+cCodDe))

    WHILE SA1->(!EOF()) .AND. SA1->A1_COD <= cCodAte

        Aadd(::WsListaClientes:aRegsClientes, WSCLASSNEW("StClientes"))
             
             ::WsListaClientes:aRegsClientes[nIndex]:clienteA1CODIGO     := SA1->A1_COD
             ::WsListaClientes:aRegsClientes[nIndex]:clienteA1NOME       := SA1->A1_NOME
             ::WsListaClientes:aRegsClientes[nIndex]:clienteA1ENDERECO   := SA1->A1_END
             ::WsListaClientes:aRegsClientes[nIndex]:clienteA1CEP        := SA1->A1_CEP
             ::WsListaClientes:aRegsClientes[nIndex]:clienteA1BAIRRO     := SA1->A1_BAIRRO
             ::WsListaClientes:aRegsClientes[nIndex]:clienteA1CIDADE     := SA1->A1_MUN
             ::WsListaClientes:aRegsClientes[nIndex]:clienteA1ESTADO     := SA1->A1_EST
 
            nIndex++
    
        SA1->(DbSkip())
    ENDDO

        SA1->(DbCloseArea())

        IF Len(::WsListaClientes:aRegsClientes) > 0
            ::WsListaClientes:cRet      := "[T]" 
            ::WsListaClientes:cMessage  := "Dados retornados com sucesso!" 
        ELSE
            ::WsListaClientes:cRet      := "[F]" 
            ::WsListaClientes:cMessage  := "Não existe dados para essa consulta!" 
        ENDIF
ENDIF

RETURN .T.
