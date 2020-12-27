

public enum Regx: Hashable { //todo HasDescrP 
    
    case regex(Pattern)
    
    case custom(Str)
    
    /// Common Regular Expression Patterns
    public enum Pattern: Str, StrEnumT {
        
        /// email addresses
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        /// first alphanumeric character of each word
        case firstChar = "(\\b\\w|(?<=_)[^_])"
        
        /// last alphanumeric character of each word
        case lastChar = "(\\w\\b|[^_](?=_))"
        
        /// non-Alphanumeric characters
        case nonAlphanumeric = "[^a-zA-Z\\d]"
        
        /// non-Alphanumeric and non-Whitespace characters
        case nonAlphanumericSpace = "[^a-zA-Z\\d\\s]"
    }
}

public extension Regx {
    
    /// Regular expression pattern that will be used to evaluate a specific str.
    var pattern: Str {
        switch self {
        case .custom(let str):
            return str
        case .regex(let regex):
            return regex.s
        }
    }
    
    init(pattern: Str) {
        self = .custom(pattern)
    }
    
    init(_ pattern: Pattern) {
        self = .regex(pattern)
    }
    
    /// Evaluates a str for all instances of a regular expression pattern and returns a list of matched ranges for that str.
    ///
    /// - Parameters:
    ///     - str: The str that will be evaluated.
    ///     - options: Regular expression options that are applied to the str during matching. Defaults to [].
    ///
    /// - Returns: A list of matches.
    func match(_ str: Str,
               with options: NSRegularExpression.Options = []) -> [Range<StrIdx>] {
        let rng = NSRange(location: 0, length: str.utf16.count)
        guard let regex = try? NSRegularExpression(pattern: pattern,
                                                   options: options) else {
            return []
        }
        
        let matches = regex.matches(in: str, options: [], range: rng)
        
        return matches.compactMap { (match) -> Range<StrIdx>? in
            match.range.range(for: str)
        }
    }
    
    /// Evaluates a str for all instances of a regular expression pattern and returns a list of matched strings for that str.
    ///
    /// - Parameters:
    ///     - str: The str that will be evaluated.
    ///     - options: Regular expression options that are applied to the str during matching. Defaults to [].
    ///
    /// - Returns: A list of matches.
    func getMatches(for str: Str,
                    with options: NSRegularExpression.Options = []) -> [Str] {
        let ranges = match(str)
        
        var all: [Str] = []
        ranges.forEach { rng in
            all.append(Str(str[rng]))
        }
        return all
    }
    
    /// Tests a str to see if it matches the regular expression pattern.
    ///
    /// - Parameters:
    ///     - str: The str that will be evaluated.
    ///     - options: Regular expression options that are applied to the str during matching. Defaults to [].
    ///
    /// - Returns: `true` if str passes the test, otherwise, `false`.
    func test(str: Str,
              with options: NSRegularExpression.Options = []) -> Bool {
        match(str, with: options).count > 0
    }
    
    
    /// Returns an array containing the first letter of each word in the test str.
    ///
    /// - Parameter str: The str to evaluate.
    /// - Returns: An array containing the first letter of each word in the provided str.
    static func firstCharOfEachWord(in str: Str) -> [Str] {
        Regx(.firstChar).getMatches(for: str)
    }
    
    /// Returns an array containing the last letter of each word in the test str.
    ///
    /// - Parameter str: The str to evaluate.
    /// - Returns: An array containing the last letter of each word in the provided str.
    static func lastCharOfEachWord(in str: Str) -> [Str] {
        Regx(.lastChar).getMatches(for: str)
    }
    
    /// Tests a str to check if it is a valid email address by using a regular expression.
    ///
    /// - Parameters:
    ///     - email: The str that needs to be evaluated.
    ///
    /// - Returns: `true` if `str` is a valid email address, otherwise `false`.
    static func isValidEmail(email: Str) -> Bool {
        Regx(.email).test(str: email)
    }
    
    /// Sanitizes of a str by removing all non-Alphanumeric characters (excluding whitespaces)
    ///
    /// - Parameter str: The str that should be sanitized.
    /// - Returns: The sanitized str.
    static func sanitize(str: Str) -> Str {
        Regx(.nonAlphanumeric)
            .replaceOccurences(in: str, withChar: "")
            .trimmingSpacesAndNewlines
    }
}


// MARK: - Helper Functions

extension Regx {
    
    /// Replace specific ranges in a str with a specific character.
    ///
    /// - Parameters:
    ///   - str: The str that will be manipulated.
    ///   - character: The character that is injected in certain ranges within the original str.
    /// - Returns: A new str based on the old str, but with specific ranges containing a different character.
    func replaceOccurences(in str: Str,
                           withChar char: Str) -> Str {
        let ranges = Regx(pattern: pattern).match(str)
        
        var newStr = str
        ranges.forEach { rng in
            newStr.replaceSubrange(rng, with: char)
        }
        return newStr
    }
}
