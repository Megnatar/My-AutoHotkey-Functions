/*
     Keywait function. It can be used in a couple of way's.
       Parameters
       K:      This is the key to wait for. Input can be blanck, A_ThisHotkey will then be used. Or any other quoted key.
               All modifiers will be removed from the string if any occour. More mods and slower: [\$\*\^\+~#!&<>]
    
       O:      Here you should specifie options for the KeyWait command. Like L, D and T. Input should be quoted! "L D T0.5"
    
       E:      When set to 1, the function will return ErrorLevel instead of the key it waited for.


    EXAMPLE
    Press the W key twice to send Z.

        *~w::
        KeyW := KeyW ? keywait(KeyW) : keywait()        ; Wait for key release and store the key in a variable when var KeyW is empty.
        ErrLvl := keywait(KeyW, "D T0.3", 1)            ; Wait 300ms for the key be pushed down again and let the function return ErrorLevel
        if (ErrLvl = 0) {                               ; Do something when var ErrLvl is set to zero. No timeout occured.
            Send {z down}{z up}
            ErrLvl := ""
        }
        Return

    Or a shorter version for the above code.

        *~w::
        KeyW := KeyW ? keywait(KeyW) : keywait()        ; Wait for key release and store the key in a variable when var KeyW is empty.
        if (keywait(KeyW, "D T0.3", 1) = 0)             ; Wait 300ms for the key be pushed down again and let the function return ErrorLevel
            Send {z down}{z up}                         ; Do something when keyWait() returns zero on the line above. The key was pressed twice.
        return

    Tip.
     Store you're hotkey/key in a variable to avoid using regex all the time. Doing so will make the function about 10ms faster.
*/

;   TODO:
;     To speed up the function. Add a option to filterout commonly used modifiers from the value in A_Thishotkey.

KeyWait(K := "", O := "", ErrLvL := "") {
    keywait, % Key := K ? K : RegExReplace(A_ThisHotkey, "[~#\*\$\^\+!&<>]"), % O
    Return ErrLvL = 1 ? ErrorLevel : Key
}

/* Older version
KeyWait(hKey := "", Options := "", RtrnErrLvL := "") {
    keywait, % Key := hKey ? hKey : RegExReplace(A_ThisHotkey, "[\$\*\^\+~#!&<>]"), % Options
    Return RtrnErrLvL = 1 ? ErrorLevel : Key
}
