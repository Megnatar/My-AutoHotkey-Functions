; GuiControl as a function for more flexible usage. Parameter ControlID can be a array.
; For example, if you want to use the GuiControl command 3 times in a row.
; Then the array should look something like:
;  ControlID := [[SubCommand, ControlID, Value], [SubCommand, ControlID], [ , ControlID, Value]]
;
; You can also insert objects directly on the parameter for ControlID.
;  GuiControl([[SubCommand, ControlID, Value], [SubCommand, ControlID], [ , ControlID, Value]])
;

GuiControl(ControlID, SubCommand = 0, Value = 0) {
    If (IsObject(ControlID)) {
        Loop % ControlID.Length() {
            GuiControl % ControlID[A_index][1], % ControlID[A_index][2], % ControlID[A_index][3]
        }
    } else {
        GuiControl % SubCommand, % ControlID, % Value
    }
    Return ErrorLevel
}
