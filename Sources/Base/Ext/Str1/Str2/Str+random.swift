


public extension Str {
    
    /**
     Creates a new string with randomized chars.
     
     - parameter random: The desired randomized character set.
     - parameter length: The desired length of a string.
     - parameter nonRepeating: The boolean value that determines whether chars in the initialized can or cannot be repeated. The default value is `false`. If `true` and length is greater than number of chars in selected character set, then string with maximum allowed length will be produced.
     - returns: The new string with randomized chars.
     */
    init(_ random: RandomStringType,
         length: Int,
         nonRepeating: Bool = false) {
        
        var letters = random.charSet
        
        var length = length // mutable var
        if length > random.charSet.len, nonRepeating {
            length = random.charSet.len
        }
        
        var r = ""
        while r.len < length {
            let i = letters.index(letters.startIndex,
                                  offsetBy: Int.rand(letters.len))
            let letter = letters[i]
            r.append(letter)
            if nonRepeating {
                letters.remove(at: i)
            }
        }
        
        self = r
    }
    
    
    
    ///  Create a new random string of given length.
    /// Str(randomOfLength: 10) -> "gY8r3MHvlQ"
    /// - Parameter length: number of chars in string.
    init(randomOfLength length: Int) {
        
        guard length > 0 else {
            self.init()
            return
        }
        let charSet = CS.engAlphanumericsLowercased
        
        var r = ""
        length.times {
            let i = Int.rand(charSet.len)
            let char = Array(charSet)[Int(i)]
            r.append(char)
        }
        self = r
    }
    
    
    static func random(withChars str: Str,
                       minLength min: Int,
                       maxLength max: Int) -> Str {
        
        guard min > 0, max >= min else {
            return ""
        }
        
        let length: Int = (min < max) ? .random(in: min...max) : max
        
        var r = ""
        length.times {
            let randomIndex: Int = .random(in: 0..<str.count)
            let i = str.index(str.startIndex,
                              offsetBy: randomIndex)
            r += Str(str[i])
        }
        return r
    }
    
    
    /// uses a set of letters in this string to make a new random string
    func randStr(_ length: Int? = nil) -> Str {
        Str((0...(length ?? count) - 1).map{ _ in randomElement()! })
    }
    
    
    enum RandomStringType {
        
        /// The character set with 36 (`A-Z+0-9`, case insensitive) or 62 (`A-Z+a-z+0-9`, case-sensitive) alphanumeric chars.
        case alphanumeric(caseSensitive: Bool)
        
        /// The character set with 26 (`A-Z`, case insensitive) or 52 (`A-Z+a-z`, case-sensitive) Latin letters.
        
        case alphabetic(caseSensitive: Bool)
        
        /// The character set with 0-9
        case numeric
        
        fileprivate var charSet: Str {
            switch self {
            case .alphanumeric(true):
                return CS.engAlphanumerics
                
            case .alphanumeric(false):
                return CS.engAlphanumericsUppercased
                
            case .alphabetic(true):
                return CS.engLetters
                
            case .alphabetic(false):
                return CS.engLettersUppercased
                
            case .numeric:
                return CS.digits
            }
        }
    }
    
    //TODO: CharSetType vs RandomStringType
//    public enum CharSetType {
//
//        /// all numbers from 0 to 9.
//        case numeric
//
//        /// all alphabetic characters ignoring case.
//        case alphabetic
//
//        /// both numbers and alphabetic characters ignoring case.
//        case alphaNumeric
//
//        /// all characters appearing within the specified Str.
//        case charSet(Str)
//    }

    
//    //MARK: - random
//
//    /// Create new instance with random numeric/alphabetic/alphanumeric Str of given length.
//    ///
//    /// - Parameters:
//    ///   - randommWithLength:      The length of the random Str to create.
//    ///   - allowedCharSetType:  The allowed characters type, see enum `CharSetType`.
//    init(randomWithLength length: Int,
//         allowedCharSetType charSetType: CharSetType) {
//        let str: Str = {
//            switch charSetType {
//            case .numeric:
//                return "0123456789"
//
//            case .alphabetic:
//                return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
//
//            case .alphaNumeric:
//                return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//
//            case .charSet(let charSet):
//                return charSet
//            }
//        }()
//
//        self.init(str.sample(size: length)!)
//    }
}

//    static func randStr(chars: Str, length: Int) -> Str {
//        return Str((0...length-1).map{ _ in chars.randomElement()! })
//    }

//    static func random(ofLength length: Int) -> Str {
//        return random(minLength: length, maxLength: length)
//    }


//    static func randStrWithEngLetters(length: Int) -> Str {
//        return CS.engLetters.randStr(length: length)
//    }
//
//
//    ///  Random string of given length.
//    /// Str.random(ofLength: 18) -> "u7MMZYvGo9obcOcPj8"
//    /// - Parameter length: number of chars in string.
//    /// - Returns: random string of given length.
//    static func random(ofLength length: Int) -> Str {
//        guard length > 0 else { return "" }
//        let chars = CS.engAlphanumerics
//        var r = ""
//        length.times {
//            let randIdx = Int.rand(chars.len)
//            let randChar = chars.chars[Int(randIdx)]
//            r.append(randChar)
//        }
//        return r
//    }




//    static func random(minLength min: Int,
//                       maxLength max: Int) -> Str {
//        return random(
//            withCharactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
//            minLength: min,
//            maxLength: max
//        )
//    }

//    static func random(withChars string: Str,
//                       ofLength length: Int) -> Str {
//        return random(
//            withCharas: string,
//            minLength: length,
//            maxLength: length
//        )
//    }
