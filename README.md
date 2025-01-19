# AutoHotkey-Distributions
Five AutoHotkey (AHK) functions for generating sets of random numbers that adhere to a distribution type.

Contents:

GenerateClusteredDistribution - Generates an array of values, where the values can be characterized as a series of sub-ranges, each sub-range containing an even distribution of values across the range.

GenerateEvenDistribution - Generates an array of values, where the values are the result of `Random(MinValue, MaxValue)`.

GenerateExponentialDistribution - Generates an array of values, where the values are the result of `Min(Max((Ln(1 - Random()) / Lambda * -1) + Lower, Lower), Upper)`. `Lambda`, `Lower`, and `Upper` are function inputs.

GenerateGaussianDistribution - Generates an array of values, where the values are the result of `Mean + StdDev * Sqrt(-2 * Ln(Random())) * Cos(2 * 3.141592653589793 * Random())`. `Mean` and `StdDev` are function inputs.

GenerateWeightedDistribution - Generates an array of values, where the values are weighted against the entire sample. The resulting output for this is similar to GenerateClusteredDistribution, but the implementation utilizes a cumulative distribution function, whereas GenerateClusteredDistribution generates each cluster sequentially.
