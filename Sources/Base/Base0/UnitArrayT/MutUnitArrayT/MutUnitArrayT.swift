


public protocol MutUnitArrayT: UnitArrayT, SequenceT {
    
    var units: [LU] {get set}
}

//SequenceT
public extension MutUnitArrayT {
    
    // TODO: mutating: remove, intersect, etc
    
    /// if cannot append - fails, and returns false
    mutating func append(_ units: [LU]) {
        self.units += units
    }
    
    /// if cannot prepend - fails, and returns false
    mutating func prepend(_ units: [LU]) {
        self.units = units + self.units
    }
    
    
    /// if cannot append - fails, and returns false
    mutating func append(_ unit: LU) {
        append([unit])
    }
    
    /// if cannot prepend - fails, and returns false
    mutating func prepend(_ unit: LU) {
        prepend([unit])
    }
    
    
    /// if cannot append - fails, and returns false
    mutating func append(_ other: Self) {
        append(other.units)
    }
    /// if cannot append - fails, and returns false
    mutating func prepend(_ other: Self) {
        prepend(other.units)
    }
    
//    /// if cannot append - fails, and returns false
//    mutating func append(_ others: [Self]) {
//        prepend(others.allUnits ?? [])
//    }
//    /// if cannot append - fails, and returns false
//    mutating func prepend(_ others: [Self])  {
//        prepend(others.allUnits ?? [])
//    }
    
    
    //MARK: -
    
    //    @discardableResult
    //    mutating func remove(at index: Int) -> Bool {
    //        //        let newUnits = units.remove(at: index)
    //        //        guard validate(newUnits) else {
    //        //            return false
    //        //        }
    //        //shift indices
    //        //if isEmpty  - dont shift
    //        //if index 0 - dont shift back when removing
    //        //if last index  - dont shift forward when adding
    //        L.notImpl()
    //
    //        //self.units = newUnits
    //    }
    //
    //    @discardableResult
    //    mutating func insert(_ unit: LC,
    //                         at index: Int) -> Bool {
    //
    //        //        let newUnits = units.insert(unit, at: index)
    //        //        guard validate(newUnits) else {
    //        //            return false
    //        //        }
    //        //shift indices
    //        //if isEmpty  - dont shift
    //        //if index 0 - dont shift back when removing
    //        //if last index  - dont shift forward when adding
    //        L.notImpl()
    //
    //        //self.units = newUnits
    //    }
    //
    //
    //    @discardableResult
    //    mutating func append(_ unit: LC) -> Bool {
    //        //use insert
    //
    //        //shift indices
    //        //if isEmpty  - dont shift
    //        //if index 0 - dont shift back when removing
    //        //if last index  - dont shift forward when adding
    //        L.notImpl()
    //    }
    //
    //    @discardableResult
    //    mutating func prepend(_ unit: LC) -> Bool {
    //        //use insert
    //
    //        //shift indices
    //        //if isEmpty  - dont shift
    //        //if index 0 - dont shift back when removing
    //        //if last index  - dont shift forward when adding
    //        L.notImpl()
    //    }
    //
    //    //MARK: many
    //
    //    @discardableResult
    //    mutating func remove(at indices: [Int]) -> Bool {
    //        return indices.map { remove(at: $0) }.allTrue
    //    }
    //
    //    @discardableResult
    //    mutating func insert(_ units: [LC],
    //                         at indices: [Int]) -> Bool {
    //        crashIf(units.len != indices.len)
    //        return zip(units, indices).map { unit, idx in
    //            insert(unit, at: idx)
    //            }.allTrue
    //    }
    //
    //    @discardableResult
    //    mutating func append(_ units: [LC]) -> Bool {
    //        return units.map { append($0) }.allTrue
    //    }
    //
    //    @discardableResult
    //    mutating func prepend(_ units: [LC]) -> Bool {
    //        return units.map { prepend($0) }.allTrue
    //    }
}



public protocol MutEUnitArrayT: EUnitArrayT, MutUnitArrayT {}


public protocol MutHUnitArrayT: HUnitArrayT, MutEUnitArrayT {}


public extension Array where Element: MutUnitArrayT {
    //typealias LU = E.LU
    var allUnits: [E.LU]? {
        map{$0.units}.flatMap{$0}.sth
    }
}

