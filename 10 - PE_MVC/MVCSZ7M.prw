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
            Help(NIL, NIL, "QUANTIDADE MENOR QUE 10",NIL, "Quantidade não Permitida",;
            1,0,NIL,NIL,NIL,NIL,NIL,{"<b>Atenção</b> Neste perído de pandemia, limitamos a quantidade de compra em até 10 unidades"})
                xRet := .F.         
        endif     
    endif
endif
    
Return xRet
