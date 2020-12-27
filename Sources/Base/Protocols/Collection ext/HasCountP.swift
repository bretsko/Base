

public protocol HasCountP {
    var count: Int {get}
}
public extension HasCountP {
    
    var len: Int {
         count
    }
    var has1: Bool {
         count == 1
    }
    /// count > 1
    var hasMany: Bool {
         count > 1
    }
    
    var randIdx: Int {
         Int.rand(count)
    }
}

