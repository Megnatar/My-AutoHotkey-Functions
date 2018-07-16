/* About FadeInOut()
 
 FadeInOut() is a helper function for Wm_LbuttonDown().
 BUt when called whit only the window handle, that window will be faded in ore out again.
 parameters:
  1: The handle of the window to fade.
  2: If the window is dragged Use "On" to fade out. Use "Off" when is dragging stoped, to fade in again.
  3: How much percentage to fade the window out. Default is 25% of it's original transparency.
     This Only have to be used with the "On" parameter and if some other transparency value then the default want to be set..
     Because - fading back - caclulates back to it's original transparency, not the value faded out. Using this whith
     the "Off" parameter will be discarded.

Commands:
 FadeInOut(hWnd, "On", 35) - FadeInOut(hWnd, "On") - FadeInOut(hwnd, "off") - FadeInOut(hWnd,, 35)
*/

FadeInOut(hWnd, Dragg := "", Pcrt = 25) {
    SetBatchLines -1
    static TransOut, TransparencyOld, Transparency := 0, Handles := {}, HCnt := 0

    if (HCnt = 0)
        HCnt += 1, Handles := {(HCnt): hwnd}
    
    if (Handles[HCnt] != hwnd)
       HCnt += 1, Handles := {(HCnt): hwnd}
        
    if (Dragg = "On") {
    
        WinGet, Transparency, Transparent, ahk_id %hWnd%
        TransparencyOld := Transparency
        TransOut := (TransparencyOld - (TransparencyOld/100)*Pcrt)
        
        Loop {
            If (A_TickCount >= WaitNextTick) {
                WaitNextTick := A_TickCount+5
                WinSet, Transparent, % Transparency -= 5, ahk_id %hWnd%
                
                If (Transparency <= TransOut)
 
                    break
        }   }
        
        return
        
    } else if (Dragg = "Off") {
    
        Loop {
            If (A_TickCount >= WaitNextTick) {
                WaitNextTick := A_TickCount+5
                WinSet, Transparent, % Transparency += 5, ahk_id %hWnd%
                
                If (Transparency >= TransparencyOld) {
                
                    Transparency := 0
                    break
        }   }   }
        return
    }
    
    If (Transparency = 0) {
        
        WinGet, Transparency, Transparent, ahk_id %hWnd%
        TransparencyOld := Transparency
        TransOut := (TransparencyOld - (TransparencyOld/100)*Pcrt)
        
        Loop {
            If (A_TickCount >= WaitNextTick) {
                WaitNextTick := A_TickCount+25
                WinSet, Transparent, % Transparency += 15, ahk_id %hWnd%
                
                ; If (Transparency >= 250){
                If (Transparency >= TransOut){
                    ;WinSet, Transparent, Off, ahk_id %hWnd%
                    break
        }   }   }
    } else {
        Loop {
            If (A_TickCount >= WaitNextTick) {
                WaitNextTick := A_TickCount+25
                WinSet, Transparent, % Transparency -= 15, ahk_id %hWnd%
                
                If (Transparency <= TransparencyOld)
                    break
        }   }  }
    return
}
