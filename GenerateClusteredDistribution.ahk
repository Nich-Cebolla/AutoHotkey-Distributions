
/**
 * @description - Creates an array of values that follow a clustered distribution, where each
 * individual cluster is characterized by an even distribution across a range. There may be gaps
 * between the extreme values of the clusters.
 * @param {Array} Input - An array of objects with the following properties:
 * @property {Integer} Start - The minimum value of the cluster.
 * @property {Integer} End - The maximum value of the cluster.
 * @property {Float} Weight - The proportion of the cluster relative to the total length of the
 * resulting array. The sum of the weights of all clusters must equal 1.
 * @param {Integer} Length - The length of the resulting array.
 * @param {Boolean} RandomizeClusterOrder - If true, the order which the clusters are created
 * will be randomized.
 * @returns {Array} - An array of values that follow the clustered distribution.
 */
GenerateClusteredDistribution(Input, Length, RandomizeClusterOrder := true) {
    _SumWeights(&Total)
    if Total != 1
        throw Error('The sum of the weights of the Clusters must equal 1.', -1, 'Sum: ' Total)
    Result := [], i := 0, TotalLength := 0
    loop Input.Length {
        Input[A_Index].LoopCount := LoopCount := Floor(Length * Input[A_Index].Weight)
        TotalLength += LoopCount
    }
    if TotalLength !== Length {
        k := 0
        loop Length - TotalLength {
            if ++k > Input.Length
                k := 1
            Input[k].LoopCount++
        }
    }
    if RandomizeClusterOrder {
        Order := [], Order.Length := Input.Length
        loop Input.Length
            Order[A_Index] := A_Index
        loop Order.Length {
            Cluster := Input[Order.RemoveAt(Random(1, Order.Length))]
            loop Cluster.LoopCount
                Result[++i] := Random(Cluster.Start, Cluster.End)
        }
    } else {
        for Cluster in Input {
            loop Cluster.LoopCount
                Result[++i] := Random(Cluster.Start, Cluster.End)
        }
    }
    return Result

    _SumWeights(&Total) {
        Total := 0
        for Item in Input
            Total += Input.Weight
    }
}