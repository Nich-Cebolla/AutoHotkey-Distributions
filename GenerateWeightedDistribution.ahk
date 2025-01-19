#Include <Array>

/**
 * @description - Creates an array of values that follow a weighted distribution.
 * @param {Array} Input - An object with the following properties:
    @example
    input :=  [
        { Start: 0, End: 25, Weight: 0.3 },
        { Start: 25, End: 50, Weight: 0.2 },
        { Start: 50, End: 75, Weight: 0.4 },
        { Start: 75, End: 100, Weight: 0.1 }
    ]
    arr := GenerateWeightedDistribution(input, 1000)
    @
 * @returns {Array} - An array of values that follow the weighted distribution.
 */
GenerateWeightedDistribution(Input, Length) {
    local Result := [], i := 0
    , CDF := [], Cumulative := 0, TotalWeight := Input.Reduce(_GetTotalWeight, 0)
    Result.Length := Length
    Input.ForEach(_GetCDFItem)
    loop Length
        Result[A_Index] := _GetNumber()
    return Result

    _GetTotalWeight(&Accumulator, Segment, *) {
        Accumulator += Segment.Weight * (Segment.End - Segment.Start)
    }
    _GetNumber() {
        SelectedSegment := CDF.Find(((n, Segment, *) => n <= Segment.Cumulative).Bind(Random()))
        return Random() * (SelectedSegment.End - SelectedSegment.Start) + SelectedSegment.Start
    }
    _GetCDFItem(Segment, *) {
        Cumulative += Segment.Weight * (Segment.End - Segment.Start) / TotalWeight
        CDF.Push({Start: Segment.Start, End: Segment.End, Weight: Segment.Weight, Cumulative: Cumulative})
    }
}
