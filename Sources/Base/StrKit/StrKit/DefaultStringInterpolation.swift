

public extension DefaultStringInterpolation {
    
    /// Convenient extension for formatting dates using string interpolation.
    ///
    /// Example:
    ///
    /// ```
    /// let date = Date()
    /// let dateFormatter = DateFormatter()
    /// dateFormatter.dateFormat = "yyyy-MM-dd"
    /// print("Today is \(date, dateFormatter)")
    /// ```
    mutating func appendInterpolation(_ value: Date,
                                      _ formatter: DateFormatter) {
        appendInterpolation(formatter.string(from: value))
    }
    
    /// Convenient extension for formatting dates using string interpolation.
    ///
    /// Example:
    ///
    /// ```
    /// let date = Date()
    /// let isoFormatter = ISO8601DateFormatter()
    /// print("Today is \(date, isoFormatter)")
    /// ```
    mutating func appendInterpolation(_ value: Date,
                                      _ formatter: ISO8601DateFormatter) {
        appendInterpolation(formatter.string(from: value))
    }
    
    /// Convenient extension for formatting numbers using string interpolation.
    ///
    /// Example:
    ///
    /// ```
    /// let numberFormatter = NumberFormatter()
    /// numberFormatter.numberStyle = .spellOut
    /// print("One plus one is \(2, numberFormatter)")
    /// ```
    mutating func appendInterpolation<T: Numeric>(_ value: T,
                                                  _ formatter: NumberFormatter) {
        appendInterpolation(formatter.string(from: value as! NSNumber) ?? "\(value)")
    }
}

