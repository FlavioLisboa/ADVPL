#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} BRWSZ9
    (Browse do cadastro de Protheuzeiro)
    @type  User Functiion
    @author Flávio Lisboa
    @since 28/07/2021
    @version 1.0
    @see (https://tdn.totvs.com/pages/releaseview.action?pageId=62390842)
    @see (https://tdn.totvs.com/pages/viewpage.action?pageId=334340072)
/*/
User Function BRWSZ9()

Local aArea := GetNextAlias()
Local oBrowseSZ9 //Variável que recebera o instaciamento da classe FWMBroser

oBrowseSZ9 :=  FwmBrowse():New()
//Passo como parametro a tabela que eu quero mostra no Browse
oBrowseSZ9:SetAlias("SZ9")

oBrowseSZ9:SetDescription("Meu primeiro Browse - Tela de Protheuzeiro SZ9")

//Faz com que somente estes campos apareçam no Grid
oBrowseSZ9:SetOnlyFields({"Z9_CODIGO","Z9_NOME","Z9_SEXO","Z9_STATUS"})
                        /*EXPRESSÃO            /COR        /DESCRIÇÃO */
oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '1'","GREEN","PROTHEUZEIRO ATIVO")
oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '2'","RED","PROTHEUZEIRO INATIVO")

oBrowseSZ9:SetFilterDefault("Z9_STATUS == '1'")
oBrowseSZ9:DisableDetails()
/*
oBrowseSZ9:AddLegend("SZ9->Z9_SEXO == '1'","BR_AZUL_CLARO","Protheuzeiro")
oBrowseSZ9:AddLegend("SZ9->Z9_SEXO == '2'","BR_PINK","Protheuzeira")
*/
oBrowseSZ9:Activate()

RestArea(aArea)
    
Return 
