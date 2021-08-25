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
    /*/

User Function MVCSZ7()

Local aArea    := GetArea()
Local oBrowse  := FwmBrowse():New()

oBrowse:SetAlias("SZ7")
oBrowse:SetDescription("Solicitação de Compras")

RestArea(aArea)

Return 


Static Function MenuDef()
    


Return aRotina


Static Function ModelDef()

//Objeto responsável pela Criação da estrutura temporária do cabeçalho
Local oStCabec := FWFormModelStruct():New()
//Objeto reponsável pela estrutura dos itens
Local oStItens := FwFomrStruct(1,"SZ7")

/*Objeto principal do desenvolvimento em MVC Modelo2,ele traz as caracterísca do 
dicionário de dados bem como é o reponsável pela estrutura de tabelas, campos e registros*/
Local oModel := MPFormModel("MVCSZ7M",/*bPre*/,/*bPos*/,/*bCommit*/,/*bCancel*/)

/*Criação da tabela temporária que será utilizada no cabeçalho*/

oStCabec:AddTable("SZ7",{"Z7_FILIAL","Z7_NUM","Z7_ITEM"},"Cabeçalho SZ7")

//Criação dos campos da tabela temporária
oStCabec:AddField(;
 "Filial",;                                                                                // [01] C Títulos do Campo
 "Filial",;                                                                                // [02] C ToolTip do Campo
 "Z7_FILIAL",;                                                                             // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_FILIAL")[1],;                                                                  // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimaldo do Campo
 Nil,;                                                                                     // [07] B Code-block de Validação do campo  
 Nil,;                                                                                     // [08] B Code-block de Validação When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FILIAL,FWxFilial('SZ7'))"),;  // [11] B Code-block de inicialização do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                      // [14] L Indica se o campo é virtual

oStCabec:AddField(;
 "Numero",;                                                                                // [01] C Títulos do Campo
 "Numero",;                                                                                // [02] C ToolTip do Campo
 "Z7_NUM",;                                                                                // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_NUM")[1],;                                                                     // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimaldo do Campo
 Nil,;                                                                                     // [07] B Code-block de Validação do campo  
 Nil,;                                                                                     // [08] B Code-block de Validação When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_NUM,'')"),;                   // [11] B Code-block de inicialização do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                      // [14] L Indica se o campo é virtual

oStCabec:AddField(;
 "Emissao",;                                                                               // [01] C Títulos do Campo
 "Emissao",;                                                                               // [02] C ToolTip do Campo
 "Z7_EMISSAO",;                                                                            // [03] C Id do Field
 "D",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_EMISSAO")[1],;                                                                 // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimaldo do Campo
 Nil,;                                                                                     // [07] B Code-block de Validação do campo  
 Nil,;                                                                                     // [08] B Code-block de Validação When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_EMISSAO,dDataBase)"),;        // [11] B Code-block de inicialização do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                      // [14] L Indica se o campo é virtual

oStCabec:AddField(;
 "Fornecedor",;                                                                            // [01] C Títulos do Campo
 "Fornecedor",;                                                                            // [02] C ToolTip do Campo
 "Z7_FORNECE",;                                                                            // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_FORNECE")[1],;                                                                 // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimaldo do Campo
 Nil,;                                                                                     // [07] B Code-block de Validação do campo  
 Nil,;                                                                                     // [08] B Code-block de Validação When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FORNECE,'')"),;               // [11] B Code-block de inicialização do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                      // [14] L Indica se o campo é virtual

oStCabec:AddField(;
 "Loja",;                                                                                  // [01] C Títulos do Campo
 "Loja",;                                                                                  // [02] C ToolTip do Campo
 "Z7_LOJA",;                                                                               // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_LOJA")[1],;                                                                    // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimaldo do Campo
 Nil,;                                                                                     // [07] B Code-block de Validação do campo  
 Nil,;                                                                                     // [08] B Code-block de Validação When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_LOJA,'')"),;                  // [11] B Code-block de inicialização do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                      // [14] L Indica se o campo é virtual


oStCabec:AddField(;
 "Usuario",;                                                                               // [01] C Títulos do Campo
 "Usuario",;                                                                               // [02] C ToolTip do Campo
 "Z7_USER",;                                                                               // [03] C Id do Field
 "C",;                                                                                     // [04] C Tipo do Campo
 TamSX3("Z7_USER")[1],;                                                                    // [05] N Tamanho do Campo
 0,;                                                                                       // [06] N Decimaldo do Campo
 Nil,;                                                                                     // [07] B Code-block de Validação do campo  
 Nil,;                                                                                     // [08] B Code-block de Validação When do campo
 {},;                                                                                      // [09] A Lista de valores permitidos no campo
 .F.,;                                                                                     // [10] L Indica se o campo tem preenchimento obrigatório
 FWBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_USER,_cuserid)" ),;           // [11] B Code-block de inicialização do campo
 .T.,;                                                                                     // [12] L Indica se trata-se de um chave
 .F.,;                                                                                     // [13] L Indica se o campo pode receber valor de uma operação
 .F.)                                                                                      // [14] L Indica se o campo é virtual

//Agora vamos tratar a estrutura dos Itens, que serão utilizados no Grid da aplicação

//Modificando os inicializadores padrão, para não dar mensagem de colunas vazias
oStItens:SetProperty("Z7_NUM",     MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))
oStItens:SetProperty("Z7_USER",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD, '_cUserId'))//Trazer o usuario automaticamente
oStItens:SetProperty("Z7_EMISSAO", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,'dDatabase'))//Trazer a data automática
oStItens:SetProperty("Z7_FORNECE", MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))
oStItens:SetProperty("Z7_LOJA",    MODEL_FIELD_INIT, FWBuildFeature(STRUCT_FEATURE_INIPAD,      '"*"'))

/*A partir de agora, eu faço a união das estrutura, vinculando o cabeçalho com os itens
também faço a vinculação da estrutura de dados dos itens ao modelo*/

oModel:AddFields("SZ7MASTER",oStCabec) //Faço a vinculação com o StCabec(Cabeçalho e itens temporários)
oModel:AddGrid("SZ7DETAIL","SZ7MASTER",oStItens,,,,,)

//Seto a relação entre cabeçalho e item, neste ponto, eu digo através de qual(ais) campo(s) o grid está vinculado com o cabeçalho
aRetaions := {}
aAdd(aRetaions,{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"})
Aadd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

//Outra formar de fazer
//oModel:SetRelation("SZ7DETAIL",{{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"},{"Z7->Z7_NUM"}},SZ7->(IndexKey(1)))

//Seto a chave primaria, lembrando que, se ela estiver definida no X2_UNICO, faz valor o que está no X2_UNICO

oModel:SetPrimaryKey({})

oModelGetModel("SZ7DETAIL"):SetUniqueline("Z7_ITEM")//O intuito é que esta campo não se repita

//Setanmos a descrição/Título que aparecerá no cabeçalho
oModel:SetDescription("MOdelo 2")
//Setamos as descrição/Títulos que aparecerá no Grid de itens
oModel:GetModel("SZ7MASTER"):SetDescription("Cabçalho da Solicitação de Compras")

oModel:GetModel("SZ7DETAIL"):SetDescription("Itens da Solicitação de Compras")

oModel:GetModel("SZ7DETAIL"):SetUseOldGrid(.T.)


Return oModel


Static Function ViewDef()
    
Return oView
