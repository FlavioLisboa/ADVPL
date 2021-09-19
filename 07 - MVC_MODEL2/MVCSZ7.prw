#INCLUDE 'Protheus.ch'
#INCLUDE 'FWMVCDEF.ch'


/*/{Protheus.doc} User Function MVCSZ7
    (Fun��o principal para a constru��o da tela de solicita��o de Compras da empresa
    Protheuzeiro Strong S/A, como base na fict�cia do treinamento da Sistematizei)
    @type  Function
    @author Fl�vio
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
oBrowse:SetDescription("Solicita��o de Compras")

oBrowse:Activate()

RestArea(aArea)

Return 


Static Function MenuDef()
//1� Op��o de Menu
Local aRotina := FwMvcMenu("MVCSZ7")

/*Segunda Op��o de Menu
Local aRotina := {}
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ7' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 5 ACCESS 0*/

/*Terceira Op��o de Menu
Local aRotina := {}
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_VIEW   ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_INSERT ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_UPDATE ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_DELETE ACCESS 0*/


Return aRotina


Static Function ModelDef()

//Objeto respons�vel pela Cria��o da estrutura tempor�ria do cabe�alho
Local oStCabec := FWFormModelStruct():New()
//Objeto repons�vel pela estrutura dos itens
Local oStItens := FwFormStruct(1,"SZ7") // 1 para Model - 2 para View

Local bVldPos  := {|| u_VldSZ7()} //Chamada da User Function Pos Validation que validar� a inclus�o antes de ir para inser��o dos itens no Grid

Local bVldCom  := {|| u_GrvSZ7()} //Chamada da User Function Commit que validar� a INCLUS�O/ALTERA��O/EXCLUS�O dos itens

/*Objeto principal do desenvolvimento em MVC Modelo2,ele traz as caracter�sca do 
dicion�rio de dados bem como � o repons�vel pela estrutura de tabelas, campos e registros*/
Local oModel := MPFormModel():New("MVCSZ7m",/*bPre*/,bVldPos,bVldCom,/*bCancel*/)

//Vari�veis que armazenar�o a estrutura da trigger dos campos quantidade e pre�o, que ir� gerar o conte�do do campo automaticamente
Local aTrigQtd := {}
Local aTrigPrc := {}

/*Cria��o da tabela tempor�ria que ser� utilizada no cabe�alho*/

oStCabec:AddTable("SZ7",{"Z7_FILIAL","Z7_NUM","Z7_ITEM"},"Cabe�alho SZ7")

//Cria��o dos campos da tabela tempor�ria
oStCabec:AddField(;
 "Filial",;                                                                                     // [01] C T�tulos do Campo
 "Filial",;                                                                                     // [02] C ToolTip do Campo
 "Z7_FILIAL",;                                                                                  // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_FILIAL")[1],;                                                                       // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                          // [08] B Code-block de Valida��o When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FILIAL,FWxFilial('SZ7'))"),;       // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                           // [14] L Indica se o campo � virtual

oStCabec:AddField(;
"Numero",;                                                                                      // [01] C T�tulos do Campo
"Numero",;                                                                                      // [02] C ToolTip do Campo
"Z7_NUM",;                                                                                      // [03] C Id do Field
"C",;                                                                                           // [04] C Tipo do Campo
TamSX3("Z7_NUM")[1],;                                                                           // [05] N Tamanho do Campo
0,;                                                                                             // [06] N Decimal do Campo
Nil,;                                                                                           // [07] B Code-block de Valida��o do campo  
Nil,;                                                                                           // [08] B Code-block de Valida��o When do campo
{},;                                                                                            // [09] A Lista de valores permitidos no campo
.F.,;                                                                                           // [10] L Indica se o campo tem preenchimento obrigat�rio
FWBuildFeature( STRUCT_FEATURE_INIPAD, 'Iif(!INCLUI,SZ7->Z7_NUM,GetSXENum("SZ7","Z7_NUM"))'),;  // [11] B Code-block de inicializa��o do campo
.T.,;                                                                                           // [12] L Indica se trata-se de um chave
.F.,;                                                                                           // [13] L Indica se o campo pode receber valor de uma opera��o
.F.)                                                                                            // [14] L Indica se o campo � virtual

oStCabec:AddField(;
 "Emissao",;                                                                                    // [01] C T�tulos do Campo
 "Emissao",;                                                                                    // [02] C ToolTip do Campo
 "Z7_EMISSAO",;                                                                                 // [03] C Id do Field
 "D",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_EMISSAO")[1],;                                                                      // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                          // [08] B Code-block de Valida��o When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_EMISSAO,dDataBase)"),;             // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                           // [14] L Indica se o campo � virtual

oStCabec:AddField(;
 "Fornecedor",;                                                                                 // [01] C T�tulos do Campo
 "Fornecedor",;                                                                                 // [02] C ToolTip do Campo
 "Z7_FORNECE",;                                                                                 // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_FORNECE")[1],;                                                                      // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                          // [08] B Code-block de Valida��o When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FORNECE,'')"),;                    // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                           // [14] L Indica se o campo � virtual

oStCabec:AddField(;
 "Loja",;                                                                                       // [01] C T�tulos do Campo
 "Loja",;                                                                                       // [02] C ToolTip do Campo
 "Z7_LOJA",;                                                                                    // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_LOJA")[1],;                                                                         // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decimal do Campo
 Nil,;                                                                                          // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                          // [08] B Code-block de Valida��o When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_LOJA,'')"),;                       // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                           // [14] L Indica se o campo � virtual


oStCabec:AddField(;
 "Usuario",;                                                                                    // [01] C T�tulos do Campo
 "Usuario",;                                                                                    // [02] C ToolTip do Campo
 "Z7_USER",;                                                                                    // [03] C Id do Field
 "C",;                                                                                          // [04] C Tipo do Campo
 TamSX3("Z7_USER")[1],;                                                                         // [05] N Tamanho do Campo
 0,;                                                                                            // [06] N Decima do Campo
 Nil,;                                                                                          // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                          // [08] B Code-block de Valida��o When do campo
 {},;                                                                                           // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                          // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_USER,__cUserid)" ),;               // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                          // [12] L Indica se trata-se de um chave
 .F.,;                                                                                          // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                           // [14] L Indica se o campo � virtual

//Agora vamos tratar a estrutura dos Itens, que ser�o utilizados no Grid da aplica��o

//Modificando os inicializadores padr�o, para n�o dar mensagem de colunas vazias
oStItens:SetProperty("Z7_NUM",     MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,   '"*"'))
oStItens:SetProperty("Z7_USER",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD, '__cUserId'))//Trazer o usuario automaticamente
oStItens:SetProperty("Z7_EMISSAO", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,'dDatabase'))//Trazer a data autom�tica
oStItens:SetProperty("Z7_FORNECE", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))
oStItens:SetProperty("Z7_LOJA",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))

/*Chamo a fun��o FwStruTrigger para montar o bloco de c�digo a Trigger, esse bloco de c�digo
ir� para dentro do array, e logo em seguida eu usarei 4 posi��es do array para criar a trigger
dentro do oStItens(Obejeto de itens do minha Trigger)*/
aTrigQtd := FwStruTrigger(;
"Z7_QUANT",; //Campo que ir� disparar o gatilho/Trigger
"Z7_TOTAL",; //Campo que ir� receber o conte�do disparado
"M->Z7_QUANT * M->Z7_PRECO",; //Conte�do que ir� para o campo Z7_TOTAL
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


/*A partir de agora, eu fa�o a uni�o das estrutura, vinculando o cabe�alho com os itens
tamb�m fa�o a vincula��o da estrutura de dados dos itens ao modelo*/

oModel:AddFields("SZ7MASTER",,oStCabec) //Fa�o a vincula��o com o StCabec(Cabe�alho e itens tempor�rios)
oModel:AddGrid("SZ7DETAIL","SZ7MASTER",oStItens,,,,,)

/*Adicionando model de totalizadores a aplica��o*/
               /*IDMODELO,    MASTER,   DETALHE,  CAMPOCALCULADO,  NOMEPERSONALIZADO, OPERA��O*/
oModel:AddCalc("SZ7TOTAL","SZ7MASTER","SZ7DETAIL","Z7_PRODUTO","QTDITENS","COUNT",,,                  "Quantidade de Itens")
oModel:AddCalc("SZ7TOTAL","SZ7MASTER","SZ7DETAIL","Z7_QUANT","QTDTOTAL"  ,"SUM"  ,,,                      "Total dos Itens")
oModel:AddCalc("SZ7TOTAL","SZ7MASTER","SZ7DETAIL","Z7_TOTAL","PRCTOTAL"  ,"SUM"  ,,,"Pre�o total da Solicita��o de Compras")


//Seto a rela��o entre cabe�alho e item, neste ponto, eu digo atrav�s de qual(ais) campo(s) o grid est� vinculado com o cabe�alho
aRelations := {}
aAdd(aRelations,{"Z7_FILIAL","Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))"})
aAdd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

//Outra formar de fazer
//oModel:SetRelation("SZ7DETAIL",{{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"},{"Z7->Z7_NUM"}},SZ7->(IndexKey(1)))

//Seto a chave primaria, lembrando que, se ela estiver definida no X2_UNICO, faz valor o que est� no X2_UNICO

oModel:SetPrimaryKey({})

oModel:GetModel("SZ7DETAIL"):SetUniqueline({"Z7_ITEM"})//O intuito � que este campo n�o se repita


//oModel:SetDescription("Modelo 2")

//Setanmos a descri��o/T�tulo que aparecer� no cabe�alho
oModel:GetModel("SZ7MASTER"):SetDescription("Cab�alho da Solicita��o de Compras")

//Setamos as descri��o/T�tulos que aparecer� no Grid de itens
oModel:GetModel("SZ7DETAIL"):SetDescription("Itens da Solicita��o de Compras")

//Finalizo a func��o model
oModel:GetModel("SZ7DETAIL"):SetUseOldGrid(.T.)// Finalizo setando o modelo antigo de Grid, que permite pegar aHeader e aCols.


Return oModel


/*/{Protheus.doc} ViewDef
    (long_description)
    @type  Static Function
    @author Flavio Lisboa
    @since 16/08/2021
    @version version
    @return oView, objeto, Objeto de Visualiza��o do fonte MVC
    @see https://tdn.totvs.com/display/framework/FWFormView
    @see https://centraldeatendimento.totvs.com/hc/pt-br/articles/360021003872-MP-ADVPL-ADDCALC-EM-CONJUNTO-COM-A-OPERA%C3%87%C3%83O-AVG-AVERAGE-
    @see https://tdn.totvs.com/display/framework/FWCalcStruct
    /*/
Static Function ViewDef()

Local oView         := Nil

/*Fa�o o Load do Movel referente � fun��o/fonte MVCSZ7, sendo assim se este Model
 estivesse em um outro fonte eu poderia pegar de l�, sem ter que copiar tudo de novo
 */
Local oModel        := FwLoadModel("MVCSZ7")

//Objeto encarregado de montar a estrutura tempor�ria do cabe�alho da View
Local oStCabec      := FwFormViewStruct():New()

/* Objeto respons�vel por montar a parte de estrutura dos itens/grid
Como estou usando FwFormStruct, ele traz a estrutura de TODOS OS CAMPOS, sendo assim
caso eu n�o queira que algum campo, apare�a na minha grid, eu devo remover este campo com RemoveField
*/
Local oStItens      := FwFormStruct(2,"SZ7") //1 para model 2 para view
Local oStTotais     := FwCalcStruct(oModel:GetModel("SZ7TOTAL"))

//Crio dentro da estrutura da View, os campos do cabe�alho

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
    Iif(INCLUI, .F., .F.),;    	// [10]  L   Indica se o campo � alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campoF
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior op��o do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo � virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil)                        // [18]  L   Indica pulo de linha ap�s o campo

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
    Iif(INCLUI, .T., .F.),;     // [10]  L   Indica se o campo � alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior op��o do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo � virtual
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
    Iif(INCLUI, .T., .F.),;     // [10]  L   Indica se o campo � alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior op��o do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo � virtual
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
    Iif(INCLUI, .T., .F.),;     // [10]  L   Indica se o campo � alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior op��o do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo � virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil)

oStCabec:AddField(;
    "Z7_USER",;                 // [01]  C   Nome do Campo
    "05",;                      // [02]  C   Ordem
    "Usu�rio",;                 // [03]  C   Titulo do campo
    X3Descric('Z7_USER'),;      // [04]  C   Descricao do campo
    Nil,;                       // [05]  A   Array com Help
    "C",;                       // [06]  C   Tipo do campo
    X3Picture("Z7_USER"),;      // [07]  C   Picture
    Nil,;                       // [08]  B   Bloco de PictTre Var
    Nil,;                       // [09]  C   Consulta F3
    .F.,;                       // [10]  L   Indica se o campo � alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
    Nil,;                       // [13]  A   Lista de valores permitido do campo (Combo)
    Nil,;                       // [14]  N   Tamanho maximo da maior op��o do combo
    Nil,;                       // [15]  C   Inicializador de Browse
    Nil,;                       // [16]  L   Indica se o campo � virtual
    Nil,;                       // [17]  C   Picture Variavel
    Nil) 

oStItens:RemoveField("Z7_NUM")
oStItens:RemoveField("Z7_EMISSAO")
oStItens:RemoveField("Z7_FORNECE")            
oStItens:RemoveField("Z7_LOJA")      
oStItens:RemoveField("Z7_USER") 

//Bloqueando os campos que s�o preenchidos autom�ticamente
oStItens:SetProperty("Z7_ITEM" , MVC_VIEW_CANCHANGE, .F.)
oStItens:SetProperty("Z7_TOTAL", MVC_VIEW_CANCHANGE, .F.)

/*Agora vamos para a segunda parte da ViewDef, onde n�s amarramos as estruturas de dados, montadas acima
com o objeto oView, e passamos para a nossa aplica��o todas as caracter�sticas visuais do projeto*/

//Instancio a classe FwFormView para o objeto View    
oView := FWFormView():New()

//Passo para o objeto View o modelo de dados que quero atrelar � ele Modelo + Visualiza��o
oView:SetModel(oModel)

//Monto a estrutura de visualiza��a do Master e do Detalhe (Cabe�alho e Itens)
oView:AddField("VIEW_SZ7M", oStCabec,"SZ7MASTER") //Cabe�alho/Master 
oView:AddGrid("VIEW_SZ7D" , oStItens,"SZ7DETAIL") //Itens/Grid
oView:AddField("VIEW_SZ7T" , oStTotais,"SZ7TOTAL") //Totalizadores

oView:AddIncrementField("SZ7DETAIL","Z7_ITEM") //Soma 1 ao campo de item.

//Criamos a Tela, dividindo proporcionalmente o tamanho do cabe�alho e o tamanho do Grid
oView:CreateHorizontalBox("CABEC",20)
oView:CreateHorizontalBox("GRID" ,50)
oView:CreateHorizontalBox("TOTAL",30)

/*Abaixo, digo para onde vai cada View criada, VIEW_SZ7M ir� para a cabec, VIEW_SZ7D ir� para GRID... 
Sendo assim, eu associo o View � cada Box criado*/
oView:SetOwnerView("VIEW_SZ7M","CABEC")
oView:SetOwnerView("VIEW_SZ7D","GRID")
oView:SetOwnerView("VIEW_SZ7T","TOTAL")

//Ativar o t�tulo de cada VIEW/Box criado
oView:EnableTitleView("VIEW_SZ7M","Cabe�alho Solicita��o de Compras")
oView:EnableTitleView("VIEW_SZ7D","Itens de Solicita��o de Compras")
oView:EnableTitleView("VIEW_SZ7T","Resumo da Solicita��o de Compras")

/*M�todo que seta um bloco de c�digo para verificar se a janela deve ou n�o
ser fechada ap�s a execu��o do bot�o OK*/
oView:SetCloseOnOk({|| .T.})

Return oView

/*/{Protheus.doc} User Function GrvSZ7()
    (long_description)
    @type  Function
    @author Flavio Lisboa
    @since 16/08/2021
    @version version
    @return lRet, Logical, Retorna TRUE ou FALSE para INCLUSAO, ALTERA��O e EXCLUS�O
/*/
User Function GrvSZ7()
Local aArea       := GetArea()
Local lRet        := .T.
//Capturo o modelo ativo, no caso o objeto do modelo(oModel) que est� sendo manipulado em nossa aplica��o
Local oModel      := FwModelActive()
//Criar modelo de dados MASTER/CABE�ALHO com base no model geral que foi capturado acima
Local oModelCabec := oModel:GetModel("SZ7MASTER")
//Criar modelo de dados DETALHE/ITENS com base no model geral que foi capturado acima
Local oModelItem  := oModel:GetModel("SZ7DETAIL")

/* Capturo os valores que est�o no CABE�ALHO, atrav�s do m�todo GetValue
Carrego os campos dentro das vari�veis, estas vari�veis ser�o utilizadas para
inserir o que foi digitado na tela, dentro do banco.
*/
Local cFilSZ7  := oModelCabec:GetValue("Z7_FILIAL")
Local cNum     := oModelCabec:GetValue("Z7_NUM")
Local dEmissao := oModelCabec:GetValue("Z7_EMISSAO")
Local cFornece := oModelCabec:GetValue("Z7_FORNECE")
Local cLoja    := oModelCabec:GetValue("Z7_LOJA")
Local cUser    := oModelCabec:GetValue("Z7_USER")

//Vari�veis que far�o a captura dos dados com base no aHeader e aCols
Local aHeaderAux := oModelItem:aHeader //Captura o aHeader do Grid
Local aColsAux   := oModelItem:aCols  //Captura o aCols do Grid

/*Precisamos agora pegar a posi��o de cada campo dentro do Grid.
Lembrando que neste caso, s� precisamos pegar a posi��o dos campos que n�o 
est�o no cabe�alho, somente os campos da Grid.
*/
Local nPosItem  := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_ITEM")})
Local nPosProd  := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_PRODUTO")})
Local nPosQtd   := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_QUANT")})
Local nPosPrc   := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_PRECO")})
Local nPosTotal := aScan(aHeaderAux,  {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_TOTAL")})

//Preciso pegar a linha atual que o usu�rio est� posicionado, para isso uma vari�vel
Local nLinAtu := 0

//Preciso identificar qual o tipo de opera��a que o usu�rio est� fazendo (INCLUS�O/ALTERA��O/EXCLUS�O)
Local cOption := oModelCabec:GetOperation()

/*Fazemos a sele��o da nossa �rea que ser� manipulada, ou seja,
  colocamos a tabela SZ7, em evid�ncia juntamente com um �ndice de ordena��o*/
  DbSelectArea("SZ7")
  SZ7->(DbSetOrder(1))

//Se a opera��o que est� sendo feita, for uma inser��o, ele far� a inser��o
if cOption == MODEL_OPERATION_INSERT
    for nLinAtu := 1 to Len(aColsAux) //Mede o tamanho do aCols ou seja, quantos itens exitem na Grid
        //Por�m, antes de tentar inserir, eu devo verificar, se a linha est� delatada.
        if !aColsAux[nLinAtu][Len(aHeaderAux)+1] //Express�o para verificar se uma linha est� exclu�da no aCols(se n�o estiver exclu�da, ele prossegue)
            //Se a linha estiver deletada, eu ainda preciso verificar se a linha deletada est� inclusa ou n�o no sistema
            RecLock("SZ7",.T.) // .T. para inclus�o .F. para altera��o/exclus�o
            //Dados do Cabe�alho
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
        //Por�m, antes de tentar inserir, eu devo verificar, se a linha est� delatada.
        if aColsAux[nLinAtu][Len(aHeaderAux)+1] //Express�o para verificar se uma linha est� exclu�da no aCols(se n�o estiver exclu�da, ele prossegue)
            //Se a linha estiver deletada, eu ainda preciso verificar se a linha deletada est� inclusa ou n�o no sistema
            SZ7->(DbSetOrder(2)) //�NDICE FILIAL+NUMEROPEDIDO+ITEM
            if SZ7->(DbSeek(cFilSZ7+cNum+aColsAux[nLinAtu,nPosItem]))//Faz a busca, se encontrar, ele deve deletar do banco
                  RecLock('SZ7',.F.)
                  DbDelete()
               SZ7->(MsUnlock())
            EndIf
        
         /*Se a linha n�o estiver exclu�da, fa�o a altera��o
         Embora seja uma altera��o, eu posso ter novos itens incluidos no meu pedido.
         Sendo assim, preciso validar se estes itens existem no banco de dados ou n�o.
         Caso eles n�o existam, eu fa�o uma inclus�o Reclock("SZ7",.T.)   
         */   
    else // 
        SZ7->(DbSetOrder(2)) //�NDICE FILIAL+NUMEROPEDIDO+ITEM
            if SZ7->(DbSeek(cFilSZ7+cNum+aColsAux[nLinAtu,nPosItem]))//Faz a busca, se encontrar, ele far� uma altera��o
                RecLock('SZ7',.F.)
                //Dados do Cabe�alho
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
    else  //Se ele n�o achar, � porque o item n�o existe ainda no banco, logo ir� incluir   
                RecLock('SZ7',.T.)
                //Dados do Cabe�alho
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
        /* Ele vai percorrer todo arquivo, e enquanto a filial for igual a do pedido e o n�mero
        do pedido for igual ao n�mero que est� posicionado para excluir(pedido que voc� quer excluir)
        ele far� a DELE��O/EXCLUS�O dos registros    
        */

    while !SZ7->(EOF()) .AND. SZ7->Z7_FILIAL = cFilSZ7 .AND. SZ7->Z7_NUM = cNum
          RecLock('SZ7',.F.)
                DbDelete()
           SZ7->(MsUnlock())

        SZ7->(DbSkip())
        
      ENDDO
 
/* OUTRA FORMA DE EXCLUS�O COM BASE NO QUE EST� NO GRID.
    SZ7->(dbSetOrder(2))
    For nLinAtu := 1 to Len(aColsAux)
        //Regrinha para verificar se a linha está excluída, se não tiver irá incluir
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
    @return lRet, Logical, retorno da valida��o de inclus�o do cabe�alho
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
        Help(Nil,Nil,"Escolha outro n�mero de pedido",Nil,"Este pedido/Solicita��o de compras j� existe em nosso sistema",1,0,Nil,Nil,Nil,Nil,Nil,{"Aten��o"})
        lRet := .F.
    endif
ENDIF

RestArea(aArea)

Return lRet
