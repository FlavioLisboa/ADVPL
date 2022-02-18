#INCLUDE 'Protheus.ch'


User Function CUSTOMERVENDOR()

Local aParam := PARAMIXB

Local xRet     := .T.

Local oObject  := aParam[1]
Local cIdPonto := aParam[2]
Local cIdModel := aParam[3]

Local cRazSoc   := AllTrim(M->A2_NOME)
Local cFantasia := AllTrim(M->A2_NREDUZ)

if aParam[2] <> Nil
    if cIdPonto == "MODELPOS"
         if Len(cRazSoc) < 20
            Help(NIL, NIL, "RAZSOC",NIL, "Razão Social Inválida",;
            1,0,NIL,NIL,NIL,NIL,NIL,{"A Razão Social <b>" + cRazSoc + "</b> deve ter no mínimo <b>20</b> caracteres"})
                xRet := .F.
        elseif Len(cFantasia) < 10
        Help(NIL, NIL, "NOMEFAN",NIL, "Nome Fantasia Inválido",;
        1,0,NIL,NIL,NIL,NIL,NIL,{"O Nome Fantasia <b>" + cFantasia + "</b> deve ter no mínimo <b>10</b> caracteres"})
            xRet := .F.        
        endif
        elseif cIdPonto == "BUTTONBAR"
            xRet := {{"Produto x Fornecedor","Produto x Fornecedor",{||MATA061()},"Chama a amarração prod x forn"}}            
    endif
endif

    
Return xRet
