


public extension Str {
    
    //MARK: - base64
    
    init(base64Value: Str) {
        let data = Data(base64Encoded: base64Value,
                        options: Data.Base64DecodingOptions(rawValue: 0))
        self = Str(data: data!,
                   encoding: Str.Encoding.utf8)!
    }
    
    var base64Value: Str {
        let a = data(using: Str.Encoding.utf8)
        return a!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    ///  Create a new string from a base64 string (if applicable).
    /// Str(base64: "SGVsbG8gV29ybGQh") = "Hello World!"
    /// Str(base64: "hello") = nil
    /// - Parameter base64: base64 string.
    init?(base64: Str) {
        guard let data = Data(base64Encoded: base64),
              let str = Str(data: data, encoding: .utf8) else {
            return nil
        }
        self.init(str)
    }
    
    ///  Str decoded from base64 (if applicable)
    /// "SGVsbG8gV29ybGQh".base64Decoded = Optional("Hello World!")
    var base64Decoded: Str? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return Str(data: decodedData, encoding: .utf8)
    }
    
    
    ///  Str encoded in base64 (if applicable).
    /// "Hello World!".base64Encoded -> Optional("SGVsbG8gV29ybGQh")
    var base64Encoded: Str? {
        // https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
        data(using: .utf8)?.base64EncodedString()
    }
    
    
    //MARK: - URL
    
    ///  Readable string from a URL string.
    /// "it's%20easy%20to%20decode%20strs".urlDecoded -> "it's easy to decode strs"
    var urlDecoded: Str {
        removingPercentEncoding ?? self
    }
    
    ///  URL escaped string.
    /// "it's easy to encode strs".urlEncoded -> "it's%20easy%20to%20encode%20strs"
    var urlEncoded: Str {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    ///  Convert URL string to readable string.
    /// var str = "it's%20easy%20to%20decode%20strs"
    /// str.urlDecode()
    /// print(str) // prints "it's easy to decode strs"
    mutating func urlDecode() {
        if let a = removingPercentEncoding {
            self = a
        }
    }
    
    ///  Escape string.
    /// var str = "it's easy to encode strs"
    /// str.urlEncode()
    /// print(str) // prints "it's%20easy%20to%20encode%20strs"
    mutating func urlEncode() {
        if let a = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            self = a
        }
    }
    
    //MARK: - common
    
    ///  The longest common suffix.
    /// "Hello world!".commonSuffix(with: "It's cold!") = "ld!"
    /// - Parameters:
    ///     - Parameter other: The string with which to compare the receiver.
    ///     - Parameter options: Options for the comparison.
    /// - Returns: The longest common suffix of the receiver and the given Str
    func commonSuffix<T: StringProtocol>(with other: T,
                                         options: Str.CompareOptions = []) -> Str {
        let reversedSuffix = Str(reversed()).commonPrefix(with: Str(other.reversed()), options: options)
        return Str(reversedSuffix.reversed())
    }
    
    var mostCommonChar: Char? {
        removingSpacesAndNewLines?.reduce(into: [Char: Int]()) {
            let len = $0[$1] ?? 0
            $0[$1] = len + 1
        }.max { $0.1 < $1.1 }?.0
    }
}

//        static func longestCommonPrefix(_ candidates: [Str]) -> Str {
//            guard candidates.isEmpty == false else { return "" }
//
//            let charArrays = candidates.map { Array($0) }
//
//            for prefixLen in 0 ..< characterArrays[0].count {
//                let character = characterArrays[0][prefixLen]
//                for i in 1 ..< characterArrays.count {
//                    if prefixLen >= characterArrays[i].count || charArrays[i][prefixLen] != character {
//                        // Mismatch found
//                        return Str(characterArrays[i][0..<prefixLen])
//                    }
//                }
//            }
//            return candidates[0]
//        }


//        static func longestCommonPrefix(_ candidates: [Str]) -> Str {
//            guard candidates.isEmpty == false else { return "" }
//
//            let characterArrays = candidates.map { Array($0) }
//
//            for prefixLen in 0 ..< characterArrays[0].count {
//                let character = characterArrays[0][prefixLen]
//                for i in 1 ..< characterArrays.count {
//                    if prefixLen >= characterArrays[i].count || characterArrays[i][prefixLen] != character {
//                        // Mismatch found
//                        return Str(characterArrays[i][0..<prefixLen])
//                    }
//                }
//            }
//            return candidates[0]
//        }


