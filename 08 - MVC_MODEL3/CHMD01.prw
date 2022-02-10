#include 'Protheus.ch'
#include 'FwMvcDef.ch'

/*/{Protheus.doc} User Function CHMD01
    Função principal para a construção da tela em MVC modelo 3 para um sistema de chamado simples
    , como base na proposta fictícia do treinamento da Sistematizei
    @Coment: A grande difereça das estruturas de dados do modelo 2 para o modelo 3, é que no modelo 2
    a estrutura de dados do cabeçalho é temporária/virtual/fica na memória, já no modelo 3/X
    todas as estruturas de dados, tendem à ser Reais, ou seja, importamos via FwFormStruct, a(s) tabela(s)
    Propriamente ditas.
    @type  User Function
    @author Flávio Lisboa
    @since 21/01/2022
    @version version
    @see (https://tdn.totvs.com/display/framework/FWFormModelStruct)
    @see (https://tdn.totvs.com/display/framework/FWFormStruct)
    @see (https://tdn.totvs.com/display/framework/MPFormModel)   
    @see (https://tdn.totvs.com/display/framework/FWBuildFeature)
    @see (https://tdn.totvs.com/display/framework/FWFormGridModel)
    /*/
User Function CHMD01()
Local oBrowse := FwLoadBrw("CHMD01")//Digo o fonte que eu estou buscando o BrowserDef

oBrowse:Activate()


return

/*/{Protheus.doc} BrowseDef
    (Função responsável por criar o Browser e retorná-lo para o Menu que o chama)
    @type  Static Function
    @author Flávio Lisboa
    @since 21/01/2022
    @version version
    @param param_name, param_type, param_descr
    @return oBrowser, Object, objetoBrowser
    @see (https://centraldeatendimento.totvs.com/hc/pt-br/articles/360016740431-MP-ADVPL-Estrutura-MVC-Pai-Filho-Neto)
/*/
Static Function BrowseDef()

Local aArea    := GetArea()    
Local oBrowse := FwMBrowse():New()

oBrowse:SetAlias("SZ2")
oBrowse:SetDescription("Cadastro de Chamados")

oBrowse:AddLegend("SZ2->Z2_STATUS == '1'","GREEN"  ,"Chamado Aberto")
oBrowse:AddLegend("SZ2->Z2_STATUS == '2'","RED"    ,"Chamado Finalizado")
oBrowse:AddLegend("SZ2->Z2_STATUS == '3'","YELLOW" ,"Chamado em Andamento")

//Deve definir de onde virá o MenuDef devo chamar o meu menu
oBrowse:SetMenudef("CHMD01")//Coloco o fonte de onde virá o menu

RestArea(aArea)

Return oBrowse

Static Function MenuDef()

Local aMenu    := {}
Local aMenuAut := FwMvcMenu("CHMD01")
Local nNumber  := Nil

ADD OPTION aMenu TITLE 'Legenda' ACTION 'u_SZ2LEG'     OPERATION 6 ACCESS 0
ADD OPTION aMenu TITLE 'Sobre'   ACTION  'u_SZ2SOBRE'  OPERATION 6 ACCESS 0

/*Utilizo um laço de repetição para adicionar à variável aMenu
o que eu criei automaticamente para a variável aMenuAut*/

for nNumber := 1 to Len(aMenuAut)
    aAdd(aMenu,aMenuAut[nNumber])
    
next nNumber

Return aMenu


/*/{Protheus.doc} ModelDef
    (long_description)
    @type  Static Function
    @author user
    @since 21/01/2022
    @version version
    @param param_name, param_type, param_descr
    @return oModel, Object, objeto oModel
    
/*/
Static Function ModelDef()

//Declaro o meu modelo de dados sem passar blocos de validação, pois usaremos a validação padrão em MVC
Local oModel := MPFormModel():New("CHMD01M",/*bPre{|oModel| MPreVld(oModel)}*/,{|oModel| MPosVld(oModel)},{|oModel| MComVld(oModel)},{|oModel| MCancVld(oModel)})
//Crio as estrutura das tabelas PAI(SZ2) e FILHO(SZ3)
Local oStPaiZ2   := FwFormStruct(1,"SZ2")
Local oStFilhoZ3 := FWFormStruct(1,"SZ3")

oStFilhoZ3:SetProperty("Z3_CHAMADO",MODEL_FIELD_INIT,FWBuildFeature(STRUCT_FEATURE_INIPAD, "SZ2->Z2_COD"))

oModel:AddFields("SZ2MASTER",,oStPaiZ2)
oModel:AddGrid("SZ3DETAIL","SZ2MASTER",oStFilhoZ3,,,,,)

oModel:SetRelation("SZ3DETAIL",{{"Z3_FILIAL","xFILIAL('SZ2')"},{"Z3_CHAMADO","Z2_COD"}},SZ3->(IndexKey(1)))

//Setamos a chave primária, prevalece o que está na SX2(X2_UNICO), se na SX2 estiver preechido
oModel:SetPrimaryKey({"Z3_FILIAL","Z3_CHAMADO","Z3_CODIGO"})

oModel:GetModel("SZ3DETAIL"):SetUniqueline({"Z3_CHAMADO","Z3_CODIGO"})

oModel:SetDescription("Modelo 3 - Sistema de Chamado")
oModel:GetModel("SZ2MASTER"):SetDescription("CABEÇALHO DO CHAMADO")
oModel:GetModel("SZ3DETAIL"):SetDescription("ITENS DO CHAMADO")

/*Como não vamos manipular aCols nem aHeader, não vou usar o SetOldGrid*/

    
Return oModel


    
Static Function ViewDef()

Local oView      := Nil
Local oModel     := FwLoadModel("CHMD01")
Local oStPaiZ2   := FwFormStruct(2,"SZ2")
Local oStFilhoZ3 := FwFormStruct(2,"SZ3")

oStFilhoZ3:RemoveField("Z3_CHAMADO")
oStFilhoZ3:SetProperty("Z3_CODIGO", MVC_VIEW_CANCHANGE, .F.)

oView := FwFormView():New()

oView:SetModel(oModel)
oView:AddField("VIEWSZ2",oStPaiZ2,"SZ2MASTER")
oView:AddGrid("VIEWSZ3",oStFilhoZ3,"SZ3DETAIL")

oView:AddIncrementField("SZ3DETAIL","Z3_CODIGO")

//Criamos os Boxes horizontais para Cabeçalho e Itens

oView:CreateHorizontalBox("CABEC",60)
oView:CreateHorizontalBox("GRID",40)

//Amarro as views criadas aos Boxes criados
oView:SetOwnerView("VIEWSZ2","CABEC")
oView:SetOwnerView("VIEWSZ3","GRID")

//Darei títulos personalizados ao cabeçalho e comentários do chamado
oView:EnableTitleView("VIEWSZ2","Detalhes do Chamado/Cabeçalho")
oView:EnableTitleView("VIEWSZ3","Comentários do chamado/Itens")

Return oView


User Function SZ2LEG()

Local aLegenda := {}

aAdd(aLegenda,{"BR_VERDE"   ,"Chamado Aberto"})
aAdd(aLegenda,{"BR_AMARELO" ,"Chamado em Andamento"})
aAdd(aLegenda,{"BR_VERMELHO","Chamado Finalizado"})

BrwLegend("Status dos Chamados",,aLegenda)    

Return aLegenda


User Function SZ2SOBRE()

Local cSobre

cSobre := "-<b>Minha primeira tela em MVC Modelo 3<br>"+;
"Este Sistema de Chamados foi desenvolvido por um(a) Protheuzeiro(a) da Sistematizei."

MsgInfo(cSobre, "Sobre o Programador...")

Return 


/*Static Function MPreVld(oModel)

Local lRet := .T.  

MsgAlert("Você está passandro por uma validação", "validação")

if oModel:GetValue("SZ2MASTER","Z2_DATA") > dDatabase
      Help(NIL, NIL, "MPreVld",NIL, "Prevalidação",;
      1,0,NIL,NIL,NIL,NIL,NIL,{"Data maior que a data base, coloque a data igual ou anterio"})
      lRet := .F.
    
endif


Return lRet
/*/


Static Function MPosVld(oModel)
    
Local lRet         := .T.
Local cTitChamado  := oModel:GetValue("SZ2MASTER","Z2_TITCHAM")
Local nLen         := Len(AllTrim(cTitChamado))

If nLen < 15
     lRet := .F.
     Help(NIL, NIL, "MPosVld",NIL, "POSVALIDATION",;
     1,0,NIL,NIL,NIL,NIL,NIL,{"O Título do Chamado deve conter no mínimo 15 caracteres"})
endif


Return lRet


Static Function MComVld(oModel)
    
Local lRet := .T.

Alert("Você está passando pela validação do COMMIT")

FwFormCommit(oModel)


Return lRet


Static Function MCancVld(oModel)
    
Local lRet := .T.

If !(MsgYesNo("Deseja fechar a janela?", "CANCELAR"))
     Help(NIL, NIL, "MCancVld",NIL, "CANCEL",;
     1,0,NIL,NIL,NIL,NIL,NIL,{"Saída/Cancelamento abortado pelo usuário"})
     lRet  := .F.
endif


Return lRet
