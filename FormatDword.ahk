GetLowWord( Dword,  H := 0 ) {
    Static WORD := 0xFFFF
    
    if ( !H )
        Return ( Dword & WORD )
    Else
        return Format( "{1:#x}", ( Dword & WORD ) )
}

GetHighWord( Dword,  H := 0 ) {
    Static BITS := 0x10, WORD := 0xFFFF
    
    if ( !H )
        Return ( (Dword >> BITS) & WORD )
    Else
        return Format( "{1:#x}",  ( (Dword >> BITS) & WORD ) )
}

MakeLong( LoWord, HiWord, H := 0 ) {
    Static BITS := 0x10, WORD := 0xFFFF
    
    if ( !H )
        return ( ( HiWord << BITS ) | ( LoWord & WORD ) )
    Else 
        return Format( "{1:#x}",  ( ( HiWord << BITS ) | ( LoWord & WORD ) ) )
}

/* **** Test ****

Dword := 0x29A1A0A

MsgBox   % "`n"
. "" GetHighWord(Dword)  " - " GetHighWord(Dword, 1) "`n"
. "" GetLowWord(Dword)  " - " GetLowWord(Dword, 1) "`n"
. "" MakeLong(GetLowWord(Dword), GetHighWord(Dword))   " - " MakeLong(GetLowWord(Dword), GetHighWord(Dword) , 1)  " `n "

 ; End
