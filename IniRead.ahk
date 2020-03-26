/*
    IniRead.ahk v1.0
    Well I've started this to reduce the nr of lines in my scripts. However I ended up with a function 74 lines long.
    So much for my reasoning, however this is mostly because iniRead() can be used in a flexible way. It can load
    all, one or a couple sections the order does not matter. Line comments and empty lines are ignored.
        
    Parameters info.
    InputFile:          Should the name or path to the ini file to get the variables from.
    LoadSection:        When empty, all variables from the file will be loaded. Otherwise LoadSection can be
                        a single section name or a couple of section names, each devided by a space.
                        LoadSection can also be a object holding the names to load.
                        
                        String:     "Section"
                        Strings:    "Section3 Section2 Section5"
                        Object:     ["Section3", "Section2", "Section5"]
    By Megnatar.    
*/
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
