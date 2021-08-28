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

RestArea(aArea)

Return 


Static Function MenuDef()

    


Return aRotina


Static Function ModelDef()

//Objeto respons�vel pela Cria��o da estrutura tempor�ria do cabe�alho
Local oStCabec := FWFormModelStruct():New()
//Objeto repons�vel pela estrutura dos itens
Local oStItens := FwFomrStruct(1,"SZ7") // 1 para Model - 2 para View

/*Objeto principal do desenvolvimento em MVC Modelo2,ele traz as caracter�sca do 
dicion�rio de dados bem como � o repons�vel pela estrutura de tabelas, campos e registros*/
Local oModel := MPFormModel("MVCSZ7M",/*bPre*/,/*bPos*/,/*bCommit*/,/*bCancel*/)

/*Cria��o da tabela tempor�ria que ser� utilizada no cabe�alho*/

oStCabec:AddTable("SZ7",{"Z7_FILIAL","Z7_NUM","Z7_ITEM"},"Cabe�alho SZ7")

//Cria��o dos campos da tabela tempor�ria
oStCabec:AddField(;
 "Filial",;                                                                                // [01] C T�tulos do Campo
 "Filial",;                                                                                // [02] C ToolTip do Campo
 "Z7_FILIAL",;                                                                             // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_FILIAL")[1],;                                                                  // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimal do Campo
 Nil,;                                                                                     // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                     // [08] B Code-block de Valida��o When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FILIAL,FWxFilial('SZ7'))"),;  // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                      // [14] L Indica se o campo � virtual

oStCabec:AddField(;
 "Numero",;                                                                                // [01] C T�tulos do Campo
 "Numero",;                                                                                // [02] C ToolTip do Campo
 "Z7_NUM",;                                                                                // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_NUM")[1],;                                                                     // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimal do Campo
 Nil,;                                                                                     // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                     // [08] B Code-block de Valida��o When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_NUM,'')"),;                   // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                      // [14] L Indica se o campo � virtual

oStCabec:AddField(;
 "Emissao",;                                                                               // [01] C T�tulos do Campo
 "Emissao",;                                                                               // [02] C ToolTip do Campo
 "Z7_EMISSAO",;                                                                            // [03] C Id do Field
 "D",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_EMISSAO")[1],;                                                                 // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimal do Campo
 Nil,;                                                                                     // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                     // [08] B Code-block de Valida��o When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_EMISSAO,dDataBase)"),;        // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                      // [14] L Indica se o campo � virtual

oStCabec:AddField(;
 "Fornecedor",;                                                                            // [01] C T�tulos do Campo
 "Fornecedor",;                                                                            // [02] C ToolTip do Campo
 "Z7_FORNECE",;                                                                            // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_FORNECE")[1],;                                                                 // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimal do Campo
 Nil,;                                                                                     // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                     // [08] B Code-block de Valida��o When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FORNECE,'')"),;               // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                      // [14] L Indica se o campo � virtual

oStCabec:AddField(;
 "Loja",;                                                                                  // [01] C T�tulos do Campo
 "Loja",;                                                                                  // [02] C ToolTip do Campo
 "Z7_LOJA",;                                                                               // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_LOJA")[1],;                                                                    // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimal do Campo
 Nil,;                                                                                     // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                     // [08] B Code-block de Valida��o When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_LOJA,'')"),;                  // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                      // [14] L Indica se o campo � virtual


oStCabec:AddField(;
 "Usuario",;                                                                               // [01] C T�tulos do Campo
 "Usuario",;                                                                               // [02] C ToolTip do Campo
 "Z7_USER",;                                                                               // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_USER")[1],;                                                                    // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decima do Campo
 Nil,;                                                                                     // [07] B Code-block de Valida��o do campo  
 Nil,;                                                                                     // [08] B Code-block de Valida��o When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigat�rio
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_USER,_cuserid)" ),;           // [11] B Code-block de inicializa��o do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma opera��o
 .F.)                                                                                      // [14] L Indica se o campo � virtual

//Agora vamos tratar a estrutura dos Itens, que ser�o utilizados no Grid da aplica��o

//Modificando os inicializadores padr�o, para n�o dar mensagem de colunas vazias
oStItens:SetProperty("Z7_NUM",     MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))
oStItens:SetProperty("Z7_USER",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD, '_cUserId'))//Trazer o usuario automaticamente
oStItens:SetProperty("Z7_EMISSAO", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,'dDatabase'))//Trazer a data autom�tica
oStItens:SetProperty("Z7_FORNECE", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))
oStItens:SetProperty("Z7_LOJA",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))

/*A partir de agora, eu fa�o a uni�o das estrutura, vinculando o cabe�alho com os itens
tamb�m fa�o a vincula��o da estrutura de dados dos itens ao modelo*/

oModel:AddFields("SZ7MASTER",oStCabec) //Fa�o a vincula��o com o StCabec(Cabe�alho e itens tempor�rios)
oModel:AddGrid("SZ7DETAIL","SZ7MASTER",oStItens,,,,,)

//Seto a rela��o entre cabe�alho e item, neste ponto, eu digo atrav�s de qual(ais) campo(s) o grid est� vinculado com o cabe�alho
aRetaions := {}
aAdd(aRelations,{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"})
aAdd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

//Outra formar de fazer
//oModel:SetRelation("SZ7DETAIL",{{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"},{"Z7->Z7_NUM"}},SZ7->(IndexKey(1)))

//Seto a chave primaria, lembrando que, se ela estiver definida no X2_UNICO, faz valor o que est� no X2_UNICO

oModel:SetPrimaryKey({})

oModelGetModel("SZ7DETAIL"):SetUniqueline("Z7_ITEM")//O intuito � que este campo n�o se repita


oModel:SetDescription("Modelo 2")

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
    Iif(INCLUI, .T., .F.),;    	// [10]  L   Indica se o campo � alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
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

/*Agora vamos para a segunda parte da ViewDef, onde n�s amarramos as estruturas de dados, montadas acima
com o objeto oView, e passamos para a nossa aplica��o todas as caracter�sticas visuais do projeto*/

//Instancio a classe FwFormView para o objeto View    
oView := FWFormView():New()

//Passo para o objeto View o modelo de dados que quero atrelar � ele Modelo + Visualiza��o
oView:SetModel(oModel)

//Monto a estrutura de visualiza��a do Master e do Detalhe (Cabe�alho e Itens)
oView:AddField("VIEW_SZ7M", oStCabec,"SZ7MASTER") //Cabe�alho/Master 
oView:AddGrid("VIEW_SZ7D" , oStItens,"SZ7DETAIL") //Itens/Grid

//Criamos a Tela, dividindo proporcionalmente o tamanho do cabe�alho e o tamanho do Grid
oView:CreateHorizontalBox("CABEC",30)
oView:CreateHorizontalBox("GRID" ,60)

/*Abaixo, digo para onde vai cada View criada, VIEW_SZ7M ir� para a cabec, VIEW_SZ7D ir� para GRID... 
Sendo assim, eu associo o View � cada Box criado*/
oView:SetOwnerView("VIEW_SZ7M","CABEC")
oView:SetOwnerView("VIEW_SZ7D","GRID")

//Ativar o t�tulo de cada VIEW/Box criado
oView:EnableTitleView("VIEW_SZ7M","Cabe�alho Solicita��o de Compras")
oView:EnableTitleView("VIEW_SZ7D","Itens de Solicita��o de Compras")

/*M�todo que seta um bloco de c�digo para verificar se a janela deve ou n�o
ser fechada ap�s a execu��o do bot�o OK*/
oView:SetCloseOnOk({|| .T.})

Return oView
