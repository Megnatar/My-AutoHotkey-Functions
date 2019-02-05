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
    
    ;return Format("{1:#x}", (LoWord | (HiWord << BITS)))
}
