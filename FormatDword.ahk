HIWORD(Dword,Hex=0){
    BITS:=0x10,WORD:=0xFFFF
    return (!Hex)?((Dword>>BITS)&WORD):Format("{1:#x}",((Dword>>BITS)&WORD))
}
LOWORD(Dword,Hex=0){
    WORD:=0xFFFF
    Return (!Hex)?(Dword&WORD):Format("{1:#x}",(Dword&WORD))
}
MAKELONG(LOWORD,HIWORD,Hex=0){
    BITS:=0x10,WORD:=0xFFFF
    return (!Hex)?((HIWORD<<BITS)|(LOWORD&WORD)):Format("{1:#x}",((HIWORD<<BITS)|(LOWORD&WORD)))
}

/* <-- Remove ore comment out this line, then run the script to test it!

LPARAM := Dword := 0x3200258
MsgBox % "Integer`t`t`tHexadecimal`n"
. "-----------------------------------------`n"
. "" HIWORD(Dword)  "`t`t`t" HIWORD(Dword, 1) "`n"
. "" LOWORD(Dword)  "`t`t`t" LOWORD(Dword, 1) "`n"
. "" MAKELONG(LOWORD(Dword), HIWORD(Dword))   "`t`t`t" MAKELONG(LOWORD(Dword), HIWORD(Dword) , 1)  "`n`n"
. "X = " HIWORD(LPARAM) "`n"
. "Y = " LOWORD(LPARAM) "`n"


/*
This table might help to make some sense from all of this.
This table might help to make some sense from all of this.
 1_____________8______________16_______________24______________32 
 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 1 0 0 0 0 0 1 0 0 0 = 32 bits.
 31____8bit____|_____8bit______|_____8bit______|_____8bit______0 -> Bit 0-31.
---- msb ----- + -- next_msb - | -- next_lsb - + -- lsb -------- Most and Least Significant Bit.
---- BYTE4 --- + -- BYTE3 ---- + -- BYTE2 ---- + -- BYTE1 ------ = 4 Byte / 4x8 bit.
---------- HIGHWORD ---------- | -------- LOWWORD -------------- = 2 Word.
---------------------------- DWORD ----------------------------- = 1 Dword = 2 Word = 4 Byte = 32 bit.

These functions do exactly the same as the macros found on the MSDN links below.
They can be used with OnMessage() to format something like coordinates from LParam.
Ore format any other 32Bit integer structured as low high bit order.

HIWORD:
 https://msdn.microsoft.com/en-us/library/windows/desktop/ms632657(v=vs.85).aspx
LOWORD:
 https://msdn.microsoft.com/en-us/library/windows/desktop/ms632659(v=vs.85).aspx
MAKELONG:
 https://msdn.microsoft.com/en-us/library/windows/desktop/ms632660(v=vs.85).aspx

EXAMPLE:
Return Highword as hexadecimal.
HIWORD(0x3200258,1)

Return Low Word as integer.
LOWORD(0x3200258)

Return Dword as hexadecimal. The LOWORD and HIWORD parameters
need to be 16bit Integers!
MAKELONG(600,800, 1)

By Megnatar
