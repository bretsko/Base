


public extension Dictionary {
        
    ///  Merge the keys/values of two dictionaries.
    ///        let dict : [Str : Str] = ["key1" : "value1"]
    ///        let dict2 : [Str : Str] = ["key2" : "value2"]
    ///        let r = dict + dict2
    ///        r["key1"] -> "value1"
    ///        r["key2"] -> "value2"
    /// - Parameters:
    ///   - lhs: dictionary
    ///   - rhs: dictionary
    /// - Returns: An dictionary with keys and values from both.
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var r = lhs
        rhs.forEach { r[$0] = $1 }
        return r
    }
        
    ///  Append the keys and values from the second dictionary into the first one.
    ///        var dict : [Str : Str] = ["key1" : "value1"]
    ///        let dict2 : [Str : Str] = ["key2" : "value2"]
    ///        dict += dict2
    ///        dict["key1"] -> "value1"
    ///        dict["key2"] -> "value2"
    /// - Parameters:
    ///   - lhs: dictionary
    ///   - rhs: dictionary
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        rhs.forEach { lhs[$0] = $1 }
    }
    
    
    /// SwifterSwift: Deep fetch or set a value from nested dictionaries.
    ///
    ///        var dict =  ["key": ["key1": ["key2": "value"]]]
    ///        dict[path: ["key", "key1", "key2"]] = "newValue"
    ///        dict[path: ["key", "key1", "key2"]] -> "newValue"
    ///
    /// - Note: Value fetching is iterative, while setting is recursive.
    ///
    /// - Complexity: O(N), _N_ being the length of the path passed in.
    ///
    /// - Parameter path: An array of keys to the desired value.
    ///
    /// - Returns: The value for the key-path passed in. `nil` if no value is found.
    subscript(path path: [Key]) -> Any? {
        get {
            guard path.hasSth else { return nil }
            var r: Any? = self
            for key in path {
                if let unit = (r as? [Key: Any])?[key] {
                    r = unit
                } else {
                    return nil
                }
            }
            return r
        }
        set {
            guard let first = path.first else {
                return
            }
            if path.count == 1,
                let new = newValue as? Value {
                return self[first] = new
            }
            if var nested = self[first] as? [Key: Any] {
                nested[path: Array(path.dropFirst())] = newValue
                return self[first] = nested as? Value
            }
        }
    }
    
    
    /// Build string representation of HTTP parameter dictionary of keys and objects
    /// This percent escapes in compliance with RFC 3986
    /// http://www.ietf.org/rfc/rfc3986.txt
    /// :returns: Str representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    
    //    func stringFromHttpParameters() -> Str {
    //        let parameterArray = map { (key, value) -> Str in
    //            let percentEscapedKey = (key as! Str).stringByAddingPercentEncodingForURLQueryValue()!
    //            let percentEscapedValue = (value as! Str).stringByAddingPercentEncodingForURLQueryValue()!
    //            return "\(percentEscapedKey)=\(percentEscapedValue)"
    //        }
    //
    //        return parameterArray.joined(separator: "&")
    //    }
}

