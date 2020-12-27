


public extension Dictionary {
    typealias K = Key
    typealias V = Value
    
    /// SwifterSwift: Check if key exists in dictionary.
    ///
    ///        let dict: [Str : Any] = ["testKey": "testValue", "testArrayKey": [1, 2, 3, 4, 5]]
    ///        dict.has(key: "testKey") -> true
    ///        dict.has(key: "anotherKey") -> false
    ///
    /// - Parameter key: key to search for
    /// - Returns: true if key exists in dictionary.
    func has(key: K) -> Bool {
        index(forKey: key) != nil
    }
    
    /// SwifterSwift: Remove all keys contained in the keys parameter from the dictionary.
    ///
    ///        var dict : [Str : Str] = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]
    ///        dict.removeAll(keys: ["key1", "key2"])
    ///        dict.keys.contains("key3") -> true
    ///        dict.keys.contains("key1") -> false
    ///        dict.keys.contains("key2") -> false
    ///
    /// - Parameter keys: keys to be removed
    mutating func removeAll<S: Sequence>(keys: S) where S.Element == K {
        keys.forEach { removeValue(forKey: $0) }
    }
    
    /// SwifterSwift: Remove a value for a random key from the dictionary.
    @discardableResult
    mutating func removeValueForRandomKey() -> V? {
        guard let randomKey = keys.randomElement() else {
            return nil
        }
        return removeValue(forKey: randomKey)
    }
    
    
    /// SwifterSwift: Returns a dictionary containing the results of mapping the given closure over the sequence’s units.
    /// - Parameter transform: A mapping closure. `transform` accepts an unit of this sequence as its parameter and returns a transformed value of the same or of a different type.
    /// - Returns: A dictionary containing the transformed units of this sequence.
    func mapKeysAndValues<KType, VType>(_ transform: ((key: K, value: V)) throws -> (KType, VType)) rethrows -> [KType: VType] {
        [KType: VType](uniqueKeysWithValues: try map(transform))
    }
    
    /// SwifterSwift: Returns a dictionary containing the non-`nil` results of calling the given transformation with each unit of this sequence.
    /// - Parameter transform: A closure that accepts an unit of this sequence as its argument and returns an optional value.
    /// - Returns: A dictionary of the non-`nil` results of calling `transform` with each unit of the sequence.
    /// - Complexity: *O(m + n)*, where _m_ is the length of this sequence and _n_ is the length of the r.
    func compactMapKeysAndValues<KType, VType>(_ transform: ((key: K, value: V)) throws -> (KType, VType)?) rethrows -> [KType: VType] {
        [KType: VType](uniqueKeysWithValues: try compactMap(transform))
    }
    
    
    //MARK: -
    
    mutating func set<KType, VType>(value:VType, for keys: [KType]) {
        keys.forEach { key in
            // self[value] = key
            updateValue(value as! V, forKey: key as! K)
        }
    }
    
    /// Merges the dictionary with dictionaries passed.
    /// The latter dictionaries will override values of the keys that are already set
    /// :param dictionaries A comma separated list of dictionaries, minimum one
    mutating func merge<KType, VType>(_ dicts: Dictionary<KType, VType>...) {
        dicts.forEach { dict in
            dict.forEach { k, v in
                updateValue(v as! V, forKey: k as! K)
            }
        }
    }
    
    
    ///  Count dictionary entries that where function returns true.
    /// - Parameter where: condition to evaluate each tuple entry against.
    /// - Returns: Count of entries that matches the where clousure.
    func count(where condition: @escaping ((key: K, value: V))  -> Bool)  -> Int {
        //TODO: reduce
        var len = 0
        forEach {
            if condition($0) {
                len += 1
            }
        }
        return len
    }
    
    /**
     Add dictionary to self in-place.
     
     - parameter dictionary: The dictionary to add to self
     */
    mutating func formUnion(_ dict: Dictionary) {
        dict.forEach {
            updateValue($0.1, forKey: $0.0)
        }
    }
    
    /**
     Return a dictionary containing the union of two dictionaries
     
     - parameter dictionary: The dictionary to add
     - returns: The combination of self and dictionary
     */
    func union(_ dict: Dictionary) -> Dictionary {
        var a = self
        a.formUnion(dict)
        return a
    }
    
    /**
     Difference of self and the input dictionaries.
     Two dictionaries are considered equal if they contain the same [key: value] pairs.
     
     :param: dictionaries Dictionaries to subtract
     :returns: Difference of self and the input dictionaries
     */
    func difference<VType: Equatable>(dicts: [K: VType]...) -> [K: VType] {
        var r = [K: VType]()
        // reduce ?
        forEach {
            if let item = $1 as? VType {
                r[$0] = item
            }
        }
        
        //  Difference
        dicts.forEach { dict in
            dict.forEach { k, v in
                if r.has(key: k) && r[k] == v {
                    r.removeValue(forKey: k)
                }
            }
        }
        return r
    }
    
    
    //MARK: JSON
    
    typealias JS = JSONSerialization
    
    /// SwifterSwift: JSON Data from dictionary.
    ///
    /// - Parameter prettify: set true to prettify data (default is false).
    /// - Returns: optional JSON Data (if applicable).
    func jsonData(prettify: Bool = false) -> Data? {
        guard JS.isValidJSONObject(self) else {
            return nil
        }
        let options = prettify ? JS.WritingOptions.prettyPrinted : JS.WritingOptions()
        return try? JS.data(withJSONObject: self, options: options)
    }
    
    
    /// SwifterSwift: JSON Str from dictionary.
    ///
    ///        dict.jsonString() -> "{"testKey":"testValue","testArrayKey":[1,2,3,4,5]}"
    ///
    ///        dict.jsonString(prettify: true)
    ///        /*
    ///        returns the following string:
    ///
    ///        "{
    ///        "testKey" : "testValue",
    ///        "testArrayKey" : [
    ///            1,
    ///            2,
    ///            3,
    ///            4,
    ///            5
    ///        ]
    ///        }"
    ///
    ///        */
    ///
    /// - Parameter prettify: set true to prettify string (default is false).
    /// - Returns: optional JSON Str (if applicable).
    func jsonString(prettify: Bool = false) -> Str? {
        
        guard JS.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JS.WritingOptions.prettyPrinted : JS.WritingOptions()
        
        guard let jsonData = try? JS.data(withJSONObject: self, options: options) else {
            return nil
        }
        return Str(data: jsonData, encoding: .utf8)
    }
    
}

// MARK: - Methods (V: Equatable)
public extension Dictionary where V: Equatable {
    
    /// SwifterSwift: Returns an array of all keys that have the given value in dictionary.
    ///
    ///        let dict = ["key1": "value1", "key2": "value1", "key3": "value2"]
    ///        dict.keys(forValue: "value1") -> ["key1", "key2"]
    ///        dict.keys(forValue: "value2") -> ["key3"]
    ///        dict.keys(forValue: "value3") -> []
    ///
    /// - Parameter value: V for which keys are to be fetched.
    /// - Returns: An array containing keys that have the given value.
    func keys(forValue value: V) -> [K] {
        keys.filter { self[$0] == value }
    }
}


public extension Dictionary where Key: StringProtocol {
    
    // http://stackoverflow.com/questions/33180028/extend-dictionary-where-key-is-of-type-string
    // Lowercase all keys in dictionary.
    mutating func lowercaseAllKeys() {
        
        keys.forEach { key in
            if let lowercaseKey = Str(describing: key).lowercased() as? Key {
                self[lowercaseKey] = removeValue(forKey: key)
            }
        }
    }
}

//MARK: - sorting

public extension Dictionary where Key: Comparable, Value: Comparable {
    
    /// The sort option of the dictionary. This is either `.key` or `.value`.
    enum SortOption {
        case key
        case value
    }
    
    /// Sorts the dictionary with the specified `SortOption` and `SortDirection`.
    ///
    /// - Parameter option: The sort option to use. This is either by `.key` or by `.value`.
    /// - Parameter direction: The sort direction to use. Defaults to `.ascending`.
    ///
    /// - Returns: The sorted `Dictionary` as an array with `(key: Key, value: Value)` pairs.
    func sorted(by option: SortOption,
                ascending: Bool = true) -> [(key: Key, value: Value)] {
        switch option {
        case .key:
            if ascending {
                return sorted { $0.key < $1.key }
            }
            return sorted { $0.key > $1.key }
            
        case .value:
            if ascending {
                return sorted { $0.value < $1.value }
            }
            return sorted { $0.value > $1.value }
        }
    }
}


//public extension Dictionary where Key == Str, Value == Any {
//
//    //MARK: stripInvalids
//
//    mutating func stripInvalids() {
//
//        for (k, v) in self {
//            //            if (value as AnyObject) is NSNull || value == nil {
//            //                removeValue(forKey: key)
//            //            } else
//
//            //            if case let Optional.some(v) = value as? Optional<Any> {
//            //                if v.isNone {
//            //                    removeValue(forKey: key)
//            //                } else {
//            //                    v.onSome { t in
//            //                        let ao = (value as AnyObject)
//            //                        if ao is NSNull {
//            //                            removeValue(forKey: key)
//            //                        } else {
//            //                            updateValue(ao, forKey: key)
//            //                        }
//            //                    }
//            //                }
//            //            }
//
//            let ao = (v as AnyObject)
//            if ao is NSNull {
//                removeValue(forKey: k)
//            } else {
//                updateValue(ao, forKey: k)
//            }
//
//            guard let values = v as? [Any] else {
//                continue
//            }
//            var filtered = values.filter {
//                !(($0 as AnyObject) is NSNull || $0 == nil) }
//
//            for (i, unit) in filtered.enumerated() {
//                guard var nestedDict = unit as? [Str: Any] else {
//                    continue
//                }
//                nestedDict.stripInvalids()
//
//                if nestedDict.values.count > 0 {
//                    filtered[i] = nestedDict as Any
//                } else {
//                    filtered.remove(at: i)
//                }
//            }
//
//            if filtered.hasSth {
//                self[k] = filtered
//            } else {
//                removeValue(forKey: k)
//            }
//
//
//            guard var nestedDict = v as? [Str: Any]  else {
//                continue
//            }
//            nestedDict.stripInvalids()
//
//            if nestedDict.values.count > 0 {
//                self[k] = nestedDict as Any
//            } else {
//                removeValue(forKey: k)
//            }
//        }
//    }
//
//    var strippingInvalids: Dictionary<Str, Any> {
//        var a = self
//        a.stripInvalids()
//        return a
//    }
//}



