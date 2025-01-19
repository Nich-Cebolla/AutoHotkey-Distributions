
/**
 * @description - Generates an array of values that follow an even distribution.
 * @param {Number} MinValue - The minimum value of the distribution.
 * @param {Number} MaxValue - The maximum value of the distribution.
 * @param {Number} Length - The length of the resulting array.
 * @param {Boolean} AsIntegers - If true, the values will be integers.
 * @param {Integer} Digits - The number of decimal places to round to.
 * @returns {Array} - An array of values that follow the even distribution.
 */
GenerateEvenDistribution(MinValue, MaxValue, Length, AsIntegers := false, Digits := 5) {
    local Result := []
    Result.Length := ArrLength
    if AsIntegers
        _Random := () => Random(MinValue, MaxValue)
    else
        MaxValue--, _Random := () => Random(MinValue, MaxValue) + (Digits ? Round(Random(), Digits) : Random())
    Loop Result.Length
        Result[A_Index] := _Random()
    return Result
}
