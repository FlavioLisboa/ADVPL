#INCLUDE 'Protheus.ch'

/*/{Protheus.doc} User Function ITEM
    (Ponto de entrada utilizado para modificar o cadastro de produtos
    quando ele estiver em MVC)
    @type  Function
    @author Flávio Lisboa
    @since 17/02/2022
    @version version
    @param xRet, indefinido, retorno da variável de controle
    @return return_var, return_type, return_description
    @example
    (examples)
    @see https://tdn.totvs.com/display/public/PROT/Pontos+de+Entrada+para+fontes+Advpl+desenvolvidos+utilizando+o+conceito+MVC
    @see https://centraldeatendimento.totvs.com/hc/pt-br/articles/360016345572-MP-ADVPL-Como-validar-se-uma-rotina-est%C3%A1-em-MVC
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=208345968
    @see https://centraldeatendimento.totvs.com/hc/pt-br/articles/360016405952-MP-ADVPL-PONTO-DE-ENTRADA-MVC-PARA-AS-ROTINAS-MATA010-MATA020-E-MATA030
    @see https://centraldeatendimento.totvs.com/hc/pt-br/articles/360000146128-MP-ADVPL-Pontos-de-Entrada-MVC-MATA030-na-P12   
    @see https://tdn.totvs.com/display/public/PROT/Fontes+em+MVC
    /*/
User Function ITEM()

Local aParam := PARAMIXB

/*/
RETORNO DO ARRAY aParam
1   O  Objeto do formulário ou do modelo, conforme o caso
2   C  ID do local de execução do ponto de entrada
3   c  ID do formulário
/*/

Local xRet     := .T.

Local oObject  := aParam[1]
Local cIdPonto := aParam[2]
Local cIdModel := aParam[3]

Local nOperation := oObject:GetOperation()

/*/
1- pesquisar
2- visualizar
3- incluir
4- alterar
5- excluir
6- outras funções
7- copiar
/*/

if aParam[2] <> Nil //Se ele estiver diferente de nulo, quer dizer que alguma ação está sendo feita no modelo
    if cIdPonto == "MODELPOS"
        if Len(AllTrim(M->B1_COD)) < 10 //Se estiver na Pós Validação (Clicou em Confirmar). Verificar se o campo de código do produto possui no mínimo 10 caracteres
            Help(NIL, NIL, "CODPRODUTO",NIL, "Código não permitido",;
            1,0,NIL,NIL,NIL,NIL,NIL,{"O Código <b>." + AllTrim(M->B1_COD) + "</b> deve ter no mínimo 10 caracteres<b>"})

            xRet := .F.

        elseif Len(AllTrim(M->B1_DESC)) < 15
             Help(NIL, NIL, "DESCPRODUTO",NIL, "Descrição do Produgo inválida",;
            1,0,NIL,NIL,NIL,NIL,NIL,{"A descrição  <b>."+ AllTrim(M->B1_DESC) + "</b> deve ter no mínimo 15 caracteres<b>"})

            xRet := .F.
        endif
    elseif nOperation = 5 // Exclusão
         Help(NIL, NIL, "EXCLUIRPRODUTO",NIL, "Exclusão não permitida",;
         1,0,NIL,NIL,NIL,NIL,NIL,{"O Produto não pode ser excluído em hipótese alguma<br>"+;
         "Consulte o departamento de TI desta unidade"})
        xRet := .F.
    endif
    
endif
    if aParam[2] <> Nil 
        if cIdPonto == "MODELCANCEL"
            Help(NIL, NIL, "CANCELAPRODUTO",NIL, "CANCEL",;
            1,0,NIL,NIL,NIL,NIL,NIL,{"Saída/Cancelamento abortado pelo usuário"})
                 lRet  := (MsgYesNo("Deseja fechar a janela?", "CANCELAR"))
    endif
endif

    
Return xRet
