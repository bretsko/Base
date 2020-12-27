

public extension Str {
    
    subscript(_ i: Int) -> Char  {
        self[index(startIndex, offsetBy: i)]
    }
    
    subscript(_ i: Int) -> Str  {
        Str(self[i] as Char)
    }
    
    //    subscript(_ i: Int) -> Str {
    //        get {
    //            return Str(Array(self)[i])
    //        }
    //    }
    
    //    subscript(_ lower: Int, _ upper: Int) -> Str {
    //        get {
    //            let temp = self[self.index(self.startIndex, offsetBy: lower)...self.index(self.startIndex, offsetBy: upper)]
    //            return Str(temp)
    //        }
    //    }

    
    //MARK: - Range
    
    subscript(value: NSRange) -> Substr {
        self[value.lowerBound..<value.upperBound]
    }
    
    subscript(value: CountableClosedRange<Int>) -> Substr {
        self[index(at: value.lowerBound)...index(at: value.upperBound)]
        
    }
    
    subscript(value: CountableRange<Int>) -> Substr {
        self[index(at: value.lowerBound)..<index(at: value.upperBound)]
    }
    
    subscript(value: PartialRangeUpTo<Int>) -> Substr {
        self[..<index(at: value.upperBound)]
    }
    
    subscript(value: PartialRangeThrough<Int>) -> Substr {
        self[...index(at: value.upperBound)]
    }
    
    subscript(value: PartialRangeFrom<Int>) -> Substr {
        self[index(at: value.lowerBound)...]
    }
    
    func index(at offset: Int) -> StrIdx {
        index(startIndex, offsetBy: offset)
    }
}

//MARK: -

//    // swiftlint:disable next identifier_name
//    ///  Safely subscript string with idx.
//    /// "Hello World!"[safe: 3] -> "l"
//    /// "Hello World!"[safe: 20] -> nil
//    subscript(safe i: Int) -> Char? {
//        guard i >= 0, i < len else { return nil }
//        return self[index(startIndex, offsetBy: i)]
//    }
//
//    ///  Safely subscript string within a half-open range.
//    /// "Hello World!"[safe: 6..<11] -> "World"
//    /// "Hello World!"[safe: 21..<110] -> nil
//    /// - Parameter range: Half-open range.
//    subscript(safe range: CountableRange<Int>) -> Str? {
//        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
//        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
//        return Str(self[lowerIdx ..< upperIdx])
//    }
//
//    ///  Safely subscript string within a closed range.
//    /// "Hello World!"[safe: 6...11] -> "World!"
//    /// "Hello World!"[safe: 21...110] -> nil
//    /// - Parameter range: Closed range.
//    subscript(safe range: ClosedRange<Int>) -> Str? {
//        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
//        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else { return nil }
//        return Str(self[lowerIdx ..< upperIdx])
//    }
//
//    // Subscript string within a half-open range.
//    subscript(range: CountableRange<Int>) -> Str? {
//        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else {
//            return nil
//        }
//        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else {
//            return nil
//        }
//        return Str(self[lowerIdx ..< upperIdx])
//    }
//
//    // Subscript string within a closed range.
//    subscript(range: ClosedRange<Int>) -> Str? {
//        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else {
//            return nil
//        }
//        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else {
//            return nil
//        }
//        return Str(self[lowerIdx ..< upperIdx])
//    }
//
//    subscript(range: CountableRange<Int>) -> Str {
//        let i1 = index(startIndex, offsetBy: range.lowerBound)
//        let i2 = index(startIndex, offsetBy: range.upperBound - 1)
//        return Str(self[i1...i2])
//    }
//
//    subscript(r: Range<Int>) -> Str {
//        let i1 = index(startIndex, offsetBy: r.lowerBound)
//        let i2 = index(startIndex, offsetBy: r.upperBound - 1)
//
//        return Str(self[i1 ..< i2])
//    }

//MARK: -

//    subscript(range: PartialRangeThrough<Int>) -> Str {
//        let i1 = index(startIndex, offsetBy: 0)
//        let i2 = index(startIndex, offsetBy: range.upperBound)
//        return Str(self[i1...i2])
//    }
//
//    subscript(range: PartialRangeUpTo<Int>) -> Str {
//        let i1 = index(startIndex, offsetBy: 0)
//        let i2 = index(startIndex, offsetBy: range.upperBound)
//        return Str(self[i1..<i2])
//    }
//
//    subscript(range: CountablePartialRangeFrom<Int>) -> Str {
//        let i1 = index(startIndex, offsetBy: range.lowerBound)
//        let i2 = index(endIndex, offsetBy: -1)
//        return Str(self[i1...i2])
//    }
//
//    subscript(range: CountableClosedRange<Int>) -> Str {
//        let i1 = index(startIndex, offsetBy: range.lowerBound)
//        let i2 = index(startIndex, offsetBy: range.upperBound)
//        return Str(self[i1...i2])
//    }


//MARK: operators

//        ///  Repeat string multiple times.
//        /// 'bar' * 3 -> "barbarbar"
//        /// - Parameters:
//        ///   - lhs: string to repeat.
//        ///   - rhs: number of times to repeat character.
//        /// - Returns: new string with given string repeated n times.
//        static func * (lhs: Str, rhs: Int) -> Str {
//            guard rhs > 0 else { return "" }
//            return Str(repeating: lhs, count: rhs)
//        }
//
//        ///  Repeat string multiple times.
//        /// 3 * 'bar' -> "barbarbar"
//        /// - Parameters:
//        ///   - lhs: number of times to repeat character.
//        ///   - rhs: string to repeat.
//        /// - Returns: new string with given string repeated n times.
//        static func * (lhs: Int, rhs: Str) -> Str {
//            guard lhs > 0 else { return "" }
//            return Str(repeating: rhs, count: lhs)
//        }

