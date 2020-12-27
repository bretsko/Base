

// FrequencyTable
/// Data structure to retrieve random values with their frequency taken into account.
public struct FreqTable<T> {
    typealias Entry = (value: T, frequency: Int)
    
    let valuesWithFrequencies: [Entry]
    
    /// Contains all values the amount of time of their frequencies.
    let frequentValues: [T]
}

public extension FreqTable {
    
    /// returns a random value taking frequencies into account or nil if values empty
    var randItem: T? {
        frequentValues.randItem
    }
    
    /// Creates a new FrequencyTable instance with values and their frequencies provided.
    ///
    /// - Parameters:
    ///   - values: An array full of values to be saved into the frequency table.
    ///   - freqClosure: The closure to specify the frequency for a specific value.
    init(values: [T],
         _ freqClosure: (T) -> Int) {
        
        valuesWithFrequencies = values.map { ($0, freqClosure($0)) }
        frequentValues = valuesWithFrequencies.reduce(into: []) { memo, entry in
            memo += Array(repeating: entry.value, count: entry.frequency)
        }
    }
    
    
    /// Returns an array of random values taking frequencies into account or nil if values empty.
    ///
    /// - Parameters:
    ///     - size: The size of the resulting array of random values.
    ///
    /// - Returns: An array of random values or nil if values empty.
    func randArray(size: Int) -> [T]? {
        guard size > 0 && !frequentValues.isEmpty else { return nil }
        return Array(0 ..< size).map { _ in randItem! }
    }
}
