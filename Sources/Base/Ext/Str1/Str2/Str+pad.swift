

// Padding Operations
public extension Str {

    /// Returns the center-padded version of the str.
    ///
    /// Example 1:
    ///
    ///     let str = "Hello World"
    ///     print(str.pad(length: 13))
    ///     // Prints " Hello World "
    ///
    /// Example 2:
    ///
    ///     let str = "Hello World"
    ///     print(str.pad(length: 13, withToken: "*"))
    ///     // Prints "*Hello World*"
    ///
    /// - Parameters:
    ///   - length: The final length of your str. If the provided length is less than or equal to the original str, the original str is returned. If the the sum-total of characters added is odd, the left side of the str will have one less instance of the token.
    ///   - token: The str used to pad the Str. Must be 1 character in length. Defaults to a white space if the parameter is left blank.
    /// - Returns: The padded copy of the str.
    func pad(length: Int,
             withToken token: Str = " ") -> Str {
        
        guard padConditionsSatisfied(tokenCount: token.count,
                                     length: length) else {
            return self
        }
        let delta = Int(ceil(Double(length-count)/2))
        return padLeft(length: length-delta, withToken: token).padRight(length: length, withToken: token)
    }

    /// Returns the left-padded version of the str.
    ///
    /// Example 1:
    ///
    ///     let str = "Hello World"
    ///     print(str.padLeft(length: 13))
    ///     // Prints "  Hello World"
    ///
    /// Example 2:
    ///
    ///     let str = "Hello World"
    ///     print(str.padLeft(length: 13, withToken: "*"))
    ///     // Prints "**Hello World"
    ///
    /// - Parameters:
    ///
    ///   - length: The final length of your str. If the provided length is less than or equal to the original str, the original str is returned.
    ///   - token: The str used to pad the Str. Must be 1 character in length. Defaults to a white space if the parameter is left blank.
    /// - Returns: The left-padded copy of the str.
    func padLeft(length: Int,
                 withToken token: Str = " ") -> Str {
        
        guard padConditionsSatisfied(tokenCount: token.count,
                                     length: length) else {
            return self
        }
        var copySelf = self
        repeat { copySelf.insert(token[token.startIndex],
                                 at: startIndex) } while copySelf.count < length
        return copySelf
    }

    /// Returns the right-padded version of the str.
    ///
    /// Example 1:
    ///
    ///     let str = "Hello World"
    ///     print(str.padRight(length: 13))
    ///     // Prints "Hello World  "
    ///
    /// Example 2:
    ///
    ///     let str = "Hello World"
    ///     print(str.padRight(length: 13, withToken: "*", ))
    ///     // Prints "Hello World**"
    ///
    /// - Parameters:
    ///   - length: The final length of your str. If the provided length is less than or equal to the original str, the original str is returned.
    ///   - token: The str used to pad the Str. Must be 1 character in length. Defaults to a white space if the parameter is left blank.
    /// - Returns: The right-padded copy of the str.
    @discardableResult
    func padRight(length: Int,
                  withToken token: Str = " ") -> Str {
        
        guard padConditionsSatisfied(tokenCount: token.count,
                                     length: length) else { return self }

        var copySelf = self
        repeat { copySelf.insert(token[token.startIndex],
                                 at: endIndex) } while copySelf.count < length
        return copySelf
    }

    //MARK: -

    /// A Boolean value indicating if all the pre-padding operation conditions are satisfied.
    ///
    /// - Parameters:
    ///   - token: The token that will be used for padding.
    ///   - length: The final length of the str.
    /// - Returns: True, if the str can be padded. Otherise, false.
    private func padConditionsSatisfied(tokenCount: Int,
                                length: Int) -> Bool {
        length > count && tokenCount == 1
    }
}
