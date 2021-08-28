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

RestArea(aArea)

Return 


Static Function MenuDef()

    


Return aRotina


Static Function ModelDef()

//Objeto responsável pela Criação da estrutura temporária do cabeçalho
Local oStCabec := FWFormModelStruct():New()
//Objeto reponsável pela estrutura dos itens
Local oStItens := FwFomrStruct(1,"SZ7") // 1 para Model - 2 para View

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
 0,;                                                                                       // [06] N Decimal do Campo
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
 0,;                                                                                       // [06] N Decimal do Campo
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
 0,;                                                                                       // [06] N Decimal do Campo
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
 0,;                                                                                       // [06] N Decimal do Campo
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
 0,;                                                                                       // [06] N Decimal do Campo
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
 0,;                                                                                       // [06] N Decima do Campo
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
aAdd(aRelations,{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"})
aAdd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

//Outra formar de fazer
//oModel:SetRelation("SZ7DETAIL",{{"Z7_FILIAL","'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial('SZ7'))'"},{"Z7->Z7_NUM"}},SZ7->(IndexKey(1)))

//Seto a chave primaria, lembrando que, se ela estiver definida no X2_UNICO, faz valor o que está no X2_UNICO

oModel:SetPrimaryKey({})

oModelGetModel("SZ7DETAIL"):SetUniqueline("Z7_ITEM")//O intuito é que este campo não se repita


oModel:SetDescription("Modelo 2")

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
    Iif(INCLUI, .T., .F.),;    	// [10]  L   Indica se o campo é alteravel
    Nil,;                       // [11]  C   Pasta do campo
    Nil,;                       // [12]  C   Agrupamento do campo
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

/*Agora vamos para a segunda parte da ViewDef, onde nós amarramos as estruturas de dados, montadas acima
com o objeto oView, e passamos para a nossa aplicação todas as características visuais do projeto*/

//Instancio a classe FwFormView para o objeto View    
oView := FWFormView():New()

//Passo para o objeto View o modelo de dados que quero atrelar à ele Modelo + Visualização
oView:SetModel(oModel)

//Monto a estrutura de visualizaçõa do Master e do Detalhe (Cabeçalho e Itens)
oView:AddField("VIEW_SZ7M", oStCabec,"SZ7MASTER") //Cabeçalho/Master 
oView:AddGrid("VIEW_SZ7D" , oStItens,"SZ7DETAIL") //Itens/Grid

//Criamos a Tela, dividindo proporcionalmente o tamanho do cabeçalho e o tamanho do Grid
oView:CreateHorizontalBox("CABEC",30)
oView:CreateHorizontalBox("GRID" ,60)

/*Abaixo, digo para onde vai cada View criada, VIEW_SZ7M irá para a cabec, VIEW_SZ7D irá para GRID... 
Sendo assim, eu associo o View à cada Box criado*/
oView:SetOwnerView("VIEW_SZ7M","CABEC")
oView:SetOwnerView("VIEW_SZ7D","GRID")

//Ativar o título de cada VIEW/Box criado
oView:EnableTitleView("VIEW_SZ7M","Cabeçalho Solicitação de Compras")
oView:EnableTitleView("VIEW_SZ7D","Itens de Solicitação de Compras")

/*Método que seta um bloco de código para verificar se a janela deve ou não
ser fechada após a execução do botão OK*/
oView:SetCloseOnOk({|| .T.})

Return oView
