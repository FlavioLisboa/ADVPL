#INCLUDE 'Protheus.ch'
#INCLUDE 'Totvs.ch'

User Function JobCalc(nPar1,nPar2)

nPar1 := Val(nPar1)
nPar2 := Val(nPar2)

ConOut("Soma            -> " + CValToChar(nPar1 + nPar2 ))
ConOut("Subtra��o       -> " + CValToChar(nPar1 - nPar2 ))
ConOut("Divis�o         -> " + CValToChar(nPar1 / nPar2 ))
ConOut("Multiplica��o   -> " + CValToChar(nPar1 * nPar2 ))
    
Return 
