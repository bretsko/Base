


public extension Optional where Wrapped == Str {
    
    var isEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

public extension Optional where Wrapped == Bool {
    
    /// == true
    var iss: Bool {
        return self == true
    }
}

//// https://github.com/RuiAAPeres/OptionalExtensions
//public extension Optional {
//
//    ///  Get self of default value (if self is nil).
//    ///        let foo: Str? = nil
//    ///        print(foo.unwrapped(or: "bar")) -> "bar"
//    ///        let bar: Str? = "bar"
//    ///        print(bar.unwrapped(or: "foo")) -> "bar"
//    /// - Parameter defaultValue: default value to return if self is nil.
//    /// - Returns: self if not nil or default value if nil.
//    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
//        // http://www.russbishop.net/improving-optionals
//        return self ?? defaultValue
//    }
//
//    ///  Gets the wrapped value of an optional. If the optional is `nil`, throw a custom error.
//    ///        let foo: Str? = nil
//    ///        try! print(foo.unwrapped(or: MyError.notFound)) -> error: MyError.notFound
//    ///        let bar: Str? = "bar"
//    ///        try! print(bar.unwrapped(or: MyError.notFound)) -> "bar"
//    /// - Parameter error: The error to throw if the optional is `nil`.
//    /// - Returns: The value wrapped by the optional.
//    /// - Throws: The error passed in.
//    func unwrapped(or error: Error) throws -> Wrapped {
//        guard let wrapped = self else { throw error }
//        return wrapped
//    }
//
//    ///  Runs a block to Wrapped if not nil
//    ///        let foo: Str? = nil
//    ///        foo.run { unwrappedFoo in
//    ///            // block will never run sice foo is nill
//    ///            print(unwrappedFoo)
//    ///        }
//    ///        let bar: Str? = "bar"
//    ///        bar.run { unwrappedBar in
//    ///            // block will run sice bar is not nill
//    ///            print(unwrappedBar) -> "bar"
//    ///        }
//    /// - Parameter block: a block to run if self is not nil.
//    func run(_ block: (Wrapped) -> Void) {
//        // http://www.russbishop.net/improving-optionals
//        _ = self.map(block)
//    }
//
//    ///  Assign an optional value to a variable only if the value is not nil.
//    ///     let someParameter: Str? = nil
//    ///     let parameters = [Str:Any]() //Some parameters to be attached to a GET request
//    ///     parameters[someKey] ??= someParameter //It won't be added to the parameters dict
//    /// - Parameters:
//    ///   - lhs: Any?
//    ///   - rhs: Any?
//    static func ??= (lhs: inout Optional, rhs: Optional) {
//        guard let rhs = rhs else { return }
//        lhs = rhs
//    }
//
//    //    func filter(_ predicate: (Wrapped) -> Bool) -> Optional {
//    //        return map(predicate) == .some(true) ? self : .none
//    //    }
//
//    //    func mapNil(_ predicate: () -> Wrapped) -> Optional {
//    //        return self ?? .some(predicate())
//    //    }
//    //
//    //    func flatMapNil(_ predicate: () -> Optional) -> Optional {
//    //        return self ?? predicate()
//    //    }
//
//    //    func then(_ f: (Wrapped) -> Void) {
//    //        if let wrapped = self { f(wrapped) }
//    //    }
//
//    //    func maybe<U>(_ defaultValue: U, f: (Wrapped) -> U) -> U {
//    //        return map(f) ?? defaultValue
//    //    }
//
//    //    func onSome(_ f: (Wrapped) -> Void) -> Optional {
//    //        then(f)
//    //        return self
//    //    }
//
//    //    func onNone(_ f: () -> Void) -> Optional {
//    //        if isNone { f() }
//    //        return self
//    //    }
//    //
//    //    var isSome: Bool {
//    //        return self != nil
//    //    }
//    //
//    //    var isNone: Bool {
//    //        return !isSome
//    //    }
//}
//
//
//public extension Optional where Wrapped: Collection {
//
//    /// Check if optional is nil or empty collection.
//    var isNilOrEmpty: Bool {
//        guard let a = self else { return true }
//        return a.isEmpty
//    }
//
//}
//
//// MARK: - Operators
//infix operator ??= : AssignmentPrecedence
