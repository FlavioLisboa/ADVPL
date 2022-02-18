#INCLUDE 'Protheus.ch'


User Function MVCSZ7M()

Local aParam := PARAMIXB

Local xRet     := .T.

Local oObject  := aParam[1]
Local cIdPonto := aParam[2]
Local cIdModel := aParam[3]

if aParam[2] <> Nil
    if cIdPonto == "FORMLINEPOS"
        if FWFldGet("Z7_QUANT") > 10
            Help(NIL, NIL, "QUANTIDADE MENOR QUE 10",NIL, "Quantidade n�o Permitida",;
            1,0,NIL,NIL,NIL,NIL,NIL,{"<b>Aten��o</b> Neste per�do de pandemia, limitamos a quantidade de compra em at� 10 unidades"})
                xRet := .F.         
        endif     
    endif
endif
    
Return xRet
