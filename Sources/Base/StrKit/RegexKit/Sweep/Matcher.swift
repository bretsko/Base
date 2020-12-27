
/// Type used to define a custom string scanning matcher,
/// which gets all substrings that appear between a set of
/// identifiers and terminators passed to its handler.
public struct Matcher {
    
    /// The identifiers to look for when scanning. When any
    /// of the identifiers are found, a matching session begins.
    public var identifiers: [Identifier]
    
    /// The terminators that end a matching session, causing the
    /// substring between any of the found terminators and the
    /// identifier that started the session to be passed to the
    /// matcher's handler.
    public var terminators: [Terminator]
    
    /// Whether this matcher should be allowed to handle multiple
    /// matches, or if it's single-use only. Default value: true.
    public var allowMultipleMatches: Bool
    
    
    /// Closure type used to define a handler for a matcher. When
    /// a match is found, the handler is passed the substring that
    /// was matched, as well as the rng containing the match plus
    /// the identifier and terminator that the match is located between.
    public typealias Handler = (Substr, ClosedRange<StrIdx>) -> Void
    
    /// The handler to be called when a match was found. A match
    /// is considered found when a substring appears between any
    /// of the matcher's identifiers and its terminators.
    public var handler: Handler
}

public extension Matcher {
    
    init(_ identifiers: [Identifier],
         _ terminators: [Terminator],
         allowMultipleMatches: Bool = true,
         _ handler: @escaping Handler) {
        self.identifiers = identifiers
        self.terminators = terminators
        self.allowMultipleMatches = allowMultipleMatches
        self.handler = handler
    }
    
    init(_ identifier: Identifier,
         _ terminator: Terminator,
         allowMultipleMatches: Bool = true,
         _ handler: @escaping Handler) {
        self.init([identifier], [terminator],
                  allowMultipleMatches: allowMultipleMatches,
                  handler)
    }
}

//MARK: - Identifier


/// Type used to define an identifier to scan for within a string.
/// An identifier can also be defined using a string literal.
/// Create a value using either .start, .prefix, or .anyString.
public struct Identifier {
    
    /// The string to scan for within a string.
    public var string: Str
    
    /// Whether or not the identifier is required to be located
    /// right at the start of the scanned string.
    public var isPrefix: Bool
}

public extension Identifier {
    
    init(_ str: Str, isPrefix: Bool) {
        self.string = str
        self.isPrefix = isPrefix
    }
    
    /// Match the very start of a string.
    static var start: Identifier {
        .prefix("")
    }
    
    /// Match a starting prefix of a string.
    static func prefix(_ str: Str) -> Identifier {
        Identifier(str, isPrefix: true)
    }
    
    /// Match against a string located anywhere within the scanned string.
    static func anyString(_ str: Str) -> Identifier {
        Identifier(str, isPrefix: false)
    }
}

extension Identifier: ExpressibleByStringLiteral {
    public init(stringLiteral str: Str) {
        self.init(str, isPrefix: false)
    }
}

//MARK: - Terminator

/// Type used to define a terminator that ends a matching session.
/// A terminator can also be defined using a string literal.
/// Create a value using either .end, .suffix, or .anyString.
public struct Terminator {
    
    /// The string to use as a terminator when scanning a string.
    public var string: Str
    
    /// Whether or not the terminator is required to be located
    /// right at the end of the scanned string.
    public var isSuffix: Bool
}

public extension Terminator {
    
    init(_ str: Str, isSuffix: Bool) {
        self.string = str
        self.isSuffix = isSuffix
    }
    
    /// Match the very end of a string.
    static var end: Terminator {
        .suffix("")
    }
    
    /// Match an ending prefix of a string.
    static func suffix(_ str: Str) -> Terminator {
        Terminator(str, isSuffix: true)
    }
    
    /// Match against a string located anywhere within the scanned string.
    static func anyString(_ str: Str) -> Terminator {
        Terminator(str, isSuffix: false)
    }
}

extension Terminator: ExpressibleByStringLiteral {
    public init(stringLiteral str: Str) {
        self.init(str, isSuffix: false)
    }
}
