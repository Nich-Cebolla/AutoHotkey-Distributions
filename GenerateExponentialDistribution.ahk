
/**
 * @description - Creates an array of values that follow an exponential distribution.
 * @param {Float} Lambda - The rate parameter of the exponential distribution.
 * @param {Number} Lower - The lower limit of the exponential distribution.
 * @param {Number} Upper - The upper limit of the exponential distribution.
    @example
        ; For demonstration, this example uses the Histogram function
        #Include <Histogram>
        arr := CreateWeightedExponentialArray(0.03, 0, 1000, 1000)
        OutputDebug(Histogram(arr))
    ;      0.000 - 13.388  : 323  ********************
    ;     13.388 - 26.776  : 238  ***************
    ;     26.776 - 40.163  : 139  *********
    ;     40.163 - 53.551  : 95   ******
    ;     53.551 - 66.939  : 61   ****
    ;     66.939 - 80.327  : 43   ***
    ;     80.327 - 93.715  : 34   **
    ;     93.715 - 107.102 : 22   *
    ;    107.102 - 120.490 : 14   *
    ;    120.490 - 133.878 : 8
    ;    133.878 - 147.266 : 7
    ;    147.266 - 160.654 : 5
    ;    160.654 - 174.041 : 3
    ;    174.041 - 187.429 : 1
    ;    187.429 - 200.817 : 2
    ;    200.817 - 214.205 : 3
    ;    214.205 - 227.592 : 1
    ;    227.592 - 240.980 : 0
    ;    240.980 - 254.368 : 0
    ;    254.368 - 267.756 : 1
    @
 * {@link https://github.com/Nich-Cebolla/AutoHotkey-Distributions/blob/main/Histogram.ahk}
 */
GenerateExponentialDistribution(Lambda, Lower, Upper, Length) {
    Result := [], i := 0
    Result.Length := Length
    loop Length
        Result[A_Index] := Min(Max((Ln(1 - Random()) / Lambda * -1) + Lower, Lower), Upper)
    return Result
}
