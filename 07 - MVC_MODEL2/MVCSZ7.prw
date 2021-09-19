#INCLUDE 'Protheus.ch'
#INCLUDE 'FWMVCDEF.ch'


/*/{Protheus.doc} User Function MVCSZ7
    (Função principal para a construção da tela de solicitação de Compras da empresa
    Protheuzeiro Strong S/A, como base na fictícia do treinamento da Sistematizei)
    @type  Function
    @author Flávio
    @since 16/08/2021
    @version version
    @param param_name, param_type, param_descr
    @see (https://tdn.totvs.com/display/framework/FWFormModelStruct)
    @see (https://tdn.totvs.com/display/framework/FWFormStruct)
    @see (https://tdn.totvs.com/display/framework/MPFormModel)   
    @see (https://tdn.totvs.com/display/framework/FWBuildFeature)
    @see (https://tdn.totvs.com/display/framework/FWFormGridModel)
    /*/

User Function MVCSZ7()

Local aArea    := GetArea()
Local oBrowse  := FwmBrowse():New()

oBrowse:SetAlias("SZ7")
oBrowse:SetDescription("Solicitação de Compras")

oBrowse:Activate()

RestArea(aArea)

Return 


Static Function MenuDef()
//1ª Opção de Menu
Local aRotina := FwMvcMenu("MVCSZ7")

/*Segunda Opção de Menu
Local aRotina := {}
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ7' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 5 ACCESS 0*/

/*Terceira Opção de Menu
Local aRotina := {}
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_VIEW   ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_INSERT ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_UPDATE ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_DELETE ACCESS 0*/


Return aRotina


Static Function ModelDef()

//Objeto responsável pela Criação da estrutura temporária do cabeçalho
Local oStCabec := FWFormModelStruct():New()
//Objeto reponsável pela estrutura dos itens
Local oStItens := FwFormStruct(1,"SZ7") // 1 para Model - 2 para View

Local bVldPos  := {|| u_VldSZ7()} //Chamada da User Function Pos Validation que validará a inclusão antes de ir para inserção dos itens no Grid

Local bVldCom  := {|| u_GrvSZ7()} //Chamada da User Function Commit que validará a INCLUSÃO/ALTERAÇÃO/EXCLUSÃO dos itens

/*Objeto principal do desenvolvimento em MVC Modelo2,ele traz as caracterísca do 
dicionário de dados bem como é o reponsável pela estrutura de tabelas, campos e registros*/
Local oModel := MPFormModel():New("MVCSZ7m",/*bPre*/,bVldPos,bVldCom,/*bCancel*/)

//Variáveis que armazenarão a estrutura da trigger dos campos quantidade e preço, que irá gerar o conteúdo do campo automaticamente
Local aTrigQtd := {}
Local aTrigPrc := {}

/*Criação da tabela temporária que será utilizada no cabeçalho*/

oStCabec:AddTable("SZ7",{"Z7_FILIAL","Z7_NUM","Z7_ITEM"},"Cabeçalho SZ7")

//Criação dos campos da tabela temporária
oStCabec:AddField(;
 "Filial",;                                                                                     // [01] C Títulos do Campo
 "Filial",;                                                                                     // [02] C ToolTip do Campo
 "Z7_FILIAL",;                                                                                  // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_FILIAL")[1],;                                                                       // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Validação do campo  
 Nil,;                                                                                          // [08] B Code-block de Validação When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FILIAL,FWxFilial('SZ7'))"),;       // [11] B Code-block de inicialização do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                           // [14] L Indica se o campo é virtual

oStCabec:AddField(;
"Numero",;                                                                                      // [01] C Títulos do Campo
"Numero",;                                                                                      // [02] C ToolTip do Campo
"Z7_NUM",;                                                                                      // [03] C Id do Field
"C",;                                                                                           // [04] C Tipo do Campo
TamSX3("Z7_NUM")[1],;                                                                           // [05] N Tamanho do Campo
0,;                                                                                             // [06] N Decimal do Campo
Nil,;                                                                                           // [07] B Code-block de Validação do campo  
Nil,;                                                                                           // [08] B Code-block de Validação When do campo
{},;                                                                                            // [09] A Lista de valores permitidos no campo
.F.,;                                                                                           // [10] L Indica se o campo tem preenchimento obrigatório
FWBuildFeature( STRUCT_FEATURE_INIPAD, 'Iif(!INCLUI,SZ7->Z7_NUM,GetSXENum("SZ7","Z7_NUM"))'),;  // [11] B Code-block de inicialização do campo
.T.,;                                                                                           // [12] L Indica se trata-se de um chave
.F.,;                                                                                           // [13] L Indica se o campo pode receber valor de uma operação
.F.)                                                                                            // [14] L Indica se o campo é virtual

oStCabec:AddField(;
 "Emissao",;                                                                                    // [01] C Títulos do Campo
 "Emissao",;                                                                                    // [02] C ToolTip do Campo
 "Z7_EMISSAO",;                                                                                 // [03] C Id do Field
 "D",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_EMISSAO")[1],;                                                                      // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Validação do campo  
 Nil,;                                                                                          // [08] B Code-block de Validação When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_EMISSAO,dDataBase)"),;             // [11] B Code-block de inicialização do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                           // [14] L Indica se o campo é virtual

oStCabec:AddField(;
 "Fornecedor",;                                                                                 // [01] C Títulos do Campo
 "Fornecedor",;                                                                                 // [02] C ToolTip do Campo
 "Z7_FORNECE",;                                                                                 // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_FORNECE")[1],;                                                                      // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Validação do campo  
 Nil,;                                                                                          // [08] B Code-block de Validação When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FORNECE,'')"),;                    // [11] B Code-block de inicialização do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                           // [14] L Indica se o campo é virtual

oStCabec:AddField(;
 "Loja",;                                                                                       // [01] C Títulos do Campo
 "Loja",;                                                                                       // [02] C ToolTip do Campo
 "Z7_LOJA",;                                                                                    // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_LOJA")[1],;                                                                         // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Validação do campo  
 Nil,;                                                                                          // [08] B Code-block de Validação When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_LOJA,'')"),;                       // [11] B Code-block de inicialização do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                           // [14] L Indica se o campo é virtual


oStCabec:AddField(;
 "Usuario",;                                                                                    // [01] C Títulos do Campo
 "Usuario",;                                                                                    // [02] C ToolTip do Campo
 "Z7_USER",;                                                                                    // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_USER")[1],;                                                                         // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decima do Campo
 Nil,;                                                                                          // [07] B Code-block de Validação do campo  
 Nil,;                                                                                          // [08] B Code-block de Validação When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_USER,__cUserid)" ),;               // [11] B Code-block de inicialização do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                           // [14] L Indica se o campo é virtual

//Agora vamos tratar a estrutura dos Itens, que serão utilizados no Grid da aplicação

//Modificando os inicializadores padrão, para não dar mensagem de colunas vazias
oStItens:SetProperty("Z7_NUM",     MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,   '"*"'))
oStItens:SetProperty("Z7_USER",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD, '__cUserId'))//Trazer o usuario automaticamente
oStItens:SetProperty("Z7_EMISSAO", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,'dDatabase'))//Trazer a data automática
oStItens:SetProperty("Z7_FORNECE", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))
oStItens:SetProperty("Z7_LOJA",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))

/*Chamo a função FwStruTrigger para montar o bloco de código a Trigger, esse bloco de código
irá para dentro do array, e logo em seguida eu usarei 4 posições do array para criar a trigger
dentro do oStItens(Obejeto de itens do minha Trigger)*/
aTrigQtd := FwStruTrigger(;
"Z7_QUANT",; //Campo que irá disparar o gatilho/Trigger
"Z7_TOTAL",; //Campo que irá receber o conteúdo disparado
"M->Z7_QUANT * M->Z7_PRECO",; //Conteúdo que irá para o campo Z7_TOTAL
.F.)

aTrigPrc := FwStruTrigger(;
"Z7_PRECO",;
"Z7_TOTAL",;
"M->Z7_QUANT * M->Z7_PRECO",;
.F.)

oStItens:AddTrigger(;
aTrigQtd[1],;
aTrigQtd[2],;
aTrigQtd[3],;
aTrigQtd[4])


oStItens:AddTrigger(;
aTrigPrc[1],;
aTrigPrc[2],;
aTrigPrc[3],;
aTrigPrc[4])


/*A partir de agora, eu faço a união das estrutura, vinculando o cabeçalho com os itens
também faço a vinculação da estrutura de dados dos itens ao modelo*/

oModel:AddFields("SZ7MASTER",,oStCabec) //Faço a vinculação com o StCabec(Cabeçalho e itens temporários)
oModel:AddGrid("SZ7DETAIL","SZ7MASTER",oStItens,,,,,)

/*Adicionando model de totalizadores a aplicação*/
               /*IDMODELO,    MASTER,   DETALHE,  CAMPOCALCULADO,  NOMEPERSONALIZADO, OPERAÇÃO*/
oModel:AddCalc("SZ7TOTAL","SZ7MASTER","SZ7DETAIL","Z7_PRODUTO","QTDITENS","COUNT",,,                  "Quantidade de Itens")
oModel:AddCalc("SZ7TOTAL","SZ7MASTER","SZ7DETAIL","Z7_QUANT","QTDTOTAL"  ,"SUM"  ,,,                      "Total dos Itens")
oModel:AddCalc("SZ7TOTAL","SZ7MASTER","SZ7DETAIL","Z7_TOTAL","PRCTOTAL"  ,"SUM"  ,,,"Preço total da Solicitação de Compras")


//Seto a relação entre cabeçalho e item, neste ponto, eu digo através de qual(ais) campo(s) o grid está vinculado com o cabeçalho
aRelations := {}
aAdd(aRelations,{"Z7_FILIAL","Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))"})
aAdd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

//Outra formar de fazer
//oModel:SetRelation("SZ7DETAIL",{{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"},{"Z7->Z7_NUM"}},SZ7->(IndexKey(1)))

//Seto a chave primaria, lembrando que, se ela estiver definida no X2_UNICO, faz valor o que está no X2_UNICO

oModel:SetPrimaryKey({})

oModel:GetModel("SZ7DETAIL"):SetUniqueline({"Z7_ITEM"})//O intuito é que este campo não se repita


//oModel:SetDescription("Modelo 2")

//Setanmos a descrição/Título que aparecerá no cabeçalho
oModel:GetModel("SZ7MASTER"):SetDescription("Cabçalho da Solicitação de Compras")

//Setamos as descrição/Títulos que aparecerá no Grid de itens
oModel:GetModel("SZ7DETAIL"):SetDescription("Itens da Solicitação de Compras")

//Finalizo a funcção model
oModel:GetModel("SZ7DETAIL"):SetUseOldGrid(.T.)// Finalizo setando o modelo antigo de Grid, que permite pegar aHeader e aCols.


Return oModel


/*/{Protheus.doc} ViewDef
    (long_description)
    @type  Static Function
    @author Flavio Lisboa
    @since 16/08/2021
    @version version
    @return oView, objeto, Objeto de Visualização do fonte MVC
    @see https://tdn.totvs.com/display/framework/FWFormView
    @see https://centraldeatendimento.totvs.com/hc/pt-br/articles/360021003872-MP-ADVPL-ADDCALC-EM-CONJUNTO-COM-A-OPERA%C3%87%C3%83O-AVG-AVERAGE-
    @see https://tdn.totvs.com/display/framework/FWCalcStruct
    /*/
Static Function ViewDef()

Local oView         := Nil

/*Faço o Load do Movel referente à função/fonte MVCSZ7, sendo assim se este Model
 estivesse em um outro fonte eu poderia pegar de lá, sem ter que copiar tudo de novo
 */
Local oModel        := FwLoadModel("MVCSZ7")

//Objeto encarregado de montar a estrutura temporária do cabeçalho da View
Local oStCabec      := FwFormViewStruct():New()

/* Objeto responsável por montar a parte de estrutura dos itens/grid
Como estou usando FwFormStruct, ele traz a estrutura de TODOS OS CAMPOS, sendo assim
caso eu não queira que algum campo, apareça na minha grid, eu devo remover este campo com RemoveField
*/
Local oStItens      := FwFormStruct(2,"SZ7") //1 para model 2 para view
Local oStTotais     := FwCalcStruct(oModel:GetModel("SZ7TOTAL"))

//Crio dentro da estrutura da View, os campos do cabeçalho

oStCabec:AddField(;
    "Z7_NUM",;                  // [01]  C   Nome do Campo
    "01",;                      // [02]  C   Ordem
    "Pedido",;                  // [03]  C   Titulo do campo
    X3Descric('Z7_NUM'),;       // [04]  C   Descricao do campo
    Nil,;                       // [05]  A   Array com Help
    "C",;                       // [06]  C   Tipo do campo
    X3Picture("Z7_NUM"),;       // [07]  C   Picture
    Nil,;                       // [08]  B   Bloco de PictTre Var
    Nil,;                       // [09]  C   Consulta F3
    Iif(INCLUI, .F., .F.),;    	// [10]  L   Indica se o campo é alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campoF
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior opção do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo é virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil)                        // [18]  L   Indica pulo de linha após o campo

oStCabec:AddField(;
    "Z7_EMISSAO",;              // [01]  C   Nome do Campo
    "02",;                      // [02]  C   Ordem
    "Emissao",;                 // [03]  C   Titulo do campo
    X3Descric('Z7_EMISSAO'),;   // [04]  C   Descricao do campo
    Nil,;                       // [05]  A   Array com Help
    "D",;                       // [06]  C   Tipo do campo
    X3Picture("Z7_EMISSAO"),;   // [07]  C   Picture
    Nil,;                       // [08]  B   Bloco de PictTre Var
    Nil,;                       // [09]  C   Consulta F3
    Iif(INCLUI, .T., .F.),;     // [10]  L   Indica se o campo é alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior opção do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo é virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil)  

oStCabec:AddField(;
    "Z7_FORNECE",;              // [01]  C   Nome do Campo
    "03",;                      // [02]  C   Ordem
    "Fornecedor",;              // [03]  C   Titulo do campo
    X3Descric('Z7_FORNECE'),;   // [04]  C   Descricao do campo
    Nil,;                       // [05]  A   Array com Help
    "C",;                       // [06]  C   Tipo do campo
    X3Picture("Z7_FORNECE"),;   // [07]  C   Picture
    Nil,;                       // [08]  B   Bloco de PictTre Var
    "SA2",;                     // [09]  C   Consulta F3
    Iif(INCLUI, .T., .F.),;     // [10]  L   Indica se o campo é alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior opção do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo é virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil) 

oStCabec:AddField(;
    "Z7_LOJA",;                 // [01]  C   Nome do Campo
    "04",;                      // [02]  C   Ordem
    "Loja",;                    // [03]  C   Titulo do campo
    X3Descric('Z7_LOJA'),;      // [04]  C   Descricao do campo
    Nil,;                       // [05]  A   Array com Help
    "C",;                       // [06]  C   Tipo do campo
    X3Picture("Z7_LOJA"),;      // [07]  C   Picture
    Nil,;                       // [08]  B   Bloco de PictTre Var
    Nil,;                       // [09]  C   Consulta F3
    Iif(INCLUI, .T., .F.),;     // [10]  L   Indica se o campo é alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior opção do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo é virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil)

oStCabec:AddField(;
    "Z7_USER",;                 // [01]  C   Nome do Campo
    "05",;                      // [02]  C   Ordem
    "Usuário",;                 // [03]  C   Titulo do campo
    X3Descric('Z7_USER'),;      // [04]  C   Descricao do campo
    Nil,;                       // [05]  A   Array com Help
    "C",;                       // [06]  C   Tipo do campo
    X3Picture("Z7_USER"),;      // [07]  C   Picture
    Nil,;                       // [08]  B   Bloco de PictTre Var
    Nil,;                       // [09]  C   Consulta F3
    .F.,;                       // [10]  L   Indica se o campo é alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior opção do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo é virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil) 

oStItens:RemoveField("Z7_NUM")
oStItens:RemoveField("Z7_EMISSAO")
oStItens:RemoveField("Z7_FORNECE")            
oStItens:RemoveField("Z7_LOJA")      
oStItens:RemoveField("Z7_USER") 

//Bloqueando os campos que são preenchidos automáticamente
oStItens:SetProperty("Z7_ITEM" , MVC_VIEW_CANCHANGE, .F.)
oStItens:SetProperty("Z7_TOTAL", MVC_VIEW_CANCHANGE, .F.)

/*Agora vamos para a segunda parte da ViewDef, onde nós amarramos as estruturas de dados, montadas acima
com o objeto oView, e passamos para a nossa aplicação todas as características visuais do projeto*/

//Instancio a classe FwFormView para o objeto View    
oView := FWFormView():New()

//Passo para o objeto View o modelo de dados que quero atrelar à ele Modelo + Visualização
oView:SetModel(oModel)

//Monto a estrutura de visualizaçõa do Master e do Detalhe (Cabeçalho e Itens)
oView:AddField("VIEW_SZ7M", oStCabec,"SZ7MASTER") //Cabeçalho/Master 
oView:AddGrid("VIEW_SZ7D" , oStItens,"SZ7DETAIL") //Itens/Grid
oView:AddField("VIEW_SZ7T" , oStTotais,"SZ7TOTAL") //Totalizadores

oView:AddIncrementField("SZ7DETAIL","Z7_ITEM") //Soma 1 ao campo de item.

//Criamos a Tela, dividindo proporcionalmente o tamanho do cabeçalho e o tamanho do Grid
oView:CreateHorizontalBox("CABEC",20)
oView:CreateHorizontalBox("GRID" ,50)
oView:CreateHorizontalBox("TOTAL",30)

/*Abaixo, digo para onde vai cada View criada, VIEW_SZ7M irá para a cabec, VIEW_SZ7D irá para GRID... 
Sendo assim, eu associo o View à cada Box criado*/
oView:SetOwnerView("VIEW_SZ7M","CABEC")
oView:SetOwnerView("VIEW_SZ7D","GRID")
oView:SetOwnerView("VIEW_SZ7T","TOTAL")

//Ativar o título de cada VIEW/Box criado
oView:EnableTitleView("VIEW_SZ7M","Cabeçalho Solicitação de Compras")
oView:EnableTitleView("VIEW_SZ7D","Itens de Solicitação de Compras")
oView:EnableTitleView("VIEW_SZ7T","Resumo da Solicitação de Compras")

/*Método que seta um bloco de código para verificar se a janela deve ou não
ser fechada após a execução do botão OK*/
oView:SetCloseOnOk({|| .T.})

Return oView

/*/{Protheus.doc} User Function GrvSZ7()
    (long_description)
    @type  Function
    @author Flavio Lisboa
    @since 16/08/2021
    @version version
    @return lRet, Logical, Retorna TRUE ou FALSE para INCLUSAO, ALTERAÇÃO e EXCLUSÃO
/*/
User Function GrvSZ7()
Local aArea       := GetArea()
Local lRet        := .T.
//Capturo o modelo ativo, no caso o objeto do modelo(oModel) que está sendo manipulado em nossa aplicação
Local oModel      := FwModelActive()
//Criar modelo de dados MASTER/CABEÇALHO com base no model geral que foi capturado acima
Local oModelCabec := oModel:GetModel("SZ7MASTER")
//Criar modelo de dados DETALHE/ITENS com base no model geral que foi capturado acima
Local oModelItem  := oModel:GetModel("SZ7DETAIL")

/* Capturo os valores que estão no CABEÇALHO, através do método GetValue
Carrego os campos dentro das variáveis, estas variáveis serão utilizadas para
inserir o que foi digitado na tela, dentro do banco.
*/
Local cFilSZ7  := oModelCabec:GetValue("Z7_FILIAL")
Local cNum     := oModelCabec:GetValue("Z7_NUM")
Local dEmissao := oModelCabec:GetValue("Z7_EMISSAO")
Local cFornece := oModelCabec:GetValue("Z7_FORNECE")
Local cLoja    := oModelCabec:GetValue("Z7_LOJA")
Local cUser    := oModelCabec:GetValue("Z7_USER")

//Variáveis que farão a captura dos dados com base no aHeader e aCols
Local aHeaderAux := oModelItem:aHeader //Captura o aHeader do Grid
Local aColsAux   := oModelItem:aCols  //Captura o aCols do Grid

/*Precisamos agora pegar a posição de cada campo dentro do Grid.
Lembrando que neste caso, só precisamos pegar a posição dos campos que não 
estão no cabeçalho, somente os campos da Grid.
*/
Local nPosItem  := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_ITEM")})
Local nPosProd  := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_PRODUTO")})
Local nPosQtd   := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_QUANT")})
Local nPosPrc   := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_PRECO")})
Local nPosTotal := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_TOTAL")})

//Preciso pegar a linha atual que o usuário está posicionado, para isso uma variável
Local nLinAtu := 0

//Preciso identificar qual o tipo de operaçõa que o usuário está fazendo (INCLUSÃO/ALTERAÇÃO/EXCLUSÃO)
Local cOption := oModelCabec:GetOperation()

/*Fazemos a seleção da nossa área que será manipulada, ou seja,
  colocamos a tabela SZ7, em evidência juntamente com um índice de ordenação*/
  DbSelectArea("SZ7")
  SZ7->(DbSetOrder(1))

//Se a operação que está sendo feita, for uma inserção, ele fará a inserção
if cOption == MODEL_OPERATION_INSERT
    for nLinAtu := 1 to Len(aColsAux) //Mede o tamanho do aCols ou seja, quantos itens exitem na Grid
        //Porém, antes de tentar inserir, eu devo verificar, se a linha está delatada.
        if !aColsAux[nLinAtu][Len(aHeaderAux)+1] //Expressão para verificar se uma linha está excluída no aCols(se não estiver excluída, ele prossegue)
            //Se a linha estiver deletada, eu ainda preciso verificar se a linha deletada está inclusa ou não no sistema
            RecLock("SZ7",.T.) // .T. para inclusão .F. para alteração/exclusão
            //Dados do Cabeçalho
            Z7_FILIAL  := cFilSZ7
            Z7_NUM     := cNum
            Z7_EMISSAO := dEmissao
            Z7_FORNECE := cFornece
            Z7_LOJA    := cLoja
            Z7_USER    := cUser

            //Dados do Grid (Itens)    
            Z7_ITEM    := aColsAux[nLinAtu, nPosItem] //Array aCols, posicionado na linha atual
            Z7_PRODUTO := aColsAux[nLinAtu, nPosProd]     
            Z7_QUANT   := aColsAux[nLinAtu,  nPosQtd]
            Z7_PRECO   := aColsAux[nLinAtu,  nPosPrc]
            Z7_TOTAL   := aColsAux[nLinAtu,nPosTotal]
            SZ7->(MsUnlock())
        EndIf
    NEXT n

elseif cOption == MODEL_OPERATION_UPDATE
    for nLinAtu := 1 to Len(aColsAux) //Mede o tamanho do aCols ou seja, quantos itens exitem na Grid
        //Porém, antes de tentar inserir, eu devo verificar, se a linha está delatada.
        if aColsAux[nLinAtu][Len(aHeaderAux)+1] //Expressão para verificar se uma linha está excluída no aCols(se não estiver excluída, ele prossegue)
            //Se a linha estiver deletada, eu ainda preciso verificar se a linha deletada está inclusa ou não no sistema
            SZ7->(DbSetOrder(2)) //ÍNDICE FILIAL+NUMEROPEDIDO+ITEM
            if SZ7->(DbSeek(cFilSZ7+cNum+aColsAux[nLinAtu,nPosItem]))//Faz a busca, se encontrar, ele deve deletar do banco
                  RecLock('SZ7',.F.)
                  DbDelete()
               SZ7->(MsUnlock())
            EndIf
        
         /*Se a linha não estiver excluída, faço a alteração
         Embora seja uma alteração, eu posso ter novos itens incluidos no meu pedido.
         Sendo assim, preciso validar se estes itens existem no banco de dados ou não.
         Caso eles não existam, eu faço uma inclusão Reclock("SZ7",.T.)   
         */   
    else // 
        SZ7->(DbSetOrder(2)) //ÍNDICE FILIAL+NUMEROPEDIDO+ITEM
            if SZ7->(DbSeek(cFilSZ7+cNum+aColsAux[nLinAtu,nPosItem]))//Faz a busca, se encontrar, ele fará uma alteração
                RecLock('SZ7',.F.)
                //Dados do Cabeçalho
                Z7_FILIAL  := cFilSZ7
                Z7_NUM     := cNum
                Z7_EMISSAO := dEmissao
                Z7_FORNECE := cFornece
                Z7_LOJA    := cLoja
                Z7_USER    := cUser

                //Dados do Grid (Itens)    
                Z7_ITEM    := aColsAux[nLinAtu, nPosItem] //Array aCols, posicionado na linha atual
                Z7_PRODUTO := aColsAux[nLinAtu, nPosProd]     
                Z7_QUANT   := aColsAux[nLinAtu,  nPosQtd]
                Z7_PRECO   := aColsAux[nLinAtu,  nPosPrc]
                Z7_TOTAL   := aColsAux[nLinAtu,nPosTotal]
            SZ7->(MsUnlock())
    else  //Se ele não achar, é porque o item não existe ainda no banco, logo irá incluir   
                RecLock('SZ7',.T.)
                //Dados do Cabeçalho
                Z7_FILIAL  := cFilSZ7
                Z7_NUM     := cNum
                Z7_EMISSAO := dEmissao
                Z7_FORNECE := cFornece
                Z7_LOJA    := cLoja
                Z7_USER    := cUser

                //Dados do Grid (Itens)    
                Z7_ITEM    := aColsAux[nLinAtu, nPosItem] //Array aCols, posicionado na linha atual
                Z7_PRODUTO := aColsAux[nLinAtu, nPosProd]     
                Z7_QUANT   := aColsAux[nLinAtu,  nPosQtd]
                Z7_PRECO   := aColsAux[nLinAtu,  nPosPrc]
                Z7_TOTAL   := aColsAux[nLinAtu,nPosTotal]
            SZ7->(MsUnlock())
            endif
        endif

    NEXT n

ELSEIF cOption == MODEL_OPERATION_DELETE
    SZ7->(DbSetOrder(1)) //FILIAL + NUMEROPEDIDO    
        /* Ele vai percorrer todo arquivo, e enquanto a filial for igual a do pedido e o número
        do pedido for igual ao número que está posicionado para excluir(pedido que você quer excluir)
        ele fará a DELEÇÃO/EXCLUSÃO dos registros    
        */

    while !SZ7->(EOF()) .AND. SZ7->Z7_FILIAL = cFilSZ7 .AND. SZ7->Z7_NUM = cNum
          RecLock('SZ7',.F.)
                DbDelete()
           SZ7->(MsUnlock())

        SZ7->(DbSkip())
        
      ENDDO
 
/* OUTRA FORMA DE EXCLUSÃO COM BASE NO QUE ESTÁ NO GRID.
    SZ7->(dbSetOrder(2))
    For nLinAtu := 1 to Len(aColsAux)
        //Regrinha para verificar se a linha estÃ¡ excluÃ­da, se nÃ£o tiver irÃ¡ incluir
        IF SZ7->(DbSeek(cFilSZ7+cNum+aColsAux[nLinAtu][nPosItem]))
            RECLOCK("SZ7",.F.)
                DbDelete()
            SZ7->(MsUnlock())
        Endif
    Next nLinAtu
*/	

ENDIF

RestArea(aArea)

Return lRet

/*/{Protheus.doc} User Function VldSZ7
    (long_description)
    @type  Function
    @author user
    @since 18/09/2021
    @version version
    @return lRet, Logical, retorno da validação de inclusão do cabeçalho
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function VldSZ7()

Local aArea       := GetArea()
Local lRet        := .T.
Local oModel      := FwModelActive()
Local oModelCabec := oModel:GetModel("SZ7MASTER")
Local cFilSZ7     := oModelCabec:GetValue("Z7_FILIAL")
Local cNum        := oModelCabec:GetValue("Z7_NUM")
Local cOption     := oModelCabec:GetOperation()

IF cOption == MODEL_OPERATION_INSERT
    DbSelectArea("SZ7")
    SZ7->(DbSetOrder(1))
    if SZ7->(DbSeek(cFilSZ7+cnum))
        Help(Nil,Nil,"Escolha outro número de pedido",Nil,"Este pedido/Solicitação de compras já existe em nosso sistema",1,0,Nil,Nil,Nil,Nil,Nil,{"Atenção"})
        lRet := .F.
    endif
ENDIF

RestArea(aArea)

Return lRet
