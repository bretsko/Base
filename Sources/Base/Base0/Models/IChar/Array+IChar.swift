

public extension Array where Element == IChar {
    typealias IdxCond = (Int) -> Bool
    typealias StrCond = (Str) -> Bool
    typealias CharCond = (Char) -> Bool
    
    // all index vars are impl-d in Array+hasIdxP
    
    var icSet: ICSet {
        Set(self)
    }
    
    //MARK: contain
    
    func contains(_ chars: [Str]) -> Bool {
        some(satisfy: {chars.contains($0.char)} )
    }
    func contains(no chars: [Str]) -> Bool {
        none(satisfy: {chars.contains($0.char)} )
    }
    func contains(_ chars: Set<Str>) -> Bool {
        some(satisfy: {chars.contains($0.char)} )
    }
    func contains(no chars: Set<Str>) -> Bool {
        none(satisfy: {chars.contains($0.char)} )
    }
    
    
    func someHave(_ char: Str) -> Bool {
        some(satisfy: {$0.char == char})
    }
    func noneHave(_ char: Str) -> Bool {
        none(satisfy: {$0.char == char})
    }
    
    
    //MARK: index
    
    
    /// some -> maybe all!
    func someHave(_ idx: Int) -> Bool {
        some(satisfy: {$0.idx == idx})
    }
    func noneHave(_ idx: Int) -> Bool {
        none(satisfy: {$0.idx == idx})
    }
    //    func allHave(_ idx: Int) -> Bool {
    //         allSatisfy{$0.idx == idx}
    //    }
    
    
    func allHaveIdx(in rng: Rng) -> Bool {
        allSatisfy{ rng.contains($0.idx)}
    }
    func noneHaveIdx(in rng: Rng) -> Bool {
        none(satisfy: { rng.contains($0.idx)})
    }
    /// some -> maybe all!
    func someHaveIdx(in rng: Rng) -> Bool {
        some(satisfy: { rng.contains($0.idx)})
    }
    
    /// strict comparison
    func allHaveIdx(moreThan idx1: Int,
                    lessThan idx2: Int) -> Bool {
        allSatisfy{ $0.idx > idx1 && $0.idx < idx2 }
    }
    /// strict comparison
    func noneHaveIdx(moreThan idx1: Int,
                     lessThan idx2: Int) -> Bool {
        none(satisfy: { $0.idx > idx1 && $0.idx < idx2 })
    }
    /// some -> maybe all!
    /// strict comparison
    func someHaveIdx(moreThan idx1: Int,
                     lessThan idx2: Int) -> Bool {
        some(satisfy: { $0.idx > idx1 && $0.idx < idx2 })
    }
    
    //MARK: moreThan
    
    func allHaveIdx(moreThan idx: Int,
                    orEqual: Bool = false) -> Bool {
        if orEqual {
            return allSatisfy{ $0.idx >= idx }
        }
        return allSatisfy{ $0.idx > idx }
    }
    func noneHaveIdx(moreThan idx: Int,
                     orEqual: Bool = false) -> Bool {
        if orEqual {
            return none(satisfy: { $0.idx >= idx })
        }
        return none(satisfy: { $0.idx > idx })
    }
    /// some -> maybe all!
    func someHaveIdx(moreThan idx: Int,
                     orEqual: Bool = false) -> Bool {
        if orEqual {
            return some(satisfy: { $0.idx >= idx })
        }
        return some(satisfy: { $0.idx > idx })
    }
    
    //MARK: lessThan
    
    func allHaveIdx(lessThan idx: Int,
                    orEqual: Bool = false) -> Bool {
        if orEqual {
            return allSatisfy{ $0.idx <= idx }
        }
        return allSatisfy{ $0.idx < idx }
    }
    func noneHaveIdx(lessThan idx: Int,
                     orEqual: Bool = false) -> Bool {
        if orEqual {
            return none(satisfy: { $0.idx <= idx } )
        }
        return none(satisfy: { $0.idx < idx } )
    }
    /// some -> maybe all!
    func someHaveIdx(lessThan idx: Int,
                     orEqual: Bool = false) -> Bool {
        if orEqual {
            return some(satisfy:{ $0.idx <= idx })
        }
        return some(satisfy:{ $0.idx < idx })
    }
    
    
    //MARK: Idx cond
    
    func allHaveIdx(_ cond: @escaping IdxCond) -> Bool {
        allSatisfy{ cond($0.idx)}
    }
    func noneHaveIdx(_ cond: @escaping IdxCond) -> Bool {
        none(satisfy:{ cond($0.idx)} )
    }
    /// some -> maybe all!
    func someHaveIdx(_ cond: @escaping IdxCond) -> Bool {
        some(satisfy:{ cond($0.idx)} )
    }
    
    
    func allHaveIdx(_ conds: [IdxCond]) -> Bool {
        allSatisfy{ unit in
            conds.allSatisfy{ $0(unit.idx) }
        }
    }
    func noneHaveIdx(_ conds: [IdxCond]) -> Bool {
        none(satisfy:{ unit in
            conds.allSatisfy{ $0(unit.idx) }
        })
    }
    /// some -> maybe all!
    func someHaveIdx(_ conds: [IdxCond]) -> Bool {
        some(satisfy:{ unit in
            conds.allSatisfy{ $0(unit.idx) }
        })
    }
    
    //MARK: Str cond
    
    func allHaveChar(_ cond: @escaping StrCond) -> Bool {
        allSatisfy{ cond($0.char) }
    }
    func noneHaveChar(_ cond: @escaping StrCond) -> Bool {
        none(satisfy: { cond($0.char) })
    }
    /// some -> maybe all!
    func someHaveChar(_ cond: @escaping StrCond) -> Bool {
        some(satisfy: { cond($0.char) })
    }
    
    
    func allHaveChar(_ conds: [StrCond]) -> Bool {
        allSatisfy{ unit in
            conds.allSatisfy{ $0(unit.char) }
        }
    }
    func noneHaveChar(_ conds: [StrCond]) -> Bool {
        none(satisfy: { unit in
            conds.allSatisfy { $0(unit.char) }
        })
    }
    /// some -> maybe all!
    func someHaveChar(_ conds: [StrCond]) -> Bool {
        some(satisfy: { unit in
            conds.allSatisfy { $0(unit.char) }
        })
    }
    
    //MARK: Char cond
    
    func allHaveChar(_ cond: @escaping CharCond) -> Bool {
        allSatisfy { cond($0.ch) }
    }
    func noneHaveChar(_ cond: @escaping CharCond) -> Bool {
        none(satisfy: { cond($0.ch) })
    }
    /// some -> maybe all!
    func someHaveChar(_ cond: @escaping CharCond) -> Bool {
        some(satisfy: { cond($0.ch) })
    }
    
    
    func allHaveChar(_ conds: [CharCond]) -> Bool {
        allSatisfy{ unit in
            conds.allSatisfy{ $0(unit.ch) }
        }
    }
    func noneHaveChar(_ conds: [CharCond]) -> Bool {
        none(satisfy: { unit in
            conds.allSatisfy{ $0(unit.ch) }
        })
    }
    /// some -> maybe all!
    func someHaveChar(_ conds: [CharCond]) -> Bool {
        some(satisfy:{ unit in
            conds.allSatisfy{ $0(unit.ch) }
        })
    }
    
    
    //    func allHave(_ ichar: IChar) -> Bool {
    //         allSatisfy{$0 == ichar}
    //    }
    //    func noneHave(_ ichar: IChar) -> Bool {
    //         none(satisfy:{$0 == ichar}
    //    }
    //    func someHave(_ ichar: IChar) -> Bool {
    //         some(satisfy:{$0 == ichar}
    //    }
}


