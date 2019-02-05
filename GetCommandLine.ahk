GetCommandLine()
{
    return DllCall("kernel32.dll\GetCommandLine")
}


MsgBox % GetCommandLine()
