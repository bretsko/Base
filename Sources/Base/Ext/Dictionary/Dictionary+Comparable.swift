



public extension Dictionary where Key: Comparable {
    
    var sortedKeys: [Key]? {
        keys.sorted(by: <).sth
    }
    var sortedByKeys: [(K,V)] {
        sorted(by: { (kv1, kv2) -> Bool in
            kv1.key > kv2.key
        })
    }
}


public extension Dictionary where Value: Comparable {
    
    var sortedValues: [Value]? {
        values.sorted(by: <).sth
    }
    var sortedByValues: [(K,V)] {
        sorted(by: { (kv1, kv2) -> Bool in
            kv1.value > kv2.value
        })
    }
    
//    var keysSortedByValues: [Key] {
//        sorted(by: <)
//    }
//    var valuesSortedByKeys: [Value] {
//        keys.sorted(by: <)
//    }
}

