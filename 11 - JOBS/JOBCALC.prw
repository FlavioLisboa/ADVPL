#INCLUDE 'Protheus.ch'
#INCLUDE 'Totvs.ch'

User Function JobCalc(nPar1,nPar2)

nPar1 := Val(nPar1)
nPar2 := Val(nPar2)

ConOut("Soma            -> " + CValToChar(nPar1 + nPar2 ))
ConOut("Subtração       -> " + CValToChar(nPar1 - nPar2 ))
ConOut("Divisão         -> " + CValToChar(nPar1 / nPar2 ))
ConOut("Multiplicação   -> " + CValToChar(nPar1 * nPar2 ))
    
Return 
