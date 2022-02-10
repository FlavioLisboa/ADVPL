#include 'Protheus.ch'
#include 'FwMvcDef.ch'


User Function MVCVLD()
Local oBrowse := FwLoadBrw("MVCVLD")//Digo o fonte que eu estou buscando o BrowserDef

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
oBrowse:SetMenudef("MVCVLD")//Coloco o fonte de onde virá o menu

RestArea(aArea)

Return oBrowse

Static Function MenuDef()

Local aMenu    := {}
Local aMenuAut := FwMvcMenu("MVCVLD")
Local nNumber  := NIL

ADD OPTION aMenu TITLE 'Legenda' ACTION 'u_VLDLEG'     OPERATION 6 ACCESS 0
ADD OPTION aMenu TITLE 'Sobre'   ACTION  'u_VLDSOBRE'  OPERATION 6 ACCESS 0

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
Local oModel     := MPFormModel():New("MVCVLDM",/*bPre*/,/*bPos*/,/*bCommit*/,/*bCancel*/)
//Crio as estrutura das tabelas PAI(SZ2) e FILHO(SZ3)
Local oStPaiZ2   := FwFormStruct(1,"SZ2")
Local oStFilhoZ3 := FWFormStruct(1,"SZ3")

oStFilhoZ3:SetProperty("Z3_CHAMADO",MODEL_FIELD_INIT,FWBuildFeature(STRUCT_FEATURE_INIPAD, "SZ2->Z2_COD"))

aTrigUser := FwStruTrigger(;
"Z2_USUARIO",;
"Z2_USERNAM",;
"USRRETNAME(M->Z2_USUARIO)",;
.F.)

oStPaiZ2:AddTrigger(;
aTrigUser[1],;
aTrigUser[2],;
aTrigUser[3],;
aTrigUser[4])



oModel:AddFields("SZ2MASTER",,oStPaiZ2)
oModel:AddGrid("SZ3DETAIL","SZ2MASTER",oStFilhoZ3,,,,,)

//Chamo o método SetVldActivate e passo o parâmetro o bloco de código com a minha Static Function
oModel:SetVldActivate({|oModel| MActivVLD(oModel)})

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
Local oModel     := FwLoadModel("MVCVLD")
Local oStPaiZ2   := FwFormStruct(2,"SZ2")
Local oStFilhoZ3 := FwFormStruct(2,"SZ3")

oStFilhoZ3:RemoveField("Z3_CHAMADO")
oStFilhoZ3:SetProperty("Z3_CODIGO", MVC_VIEW_CANCHANGE, .F.)

oStPaiZ2:SetProperty("Z2_USUARIO", MVC_VIEW_LOOKUP, "USR")


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


User Function VLDLEG()

Local aLegenda := {}

aAdd(aLegenda,{"BR_VERDE"   ,"Chamado Aberto"})
aAdd(aLegenda,{"BR_AMARELO" ,"Chamado em Andamento"})
aAdd(aLegenda,{"BR_VERMELHO","Chamado Finalizado"})

BrwLegend("Status dos Chamados",,aLegenda)    

Return aLegenda


User Function VLDSOBRE()

Local cSobre

cSobre := "-<b>Minha primeira tela em MVC Modelo 3<br>"+;
"Este Sistema de Chamados foi desenvolvido por um(a) Protheuzeiro(a) da Sistematizei."

MsgInfo(cSobre, "Sobre o Programador...")

Return 

/*/{Protheus.doc} MACTIVLVD
    (Esta função fará a validação se o usuário está apto a entrar na rotina ou não
    Se ele não estiver dentro do parâmentro MV_XUSMVC, ele não poderá por exemplo... Incluir ou Alterar.)
    @type  Static Function
    @author Flávio Lisboa
    @since 24/01/2022
    @version version
    @param oModel, Object, 
    @return lRet, Logical, 
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function MActivVLD(oModel)

Local lRet     := .T.
Local cUserMVC := SUPERGETMVC("MV_XUSMVC")
Local cCodUser := RetCodUsr()

If !(cCodUser$cUserMVC)
    lRet := .F.

    Help(NIL, NIL, "MActivVLD",NIL, "Usuário não autorizado",;
    1,0,NIL,NIL,NIL,NIL,NIL,{"Este usuário não está autorizado à realizar está operação, vide parâmentro MV_XUSMVC"})

ENDIF


    
Return lRet
