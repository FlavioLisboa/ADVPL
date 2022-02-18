#INCLUDE 'Protheus.ch'


User Function MATA070()

Local aParam := PARAMIXB

Local xRet     := .T.

Local oObject  := aParam[1]
Local cIdPonto := aParam[2]
Local cIdModel := aParam[3]

if aParam[2] <> Nil
    if cIdPonto == "MODELPOS"
        if Empty(M->A6_DVAGE) .OR. Empty(M->A6_DVCTA)
            Help(NIL, NIL, "MATA070",NIL, "DV de Agência ou Conta em branco",;
            1,0,NIL,NIL,NIL,NIL,NIL,{"O dígito verificador da <b>Agência</b> e da <b>Conta</b> devem ser preenchidos"})
                xRet := .F.         
        endif     
    endif
endif
    
Return xRet
