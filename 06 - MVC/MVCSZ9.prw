#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCSZ9
    (long_description)
    @type  Function
    @author Flávio Lisboa
    @since 12/08/2021
    @version version
    @param param_name, param_type, param_descr
    @return oModel, Objeto da função MVC meu modelo de dados, return_description
    @example
    (examples)
    @see (https://tdn.totvs.com/display/framework/FWFormStruct)
    @see (https://tdn.totvs.com/display/framework/MPFormModel)  
    /*/
User Function MVCSZ9()

Local aArea := GetNextAlias()
Local oBrowseSZ9 //Variável que recebera o instaciamento da classe FWMBroser

oBrowseSZ9 :=  FwmBrowse():New()
//Passo como parametro a tabela que eu quero mostra no Browse
oBrowseSZ9:SetAlias("SZ9")

oBrowseSZ9:SetDescription("Meu primeiro Browse - Tela de Protheuzeiro SZ9")

//Faz com que somente estes campos apareçam no Grid
oBrowseSZ9:SetOnlyFields({"Z9_CODIGO","Z9_NOME","Z9_SEXO","Z9_STATUS"})
                        /*EXPRESSÃO            /COR        /DESCRIÇÃO */

//oBrowseSZ9:SetFilterDefault("Z9_STATUS == '1'")
oBrowseSZ9:DisableDetails()

oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '1'","GREEN","Ativo")
oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '2'","RED","Inativo")

oBrowseSZ9:Activate()

RestArea(aArea)
    
Return 

/*/{Protheus.doc} Static Function MenuDef
    ()
    @type Static Function
    @author Flávio Lisboa
    @since 12/08/2021
    @return oView, Objeto da função MVC minha Visão de dados, return_description
    @see (https://tdn.totvs.com/display/framework/FWMVCMenu)
    /*/


Static Function MenuDef()

Local aRotina    := {}
Local aRotinaAut := FwMvcMenu("MVCSZ9") //Recebe os menus automaticamente

/*
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ9' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ9' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCSZ9' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ9' OPERATION 5 ACCESS 0*/
/*
1 - Pesquisar
2 - Visualizar
3 - Incluir
4 - Alterar
5 - Excluir
6 - Outras Funções
7 - Copiar
*/
//Populo a variável aRotina
ADD OPTION aRotina TITLE 'Legenda'    ACTION 'u_SZ9LEG'       OPERATION 6 ACCESS 0
ADD OPTION aRotina TITLE 'Sobre'      ACTION 'u_SZ9SOBRE'     OPERATION 6 ACCESS 0

//Adiciona dentro do array aRotina, o conteúdo do array aRotinaAut
For n := 1 TO Len(aRotinaAut)
    aAdd(aRotina,aRotinaAut[n])
NEXT n

Return aRotina

/*/{Protheus.doc} Static Function ModelDef
    (Monta as Definições da estrutura SZ9)
    @type Static Function
    @author Flávio Lisboa
    @since 12/08/2021
    @return oModel, Objeto da função MVC da Definição de dados, return_description
    @see (https://tdn.totvs.com/display/framework/FWFormStruct)
    @see (https://tdn.totvs.com/display/framework/MPFormModel)  
    /*/

Static Function ModelDef()

Local oModel := Nil
//Traz a estrutura da SZ9(Tabela e características dos campos), Para o modelo - (1 Model | 2 View)
Local oStructSZ9 := FWFormStruct(1,"SZ9")

oModel := MPFormModel():New("MVCSZ9M",/*bPre*/,/*bPos*/,/*bCommit*/,/*bCancel*/)
//Atribuindo formulario para o modelo de dados
oModel:AddFields("FORMSZ9",/*Owner*/,oStructSZ9)
//Definindo chave primária para a aplicação (quando a mesma não for informada na SX2)
oModel:SetPrimaryKey({"Z9_FILIAL","Z9_CODIGO"}) 

//Atribui ao modelo um texto explicativo sobre o objetivo do Modelo.
//O objetivo é mostrado em diversos operações, tais como web services,relatórios e schemas (xsd).
oModel:SetDescription("Modelo de Dados de Cadastro de Protheuzeiro")

//Fornece a Estrutura do modelo ou de um submodelo
oModel:GetModel("FORMSZ9"):SetDescription("Formulário de Cadastro de Protheuzeiro(a)")


Return oModel


/*/{Protheus.doc} Static Function ViewDef
    (Monta a Visão da estrutura definida na MVCSZ9 e ModelDef)
    @type Static Function
    @author Flávio Lisboa
    @since 12/08/2021
    @return oView, Objeto da função MVC minha Visão de dados, return_description
    @see (https://tdn.totvs.com/display/framework/FWFormView)  
    /*/

Static Function ViewDef()

Local oView := Nil

//Função que retorna um objeto de model de determinado fonte
Local oModel := FwLoadModel("MVCSZ9")

//Traz a estrutura da SZ9 - (1 Model | 2 View)
Local oStructSZ9 := FwFormStruct(2,"SZ9")

//Remove campo para o usuário não visualizar
oStructSZ9:RemoveField("Z9_ESTCIV")

//Construindo a parte de Visão dos Dados
oView := FwFormView():New()

//Passando o modelo de dados informado
oView:SetModel(oModel)

//Atribuição da estrutura de dados à camada de Visão
oView:AddField("VIEWSZ9",oStructSZ9,"FORMSZ9")

oView:CreateHorizontalBox("TELASZ9",100)

oView:EnableTitleView("VIEWSZ9","Visualização dos(as) Protheuzeiros(as)")

//Força o fechamento da janela. `Passando o Parâmentro .T.
oView:SetCloseOnOk({||.T.})

oView:SetOwnerView("VIEWSZ9","TELASZ9")


Return oView

User Function SZ9LEG()
    
Local aLegenda := {}    

aADD(aLegenda,{"BR_VERDE",     "Ativo"})
aADD(aLegenda,{"BR_VERMELHO","Inativo"})

BrwLegenda("Protheuzeiros(as)","Ativos/Inativos",aLegenda)

Return aLegenda


User Function SZ9SOBRE()
Local cSobre

cSobre := "-<b>Minha primeira tela em MVC modelo 1<br> Este fonte foi desenvolvido por um(a) Protheuzeiro da Sistematizei"

MsgInfo(cSobre, "Sobre")
    
Return 
