


public protocol HasIndexP: HasIdxP, HasCountP {}

public extension HasIndexP {
    
    var isEnd: Bool {
        idx == len - 1
    }
    var isStart: Bool {
        idx == 0
    }
    var hasPrev: Bool {
        !isStart
    }
    var hasNext: Bool {
        !isEnd
    }
    
    var countNextSteps: Int {
        len - idx - 1
    }
    var countPrevSteps: Int {
        idx
    }
    
    /// in ascending order
    var nextIndexes: [Int]? {
        var r = [Int]()
        for i in (idx+1)..<len {
            r.append(i)
        }
        return r.sth
    }
    /// in descending order
    var prevIndexes: [Int]? {
        var r = [Int]()
        for i in (0..<idx).reversed() {
            r.append(i)
        }
        return r.sth
    }
}

//MARK: -

public protocol HasMutIndexP: HasMutIdxP, HasIndexP {}
public extension HasMutIndexP {
    
    /// idx += num
    mutating func advanceIndex(by num: Int = 1) {
        crashIf(num <= 0)
        idx += num
    }
}
//TODO: array exts

//MARK: -

//public extension Array where E: HasIndexP {
//}
