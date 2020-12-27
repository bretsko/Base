

//MARK: - HasAllFormsT

extension Int: HasAllFormsT {}
public extension Int {
    
    /// Returns sorted list of Ints in the given range
    /// by default from 0 to 1 million
    /// with step 0.1, 0 is not included
    static func gen(min: Int = 1,
                         max: Int = 1000000,
                         step: Int = 1) -> [Int] {
        stride(from: min, through: max, by: step).array
    }
    
    // HasAllFormsT
    /// Returns a set of Ints in the range (not all Ints !) 0 to 1 million,
    /// with step 0.1, 0 is not included
    static var allForms: Set<Self> {
        stride(from: 1, through: 1000000, by: 1).set
    }
}


//MARK: - rand

public extension Int {
    
    static func rand(_ upper_bound: Int = Int.max) -> Int {
        //        #if os(Linux)
        //        return Int(random() % (upper_bound + 1))
        //        #else
        Int(arc4random_uniform(UInt32(upper_bound)))
        //#endif
    }
    
    static func random(lower: Int = 0,
                       upper: Int = 100) -> Int {
        random(in: lower...upper)
    }
    
    func times(_ f: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
}

//MARK: - convs


// long
public extension Int {
    var f:Float {
        Float(self)
    }
    var d:Double {
        Double(self)
    }
    var i:Int {
        self
    }
    var squared:Int {
        self * self
    }
    var b: Int8 {
        Int8(self)
    }
    var ub: UInt8 {
        UInt8(self)
    }
    var s: Int16 {
        Int16(self)
    }
    var us: UInt16 {
        UInt16(self)
    }
    var ui: UInt32 {
        UInt32(self)
    }
    var ul: UInt {
        UInt(self)
    }
    var ll: Int64 {
        Int64(self)
    }
    var ull: UInt64 {
        UInt64(self)
    }
}


//MARK: UInt

public extension UInt {
    func times(_ f: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
}

// unsigned long, size_t
public extension UInt {
    
    var d: Double {
        Double(self)
    }
    var f: Float {
        Float(self)
    }
    var b: Int8 {
        Int8(self)
    }
    var ub: UInt8 {
        UInt8(self)
    }
    var s: Int16 {
        Int16(self)
    }
    var us: UInt16 {
        UInt16(self)
    }
    var i: Int32 {
        Int32(self)
    }
    var ui: UInt32 {
        UInt32(self)
    }
    var l: Int {
        Int(self)
    }
    var ll: Int64 {
        Int64(self)
    }
    var ull: UInt64 {
        UInt64(self)
    }
}

//MARK: Int32

public extension Int32 {
    /// - note: Using `Int` as parameter type as we usually just want to write `Int32.random(13, 37)` and not `Int32.random(Int32(13), Int32(37))`
    static func random(lower: Int = 0,
                       upper: Int = 100) -> Int32 {
        Int32.random(in: Int32(lower)...Int32(upper))
    }
}

// GLint, cl_int
public extension Int32 {
    
    var d: Double {
        Double(self)
    }
    var f: Float {
        Float(self)
    }
    var b: Int8 {
        Int8(self)
    }
    var ub: UInt8 {
        UInt8(self)
    }
    var s: Int16 {
        Int16(self)
    }
    var us: UInt16 {
        UInt16(self)
    }
    var ui: UInt32 {
        UInt32(self)
    }
    var l: Int {
        Int(self)
    }
    var ul: UInt {
        UInt(self)
    }
    var ll: Int64 {
        Int64(self)
    }
    var ull: UInt64 {
        UInt64(self)
    }
}

//MARK: Int64

public extension Int64 {
    
    var d: Double {
        Double(self)
    }
    var f: Float {
        Float(self)
    }
    var b: Int8 {
        Int8(self)
    }
    var ub: UInt8 {
        UInt8(self)
    }
    var s: Int16 {
        Int16(self)
    }
    var us: UInt16 {
        UInt16(self)
    }
    var ui: UInt32 {
        UInt32(self)
    }
    var l: Int {
        Int(self)
    }
    var ul: UInt {
        UInt(self)
    }
    var ll: Int64 {
        Int64(self)
    }
    var ull: UInt64 {
        UInt64(self)
    }
}

//MARK: UInt32

// GLuint, GLenum, GLsizei
public extension UInt32 {
    var d: Double {
        Double(self)
    }
    var f: Float {
        Float(self)
    }
    var b: Int8 {
        Int8(self)
    }
    var ub: UInt8 {
        UInt8(self)
    }
    var s: Int16 {
        Int16(self)
    }
    var us: UInt16 {
        UInt16(self)
    }
    var i: Int32 {
        Int32(self)
    }
    var l: Int {
        Int(self)
    }
    var ul: UInt {
        UInt(self)
    }
    var ll: Int64 {
        Int64(self)
    }
    var ull: UInt64 {
        UInt64(self)
    }
}

//MARK: UInt64

// Darwin clock_types.h
public extension UInt64 {
    
    var d: Double {
        Double(self)
    }
    var f: Float {
        Float(self)
    }
    var b: Int8 {
        Int8(self)
    }
    var ub: UInt8 {
        UInt8(self)
    }
    var s: Int16 {
        Int16(self)
    }
    var us: UInt16 {
        UInt16(self)
    }
    
    var i: Int32 {
        Int32(self)
    }
    var ui: UInt32 {
        UInt32(self)
    }
    var l: Int {
        Int(self)
    }
    var ul: UInt {
        UInt(self)
    }
    var ll: Int64 {
        Int64(self)
    }
}

// GLboolean, Boolean
public extension UInt8 {
    var boolValue: Bool {
        self != 0
    }
    
    init(booleanLiteral value: BooleanLiteralType) {
        self = value ? UInt8(1) : UInt8(0)
    }
}



// GLint
extension Int32: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        self = value ? Int32(1) : Int32(0)
    }
}

extension Int: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        self = value ? Int(1) : Int(0)
    }
    
    //    public init<T : FixedWidthInteger>(_ integer: T) {
    //        if integer == 0 {
    //            self.init(false)
    //        } else {
    //            self.init(true)
    //        }
    //    }
}


// Int8
public extension CChar {
    init(_ v: UnicodeScalar) {
        self = CChar(v.value)
    }
}


