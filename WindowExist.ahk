/* About WindowExist()
 
 Input parameter should a array. The array can be created by AHKGroupEX().
 Returns the Window handle if successful.
 
  Command:
   WindowExist(Apps)
   
*/

WindowExist(A) {
    SetWinDelay 1
    for i, v in A {
        if (hWmd := WinExist(v)) {
            return hWmd
    }
  }
}
