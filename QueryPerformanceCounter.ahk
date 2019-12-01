QueryPerformanceCounter() {
    return DllCall("QueryPerformanceCounter", "Int64*", lpCounter) ? lpCounter : 0
}
