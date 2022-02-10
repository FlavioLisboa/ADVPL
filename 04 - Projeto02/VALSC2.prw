#Include 'Protheus.ch'
#INCLUDE 'Totvs.ch'


/*/{Protheus.doc} User Function VALSC2
    (long_description)
    @type  Function
    @author user
    @since 27/01/2022
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function VALSC2()
//Local cProduto := M->C2_PRODUTO
Local cTipo    := POSICIONE('SB1',1,xFilial('SB1')+M->C2_PRODUTO,'B1_TIPO')
//Local cXLote   := M->C2_XLOTE

If cTipo = 'PA'
    MsgAlert("É obrigatório o preenchimento do campo Lote", "Preencher Lote")

ENDIF
    
Return 
