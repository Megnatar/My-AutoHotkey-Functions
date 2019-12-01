StringSetCase(S, L = 0, T = 0) {
    if (S && !L & !T) {                   ; Format("{:U}, {:L} and {:T}", "", "", "")
        StringUpper, NewCase, S
    } else if (S && L & !T) {
        StringLower, NewCase, S
    } else if (S && T) {
        StringLower, NewCase, S, T
    } Return NewCase
}
