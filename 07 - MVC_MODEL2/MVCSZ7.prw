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
Local oStItens := FwFomrStruct(1,"SZ7")

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
 0,;                                                                                       // [06] N Decimaldo do Campo
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
 0,;                                                                                       // [06] N Decimaldo do Campo
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
 0,;                                                                                       // [06] N Decimaldo do Campo
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
 0,;                                                                                       // [06] N Decimaldo do Campo
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
 0,;                                                                                       // [06] N Decimaldo do Campo
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
 0,;                                                                                       // [06] N Decimaldo do Campo
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
aAdd(aRetaions,{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"})
Aadd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

//Outra formar de fazer
//oModel:SetRelation("SZ7DETAIL",{{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"},{"Z7->Z7_NUM"}},SZ7->(IndexKey(1)))

//Seto a chave primaria, lembrando que, se ela estiver definida no X2_UNICO, faz valor o que est� no X2_UNICO

oModel:SetPrimaryKey({})

oModelGetModel("SZ7DETAIL"):SetUniqueline("Z7_ITEM")//O intuito � que esta campo n�o se repita

//Setanmos a descri��o/T�tulo que aparecer� no cabe�alho
oModel:SetDescription("MOdelo 2")
//Setamos as descri��o/T�tulos que aparecer� no Grid de itens
oModel:GetModel("SZ7MASTER"):SetDescription("Cab�alho da Solicita��o de Compras")

oModel:GetModel("SZ7DETAIL"):SetDescription("Itens da Solicita��o de Compras")

oModel:GetModel("SZ7DETAIL"):SetUseOldGrid(.T.)


Return oModel


Static Function ViewDef()
    
Return oView
