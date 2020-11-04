;  Returns one if Nr is odd. Zero when nr is even.
; This was before I got equinted with module operator %
; I'm not sure ahk supports it.

OddEven(Nr) {
    return ((i:=(Nr / 2)) - Floor(i) > 0 ? 1 : 0)
}
