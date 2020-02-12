/*
    PARAMETERS
    K:           The hotkey that called the function or the key to wait for.
                    When empty, the content of A_ThisHotkey is used as the key to wait for

    O:        Use D for a down key state, L for logical state and T for time to wait. Which is in seconds.
                    Errorlevel is set to 1 when the timer runs out.

    ErrLvL:     Returns Errorlevel if set to 1. By default the function returns the key used by the first parameter.
                    All modifiers will be removed from the key when A_ThisHotkey is used.

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
            Send {z down}{z up}                         ; Do something when KeyWait() returns zero on the line above.
        return

    Tip.
     Store you're hotkey/key in a variable to avoid using regex all the time. Doing so will make the function about 10ms faster.
*/

KeyWait(K := "", O := "", ErrLvL := "") {
    keywait, % Key := K ? K : RegExReplace(A_ThisHotkey, "[\$\*\^\+~#!&<>]"), % O
    Return ErrLvL = 1 ? ErrorLevel : Key
}

/* Older version
KeyWait(hKey := "", Options := "", RtrnErrLvL := "") {
    keywait, % Key := hKey ? hKey : RegExReplace(A_ThisHotkey, "[\$\*\^\+~#!&<>]"), % Options
    Return RtrnErrLvL = 1 ? ErrorLevel : Key
}
