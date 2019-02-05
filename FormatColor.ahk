/*
FormatColor:

    Format Integer colours to hexadecimal or vice versa.
    
    Parameters:
     c      The Input colour.
            
            Input colour must follow these rules:
             For hexadecimal numbers, the 0x prefix must be present.
         
             For decimal numbers, a space ore a comma must be preset
             between the 3 color values.
    
     bgr    Swaps rgb colours to bgr for hexadecimal numbers.
            This parameter is optional.
    
By Megnatar

*/

FormatColor(c, bgr=0) {
    i:=0
    
    if (InStr(c, "0x")) {
    
        if (bgr) {
            setformat,IntegerFast, H
            c := (c&255) << 16 | c&65280 | c >> 16 ""
            SetFormat, IntegerFast, d
        }
        
        Loop, 3
            clr .= Format("{:u} ", "0x" SubStr(c, 7-i, 2)), i += 2
    }
    
    else {
        clr := "0x" clr
        loop, Parse, c, %a_space% `,
            clr .= Format("{:X}", A_LoopField)
     }
    return clr
}
