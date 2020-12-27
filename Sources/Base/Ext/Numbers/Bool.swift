


public extension Bool {
    
    ///  1 if true, or 0 if false.
    var int: Int {
        self ? 1 : 0
    }
    
    ///  "true" if true, or "false" if false.
    var string: Str {
        description
    }
    
    /// inverse value
    var toggled: Bool {
        return !self
    }
    
    static var random: Bool {
        arc4random_uniform(2) == 1
        //Int.random() % 2 == 0
    }
  
    /// Creates an instance initialized to the specified integer value.
    init<T: BinaryInteger>(_ integer: T) {
        self = integer != 0
    }
    
    ///  Toggle value for bool
    @discardableResult mutating func toggle() -> Bool {
        self = !self
        return self
    }
}


extension Bool: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = value != 0 ? true : false
    }
    
    public typealias IntegerLiteralType = Int
}
