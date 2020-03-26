iniRead(InputFile, LoadSection = 0) {
    if (LoadSection) {
        if (IsObject(LoadSection)) {
             for i, Name in LoadSection
             {
                Loop, parse, % FileOpen(InputFile, 0).read(), `n, `r
                {
                    if (InStr(A_Loopfield, Name)) {
                        SectionName := StrReplace(A_Loopfield, "["), SectionName := StrReplace(SectionName, "]")
                        Continue
                    }
                    if (SectionName) {
                        if (((InStr(A_LoopField, "[",, 1, 1)) = 1) | ((InStr(A_LoopField, "`;",, 1, 1)) = 1) | (!A_LoopField)) {
                            if (((InStr(A_LoopField, "`;",, 1, 1)) = 1) | (!A_LoopField))
                                Continue
                            else
                                break
                        }
                        VarRef := SubStr(A_LoopField, 1, InStr(A_LoopField, "=")-1), %VarRef% := SubStr(A_LoopField, InStr(A_LoopField, "=")+1)
                    }
                }
            }
        } else if (!IsObject(LoadSection)) {
            if ((InStr(LoadSection, " ")) > 1) {
                Sections := []
                Loop, Parse, LoadSection, " ", A_Space
                {
                    Sections[A_Index] := A_Loopfield
                }
                for i, Name in Sections
                {
                    Loop, parse, % FileOpen(InputFile, 0).read(), `n, `r
                    {
                        if (InStr(A_Loopfield, Name)) {
                            SectionName := StrReplace(A_Loopfield, "["), SectionName := StrReplace(SectionName, "]")
                            Continue
                        }
                        if (SectionName){
                            if (((InStr(A_LoopField, "[",, 1, 1)) = 1) | ((InStr(A_LoopField, "`;",, 1, 1)) = 1) | (!A_LoopField)) {
                                if ((InStr(A_LoopField, "`;")) | (!A_LoopField))
                                    Continue
                                else
                                    break
                            }
                            VarRef := SubStr(A_LoopField, 1, InStr(A_LoopField, "=")-1), %VarRef% := SubStr(A_LoopField, InStr(A_LoopField, "=")+1)
                        }
                    }
                }
            } Else {
                Loop, parse, % FileOpen(InputFile, 0).read(), `n, `r
                {
                    if (InStr(A_Loopfield, LoadSection)) {
                        SectionName := StrReplace(A_Loopfield, "["), SectionName := StrReplace(SectionName, "]")
                        Continue
                    }
                    If (SectionName) {
                        if ((InStr(A_LoopField, "[",, 1, 1)) = 1) {
                            Break
                        }
                        VarRef := SubStr(A_LoopField, 1, InStr(A_LoopField, "=")-1), %VarRef% := SubStr(A_LoopField, InStr(A_LoopField, "=")+1)        
                    }
                }
            }
        }
    } else if (!LoadSection) {
        Loop, parse, % FileOpen(InputFile, 0).read(), `n, `r
        {
            if (((InStr(A_LoopField, "[",, 1, 1)) = 1) | ((InStr(A_LoopField, "`;",, 1, 1)) = 1) | (!A_LoopField))
                Continue
            VarRef := SubStr(A_LoopField, 1, InStr(A_LoopField, "=")-1), %VarRef% := SubStr(A_LoopField, InStr(A_LoopField, "=")+1)
        }
    }
    Return
}
