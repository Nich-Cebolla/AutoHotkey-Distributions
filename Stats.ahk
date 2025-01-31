
StdDev(Data, SampleVarianceOffset := 0) => Sqrt(Variance(Data, SampleVarianceOffset))
Variance(Data, SampleVarianceOffset := 0) => SumSquaredDifference(Data, Mean(Data)) / (Data.Length + SampleVarianceOffset)
Mean(Data) {
    if Data.Length < 2
        throw ValueError('The dataset must have at least 2 items.', -1, 'Length: ' Data.Length)
    Total := n := 0
    for Item in Data {
        if IsSet(Item)
            Total += Item, n++
    }
    return Total / n
}
SumSquaredDifference(Data, Mean) {
    Total := 0
    For Item in Data {
        if IsSet(Item)
            Total += (Item - Mean)*(Item - Mean)
    }
    return Total
}
