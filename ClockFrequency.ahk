ClockFrequency() {
    return DllCall("QueryPerformanceFrequency", "Int64*", lpFrequency) ? lpFrequency : 0
}
