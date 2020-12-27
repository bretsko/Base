

/// Convenience class for easier use of NSRegex
///
/// Example:
/// ```
/// Regex("he[l]+").isMatch("hello")
/// let regex: Regex = "he[l]+o"
/// regex.isMatch("hello")
/// "hello".matches(regex: regex)
/// "hello".matches(regex: "he[l]+o")
///
/// let regex2: Regex = "([0123456789]+)\\.([0123456789]+)"
/// regex2.numberOfMatches("313.145192653 1.78")
/// let matches = regex2.match("3.145192653 1.78 2.41")
/// "3.145192653 1.78 2.41".match(regex: "([0123456789]+)\\.([0123456789]+)")
///
/// switch "This is a test" {
/// case Regex("This is a .*"):
///     print("It is indeed.")
///     break
///     ...
/// }
///
/// let regex3 = Regex("(\\w+)=(\\d+)")
/// let a = regex3.replaceMatches(in: "123 456 789", template: "($0)")
/// let b = regex3.replaceMatches(in: "a=123 b=456 c=789", template: "($1: $2)")
/// ```
public struct Regex {
    
    fileprivate var matcher: NSRegex? = nil
    
    fileprivate let pattern: Str
    
    fileprivate var options: NSRegex.Options = []
}

public typealias NSRegex = NSRegularExpression

public extension Regex {
    
    var isValid: Bool {
        matcher != nil
    }
    
    init(_ pattern: Str,
         _ options: NSRegex.Options = []) {
        self.options = options
        self.pattern = pattern
        createMatcher()
    }
    
    /// Checks if string matches pattern.
    ///
    /// Examples:
    /// ```
    /// Regex("he[l]+").isMatch("hello")
    ///
    /// let regex: Regex = "he[l]+o"
    /// regex.isMatch("hello")
    /// ```
    ///
    /// - parameter string: Str to match.
    /// - parameter options: Regular expression matching options.
    ///
    /// - returns: Returns `true` if string matches pattern, else `false`.
    func isMatch(_ string: Str,
                 options: NSRegex.MatchingOptions = []) -> Bool {
        numberOfMatches(string, options: options) != 0
    }
    
    /// Returns the number of matches for this pattern in the string.
    ///
    /// - parameter string: Str to match.
    /// - parameter inRange: Restrict matching to this part of the string.
    ///                      Defaults to entire string.
    /// - parameter options: Regular expression matching options.
    ///
    /// - returns: The number of matches for this pattern in the string.
    func numberOfMatches(_ string: Str,
                         inRange: CountableRange<Int>? = nil,
                         options: NSRegex.MatchingOptions = []) -> Int {
        if let matcher = matcher {
            let inputRange = rangeToNSRange(in: string, range: inRange)
            return matcher.numberOfMatches(in: string, options: options, range: inputRange)
        } else {
            return 0
        }
    }
    
    /// Matches pattern with a string and return the matches.
    ///
    /// - parameter string: Str to match.
    /// - parameter inRange: Restrict matching to this part of the string.
    ///                      Defaults to entire string.
    /// - parameter options: Regular expression matching options.
    ///
    /// - returns: The matches.
    func match(_ string: Str,
               inRange: CountableRange<Int>? = nil,
               options: NSRegex.MatchingOptions = []) -> [[Str]] {
        let inputRange = rangeToNSRange(in: string, range: inRange)
        var matches: [[Str]] = []
        matcher?.enumerateMatches(in: string, options: options, range: inputRange) {
            (match, flags, stop) -> Void in
            if let match = match {
                let group = self.group(from: string, match: match)
                matches.append(group)
            }
        }
        return matches
    }
    
    /// Returns the first match from the string.
    ///
    /// - parameter string: Str to match.
    /// - parameter inRange: Restrict matching to this part of the string.
    ///                      Defaults to entire string.
    /// - parameter options: Regular expression matching options.
    ///
    /// - returns: Returns the first match from the string.
    func firstMatch(in string: Str,
                    inRange: CountableRange<Int>? = nil,
                    options: NSRegex.MatchingOptions = []) -> ([Str], CountableRange<Int>)? {
        let inputRange = rangeToNSRange(in: string, range: inRange)
        
        guard let match = matcher?.firstMatch(in: string,
                                              options: options,
                                              range: inputRange) else {
            return nil
        }
        let group = self.group(from: string, match: match)
        
        let min = match.range.location
        let max = match.range.location + match.range.length
        
        return (group, min..<max)
    }
    
    /// Returns the range of the first match from the string.
    ///
    /// - parameter string: Str to match.
    /// - parameter inRange: Restrict matching to this part of the string.
    ///                      Defaults to entire string.
    /// - parameter options: Regular expression matching options.
    ///
    /// - returns: Returns the range of the first match from the string.
    func rangeOfFirstMatch(in string: Str,
                           inRange: CountableRange<Int>? = nil,
                           _ options: NSRegex.MatchingOptions = []) -> Range<Int>? {
        let inputRange = rangeToNSRange(in: string, range: inRange)
        guard let range = matcher?.rangeOfFirstMatch(in: string,
                                                     options: options,
                                                     range: inputRange) else {
            return nil
        }
        guard range.location != NSNotFound else {
            return nil
        }
        let min = range.location
        let max = range.location + range.length
        return min..<max
    }
    
    
    /// Returns a new string where the matches in the string have been replaced
    /// with a substring generated from a template.
    ///
    /// - parameter string: Str to match.
    /// - parameter template: Template to use when replacing substrings.
    /// - parameter inRange: Restrict matching to this part of the string.
    /// - parameter options: Regular expression matching options.
    ///
    /// - returns: Returns a new string where the matches in the string have
    ///            been replaced with a substring generated from a template.
    func replaceMatches(in string: Str,
                        template: Str,
                        inRange: CountableRange<Int>? = nil,
                        options: NSRegex.MatchingOptions = []) -> Str {
        guard let matcher = matcher else {
            return string
        }
        let inputRange = rangeToNSRange(in: string, range: inRange)
        return matcher.stringByReplacingMatches(in: string, options: options, range: inputRange, withTemplate: template)
    }
    
    
    /// Enumerates the pattern matches in the string.
    ///
    /// - parameter string: Str to match.
    /// - parameter inRange: Restrict matching to this part of the string.
    /// - parameter options: Regular expression matching options.
    /// - parameter action: Closure to call for each match in the string.
    func enumerateMatches(in string: Str,
                          inRange: CountableRange<Int>? = nil,
                          options: NSRegex.MatchingOptions = [],
                          action: (_ match: [Str]) -> Void) {
        let inputRange = rangeToNSRange(in: string, range: inRange)
        matcher?.enumerateMatches(in: string, options: options, range: inputRange, using: { (result, _, _) -> Void in
            if let result = result {
                let group = self.group(from: string, match: result)
                action(group)
            }
        })
    }
}


private extension Regex {
    
    mutating func createMatcher() {
        do {
            let regex = try NSRegex(pattern: pattern,
                                    options: options)
            matcher = regex
        } catch let error as NSError {
            print("[Regex] ERROR: Failed to create regular expression: \(error.localizedDescription)")
            matcher = nil
        }
    }
    
    func group(from string: Str,
               match: NSTextCheckingResult) -> [Str] {
        
        var group: [Str] = []
        for i in 0..<match.numberOfRanges {
            let range = match.range(at: i)
            
            if range.location == NSNotFound {
                group.append("")
            } else {
                let fromUtf16 = string.utf16.index(string.utf16.startIndex, offsetBy: range.location, limitedBy: string.utf16.endIndex)!
                let toUtf16 = string.utf16.index(fromUtf16, offsetBy: range.length, limitedBy: string.utf16.endIndex)!
                if let from = StrIdx(fromUtf16, within: string),
                   let to = StrIdx(toUtf16, within: string) {
                    group.append(Str(string[from..<to]))
                }
            }
        }
        return group
    }
    
    func rangeToNSRange(in string: Str,
                        range: CountableRange<Int>?) -> NSRange {
        if let range = range {
            return NSMakeRange(range.startIndex,
                               range.endIndex - range.startIndex)
        }
        return NSMakeRange(0, string.count)
    }
}

// MARK: - Str Literal Convertible

// This is what allows the Regex to be created from a literal pattern string.
extension Regex: ExpressibleByStringLiteral {}
public extension Regex {
    typealias UnicodeScalarLiteralType = StringLiteralType
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    
    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        pattern = "\(value)"
        createMatcher()
    }
    
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        pattern = value
        createMatcher()
    }
    
    init(stringLiteral value: StringLiteralType) {
        self.pattern = value
        createMatcher()
    }
}

// MARK: - Object Description

extension Regex: HasDescrP {
    
    public var descr: Str {
        pattern
    }
}

// MARK: - Extension on Str

public extension Str {
    
    /// Checks if string matches a regular expression.
    ///
    /// - parameter regex: Regular expression to match with string.
    ///
    /// - returns: Returns `true` if string matches regular expression,
    ///            else `false`
    func matches(regex: Regex) -> Bool {
        regex.isMatch(self)
    }
    
    
    /// Returns regular expression matches.
    ///
    /// - parameter regex: Regular expression to match with string.
    ///
    /// - returns: Returns regular expression matches.
    func match(regex: Regex) -> [[Str]] {
        regex.match(self)
    }
}

// MARK: - Pattern matching

public func ~=(regex: Regex, input: Str) -> Bool {
    regex.isMatch(input)
}
