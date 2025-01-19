
/**
 * @description - Generates an array containing values that follow a Gaussian distribution.
 * @param {Number} Mean - The mean of the Gaussian distribution.
 * @param {Number} StdDev - The standard deviation of the Gaussian distribution.
 * @param {Integer} Length - The length of the resulting array.
 * @returns {Array} - An array of values that follow the Gaussian distribution.
    @example
        ; For demonstration, this example uses the Histogram function
        #Include <Histogram>
        OutputDebug(Histogram(GenerateGaussianDistribution(50, 10, 10000)))
        ; 13.060 - 16.734 : 3
        ; 16.734 - 20.409 : 7
        ; 20.409 - 24.083 : 34
        ; 24.083 - 27.757 : 92    *
        ; 27.757 - 31.431 : 190   ***
        ; 31.431 - 35.106 : 375   *****
        ; 35.106 - 38.780 : 681   *********
        ; 38.780 - 42.454 : 947   *************
        ; 42.454 - 46.128 : 1216  *****************
        ; 46.128 - 49.803 : 1451  ********************
        ; 49.803 - 53.477 : 1402  *******************
        ; 53.477 - 57.151 : 1256  *****************
        ; 57.151 - 60.825 : 989   **************
        ; 60.825 - 64.499 : 611   ********
        ; 64.499 - 68.174 : 418   ******
        ; 68.174 - 71.848 : 199   ***
        ; 71.848 - 75.522 : 83    *
        ; 75.522 - 79.196 : 32
        ; 79.196 - 82.871 : 12
        ; 82.871 - 86.545 : 2
    @
 * {@link https://github.com/Nich-Cebolla/AutoHotkey-Distributions/blob/main/Histogram.ahk}
 */
GenerateGaussianDistribution(Mean, StdDev, Length) {
    Result := [], Result.Length := Length, i := 0
    loop Length
        Result[++i] := Mean + StdDev * Sqrt(-2 * Ln(Random())) * Cos(2 * 3.141592653589793 * Random())
    return Result
}
