
/// The Lexer object tokenizes a string based on a list of regular expressions.
/// Each regular expression corresponds to a token. The list is evaluated from
/// the beginning, which results in earlier regular expressions taking
/// precedence over later regular expressions.
///
/// Example:
/// ```
/// enum ExampleToken {
///     case symbol(Str)
///     case number(Float)
/// }
///
/// let lexerRules: [Lexer<ExampleToken>.Rule] = [
///     ("^\\s+", { _ in nil }),
///     ("^\\d+", { .number(($0 as NSString).floatValue) }),
///     ("^\\w+", { .symbol($0) })
/// ]
/// let lexer = Lexer<ExampleToken>(rules: lexerRules)
/// let tokens = try? lexer.tokenize("this is the number 123")
///
/// let lexerRangedTokenRules: [Lexer<ExampleToken>.RangedTokenRule] = [
///     ("^\\s+", { (_, _) in nil }),
///     ("^\\d+", { (groups, _) in .number((groups[0] as NSString).floatValue) }),
///     ("^\\w+", { (groups, _) in .symbol(groups[0]) })
/// ]
/// let lexer2 = Lexer<ExampleToken>(rules: lexerRules)
/// let rangedTokens = try? lexer2.tokenize("this is the number 123")
/// ```
public final class Lexer<Token> {
    
    private typealias GenericRule = (Regex, TokenFactory?, RangedTokenFactory?)
    private let rules: [GenericRule]
    
    public init(_ rules: [Rule]) {
        self.rules = rules.map { ($0.0, $0.1, nil) }
    }
    
    public init(_ rules: [RangedTokenRule]) {
        self.rules = rules.map { ($0.0, nil, $0.1) }
    }
}

public extension Lexer {
    
    typealias MatchGroups = [Str]
    typealias RangedTokenFactory = (MatchGroups, CountableRange<Int>) -> Token?
    typealias RangedTokenRule = (Regex, RangedTokenFactory)
    typealias TokenFactory = (Str) -> Token?
    typealias Rule = (Regex, TokenFactory)
    
    
    /// Tokenizes a string based on a list of regular expression patterns.
    ///
    /// - parameter string: The string to tokenize.
    ///
    /// - returns: Array of tokens.
    func tokenize(_ string: Str) -> [Token] {
        var tokens = [Token]()
        
        var range: CountableRange<Int> = 0 ..< string.count
        
        while !range.isEmpty {
            //var ruleMatched = false
            for (regex, tokenFactory, rangedTokenFactory) in rules {
                
                guard let (groups, tokenRange) = regex.firstMatch(in: string, inRange: range) else {
                    continue
                }
                if let token = createToken(with: tokenFactory, rangedTokenFactory: rangedTokenFactory, groups: groups, tokenRange: tokenRange) {
                    tokens.append(token)
                }
                //ruleMatched = true
                range = tokenRange.upperBound ..< string.count
                break
            }
            
            //if !ruleMatched {
            //    print("[Lexer] Error: Token not recognized.")
            //    print(range)
            //}
        }
        return tokens
    }
    
    //MARK: - private
    
    private func createToken(with tokenFactory: TokenFactory?,
                             rangedTokenFactory: RangedTokenFactory?,
                             groups: [Str],
                             tokenRange: CountableRange<Int>) -> Token? {
        
        if let factory = tokenFactory {
            return factory(groups[0])
            
        } else if let factory = rangedTokenFactory {
            return factory(groups, tokenRange)
        }
        return nil
    }
    
    private func createToken(with factory: TokenFactory,
                             groups: [Str],
                             tokenRange: Range<Int>) -> Token? {
        factory(groups[0])
    }
    
    
    /// Error type for Lexer methods that throw.
    //    public enum LexerError: Error {
    //        case tokenNotRecognized(range: CountableRange<Int>)
    //    }
}
