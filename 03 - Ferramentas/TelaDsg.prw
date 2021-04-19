#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³         ³ Autor ³                       ³ Data ³           ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Locacao   ³                  ³Contato ³                                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Aplicacao ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÁÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Analista Resp.³  Data  ³                                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³              ³  /  /  ³                                               ³±±
±±³              ³  /  /  ³                                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function TelaDsg()

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de cVariable dos componentes                                 ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
Private cGetCPF    := Space(30)
Private cGetNome   := Space(30)
Private cSayCPF    := Space(30)
Private cSayEstCiv := Space(30)
Private cSaynome   := Space(30)
Private lComboADVP := .F.
Private lComboCSha := .F.
Private lComboPyth := .F.
Private lComboSQl  := .F.
Private cComboEstC
Private oComboEstC
Private nRadioSexo

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de Variaveis Private dos Objetos                             ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
SetPrvt("oFont1","oDlg1","oSaynome","oSayCPF","oSayEstCivil","oSay1","oBmpIncluir","oGetNome","oGetCPF")
SetPrvt("oComboEstCivil","oGrpLinguagens","oComboADVPL","oComboCSharp","oComboSQl","oComboPython","oLBox1")


/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Definicao do Dialog e todos os seus componentes.                        ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
oFont1     := TFont():New( "Comic Sans MS",0,-13,,.T.,0,,700,.F.,.F.,,,,,, )
oDlg1      := MSDialog():New( 097,535,831,1862,"Primeira tela com Designer",,,.F.,,,,,,.T.,,oFont1,.T. )
oSaynome   := TSay():New( 000,008,{||"Nome"},oDlg1,,oFont1,.F.,.F.,.F.,.T.,CLR_GREEN,CLR_WHITE,032,008)
oSayCPF    := TSay():New( 040,012,{||"CPF"},oDlg1,,oFont1,.F.,.F.,.F.,.T.,CLR_GREEN,CLR_WHITE,032,008)
oSayEstCiv := TSay():New( 008,232,{||"Estado Civil"},oDlg1,,oFont1,.F.,.F.,.F.,.T.,CLR_GREEN,CLR_WHITE,052,008)
oSay1      := TSay():New( 012,428,{||"Como você está hoje?"},oDlg1,,oFont1,.F.,.F.,.F.,.T.,CLR_GREEN,CLR_WHITE,076,008)
oBmpInclui := TBitmap():New( 116,140,052,052,,"H:\TOTVS\protheus_data\system\limpartela.bmp",.F.,oDlg1,,,.F.,.T.,,"",.T.,,.T.,,.F. )
oGetNome   := TGet():New( 012,004,{|u| If(PCount()>0,cGetNome:=u,cGetNome)},oDlg1,076,008,'',,CLR_GREEN,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGetNome",,)
oGetCPF    := TGet():New( 056,004,{|u| If(PCount()>0,cGetCPF:=u,cGetCPF)},oDlg1,076,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGetCPF",,)
GoRadioSex := TGroup():New( 008,092,072,208,"Sexo",oDlg1,CLR_GREEN,CLR_WHITE,.T.,.F. )
oRadioSexo := TRadMenu():New( 012,098,{"Masculino","Feminino"},{|u| If(PCount()>0,nRadioSexo:=u,nRadioSexo)},oDlg1,,,CLR_GREEN,CLR_WHITE,"",,,096,32,,.F.,.F.,.T. )
oComboEstC := TComboBox():New( 020,220,{|u| If(PCount()>0,cComboEstCivil:=u,cComboEstCivil)},{"Solteiro","Casado","Divorciado","Viuvo"},076,013,oDlg1,,,,CLR_GREEN,CLR_WHITE,.T.,oFont1,"",,,,,,,cComboEstCivil )
cComboEstC := "Viuvo"
oGrpLingua := TGroup():New( 012,312,080,420,"Linguagens",oDlg1,CLR_GREEN,CLR_WHITE,.T.,.F. )
oComboADVP := TCheckBox():New( 028,320,"ADVPL",{|u| If(PCount()>0,lComboADVPL:=u,lComboADVPL)},oGrpLinguagens,048,008,,,oFont1,,CLR_MAGENTA,CLR_WHITE,,.T.,"",, )
oComboCSha := TCheckBox():New( 040,320,"CSharp",{|u| If(PCount()>0,lComboCSharp:=u,lComboCSharp)},oGrpLinguagens,048,008,,,oFont1,,CLR_CYAN,CLR_WHITE,,.T.,"",, )
oComboSQl  := TCheckBox():New( 052,320,"SQL",{|u| If(PCount()>0,lComboSQl:=u,lComboSQl)},oGrpLinguagens,048,008,,,oFont1,,CLR_BROWN,CLR_WHITE,,.T.,"",, )
oComboPyth := TCheckBox():New( 064,320,"Python",{|u| If(PCount()>0,lComboPython:=u,lComboPython)},oGrpLinguagens,048,008,,,oFont1,,CLR_HCYAN,CLR_WHITE,,.T.,"",, )
oLBox1     := TListBox():New( 024,428,,{"Feliz","Ansioso","Tenso","Livre"},080,056,,oDlg1,,CLR_BLACK,CLR_WHITE,.T.,,,oFont1,"",,,,,,, )
oBtn1      := TButton():New( 148,008,"Mostrar Elementos",oDlg1,{|| Alert(cGetNome)},104,020,,oFont1,,.T.,,"",,,,.F. )

oDlg1:Activate(,,,.T.)

Return

