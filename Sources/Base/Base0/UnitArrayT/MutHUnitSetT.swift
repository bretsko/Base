

public protocol HUnitSetT: HUnitArrayT {
    
    var uset: Set<LU> {get}
}
public extension HUnitSetT  {
    var units: [LU] { //HUnitArrayT
         uset.array
    }
}



public protocol MutHUnitSetT: HUnitSetT, MutHUnitArrayT {
    
    var uset: Set<LU> {get set}
    
    init(_ uset: Set<LU>)
}
public extension MutHUnitSetT {
    
    init(_ units: [LU] = []) {
        self.init(Set(units))
    }
    init(_ unit: LU) {
        self.init([unit])
    }
    
    //MutHUnitArrayT
    var units: [LU] {
        get {
             uset.array
        }
        set {
            uset = Set(newValue)
        }
    }
    
    //MARK: funcs
    

    @discardableResult
    mutating func insert(_ other: Self) -> Bool {
         uset.insert(other.uset)
    }
    @discardableResult
    mutating func remove(_ other: Self) -> Bool {
         uset.remove(other.uset)
    }
    
    
    func removing(_ other: Self) -> Self? {
        var a = self
        guard a.remove(other) else {
            return nil
        }
        return a
    }
    
    func intersection(_ other: Self) -> Self? {
        guard uset.contains(other.uset) else{
            return nil
        }
        return Self.init(uset.intersection(other.uset))
    }
    
    mutating func intersect(_ other: Self) -> Bool {
        guard let a = intersection(other) else{
            return false
        }
        self = a
        return true
    }
}

//MARK: -

public extension Array where Element: HUnitSetT {
    typealias LU = E.LU
    
    var usets: [Set<LU>] {
        map{$0.uset}.compactMap{$0}
    }
}

public extension Set where Element: HUnitSetT {
    typealias LU = E.LU
    
    var usets: [Set<LU>] {
        array.usets
    }
}
