
; A combination of Control and ControlGet. By default the ControlGet command will be used. To use Control set parameter NotGet to one.
; Parameter Parms should be a Array of Objects. Each seperate Object will hold the command options. Only one of the commands can be
; used for each call done to the function.
;
; The order of the options for the commands should be the same in the array as used by the command.
; E.g.
;  ControlGet_Parms := [[OutputVar, Cmd, Value, Control, WinTitle, WinText, ExcludeTitle, ExcludeText], [OutputVar, Cmd, Value ... etc]]
;  Control_Parms    := [[Cmd, Value, Control, WinTitle, WinText, ExcludeTitle, ExcludeText], [Cmd, Value ... etc]]
;
;  ControlGetControl(ControlGet_Parms)
;  ControlGetControl(Control_Parms, 1)
;  ControlGetControl([[Cmd, Value, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]], 1)
;
ControlGetControl(Parms, NotGet = 0) {
    If (IsObject(Parms)) {
        if (!NotGet) {
           Loop % Parms.Length() {
                OutputVar := Parms[A_index][1]
                ControlGet %OutputVar%, % Parms[A_index][2], % Parms[A_index][3], % Parms[A_index][4], % Parms[A_index][5], % Parms[A_index][6], % Parms[A_index][7], % Parms[A_index][8]
            }
       } else if (NotGet) {
            Loop % Parms.Length() {
                Control % Parms[A_index][1], % Parms[A_index][2], % Parms[A_index][3], % Parms[A_index][4], % Parms[A_index][5], % Parms[A_index][6], % Parms[A_index][7]
            }
        }
    }
    Return ErrorLevel
}
